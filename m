Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9430F2E0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 13:10:14 +0100 (CET)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7dSf-0001ei-FS
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 07:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7dRZ-0001Ek-Aw
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7dRV-0000bN-1a
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 07:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612440540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tlAOW600HGtbsHB7QGarzQKISjtCgvEctzj6uONVHBU=;
 b=HRTbV1hZ+QjxN32HE90Gm7xJHhH1DBLDSDh6nZiREy4Sg+VY/drM/4tPJdw3Nrqg5BnhC8
 AGz0Pg2WtHMlGbUPgPbbAAcXFhL618SGo6TjASkZj3DFXeQxkiUHhxdxEgiutBYxF9jnhU
 t67FwmRO5xHY1Dz+aq5DmfgUjSrg7C0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-JTAFvzwZMy2RCVcnFojamg-1; Thu, 04 Feb 2021 07:08:58 -0500
X-MC-Unique: JTAFvzwZMy2RCVcnFojamg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5F29107ACE4;
 Thu,  4 Feb 2021 12:08:56 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 921C35C257;
 Thu,  4 Feb 2021 12:08:43 +0000 (UTC)
Date: Thu, 4 Feb 2021 12:08:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: Re: [RFC PATCH 6/9] virtiofsd: Add two new options for crash
 reconnection
Message-ID: <20210204120840.GG3039@work-vm>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <20201215162119.27360-7-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20201215162119.27360-7-zhangjiachen.jaycee@bytedance.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jiachen Zhang (zhangjiachen.jaycee@bytedance.com) wrote:
> We add two options for virtiofsd crash reconnection: reconnect |
> no_reconnect(default) and
> 
> User of virtiofsd should set "-o reconnect" for crash reconnection. Note
> that, when "-o reconnect" is set, some options will not be supported and we
> need to disable them:
> 
>   - mount namespace: When mount namespace is enabled, reconnected
>     virtiofsd will failed to link/rename for EXDEV. The reason is, when
>     virtiofsd is sandboxed by mount namespace, attempts to link/rename
>     the fds opened before crashing (also recovered from QEMU) will be
>     considered as across mount operations between mounts, which is not
>     allowed by host kernel.
> 
>     So we introduce another option "-o mount_ns|no_mount_ns" (mount_ns
>     by default, and takes no effect when sandbox=chroot is specified).
>     The option "-o no_mount_ns" should be used with "-o reconnect".

Why not just use -o sandbox=chroot?

>   - remote locking: As it is hard to determine wether a file is locked or
>     not when handling inflight locking requests, we should specify "-o
>     no_posix_lock" (default) and "-o no_flock" (default).
> 
>   - extended attributes: When handling inflight removexattr requests after
>     reconnecting, it is hard to determine wether a attr is already removed
>     or not. Therefore, we should also use "-o noxattr" (default) with "-o
>     reconnect".

Can you explain a bit more about why removexattr is hard to restart?

Dave
> 
> Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  tools/virtiofsd/helper.c         |   9 +++
>  tools/virtiofsd/passthrough_ll.c | 112 ++++++++++++++++++++++---------
>  2 files changed, 88 insertions(+), 33 deletions(-)
> 
> diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> index 75ac48dec2..e0d6525b1a 100644
> --- a/tools/virtiofsd/helper.c
> +++ b/tools/virtiofsd/helper.c
> @@ -174,6 +174,10 @@ void fuse_cmdline_help(void)
>             "                               - chroot: chroot(2) into shared\n"
>             "                                 directory (use in containers)\n"
>             "                               default: namespace\n"
> +           "    -o mount_ns|no_mount_ns    enable/disable mount namespace\n"
> +           "                               default: mount_ns\n"
> +           "                               note: if chroot sandbox mode is used,\n"
> +           "                               mount_ns will not take effect.\n"
>             "    -o timeout=<number>        I/O timeout (seconds)\n"
>             "                               default: depends on cache= option.\n"
>             "    -o writeback|no_writeback  enable/disable writeback cache\n"
> @@ -191,6 +195,11 @@ void fuse_cmdline_help(void)
>             "                               to virtiofsd from guest applications.\n"
>             "                               default: no_allow_direct_io\n"
>             "    -o announce_submounts      Announce sub-mount points to the guest\n"
> +           "    -o reconnect|no_reconnect  enable/disable crash reconnection\n"
> +           "                               to enable crash reconnection, the options\n"
> +           "                               no_mount_ns, no_flock, no_posix_lock, and\n"
> +           "                               no_xattr should also be set.\n"
> +           "                               default: no_reconnect\n"
>             );
>  }
>  
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 815b001076..73a50bd7a3 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -170,6 +170,8 @@ struct lo_data {
>      pthread_mutex_t mutex;
>      int sandbox;
>      int debug;
> +    int mount_ns;
> +    int reconnect;
>      int writeback;
>      int flock;
>      int posix_lock;
> @@ -204,8 +206,12 @@ static const struct fuse_opt lo_opts[] = {
>      { "sandbox=chroot",
>        offsetof(struct lo_data, sandbox),
>        SANDBOX_CHROOT },
> +    { "reconnect", offsetof(struct lo_data, reconnect), 1 },
> +    { "no_reconnect", offsetof(struct lo_data, reconnect), 0 },
>      { "writeback", offsetof(struct lo_data, writeback), 1 },
>      { "no_writeback", offsetof(struct lo_data, writeback), 0 },
> +    { "mount_ns", offsetof(struct lo_data, mount_ns), 1 },
> +    { "no_mount_ns", offsetof(struct lo_data, mount_ns), 0 },
>      { "source=%s", offsetof(struct lo_data, source), 0 },
>      { "flock", offsetof(struct lo_data, flock), 1 },
>      { "no_flock", offsetof(struct lo_data, flock), 0 },
> @@ -3047,8 +3053,14 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
>       * an empty network namespace to prevent TCP/IP and other network
>       * activity in case this process is compromised.
>       */
> -    if (unshare(CLONE_NEWPID | CLONE_NEWNS | CLONE_NEWNET) != 0) {
> -        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWPID | CLONE_NEWNS): %m\n");
> +    int unshare_flag;
> +    if (lo->mount_ns) {
> +        unshare_flag = CLONE_NEWPID | CLONE_NEWNS | CLONE_NEWNET;
> +    } else {
> +        unshare_flag = CLONE_NEWPID | CLONE_NEWNET;
> +    }
> +    if (unshare(unshare_flag) != 0) {
> +        fuse_log(FUSE_LOG_ERR, "unshare(): %m\n");
>          exit(1);
>      }
>  
> @@ -3083,38 +3095,47 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
>      /* Send us SIGTERM when the parent thread terminates, see prctl(2) */
>      prctl(PR_SET_PDEATHSIG, SIGTERM);
>  
> -    /*
> -     * If the mounts have shared propagation then we want to opt out so our
> -     * mount changes don't affect the parent mount namespace.
> -     */
> -    if (mount(NULL, "/", NULL, MS_REC | MS_SLAVE, NULL) < 0) {
> -        fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_SLAVE): %m\n");
> -        exit(1);
> -    }
> +    if (lo->mount_ns) {
> +        /*
> +         * If the mounts have shared propagation then we want to opt out so our
> +         * mount changes don't affect the parent mount namespace.
> +         */
> +        if (mount(NULL, "/", NULL, MS_REC | MS_SLAVE, NULL) < 0) {
> +            fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_SLAVE): %m\n");
> +            exit(1);
> +        }
>  
> -    /* The child must remount /proc to use the new pid namespace */
> -    if (mount("proc", "/proc", "proc",
> -              MS_NODEV | MS_NOEXEC | MS_NOSUID | MS_RELATIME, NULL) < 0) {
> -        fuse_log(FUSE_LOG_ERR, "mount(/proc): %m\n");
> -        exit(1);
> -    }
> +        /* The child must remount /proc to use the new pid namespace */
> +        if (mount("proc", "/proc", "proc",
> +                  MS_NODEV | MS_NOEXEC | MS_NOSUID | MS_RELATIME, NULL) < 0) {
> +            fuse_log(FUSE_LOG_ERR, "mount(/proc): %m\n");
> +            exit(1);
> +        }
>  
> -    /*
> -     * We only need /proc/self/fd. Prevent ".." from accessing parent
> -     * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
> -     * previously remounted with MS_REC | MS_SLAVE this mount change only
> -     * affects our process.
> -     */
> -    if (mount("/proc/self/fd", "/proc", NULL, MS_BIND, NULL) < 0) {
> -        fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, MS_BIND): %m\n");
> -        exit(1);
> -    }
> +        /*
> +         * We only need /proc/self/fd. Prevent ".." from accessing parent
> +         * directories of /proc/self/fd by bind-mounting it over /proc. Since
> +         * / was previously remounted with MS_REC | MS_SLAVE this mount change
> +         * only affects our process.
> +         */
> +        if (mount("/proc/self/fd", "/proc", NULL, MS_BIND, NULL) < 0) {
> +            fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, MS_BIND): %m\n");
> +            exit(1);
> +        }
>  
> -    /* Get the /proc (actually /proc/self/fd, see above) file descriptor */
> -    lo->proc_self_fd = open("/proc", O_PATH);
> -    if (lo->proc_self_fd == -1) {
> -        fuse_log(FUSE_LOG_ERR, "open(/proc, O_PATH): %m\n");
> -        exit(1);
> +        /* Get the /proc (actually /proc/self/fd, see above) file descriptor */
> +        lo->proc_self_fd = open("/proc", O_PATH);
> +        if (lo->proc_self_fd == -1) {
> +            fuse_log(FUSE_LOG_ERR, "open(/proc, O_PATH): %m\n");
> +            exit(1);
> +        }
> +    } else {
> +        /* Now we can get our /proc/self/fd directory file descriptor */
> +        lo->proc_self_fd = open("/proc/self/fd", O_PATH);
> +        if (lo->proc_self_fd == -1) {
> +            fuse_log(FUSE_LOG_ERR, "open(/proc/self/fd, O_PATH): %m\n");
> +            exit(1);
> +        }
>      }
>  }
>  
> @@ -3347,7 +3368,9 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
>  {
>      if (lo->sandbox == SANDBOX_NAMESPACE) {
>          setup_namespaces(lo, se);
> -        setup_mounts(lo->source);
> +        if (lo->mount_ns) {
> +            setup_mounts(lo->source);
> +        }
>      } else {
>          setup_chroot(lo);
>      }
> @@ -3438,7 +3461,11 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
>      struct stat stat;
>      uint64_t mnt_id;
>  
> -    fd = open("/", O_PATH);
> +    if (lo->mount_ns) {
> +        fd = open("/", O_PATH);
> +    } else {
> +        fd = open(lo->source, O_PATH);
> +    }
>      if (fd == -1) {
>          fuse_log(FUSE_LOG_ERR, "open(%s, O_PATH): %m\n", lo->source);
>          exit(1);
> @@ -3515,6 +3542,9 @@ int main(int argc, char *argv[])
>      lo.allow_direct_io = 0,
>      lo.proc_self_fd = -1;
>  
> +    lo.reconnect = 0;
> +    lo.mount_ns = 1;
> +
>      /* Don't mask creation mode, kernel already did that */
>      umask(0);
>  
> @@ -3577,6 +3607,22 @@ int main(int argc, char *argv[])
>          goto err_out1;
>      }
>  
> +    /* For sandbox mode "chroot", set the mount_ns option to 0. */
> +    if (lo.sandbox == SANDBOX_CHROOT) {
> +        lo.mount_ns = 0;
> +    }
> +
> +    if (lo.reconnect) {
> +        if ((lo.sandbox == SANDBOX_NAMESPACE && lo.mount_ns) || lo.flock
> +                                               || lo.posix_lock || lo.xattr) {
> +            printf("Mount namespace, remote lock, and extended attributes"
> +                   " are not supported by reconnection (-o reconnect). Please "
> +                   "specify  -o no_mount_ns, -o no_flock (default), -o"
> +                   "no_posix_lock (default), and -o no_xattr (default).\n");
> +            exit(1);
> +        }
> +    }
> +
>      if (opts.log_level != 0) {
>          current_log_level = opts.log_level;
>      } else {
> -- 
> 2.20.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


