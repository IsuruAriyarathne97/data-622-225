from datetime import datetime

def greet():
    current_hour = datetime.now().hour
    if current_hour < 12:
        greeting = "Good morning!"
    elif current_hour < 18:
        greeting = "Good afternoon!"
    else:
        greeting = "Good evening!"
    
    print(greeting)

if __name__ == "__main__":
    greet()
