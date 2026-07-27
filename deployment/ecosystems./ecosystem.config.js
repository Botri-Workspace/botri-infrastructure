module.exports = {
  apps: [
    {
      name: "BOTRI-CORE",
      cwd: "/home/ubuntu/BOTRI-LAB/GitHub/iqbinary-deriv-lab",
      script: "index.js",
      interpreter: "node",
      watch: false,
      autorestart: true,
      max_restarts: 10,
      restart_delay: 3000,
      env: {
        NODE_ENV: "production"
      }
    }
  ]
};
