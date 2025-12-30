library(tidyverse)
library(caret)        # หัวใจหลักสำหรับทำ ML (Train/Test/CV)
library(randomForest) # สำหรับเรียกใช้ Random Forest

# 1. ขั้นตอนเลือกโมเดลและประเมินผล (ทำ K-Fold Cross Validation ตามรูป)
#แทนที่จะแบ่งข้อมูลรอบเดียว (80/20) ชีวิตจริงเราจะสั่งให้โปรแกรมทำ K-Fold 
#อัตโนมัติ เพื่อวัดค่า RMSE และ R^2ให้เสถียรที่สุด

# ตั้งค่าการประเมินผล: ทำ 5-Fold Cross Validation (ตามรูปเป๊ะๆ)
set.seed(42)
ctrl <- trainControl(method = "cv", number = 5)

# --- ลองใช้ Linear Regression ---
model_lm <- train(mpg ~ hp + wt, 
                  data = mtcars, 
                  method = "lm", 
                  trControl = ctrl)

# --- ลองใช้ Random Forest ---
model_rf <- train(mpg ~ hp + wt, 
                  data = mtcars, 
                  method = "rf", 
                  trControl = ctrl)

# เปรียบเทียบผลลัพธ์เพื่อเลือกโมเดลที่ดีที่สุด 
results <- resamples(list(Linear = model_lm, RandomForest = model_rf))
summary(results)

# 2. ขั้นตอนการทำนาย prediction
# สร้างข้อมูลใหม่
newcars <- data.frame(hp = c(250, 320, 400), wt = c(3.5, 4.0, 4.5))

# ทำนายผลทันที
newcars$mpg_pred <- predict(model_rf, newdata = newcars)

# ดูผลลัพธ์
newcars

# ดูความสำคัญของตัวแปร
> varImp(model_rf)

# วาดกราฟเปรียบเทียบ RMSE และ Rsquared ของทั้งสองโมเดล
bwplot(results)

