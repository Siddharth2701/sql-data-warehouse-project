/*
=================================================================================
Stored Procedure: Load bronze layer (Source -->Bronze)
=================================================================================
Script Purpose:
  This stored procedure loads data into the 'Bronze' schema from the external csv files.
  It performs the following actions :
   - Truncates the bronze tables before loading data.
   - Uses the BULK INSERT command to load data from csv files to bronze tables.

Parameters:
  None.
This stored procedure does not accept any parameters or Return any values.

Usage Examples:
    EXEC bronze.load_bronze;
===================================================================================
*/
Create or Alter Procedure bronze.load_bronze As
Begin
	Declare @batch_start_time DATETIME, @batch_end_time DATETIME;
	
		Set @batch_start_time = GETDATE();
		Print '============================================';
		Print 'Loading Bronze Layer';
		Print '============================================';

		Print '--------------------------------------------';
		Print 'Loading CRM Tables';
		Print '--------------------------------------------';
	
		Print '>>Truncating Table:bronze_crm_cust_info<<';
		Truncate Table bronze_crm_cust_info;

		Print '>>Inserting data into:bronze_crm_cust_info<<';
		Bulk Insert bronze_crm_cust_info
		from 'D:\SQL Course\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with ( 
			FirstRow = 2,
			Fieldterminator = ',',
			TabLock
			);

		Print '>>Truncating Table:bronze_crm_prd_id<<';
		Truncate Table bronze_crm_prd_id;

		Print '>>Inserting data into:bronze_crm_prd_id<<';
		Bulk Insert bronze_crm_prd_id
		from 'D:\SQL Course\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with ( 
			FirstRow = 2,
			Fieldterminator = ',',
			TabLock
			);

		Print '>>Truncating Table:bronze_crm_sales_details<<';
		Truncate Table bronze_crm_sales_details;

		Print '>>Inserting data into:bronze_crm_sales_details<<';
		Bulk Insert bronze_crm_sales_details
		from 'D:\SQL Course\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with ( 
			FirstRow = 2,
			Fieldterminator = ',',
			TabLock
			);
	
		Print '--------------------------------------------';
		Print 'Loading ERP Tables';
		Print '--------------------------------------------';
	

		Print '>>Truncating Table:bronze_erp_cust_AZ12<<';
		Truncate Table bronze_erp_cust_AZ12;
	
		Print '>>Inserting data into:bronze_erp_cust_AZ12<<';
		Bulk Insert bronze_erp_cust_AZ12
		from 'D:\SQL Course\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with ( 
			FirstRow = 2,
			Fieldterminator = ',',
			TabLock
			);


		Print '>>Truncating Table:bronze_erp_LOC_A101<<';
		Truncate Table bronze_erp_LOC_A101;

		Print '>>Inserting data into:bronze_erp_LOC_A101<<';
		Bulk Insert bronze_erp_LOC_A101
		from 'D:\SQL Course\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with ( 
			FirstRow = 2,
			Fieldterminator = ',',
			TabLock
			);

		Print '>>Truncating Table:bronze_erp_PX_Cat_G1V2<<';
		Truncate Table bronze_erp_PX_Cat_G1V2;

		Print '>>Inserting data into:bronze_erp_PX_Cat_G1V2<<';
		Bulk Insert bronze_erp_PX_Cat_G1V2
		from 'D:\SQL Course\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with ( 
			FirstRow = 2,
			Fieldterminator = ',',
			TabLock
		);
		Set  @batch_end_time = GETDATE();
		Print '==========================================';
		Print 'Loading Bronze layer is completed';
		Print ' - Total Load Duration: ' + Cast(DATEDIFF(Second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'Seconds';
		Print '==========================================';
	End	
