import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Save your ideas", "Enjoy them whenever you want"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
