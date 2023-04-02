<script lang="ts">
  import Marquee from "svelte-fast-marquee";

  function handleBlobMovement({ clientX, clientY }: MouseEvent) {
    const blob = document.querySelector(".blob");

    blob.animate(
      {
        left: `${clientX - 50}px`,
        top: `${clientY - 50}px`,
      },
      { duration: 3000, fill: "forwards" }
    );
  }

  const functiondescription = "";
  const name = "";

  const repeatWord: number = 5;
</script>

<div class="remove-insert" style="display:none" />

<section id="hero" on:pointermove={handleBlobMovement} class="hero">
  <span class="blob" />
  <span class="blob-blur" />
</section>

<style lang="scss">
  .hero * {
    z-index: 4;
  }

  .blob {
    background-color: white;
    height: 260px;
    aspect-ratio: 1;
    position: absolute;
    inset: 0;
    translate: -50% -50%;
    border-radius: 50%;
    background: linear-gradient(to right, rgb(56, 66, 156), rgb(113, 41, 122));
    animation: rotateBlob 20s infinite;
    opacity: 0.6;
    z-index: 2;
    filter: blur(80px);
  }

  .blob-blur {
    height: 100%;
    width: 100%;
    position: absolute;
    z-index: 3;
    backdrop-filter: blur(20px);
  }

  @keyframes rotateBlob {
    from {
      rotate: 0deg;
    }

    50% {
      scale: 1 1.5;
    }

    to {
      rotate: 360deg;
    }
  }

  @keyframes float {
    0% {
      transform: translatey(0);
    }
    50% {
      transform: translatey(10px);
    }
    100% {
      transform: translatey(0);
    }
  }

  @keyframes rotateGradient {
    from {
      transform: rotate(0deg);
    }
    to {
      transform: rotate(360deg);
    }
  }

  .hero::before {
    content: "";
    position: absolute;
    display: grid;
    place-self: center;
    width: calc(100vw * 15);
    height: calc(100vh * 5);
    flex-shrink: 0;
    top: -50vh;
    bottom: 0;
    transform-origin: center;
    transform: translate(-50%, -50%);
    background: radial-gradient(circle at 50% 0, #0e1116, #ff000000 70.71%),
      radial-gradient(circle at 6.7% 75%, #0e1116, #0000ff00 70.71%),
      radial-gradient(circle at 93.3% 75%, #0e1116, #00ff0000 70.71%)
        rgb(5, 5, 5);
    background-size: 200% 200%;
    animation: rotateGradient 120s linear infinite;
    z-index: 1;
    filter: blur(10px);
  }

  .hero {
    position: relative;
    background-color: black;
    color: var(--hero-white);
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    font-family: "agrandir-grand", sans-serif;
    overflow: hidden;
  }
</style>
