# Creating and modeling the Data Base:

Once I had the files ready, I proceeded to create the data base named airlines_loyalty. The tables will be named as follows:


* customers:
     * Loyalty_Number:Customer's unique loyalty number
     * Year:Year of the period
     * Month:Month of the period
     * Total_Flights:Sum of Flights Booked (all tickets purchased in the period)
     * Distance:Flight distance traveled in the period (km)
     * Points_Accumulated:Loyalty points accumulated in the period
     * Points_Redeemed:Loyalty points redeemed in the period
     * Cost_Points_Redeemed:Dollar equivalent for points redeemed in the period in CDN
       
       
* customers_movements:
     * Loyalty_Number:Customer's unique loyalty number
     * Country:Country of residence
     * Province:Province of residence
     * City:City of residence
     * Postal_Code:Postal code of residence
     * Gender:Gender
     * Education:Highest education level (High school or lower > College > Bachelor > Master > Doctor)
     * Salary:Annual income
     * Marital_Status:"Marital status (Single: Married: Divorced)"
     * Loyalty_Card:Loyalty card status (Star > Nova > Aurora)
     * CLV:Customer lifetime value - total invoice value for all flights ever booked by member
     * Enrollment_Type:Enrollment type (Standard / 2018 Promotion)
     * Enrollment_Year:Year Member enrolled in membership program
     * Enrollment_Month:Month Member enrolled in membership program
     * Cancellation_Year:Year Member cancelled their membership
     * Cancellation_Month:Month Member cancelled their membership
