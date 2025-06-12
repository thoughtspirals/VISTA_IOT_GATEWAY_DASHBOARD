/** @type {import('postcss-load-config').Config} */
const config = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {}, // important for vendor prefixes (e.g., -webkit-)
  },
};

export default config;
