<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mahmudul Hasan | Contact Me</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    :root {
      --primary: #6a11cb;
      --secondary: #2575fc;
      --accent: #ff6a00;
      --text: #333;
      --light: #fff;
      --dark: #121212;
      --card-bg: rgba(255, 255, 255, 0.15);
      --shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
      --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    }

    body {
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      background: linear-gradient(-45deg, #ff4e50, #1e90ff, #32cd32, #ff69b4);
      background-size: 400% 400%;
      animation: gradientMove 15s ease infinite;
      padding: 20px;
      position: relative;
      overflow-x: hidden;
      transition: background 0.5s ease;
    }

    body.dark-mode {
      background: linear-gradient(-45deg, #2c3e50, #1a2a6c, #0f2027, #232526);
    }

    /* Floating particles */
    .particles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      z-index: 0;
    }

    .particle {
      position: absolute;
      width: 6px;
      height: 6px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.6);
      animation: float 15s linear infinite;
    }

    @keyframes gradientMove {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    @keyframes float {
      0% {
        transform: translateY(0) translateX(0);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      90% {
        opacity: 1;
      }
      100% {
        transform: translateY(-100vh) translateX(calc(var(--x) * 100px));
        opacity: 0;
      }
    }

    .container {
      position: relative;
      z-index: 2;
      width: 100%;
      max-width: 500px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .header {
      text-align: center;
      margin-bottom: 30px;
      animation: fadeInDown 1s ease;
    }

    @keyframes fadeInDown {
      from {
        opacity: 0;
        transform: translateY(-30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .title {
      font-size: 2.8rem;
      font-weight: 700;
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      -webkit-background-clip: text;
      background-clip: text;
      color: transparent;
      margin-bottom: 10px;
      text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .subtitle {
      font-size: 1.2rem;
      color: var(--light);
      font-weight: 300;
      opacity: 0.9;
      text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    }

    .profile-card {
      background: var(--card-bg);
      backdrop-filter: blur(12px);
      border-radius: 24px;
      padding: 30px;
      width: 100%;
      box-shadow: var(--shadow);
      border: 1px solid rgba(255, 255, 255, 0.18);
      margin-bottom: 30px;
      text-align: center;
      transition: var(--transition);
      transform: translateY(0);
      position: relative;
      overflow: hidden;
      animation: fadeIn 0.8s ease-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .profile-card::before {
      content: '';
      position: absolute;
      top: -50%;
      left: -50%;
      width: 200%;
      height: 200%;
      background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
      z-index: -1;
    }

    .profile-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    }

    .profile-frame {
      width: 180px;
      height: 180px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 8px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
      margin: 0 auto 25px;
      animation: pulse 3s infinite, floatAvatar 8s ease-in-out infinite;
      overflow: hidden;
      border: 4px solid white;
    }

    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.03); }
      100% { transform: scale(1); }
    }

    @keyframes floatAvatar {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-15px); }
    }

    .profile-img {
      width: 100%;
      height: 100%;
      border-radius: 50%;
      object-fit: cover;
    }

    .name {
      font-size: 2.2rem;
      font-weight: 700;
      color: var(--light);
      margin-bottom: 5px;
      text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
      position: relative;
      display: inline-block;
    }

    .name::after {
      content: '';
      position: absolute;
      bottom: -5px;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 3px;
      background: linear-gradient(90deg, var(--primary), var(--secondary));
      border-radius: 3px;
    }

    .tagline {
      font-size: 1.1rem;
      color: rgba(255, 255, 255, 0.85);
      font-weight: 300;
      margin-bottom: 25px;
    }

    .buttons-container {
      position: relative;
      z-index: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 100%;
      gap: 18px;
    }

    .button {
      padding: 18px 25px;
      width: 100%;
      font-size: 1.2rem;
      font-weight: 600;
      text-align: center;
      color: var(--light);
      border-radius: 16px;
      text-decoration: none;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: var(--transition);
      box-shadow: var(--shadow);
      position: relative;
      overflow: hidden;
      transform: translateY(0);
      border: none;
      cursor: pointer;
      animation: fadeIn 0.5s ease-out;
      animation-fill-mode: both;
    }

    .button i {
      margin-right: 15px;
      font-size: 1.5rem;
      transition: transform 0.3s;
    }

    .button:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
    }

    .button:hover i {
      transform: scale(1.2);
    }

    .button::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(rgba(255, 255, 255, 0.2), transparent);
      clip-path: polygon(0 0, 100% 0, 100% 30%, 0 100%);
      z-index: -1;
    }

    .button::after {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
      transition: 0.6s;
    }

    .button:hover::after {
      left: 100%;
    }

    .telegram {
      background: linear-gradient(135deg, #0088cc, #25a3e1);
      animation-delay: 0.1s;
    }

    .myapp {
      background: linear-gradient(135deg, #ff6a00, #ff3c83);
      animation-delay: 0.2s;
    }

    .website {
      background: linear-gradient(135deg, #0acf83, #2dd4bf);
      animation-delay: 0.3s;
    }

    .contact {
      background: linear-gradient(135deg, #25d366, #128c7e);
      animation-delay: 0.4s;
    }

    .social-icons {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 25px;
    }

    .social-icon {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(255, 255, 255, 0.1);
      color: var(--light);
      font-size: 1.5rem;
      transition: var(--transition);
      backdrop-filter: blur(5px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      animation: fadeIn 0.5s ease-out;
      animation-fill-mode: both;
    }

    .social-icon:nth-child(1) { animation-delay: 0.5s; }
    .social-icon:nth-child(2) { animation-delay: 0.6s; }
    .social-icon:nth-child(3) { animation-delay: 0.7s; }
    .social-icon:nth-child(4) { animation-delay: 0.8s; }

    .social-icon:hover {
      transform: translateY(-5px) scale(1.1);
      background: rgba(255, 255, 255, 0.2);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .footer {
      margin-top: 35px;
      color: rgba(255, 255, 255, 0.7);
      font-size: 0.9rem;
      text-align: center;
      padding: 15px;
      text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
      position: relative;
      z-index: 1;
      animation: fadeIn 1s ease-out;
    }

    .theme-toggle {
      position: absolute;
      top: 20px;
      right: 20px;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(5px);
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-size: 1.3rem;
      cursor: pointer;
      z-index: 10;
      border: 1px solid rgba(255, 255, 255, 0.2);
      transition: var(--transition);
      animation: fadeIn 1s ease-out;
    }

    .theme-toggle:hover {
      background: rgba(255, 255, 255, 0.25);
      transform: rotate(30deg);
    }

    /* Custom Cartoon Avatar */
    .avatar-container {
      width: 180px;
      height: 180px;
      border-radius: 50%;
      background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      overflow: hidden;
    }

    .avatar {
      position: relative;
      width: 140px;
      height: 140px;
    }

    /* Head */
    .avatar-head {
      position: absolute;
      width: 120px;
      height: 120px;
      background: #f9d5bb;
      border-radius: 50%;
      top: 10px;
      left: 10px;
      z-index: 2;
      box-shadow: inset -5px -5px 10px rgba(0,0,0,0.1);
    }

    /* Eyes */
    .avatar-eye {
      position: absolute;
      width: 16px;
      height: 20px;
      background: #333;
      border-radius: 50%;
      top: 45px;
      z-index: 3;
    }

    .avatar-eye-left {
      left: 40px;
    }

    .avatar-eye-right {
      right: 40px;
    }

    .avatar-eye::before {
      content: '';
      position: absolute;
      width: 6px;
      height: 6px;
      background: white;
      border-radius: 50%;
      top: 4px;
      left: 4px;
    }

    /* Eyebrows */
    .avatar-eyebrow {
      position: absolute;
      width: 25px;
      height: 8px;
      background: #8b6b4d;
      border-radius: 4px;
      top: 38px;
      z-index: 3;
    }

    .avatar-eyebrow-left {
      left: 38px;
      transform: rotate(-5deg);
    }

    .avatar-eyebrow-right {
      right: 38px;
      transform: rotate(5deg);
    }

    /* Nose */
    .avatar-nose {
      position: absolute;
      width: 12px;
      height: 15px;
      background: #e8b99c;
      border-radius: 50%;
      top: 65px;
      left: 64px;
      z-index: 3;
    }

    /* Mouth */
    .avatar-mouth {
      position: absolute;
      width: 40px;
      height: 15px;
      border-bottom: 4px solid #333;
      border-radius: 0 0 20px 20px;
      top: 85px;
      left: 50px;
      z-index: 3;
    }

    /* Hair */
    .avatar-hair {
      position: absolute;
      width: 130px;
      height: 70px;
      background: #3a2618;
      border-radius: 60px 60px 0 0;
      top: 5px;
      left: 5px;
      z-index: 1;
    }

    /* Glasses */
    .avatar-glasses {
      position: absolute;
      width: 80px;
      height: 30px;
      border: 3px solid #4a6fa5;
      border-radius: 15px;
      top: 50px;
      left: 30px;
      z-index: 4;
    }

    .avatar-glasses::before {
      content: '';
      position: absolute;
      width: 3px;
      height: 10px;
      background: #4a6fa5;
      top: 15px;
      left: 40px;
    }

    /* Suit */
    .avatar-suit {
      position: absolute;
      width: 100px;
      height: 60px;
      background: #1a3a6c;
      top: 130px;
      left: 20px;
      z-index: 1;
      border-radius: 10px 10px 0 0;
    }

    .avatar-suit::before {
      content: '';
      position: absolute;
      width: 30px;
      height: 40px;
      background: #1a3a6c;
      top: -20px;
      left: 35px;
      border-radius: 10px 10px 0 0;
    }

    .avatar-tie {
      position: absolute;
      width: 15px;
      height: 30px;
      background: #c00;
      top: 150px;
      left: 62.5px;
      z-index: 2;
      border-radius: 0 0 5px 5px;
    }

    .avatar-tie::before {
      content: '';
      position: absolute;
      width: 25px;
      height: 20px;
      background: #c00;
      top: -20px;
      left: -5px;
      border-radius: 5px 5px 0 0;
      clip-path: polygon(50% 0%, 0% 100%, 100% 100%);
    }
    
    /* Responsive adjustments */
    @media (max-width: 600px) {
      .title {
        font-size: 2.2rem;
      }
      
      .profile-frame {
        width: 160px;
        height: 160px;
      }
      
      .name {
        font-size: 1.8rem;
      }
      
      .button {
        padding: 16px 20px;
        font-size: 1.1rem;
      }
      
      .social-icon {
        width: 45px;
        height: 45px;
        font-size: 1.3rem;
      }
    }

    @media (max-width: 480px) {
      .profile-card {
        padding: 20px;
      }
      
      .title {
        font-size: 1.8rem;
      }
      
      .subtitle {
        font-size: 1rem;
      }
    }
  </style>
</head>
<body>

  <!-- Floating particles -->
  <div class="particles" id="particles"></div>
  
  <div class="theme-toggle" id="themeToggle">
    <i class="fas fa-moon"></i>
  </div>
  
  <div class="container">
    <div class="header">
      <h1 class="title">Smart Earning</h1>
      <p class="subtitle">Connect with Mahmudul Hasan</p>
    </div>
    
    <div class="profile-card">
      <div class="profile-frame">
        <!-- Custom Cartoon Avatar -->
        <div class="avatar-container">
          <div class="avatar">
            <div class="avatar-head"></div>
            <div class="avatar-hair"></div>
            <div class="avatar-eyebrow avatar-eyebrow-left"></div>
            <div class="avatar-eyebrow avatar-eyebrow-right"></div>
            <div class="avatar-glasses"></div>
            <div class="avatar-eye avatar-eye-left"></div>
            <div class="avatar-eye avatar-eye-right"></div>
            <div class="avatar-nose"></div>
            <div class="avatar-mouth"></div>
            <div class="avatar-suit"></div>
            <div class="avatar-tie"></div>
          </div>
        </div>
      </div>
      <h2 class="name">Mahmudul Hasan</h2>
      <p class="tagline">Digital Entrepreneur & Financial Advisor</p>
      
      <div class="buttons-container">
        <a href="https://t.me/free_smart_earning" target="_blank" class="button telegram">
          <i class="fab fa-telegram"></i>
          <span>Telegram Channel</span>
        </a>
        
        <a href="https://bit.ly/smart_earning_MHS" target="_blank" class="button myapp">
          <i class="fas fa-mobile-alt"></i>
          <span>My Mobile App</span>
        </a>
        
        <a href="https://t.me/sabbirhasan_088" target="_blank" class="button website">
          <i class="fas fa-globe"></i>
          <span>Official Website</span>
        </a>
        
        <a href="https://wa.me/8801764458050" target="_blank" class="button contact">
          <i class="fab fa-whatsapp"></i>
          <span>Contact Me</span>
        </a>
      </div>
      
      <div class="social-icons">
        <a href="https://www.facebook.com/share/1FopbocHiX/" target="_blank" class="social-icon">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="https://www.instagram.com" target="_blank" class="social-icon">
          <i class="fab fa-instagram"></i>
        </a>
        <a href="https://www.youtube.com/@smartearningpyro" target="_blank" class="social-icon">
          <i class="fab fa-youtube"></i>
        </a>
        <a href="https://www.linkedin.com" target="_blank" class="social-icon">
          <i class="fab fa-linkedin-in"></i>
        </a>
      </div>
    </div>
    
    <div class="footer">
      © 2025 Mahmudul Hasan | Welcome Working
    </div>
  </div>

  <script>
    // Create floating particles
    document.addEventListener('DOMContentLoaded', function() {
      const particlesContainer = document.getElementById('particles');
      const particleCount = 30;
      
      for (let i = 0; i < particleCount; i++) {
        const particle = document.createElement('div');
        particle.classList.add('particle');
        
        // Random position
        const left = Math.random() * 100;
        const top = Math.random() * 100;
        const size = Math.random() * 4 + 2;
        const duration = Math.random() * 15 + 10;
        const delay = Math.random() * 5;
        
        particle.style.left = `${left}%`;
        particle.style.top = `${top}%`;
        particle.style.width = `${size}px`;
        particle.style.height = `${size}px`;
        particle.style.animationDuration = `${duration}s`;
        particle.style.animationDelay = `${delay}s`;
        particle.style.setProperty('--x', Math.random() * 2 - 1);
        
        particlesContainer.appendChild(particle);
      }
      
      // Theme toggle functionality
      const themeToggle = document.getElementById('themeToggle');
      const body = document.body;
      const icon = themeToggle.querySelector('i');
      
      themeToggle.addEventListener('click', () => {
        body.classList.toggle('dark-mode');
        if (body.classList.contains('dark-mode')) {
          icon.classList.remove('fa-moon');
          icon.classList.add('fa-sun');
        } else {
          icon.classList.remove('fa-sun');
          icon.classList.add('fa-moon');
        }
      });
      
      // Animate buttons sequentially
      const buttons = document.querySelectorAll('.button');
      buttons.forEach((button, index) => {
        button.style.animationDelay = `${index * 0.1 + 0.3}s`;
      });
      
      // Add floating animation to profile card
      const profileCard = document.querySelector('.profile-card');
      profileCard.addEventListener('mousemove', (e) => {
        const rect = profileCard.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        
        const rotateX = (y - centerY) / 25;
        const rotateY = (centerX - x) / 25;
        
        profileCard.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-10px)`;
      });
      
      profileCard.addEventListener('mouseleave', () => {
        profileCard.style.transform = 'translateY(-10px)';
      });
    });
  </script>
</body>
</html>
<script type="text/javascript">
	atOptions = {
		'key' : '2949c531a729feff9db3ba26f411eac9',
		'format' : 'iframe',
		'height' : 60,
		'width' : 468,
		'params' : {}
	};
</script>
<script type="text/javascript" src="//www.highperformanceformat.com/2949c531a729feff9db3ba26f411eac9/invoke.js"></script>
