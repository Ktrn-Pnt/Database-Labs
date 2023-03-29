USE KB301_Panteleeva
GO


EXEC CheckCardBalance

EXEC Deposit 'EUR', 740

EXEC CheckCardBalance

EXEC Deposit 'GBP', 8000
EXEC TakeOff 'USD', 4103.70

EXEC TakeOff 'EUR', 1480.80
EXEC TakeOff 'GBP', 8000
EXEC TakeOff 'JPY', 7500
EXEC TakeOff 'RUB', 253845.03


EXEC Sell 'RUB', 1000, 'EUR'

EXEC SellEverything 'RUB'

EXEC Deposit 'RUB', 5500
EXEC Deposit 'USD', 1500
EXEC Deposit 'JPY', 7500
EXEC Deposit 'EUR', 300

EXEC CheckCardBalance

EXEC Sell 'EUR', 740, 'USD'

EXEC CheckCardBalance

EXEC SellEverything 'RUB'

EXEC Sell 'USD', 100, 'RUB'

SELECT* FROM Task2.DebitCard

