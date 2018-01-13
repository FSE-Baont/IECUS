ECHO OFF 
ECHO ========================================
ECHO Dang cap nhat CSDL ECUS!
ECHO Hay cho den khi co thong bao thanh cong!
ECHO ========================================
CD D:\Project\GIN_IECUS\KD_CANG\\Update\SQL
osql -d ECUS5_CANG_PH  /S localhost\SQL2016 /U sa /P Baonguyen@16181992 /i  ECUS_SQL_12.sql /n /o ECUS_SQL_12.log
osql -d ECUS5_CANG_PH  /S localhost\SQL2016 /U sa /P Baonguyen@16181992 /i  ECUS_SQL_13.sql /n /o ECUS_SQL_13.log
osql -d ECUS5_CANG_PH  /S localhost\SQL2016 /U sa /P Baonguyen@16181992 /i  ECUS_SQL_14.sql /n /o ECUS_SQL_14.log
osql -d ECUS5_CANG_PH  /S localhost\SQL2016 /U sa /P Baonguyen@16181992 /i  ECUS_SQL_15.sql /n /o ECUS_SQL_15.log
osql -d ECUS5_CANG_PH  /S localhost\SQL2016 /U sa /P Baonguyen@16181992 /i  ECUS_SQL_16.sql /n /o ECUS_SQL_16.log
osql -d ECUS5_CANG_PH  /S localhost\SQL2016 /U sa /P Baonguyen@16181992 /i  ECUS_SQL_17.sql /n /o ECUS_SQL_17.log
osql -d ECUS5_CANG_PH  /S localhost\SQL2016 /U sa /P Baonguyen@16181992 /i  ECUS_SQL_18.sql /n /o ECUS_SQL_18.log
osql -d ECUS5_CANG_PH  /S localhost\SQL2016 /U sa /P Baonguyen@16181992 /i  ECUS_SQL_19.sql /n /o ECUS_SQL_19.log
if  errorlevel 1 goto AbortUpdate
ECHO ========================================
ECHO Cap nhat thanh cong !
ECHO An phim bat ky de thoat !
ECHO Chon nut (Kiem tra lai) de xem ket qua !
ECHO ========================================
Exit
:AbortUpdate
ECHO ========================================
ECHO Thuc hien co loi
ECHO Xem file ECUS_SQL_19.log de biet them thong tin
ECHO An phim bat ky de thoat !
ECHO ========================================
