# Troubleshooting

Common operational issues that may arise during the deployment lifecycle and how to fix them.

## Port Already in Use
**Error**: `Bind for 0.0.0.0:80 failed: port is already allocated`
**Fix**: Ensure no other service or Apache/Nginx instance is running on port 80 on your host machine.

## Container Not Starting / CrashLoopBackOff
**Fix**: Check logs to see what's wrong:
```bash
./scripts/logs.sh app
```

## Wrong Env Values
**Error**: Application behaves unexpectedly or port configuration mismatch.
**Fix**: Ensure your `.env` structure matches the `.env.example` file perfectly.

## Bad Nginx Config
**Error**: Nginx container exits immediately upon start.
**Fix**: A syntax issue might exist in `nginx/nginx.conf`. Run `docker logs demo-devops-nginx` to view the specific parsing failure.

## Build Failure
**Fix**: Check your `Dockerfile` or NPM installation logs. A common issue is misconfigured network restrictions preventing downloading node dependencies.

## Health Endpoint Not Reachable
**Fix**: Run `./scripts/healthcheck.sh` if it fails immediately, the container may still be booting. Wait 10 seconds and retry. If failure persists, tail the application logs.
