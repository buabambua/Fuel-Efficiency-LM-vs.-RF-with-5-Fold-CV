1. ตั้งสมมติฐาน (แรงม้า/น้ำหนัก มีผลต่อการกินน้ำมัน)
2. สร้างโมเดลเปรียบเทียบ (LM vs RF)
3. พิสูจน์ความแม่นยำ (5-Fold CV / RMSE / R^2)
4. วิเคราะห์ความสำคัญของตัวแปร (Variable Importance)
5. ทดสอบกับข้อมูลจำลอง (Prediction on New Data)

# 1. Objective (เป้าหมาย) 
- พยากรณ์อัตราการสิ้นเปลืองน้ำมัน (mpg) โดยใช้แรงม้า (hp) และน้ำหนักรถ (wt) เป็นตัวแปรพยากรณ์

# 2. Methodology (วิธีการ)

- ใช้ชุดข้อมูลมาตรฐาน mtcars
- เปรียบเทียบ 2 อัลกอริทึม: Linear Regression และ Random Forest
- ใช้เทคนิค 5-Fold Cross Validation เพื่อป้องกันการเกิด Overfitting และเพื่อให้ได้ค่าความแม่นยำที่น่าเชื่อถือ (Stable Metrics)

  # 3. สรุป Key Insights
  Prediction Plateau: ในรถกลุ่ม High Performance (แรงม้า 250-400, น้ำหนัก 3.5-4.5) โมเดลพยากรณ์ค่า mpg ออกมาใกล้เคียงกันมาก (ช่วง 14.6 - 14.8) สะท้อนว่าเมื่อตัวแปรสูงถึงจุดหนึ่ง อัตราการกินน้ำมันจะเริ่มอิ่มตัว ไม่ได้ลดลงเป็นเส้นตรงตามทฤษฎี

## Model Performance Comparison
Using 5-fold Cross-Validation, I compared Linear Regression and Random Forest models:

- **Stability:** The Boxplot reveals that **Random Forest** is more stable. While Linear Regression achieved a lower error in some folds, it also produced significant outliers (higher RMSE/MAE in others).
- **Reliability:** Random Forest consistently maintained a higher R-squared value across all folds, indicating better generalization on unseen data.
- **Conclusion:** I selected **Random Forest** as the final model for this prediction task due to its robustness and consistent performance.
