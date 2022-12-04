import mysql.connector
import os

db = mysql.connector.connect(
    host='localhost',
    user='root',
    passwd='password'
)

def initDB():
    mycursor = db.cursor()
    mycursor.execute('USE DEALERSHIP')

def displayMainMenu():
    print(' — — — — - - - OPTIONS - - - — — — - -')
    print(' 1. View Inventory ')
    print(' 2. View Customer Information ')
    print(' 3. View Customer Billing Information ')
    print(' 4. Quit')
    print(' — — — — — — — — — — - - - - - - - - -')

def viewInventory():
    mycursor = db.cursor()
    sql = 'SELECT * FROM car_inv_vw'
    mycursor.execute(sql)
    result = mycursor.fetchall()
    print('- - - - - - - - Vehicle Inventory - - - - - - - -')
    for r in (result):
        print('Model:              ', r[0], '\n')
        print('Make:               ', r[1], '\n')
        print('Type:               ', r[2], '\n')
        print('Quantity on hand:   ', r[3], '\n')
        print('Quantity on order:   ', r[4], '\n')
        print('Recommended quantity:   ', r[5], '\n')
        print('- - - - - - - - - - - - - - - - -')
    
    goBack()

def getAllCustomer():
    mycursor = db.cursor()
    sql = 'SELECT * FROM customer_info_vw'
    mycursor.execute(sql)
    result = mycursor.fetchall()
    print('- - - - - - - - Customer Information - - - - - - - -')
    for r in (result):
        print('CustomerID:      ', r[0], '\n')
        print('First Name:      ', r[1], '\n')
        print('Last Name:       ', r[2], '\n')
        print('Phone number:    ', r[3], '\n')
        print('Address:         ', r[4], '\n')
        print('City:            ', r[5], '\n')
        print('State:           ', r[6], '\n')
        print('Zipcode:         ', r[7], '\n')
        print('- - - - - - - - - - - - - - - - -')
    
    goBack()

def getAllCustomerBilling():
    mycursor = db.cursor()
    sql = 'SELECT * FROM customer_billing_info_vw'
    mycursor.execute(sql)
    result = mycursor.fetchall()
    print('- - - - - - - - Customer Information - - - - - - - -')
    for r in (result):
        print('CustomerID:          ', r[0], '\n')
        print('First Name:          ', r[1], '\n')
        print('Last Name:           ', r[2], '\n')
        print('Phone number:        ', r[3], '\n')
        print('Address:             ', r[4], '\n')
        print('City:                ', r[5], '\n')
        print('State:               ', r[6], '\n')
        print('Zipcode:             ', r[7], '\n')
        print('Balance Due:         ', r[8], '\n')
        print('- - - - - - - - - - - - - - - - -')
    
    goBack()

def goBack():
    option = int(input('press 0 to go back and 4 to exit :  '))
    if option==0:
        os.system('clear')
        run()
    else:
        quit()

def quit():
    n = int(input('Press 4 to exit : '))
    if n == 4:
       os.system('clear') 
    else:
       print('Invalid Option')
       quit()

def run():
   displayMainMenu()
   n = int(input('Enter option : '))
   if n == 1:
        os.system('clear')
        viewInventory()
   elif n == 2:
        os.system('clear')
        getAllCustomer()
   elif n == 3:
        os.system('clear')
        getAllCustomerBilling()
   elif n == 4:
        os.system('clear')
        quit()
        print(' — — — Thank You — — -')
   else:
        os.system('clear')
        run()

if __name__ == '__main__':
    initDB()
    run()