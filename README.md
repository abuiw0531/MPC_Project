# MPC 車輛障礙物避讓與路徑控制 (MPC Vehicle Obstacle Avoidance and Path Control)
汽車避障mpc

[English Version](#english-version) | [Original MathWorks README](README_official.md)

## 專案簡介 (Project Overview)
**Demo Video (CarSim):** [Watch Demo Video](https://youtu.be/lArXpTgcnzY?si=3mgiWZGPRZ0MI6T7)

這是 Electrical Engineering 畢業專題，以模型預測控制（Model Predictive Control, MPC）研究車輛路徑追蹤與障礙物避讓。專題為團隊共同完成；專題報告、模擬結果與專案中納入的程式碼，呈現的是整體團隊成果。
**專題摘要：**
專題的核心問題是：如何利用車輛模型與 MPC，在追蹤參考路徑的同時處理障礙物，並評估取樣週期及轉向限制對控制響應與軌跡的影響。

## 車輛模型與 MPC 架構 (Vehicle Model & MPC Architecture)

報告分別說明車輛運動學與動態模型，並以車輛狀態及控制輸入描述車輛行為。MPC 採滾動時域方式運作：根據目前狀態預測未來行為、求得控制輸入、執行目前控制，再依更新後的狀態重新計算。

成本設計考量參考輸出與目標之間的差異，以及控制輸入變化。專題透過不同取樣週期及轉向角限制的模擬比較，研究路徑追蹤、響應速度、控制變化與穩定性之間的關係。

## 障礙物避讓 (Obstacle Avoidance)

專題報告描述以車輛與障礙物間距作為避讓觸發條件，並利用斜率關係形成繞行路徑；系統亦考量轉向角限制，以限制模擬中的轉向輸入。這些方法共同構成專題的 MPC 車輛路徑控制與障礙物避讓情境。

## 模擬結果說明 (Simulation Results)

報告結果顯示，取樣週期與轉向角限制會影響控制響應、路徑偏移及穩定表現。以上為專題模擬觀察，不是實車道路測試或量化安全保證。

### 1. MATLAB/Simulink Block 架構
此圖為專題中的 Simulink block diagram，包含路徑／曲率輸入、MPC 控制器、CarSim 車輛模型與 Scope 輸出，呈現閉迴路控制架構。

<img src="image1.png" width="900" alt="MATLAB/Simulink Block 架構">

### 2. 避障路徑規劃與可行軌跡
黑線為車輛規劃後的行駛軌跡，藍線為道路邊界，紅色框為障礙物與安全區。
系統利用斜率關係形成繞行路徑，車輛在道路邊界內繞過障礙物後逐步回到預期路徑。

<img src="image2.png" width="600" alt="避障路徑規劃與可行軌跡">

### 3. 障礙物安全距離與避讓條件
紅色虛線框表示障礙物緩衝區，黑線為避讓後路徑。
系統以車輛與障礙物間距作為避讓觸發條件，當距離低於門檻時啟動繞行策略。

<img src="image3.png" width="600" alt="障礙物安全距離與避讓條件">

### 4. 不同取樣週期對軌跡的影響
比較不同取樣週期下，MPC 控制器對路徑變化的控制響應。
取樣週期較短時，控制器能更快回應，軌跡較平滑；取樣週期較長時，較容易出現延遲與路徑偏移。

<img src="image4.png" width="600" alt="不同取樣週期對軌跡的影響">

### 5. 不同轉向角限制對避讓穩定性的影響
比較不同轉向角限制下的避讓軌跡。
轉向角限制影響車輛在避讓時的靈活性與穩定性；系統透過轉向角限制約束模擬中的控制輸入，分析其對整體穩定表現的影響。

<img src="image5.png" width="600" alt="不同轉向角限制對避讓穩定性的影響">

### 6. CarSim 模擬畫面
左側為車輛道路模擬畫面，右側為車輛狀態輸出曲線。
可觀察橫向距離、轉向角與偏航角等相關訊號，作為判斷控制響應與軌跡穩定性的依據。

<img src="image6.png" width="600" alt="CarSim 模擬畫面">

## 我從專題中建立的理解 (What I Learned)

參與這項團隊專題，讓我從 Electrical Engineering 的控制基礎理解自主系統中的模型預測、路徑控制、避障邏輯與輸入限制如何共同影響系統行為。我也因此希望進一步學習機器人與自主系統中的感知、運動規劃及高階控制整合。

## 專題技術 (Technologies)

- Model Predictive Control（MPC）
- 車輛路徑追蹤與障礙物避讓
- 車輛運動學與動態模型
- 障礙物距離條件與繞行路徑生成
- 取樣週期與轉向角限制之模擬比較
- MATLAB、Simulink、CarSim

## 專案結構 (Project Structure)
- `simulink_models/`：包含設計與測試用的 Simulink 模型（例如 `Linear_MPC_design.slxc`）。
- `scripts/`：包含輔助分析與資料處理的 MATLAB 腳本。
- `MPC virtual lab/`：主要的互動式 MATLAB Live Scripts，記錄詳細的實驗過程。
- `README_official.md`：保留原版的 MathWorks 官方操作說明與授權資訊。

---

# English Version

## Project Overview
**Demo Video (CarSim):** [Watch Demo Video](https://youtu.be/lArXpTgcnzY?si=3mgiWZGPRZ0MI6T7)

This is an Electrical Engineering capstone project investigating vehicle path tracking and obstacle avoidance using Model Predictive Control (MPC).

**Project Summary:**
The core research question is: how can a vehicle model and MPC be used to track a reference path while handling obstacles, and how do sampling period and steering constraints affect control response and trajectory? The team built vehicle simulation scenarios using MATLAB, Simulink, and CarSim, compared vehicle trajectories under different sampling periods and steering angle limits, and examined signals such as lateral displacement, steering angle, and yaw angle.

## Vehicle Model & MPC Architecture

The report describes both vehicle kinematic and dynamic models, characterizing vehicle behavior through state variables and control inputs. MPC operates in a receding horizon manner: it predicts future behavior from the current state, solves for control inputs, applies the current control action, and recalculates based on the updated state.

The cost function accounts for the deviation between reference outputs and targets, as well as changes in control inputs. Simulations comparing different sampling periods and steering angle limits were used to study the trade-offs among path tracking accuracy, response speed, control variation, and stability.

## Obstacle Avoidance

The project report describes using the distance between the vehicle and obstacles as the trigger condition for avoidance, and forming a detour path using a slope relationship. The system also incorporates steering angle limits to constrain steering inputs during simulation. Together, these methods constitute the MPC-based vehicle path control and obstacle avoidance scenario studied in this project.

## Simulation Results

Results show that sampling period and steering angle limits affect control response, path deviation, and stability performance. These are simulation observations from the project, not real-vehicle road tests or quantitative safety guarantees.

### 1. MATLAB/Simulink Block Architecture
The Simulink block diagram for the project, including path/curvature inputs, the MPC controller, the CarSim vehicle model, and Scope outputs, illustrating the closed-loop control architecture.

<img src="image1.png" width="900" alt="MATLAB/Simulink Block Architecture">

### 2. Obstacle Avoidance Path Planning & Feasible Trajectory
The black line is the planned vehicle trajectory, the blue lines are road boundaries, and the red box represents the obstacle and safety zone.
The system uses a slope relationship to form a detour path; the vehicle bypasses the obstacle within road boundaries and gradually returns to the expected path.

<img src="image2.png" width="600" alt="Obstacle Avoidance Path Planning & Feasible Trajectory">

### 3. Obstacle Safety Distance & Avoidance Trigger Condition
The red dashed box indicates the obstacle buffer zone, and the black line is the path after avoidance.
The system uses the vehicle-to-obstacle distance as the trigger condition, activating the detour strategy when the distance falls below the threshold.

<img src="image3.png" width="600" alt="Obstacle Safety Distance & Avoidance Trigger Condition">

### 4. Impact of Sampling Period on Trajectory
Compares the MPC controller's control response under different sampling periods.
A shorter sampling period enables faster controller response and a smoother trajectory; a longer sampling period is more prone to delays and path deviation.

<img src="image4.png" width="600" alt="Impact of Sampling Period on Trajectory">

### 5. Impact of Steering Angle Limits on Avoidance Stability
Compares avoidance trajectories under different steering angle limits.
Steering angle limits affect the vehicle's maneuverability and stability during avoidance; the system uses these limits to constrain control inputs in simulation and analyzes their effect on overall stability.

<img src="image5.png" width="600" alt="Impact of Steering Angle Limits on Avoidance Stability">

### 6. CarSim Simulation
The left side shows the vehicle road simulation, and the right side displays vehicle state output curves.
Signals including lateral displacement, steering angle, and yaw angle can be observed as a basis for evaluating control response and trajectory stability.

<img src="image6.png" width="600" alt="CarSim Simulation">

## What I Learned

Participating in this team project allowed me to understand, from an Electrical Engineering control foundation, how model prediction, path control, obstacle avoidance logic, and input constraints collectively affect system behavior in autonomous systems. This experience has motivated me to further explore perception, motion planning, and higher-level control integration in robotics and autonomous systems.

## Technologies

- Model Predictive Control (MPC)
- Vehicle path tracking and obstacle avoidance
- Vehicle kinematic and dynamic modeling
- Obstacle distance condition and detour path generation
- Simulation comparison of sampling periods and steering angle limits
- MATLAB, Simulink, CarSim

## Project Structure
- `simulink_models/`: Contains Simulink models used for design and testing (e.g., `Linear_MPC_design.slxc`).
- `scripts/`: Contains MATLAB scripts for auxiliary analysis and data processing.
- `MPC virtual lab/`: The main interactive MATLAB Live Scripts documenting the experimental process.
- `README_official.md`: The original MathWorks documentation with detailed setup instructions and license information.
