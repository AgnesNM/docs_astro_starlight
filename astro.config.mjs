// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

import vercel from '@astrojs/vercel';

// https://astro.build/config
export default defineConfig({
  integrations: [
    starlight({
      title: 'Vuejs Docs Revamp',
      social: [{ icon: 'github', label: 'GitHub', href: 'https://github.com/withastro/starlight' }],
      sidebar: [
        // {
        //   label: 'Guides',
        //   items: [
        //     // Each item here is one entry in the navigation menu.
        //     { label: 'Example Guide', slug: 'guides/example' },
        //   ],
        // },
        // {
        //   label: 'Reference',
        //   autogenerate: { directory: 'reference' },
        // },
        // Add this new section for Vue.js docs
        {
          label: 'Vue.js Documentation',
          autogenerate: { directory: 'vue' },
        },
      ],
    }),
  ],

  adapter: vercel(),
});