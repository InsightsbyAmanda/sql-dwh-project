/*
ADDING PRINT
If you are writing an ETL script more like the Stored Procedure we just created, it is important to take care
of the messaging of the code ie the Output message. In other words, Add PRINT to track execution, debuag issues and understand the flow.
So, we will simply divide the message based on our script
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	PRINT '=====================================================================================';
	PRINT 'Loading Bronze Layer';
	PRINT '=====================================================================================';

	PRINT '--------------------------------------------------------------------------------------';
	PRINT 'Loading CRM Tables';
	PRINT '--------------------------------------------------------------------------------------';
	
	PRINT '>> Truncating Table: bronze.crm_cust_info';
	TRUNCATE TABLE bronze.crm_cust_info;
	
	PRINT '>> Inserting Data Into: bronze.crm_cust_info';
	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\amand\Music\Data Analysis Bootcamp\SQL\Materials\SQL Data with Baraa\sql-data-warehouse-project\datasets\source_crm\cust_info.csv' -- The location of the file in the system
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	PRINT '>> Truncating Table: bronze.crm_prd_info';
	TRUNCATE TABLE bronze.crm_prd_info;
	
	PRINT '>> Inserting Data Into: bronze.crm_prd_info';
	BULK INSERT bronze.crm_prd_info
	FROM 'C:\Users\amand\Music\Data Analysis Bootcamp\SQL\Materials\SQL Data with Baraa\sql-data-warehouse-project\datasets\source_crm\prd_info.csv' -- The location of the file in the system
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	
	PRINT '>> Truncating Table: bronze.crm_sales_details';
	TRUNCATE TABLE bronze.crm_sales_details;
	
	PRINT '>> Inserting Data Into: bronze.crm_sales_details';
	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\amand\Music\Data Analysis Bootcamp\SQL\Materials\SQL Data with Baraa\sql-data-warehouse-project\datasets\source_crm\sales_details.csv' -- The location of the file in the system
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);


	PRINT '--------------------------------------------------------------------------------------';
	PRINT 'Loading ERP Tables';
	PRINT '--------------------------------------------------------------------------------------';
	
	PRINT '>> Truncating Table: bronze.erp_cust_az12';
	TRUNCATE TABLE bronze.erp_cust_az12;
	
	PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\amand\Music\Data Analysis Bootcamp\SQL\Materials\SQL Data with Baraa\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv' -- The location of the file in the system
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	
	PRINT '>> Truncating Table: bronze.erp_loc_a101';
	TRUNCATE TABLE bronze.erp_loc_a101;
	
	PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\amand\Music\Data Analysis Bootcamp\SQL\Materials\SQL Data with Baraa\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv' -- The location of the file in the system
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	
	PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	
	PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\amand\Music\Data Analysis Bootcamp\SQL\Materials\SQL Data with Baraa\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv' -- The location of the file in the system
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
END

--Next, execute the Stored Procedure
EXEC bronze.load_bronze
