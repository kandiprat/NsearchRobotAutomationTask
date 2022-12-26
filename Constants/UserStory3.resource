*** Variables ***
${upload_CSV_file}   //input[@type='file']
${CSV_file_single_row}   ${EXECDIR}/Testdata/UploadCSVFile/validCSVwithSingleRecord.csv
${CSV_file_multiple_rows}  ${EXECDIR}/Testdata/UploadCSVFile/validCSVwithMultipleRecords.csv
${CSV_file_with_missing_headers}  ${EXECDIR}/Testdata/UploadCSVFile/CSVWithMissingHeaders.csv
${CSV_file_with_invalid_headers}  ${EXECDIR}/Testdata/UploadCSVFile/CSVWithInvalidHeaders.csv
${Invalid_file_type}  ${EXECDIR}/Testdata/UploadCSVFile/InvalidFileType.txt
${refresh_tax_relief_table}   //button[text()='Refresh Tax Relief Table']
${NatId_text}  //*[text()='NatId']
${Relief}   //*[text()='Relief']
@{valid_CSV_text_elements}  4443$$$  1220.00  7367$$$  4340.00  7367$$$$  8100.00
@{valid_CSV_text_element}   1237$$$  1220.00