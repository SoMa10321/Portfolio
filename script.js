// شبكة متصلة ثلاثية الأبعاد
function initNetworkAnimation() {
  const canvas = document.getElementById('networkCanvas');
  const ctx = canvas.getContext('2d');

  canvas.width = canvas.offsetWidth;
  canvas.height = canvas.offsetHeight;

  const nodes = [];
  const nodeCount = 15;
  const connectionDistance = 150;

  /* ----------------------------------------*/
  // إنشاء العقد
  /* ----------------------------------------*/

  for (let i = 0; i < nodeCount; i++) {
    nodes.push({
      x: Math.random() * canvas.width,
      y: Math.random() * canvas.height,
      vx: (Math.random() - 0.5) * 0.5,
      vy: (Math.random() - 0.5) * 0.5,
      radius: Math.random() * 2 + 1
    });
  }

  function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    /* ----------------------------------------*/
    // تحديث مواقع العقد
    /* ----------------------------------------*/

    nodes.forEach(node => {
      node.x += node.vx;
      node.y += node.vy;

      if (node.x < 0 || node.x > canvas.width) node.vx *= -1;
      if (node.y < 0 || node.y > canvas.height) node.vy *= -1;
    });

    /* ----------------------------------------*/
    // رسم الخطوط المتصلة
    /* ----------------------------------------*/

    for (let i = 0; i < nodes.length; i++) {
      for (let j = i + 1; j < nodes.length; j++) {
        const dx = nodes[i].x - nodes[j].x;
        const dy = nodes[i].y - nodes[j].y;
        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance < connectionDistance) {
          ctx.beginPath();
          ctx.moveTo(nodes[i].x, nodes[i].y);
          ctx.lineTo(nodes[j].x, nodes[j].y);
          ctx.strokeStyle = `rgba(255, 255, 255, ${0.2 * (1 - distance / connectionDistance)})`;
          ctx.lineWidth = 0.5;
          ctx.stroke();
        }
      }
    }

    /* ----------------------------------------*/
    // رسم العقد
    /* ----------------------------------------*/

    nodes.forEach(node => {
      ctx.beginPath();
      ctx.arc(node.x, node.y, node.radius, 0, Math.PI * 2);
      ctx.fillStyle = 'rgba(255, 255, 255, 0.8)';
      ctx.fill();
    });

    requestAnimationFrame(animate);
  }

  animate();
}

/* ----------------------------------------*/
// إنشاء الجسيمات المتصلة
/* ----------------------------------------*/

function createConnectedParticles() {
  const container = document.getElementById('particlesContainer');
  const particleCount = 30;
  const particles = [];

  for (let i = 0; i < particleCount; i++) {
    const particle = document.createElement('div');
    particle.className = 'particle';

    /* ----------------------------------------*/
    // موضع عشوائي
    /* ----------------------------------------*/

    const x = Math.random() * 100;
    const y = Math.random() * 100;
    particle.style.left = `${x}%`;
    particle.style.top = `${y}%`;

    /* ----------------------------------------*/
    // تأخير عشوائي
    /* ----------------------------------------*/

    particle.style.animationDelay = `${Math.random() * 20}s`;

    container.appendChild(particle);
    particles.push({ element: particle, x, y });
  }

  /* ----------------------------------------*/
  // إنشاء خطوط الاتصال
  /* ----------------------------------------*/

  for (let i = 0; i < particles.length; i++) {
    for (let j = i + 1; j < particles.length; j++) {
      const dx = particles[i].x - particles[j].x;
      const dy = particles[i].y - particles[j].y;
      const distance = Math.sqrt(dx * dx + dy * dy);

      if (distance < 20) {
        const line = document.createElement('div');
        line.className = 'connection-line';

        const angle = Math.atan2(dy, dx) * 180 / Math.PI;
        const length = Math.sqrt(dx * dx + dy * dy);

        line.style.width = `${length}%`;
        line.style.left = `${particles[j].x}%`;
        line.style.top = `${particles[j].y}%`;
        line.style.transform = `rotate(${angle}deg)`;

        container.appendChild(line);
      }
    }
  }
}

/* ----------------------------------------*/
// إنشاء الجسيمات المتحركة
/* ----------------------------------------*/

function createParticles() {
  const particlesContainer = document.getElementById('particles');
  const particleCount = 30;

  for (let i = 0; i < particleCount; i++) {
    const particle = document.createElement('div');
    particle.className = 'particle';

    /* ----------------------------------------*/
    // حجم عشوائي
    /* ----------------------------------------*/

    const size = Math.random() * 3 + 1;
    particle.style.width = `${size}px`;
    particle.style.height = `${size}px`;

    /* ----------------------------------------*/
    // موضع عشوائي
    /* ----------------------------------------*/

    particle.style.left = `${Math.random() * 100}%`;
    particle.style.top = `${Math.random() * 100}%`;

    /* ----------------------------------------*/
    // تأخير عشوائي
    /* ----------------------------------------*/

    particle.style.animationDelay = `${Math.random() * 20}s`;

    particlesContainer.appendChild(particle);
  }
}

/* ----------------------------------------*/
// تهيئة كل الرسوم المتحركة
/* ----------------------------------------*/

window.addEventListener('load', function () {
  initNetworkAnimation();
  createConnectedParticles();
  createParticles();
});

/* ----------------------------------------*/
// القائمة المتحركة للشاشات الصغيرة
/* ----------------------------------------*/

document.querySelector('.menu-toggle').addEventListener('click', function () {
  document.querySelector('nav').classList.toggle('active');
});

/* ----------------------------------------*/
// إغلاق القائمة عند النقر على رابط
/* ----------------------------------------*/

document.querySelectorAll('nav a').forEach(link => {
  link.addEventListener('click', function () {
    document.querySelector('nav').classList.remove('active');
  });
});

/* ----------------------------------------*/
// تأثير التمرير للعناصر
/* ----------------------------------------*/

function checkVisibility() {
  const elements = document.querySelectorAll('.project-card, .skill-card');

  elements.forEach(element => {
    const elementTop = element.getBoundingClientRect().top;
    const windowHeight = window.innerHeight;

    if (elementTop < windowHeight - 100) {
      element.classList.add('visible');
    }
  });
}

/* ----------------------------------------*/
// التحقق من ظهور العناصر عند التحميل وعند التمرير
/* ----------------------------------------*/

window.addEventListener('load', checkVisibility);
window.addEventListener('scroll', checkVisibility);

/* ----------------------------------------*/
// تأثير الشريط العلوي عند التمرير
/* ----------------------------------------*/

window.addEventListener('scroll', function () {
  const header = document.querySelector('header');
  if (window.scrollY > 100) {
    header.classList.add('scrolled');
  } else {
    header.classList.remove('scrolled');
  }
});

/* ----------------------------------------*/
// إضافة تأثيرات إضافية للروابط
/* ----------------------------------------*/

document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();

    const targetId = this.getAttribute('href');
    if (targetId === '#') return;

    const targetElement = document.querySelector(targetId);
    if (targetElement) {
      window.scrollTo({
        top: targetElement.offsetTop - 80,
        behavior: 'smooth'
      });
    }
  });
});


/* ----------------------------------------*/
// تأثير الكتابة في الـ Terminal
/* ----------------------------------------*/

function typeWriter() {
  const terminalLines = document.querySelectorAll('.terminal-line');
  terminalLines.forEach((line, index) => {
    setTimeout(() => {
      line.style.opacity = '1';
    }, index * 500);
  });
}

typeWriter();
