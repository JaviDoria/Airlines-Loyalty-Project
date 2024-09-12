# Preparing and examing the files 

# This database contains two CSV files:
* Customer Flight Activity:
     * Loyalty Number:Customer's unique loyalty number
     * Year:Year of the period
     * Month:Month of the period
     * Total Flights:Sum of Flights Booked (all tickets purchased in the period)
     * Distance:Flight distance traveled in the period (km)
     * Points Accumulated:Loyalty points accumulated in the period
     * Points Redeemed:Loyalty points redeemed in the period
     * Dollar Cost Points Redeemed:Dollar equivalent for points redeemed in the period in CDN
       
* Customer Loyalty History:
     * Loyalty Number:Customer's unique loyalty number
     * Country:Country of residence
     * Province:Province of residence
     * City:City of residence
     * Postal Code:Postal code of residence
     * Gender:Gender
     * Education:Highest education level (High school or lower > College > Bachelor > Master > Doctor)
     * Salary:Annual income
     * Marital Status:"Marital status (Single: Married: Divorced)"
     * Loyalty Card:Loyalty card status (Star > Nova > Aurora)
     * CLV:Customer lifetime value - total invoice value for all flights ever booked by member
     * Enrollment Type:Enrollment type (Standard / 2018 Promotion)
     * Enrollment Year:Year Member enrolled in membership program
     * Enrollment Month:Month Member enrolled in membership program
     * Cancellation Year:Year Member cancelled their membership
     * Cancellation Month:Month Member cancelled their membership





After reviewing them, the only issue detected was that the Loyalty History CSV file has a problem: at the end of the file, an INT column contains an empty space.


![image](https://github.com/user-attachments/assets/b59b3484-cd25-4161-941f-d4cefe3593f0)


I decided fixed using Python to replace the empty space for a 0 , then i got this as a result:


![image](https://github.com/user-attachments/assets/457f991a-0f71-41a3-9eb7-3bd938b1be21)
