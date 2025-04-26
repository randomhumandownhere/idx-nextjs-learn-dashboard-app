npx --yes create-next-app@latest nextjs-dashboard --example "https://github.com/vercel/next-learn/tree/main/dashboard/starter-example" --use-pnpm
mv nextjs-dashboard/.* .
mv nextjs-dashboard/* .
rm -rf nextjs-dashboard
pnpm i
echo "Startup done!"