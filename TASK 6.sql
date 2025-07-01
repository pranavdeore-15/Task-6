use railway_reservation_system;
-- Scalar Subquery
SELECT Name, Email
FROM Passenger
WHERE Passenger_Id IN (
    SELECT Passenger_Id
    FROM Booking
    WHERE Fare > (
        SELECT AVG(Fare) FROM Booking
    )
);

-- Correlated Subquery
SELECT Booking_Id, Fare, Schedule_Id
FROM Booking B
WHERE Fare > (
    SELECT AVG(Fare)
    FROM Booking
    WHERE Schedule_Id = B.Schedule_Id
);

-- Subquery with IN
SELECT Name
FROM Passenger
WHERE Passenger_Id IN (
    SELECT Passenger_Id FROM Booking
);

-- Subquery with EXISTS
SELECT Name, Email
FROM Passenger P
WHERE EXISTS (
    SELECT 1
    FROM Booking B
    WHERE B.Passenger_Id = P.Passenger_Id
);

-- Subquery with =
SELECT Train_Name
FROM Train
WHERE Train_Id = (
    SELECT Train_Id
    FROM Booking
    ORDER BY Fare DESC
    LIMIT 1
);


