(use xlsxwriterscm)

(define number 41333.5)
(init-formats 2)
(create-workbook "dates-and-times-01.xlsx")
(add-worksheet "")
(create-format)
(set-cell-num-format "mmm d yyyy hh:mm AM/PM")
(create-format)
(worksheet-set-column 20 0 0)
(worksheet-write-number number)
(set-format-index 0)
(set-row 1)
(worksheet-write-number number)
(close-workbook)
(exit)


