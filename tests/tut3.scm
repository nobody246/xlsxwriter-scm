(use xlsxwriterscm)

(define expenses '((Rent (2013 1 13)  1000)
                   (Gas  (2013 1 14)  100)
                   (Food (2013 1 16)  300)
                   (Gym  (2013 1 20)  50)))
(define row 0)
(define col 0)

(create-workbook "tut3.xlsx")
(add-worksheet "")
(init-formats 4)
;add bold format
(create-format)
(set-bold)
;add money format
(create-format)
(set-cell-num-format "$#,##0")
;add date format
(create-format)
(set-cell-num-format "mmmm d yyyy")
;add regular text format
(create-format)
;set column width
(worksheet-set-column 15 0 0)
(set-format-index 0)
(worksheet-write-string "Item")
(set-col (add1 col))
(worksheet-write-string "Date")
(set-col (+ col 2))
(worksheet-write-string "Cost")
(set! row (add1 row))
(define (write-expenses e)
  (set-pos row col)
  (if (not (null? e))
      (let* ((curr-row (car e))
             (curr-str (symbol->string (car curr-row)))
             (curr-date (cadr curr-row))
             (curr-num (caddr curr-row)))
        (set-format-index 3)
        (worksheet-write-string curr-str)
        (set-col (add1 col))
        (set-format-index 2)
        (worksheet-write-datetime (car curr-date)
                                  (cadr curr-date)
                                  (caddr curr-date)
                                  0
                                  0
                                  0)
        (set-col (+ col 2))
        (set-format-index 1)
        (worksheet-write-number curr-num)
        (set! row (add1 row))
        (write-expenses (cdr e)))
      (begin (worksheet-write-string "TOTAL")
             (set-col (+ col 2))
             (worksheet-write-formula "=SUM(C1:C4)"))))
(write-expenses expenses)
(close-workbook)
(exit)