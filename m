Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED64ABDA9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:02:56 +0100 (CET)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2jO-0000c2-Tv
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH2Lh-0004Oj-IJ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH2Lb-0002YR-C4
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644233898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b3ol/8IF2cgQcapfiNN7unM6VujNjQ0dhWD2hTYx6YA=;
 b=NEpzrbFyFWXkNF+cTzdCmRBX7OxVeC/4vngNhy7e+kPAneuvwtIZJDWFPUuKP+1xyMQSoG
 /mDtjPGi3Wq5DquH0zfOnD3hdzVmRKVH7sEtcGnSOigY0ooE5LlLpTWzoU7IE3dkwZY+k/
 Zc6UGDXP9578j5RF40YLToCOD7xnVCE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-WDwxuaBEOJCjELYt1uChdQ-1; Mon, 07 Feb 2022 06:38:16 -0500
X-MC-Unique: WDwxuaBEOJCjELYt1uChdQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l27-20020adfa39b000000b001e315c20064so699312wrb.10
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b3ol/8IF2cgQcapfiNN7unM6VujNjQ0dhWD2hTYx6YA=;
 b=mkNZM8JErvgAQ5rAzfil7QL/iVXRkDbNq65mkEWNlvjk5HPezZt/X9Q7CMx46U7Loh
 zVOWteDWQuOEO50AdMa1gE+U2L6k9oTJ28uXLXaqBY7Rns0qHXqxs1HBONv5EhcVqrhL
 f26Hh+0/QTlDYk5AF6Lbj8sWmU+fkUvmM0OSKrFWd8eTeUxj0ZLC1D+JGP0EGxHzWwTH
 hUlhWSuUbnHOptm3e2577gtTIcHibwez3bQ327qU7Yrf1OgxKOl7BEu6Ze78Y7l+iKkA
 5hlHCRBxVQu4RKpfNK0UH59O7KG+QYvBgQ5pU/bBFk2wd62bE9IhNLG7s02Rk7ZamHxG
 8Zug==
X-Gm-Message-State: AOAM533tIB3wIvZEVB/97SnxyxSjktZzmEJSdGQue76YihJ0XiJbGyxs
 3PfskccPe5Ab+mE0pL5rjALrrgAvL7euU6qkQ1i2C8TpE0nIF4PCz4HyJ0gtt1CEY2rn/ev7LvK
 wksIw1/p0dQyUYTo=
X-Received: by 2002:a05:600c:4e16:: with SMTP id
 b22mr13711901wmq.31.1644233894978; 
 Mon, 07 Feb 2022 03:38:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaFWWPBVrYdZCIQDOAO6DBvxsPhfrQu3CgvKG2DOG2aJEgO2xC7UIRiqfY5+RWp1L9O80P7w==
X-Received: by 2002:a05:600c:4e16:: with SMTP id
 b22mr13711867wmq.31.1644233894586; 
 Mon, 07 Feb 2022 03:38:14 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m12sm11094041wrp.61.2022.02.07.03.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 03:38:14 -0800 (PST)
Date: Mon, 7 Feb 2022 11:38:12 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 7/9] virtiofsd: Create new file with fscreate set
Message-ID: <YgEEpKoFqLK2JPQq@work-vm>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <20220202193935.268777-8-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220202193935.268777-8-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> This patch adds support to set /proc/thread-self/attr/fscreate before
> file creation. It is set to a value as sent by client. This will allow
> for atomic creation of security context on files w.r.t file creation.
> 
> This is primarily useful when either there is no SELinux enabled on
> host or host and guest policies are in sync and don't conflict.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Minor nit below, but I think this is right:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

I would however prefer if you could split this patch; it's a bit long to
review.


> ---
>  tools/virtiofsd/passthrough_ll.c | 317 ++++++++++++++++++++++++++++---
>  1 file changed, 290 insertions(+), 27 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 82023bf3d4..acb99aa2fc 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -173,10 +173,14 @@ struct lo_data {
>  
>      /* An O_PATH file descriptor to /proc/self/fd/ */
>      int proc_self_fd;
> +    /* An O_PATH file descriptor to /proc/self/task/ */
> +    int proc_self_task;
>      int user_killpriv_v2, killpriv_v2;
>      /* If set, virtiofsd is responsible for setting umask during creation */
>      bool change_umask;
>      int user_posix_acl, posix_acl;
> +    /* Keeps track if /proc/<pid>/attr/fscreate should be used or not */
> +    bool use_fscreate;
>  };
>  
>  static const struct fuse_opt lo_opts[] = {
> @@ -230,6 +234,11 @@ static struct lo_inode *lo_find(struct lo_data *lo, struct stat *st,
>  static int xattr_map_client(const struct lo_data *lo, const char *client_name,
>                              char **out_name);
>  
> +#define FCHDIR_NOFAIL(fd) do {                         \
> +        int fchdir_res = fchdir(fd);                   \
> +        assert(fchdir_res == 0);                       \
> +    } while (0)
> +
>  static bool is_dot_or_dotdot(const char *name)
>  {
>      return name[0] == '.' &&
> @@ -256,6 +265,33 @@ static struct lo_data *lo_data(fuse_req_t req)
>      return (struct lo_data *)fuse_req_userdata(req);
>  }
>  
> +/*
> + * Tries to figure out if /proc/<pid>/attr/fscrate is usable or not. With
> + * selinux=0, read from fscreate returns -EINVAL.
> + *
> + * TODO: Link with libselinux and use is_selinux_enabled() instead down
> + * the line. It probably will be more reliable indicator.
> + */
> +static bool is_fscreate_usable(struct lo_data *lo)
> +{
> +    char procname[64];
> +    int fscreate_fd;
> +    size_t bytes_read;
> +
> +    sprintf(procname, "%d/attr/fscreate", gettid());
> +    fscreate_fd = openat(lo->proc_self_task, procname, O_RDWR);
> +    if (fscreate_fd == -1) {
> +        return false;
> +    }
> +
> +    bytes_read = read(fscreate_fd, procname, 64);
> +    close(fscreate_fd);
> +    if (bytes_read == -1) {
> +        return false;
> +    }
> +    return true;
> +}
> +
>  /*
>   * Load capng's state from our saved state if the current thread
>   * hadn't previously been loaded.
> @@ -1284,16 +1320,140 @@ static void lo_restore_cred_gain_cap(struct lo_cred *old, bool restore_umask,
>      }
>  }
>  
> +/* Helpers to set/reset fscreate */
> +static int open_set_proc_fscreate(struct lo_data *lo, const void *ctx,
> +                                  size_t ctxlen, int *fd)
> +{
> +    char procname[64];
> +    int fscreate_fd, err = 0;
> +    size_t written;
> +
> +    sprintf(procname, "%d/attr/fscreate", gettid());
> +    fscreate_fd = openat(lo->proc_self_task, procname, O_WRONLY);
> +    err = fscreate_fd == -1 ? errno : 0;
> +    if (err) {
> +        return err;
> +    }
> +
> +    written = write(fscreate_fd, ctx, ctxlen);
> +    err = written == -1 ? errno : 0;
> +    if (err) {
> +        goto out;
> +    }
> +
> +    *fd = fscreate_fd;
> +    return 0;
> +out:
> +    close(fscreate_fd);
> +    return err;
> +}
> +
> +static void close_reset_proc_fscreate(int fd)
> +{
> +    if ((write(fd, NULL, 0)) == -1) {
> +        fuse_log(FUSE_LOG_WARNING, "Failed to reset fscreate. err=%d\n", errno);
> +    }
> +    close(fd);
> +    return;
> +}
> +
> +static int do_mknod_symlink_secctx(fuse_req_t req, struct lo_inode *dir,
> +                                   const char *name, const char *secctx_name)
> +{
> +    int path_fd, err;
> +    char procname[64];
> +    struct lo_data *lo = lo_data(req);
> +
> +    if (!req->secctx.ctxlen) {
> +        return 0;
> +    }
> +
> +    /* Open newly created element with O_PATH */
> +    path_fd = openat(dir->fd, name, O_PATH | O_NOFOLLOW);
> +    err = path_fd == -1 ? errno : 0;
> +    if (err) {
> +        return err;
> +    }
> +    sprintf(procname, "%i", path_fd);
> +    FCHDIR_NOFAIL(lo->proc_self_fd);
> +    /* Set security context. This is not atomic w.r.t file creation */
> +    err = setxattr(procname, secctx_name, req->secctx.ctx, req->secctx.ctxlen,
> +                   0);
> +    if (err) {
> +        err = errno;
> +    }
> +    FCHDIR_NOFAIL(lo->root.fd);
> +    close(path_fd);
> +    return err;
> +}
> +
> +static int do_mknod_symlink(fuse_req_t req, struct lo_inode *dir,
> +                            const char *name, mode_t mode, dev_t rdev,
> +                            const char *link)
> +{
> +    int err, fscreate_fd = -1;
> +    const char *secctx_name = req->secctx.name;
> +    struct lo_cred old = {};
> +    struct lo_data *lo = lo_data(req);
> +    char *mapped_name = NULL;
> +    bool secctx_enabled = req->secctx.ctxlen;
> +    bool do_fscreate = false;
> +
> +    if (secctx_enabled && lo->xattrmap) {
> +        err = xattr_map_client(lo, req->secctx.name, &mapped_name);
> +        if (err < 0) {
> +            return -err;
> +        }
> +        secctx_name = mapped_name;
> +    }
> +
> +    /*
> +     * If security xattr has not been remapped and selinux is enabled on
> +     * host, set fscreate and no need to do a setxattr() after file creation
> +     */
> +    if (secctx_enabled && !mapped_name && lo->use_fscreate) {
> +        do_fscreate = true;
> +        err = open_set_proc_fscreate(lo, req->secctx.ctx, req->secctx.ctxlen,
> +                                     &fscreate_fd);
> +        if (err) {
> +            goto out;
> +        }
> +    }
> +
> +    err = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
> +    if (err) {
> +        goto out;
> +    }
> +
> +    err = mknod_wrapper(dir->fd, name, link, mode, rdev);
> +    err = err == -1 ? errno : 0;
> +    lo_restore_cred(&old, lo->change_umask && !S_ISLNK(mode));
> +    if (err) {
> +        goto out;
> +    }
> +
> +    if (!do_fscreate) {
> +        err = do_mknod_symlink_secctx(req, dir, name, secctx_name);
> +        if (err) {
> +            unlinkat(dir->fd, name, S_ISDIR(mode) ? AT_REMOVEDIR : 0);
> +        }
> +    }
> +out:
> +    if (fscreate_fd != -1) {
> +        close_reset_proc_fscreate(fscreate_fd);
> +    }
> +    g_free(mapped_name);
> +    return err;
> +}
> +
>  static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>                               const char *name, mode_t mode, dev_t rdev,
>                               const char *link)
>  {
> -    int res;
>      int saverr;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *dir;
>      struct fuse_entry_param e;
> -    struct lo_cred old = {};
>  
>      if (is_empty(name)) {
>          fuse_reply_err(req, ENOENT);
> @@ -1311,21 +1471,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
>          return;
>      }
>  
> -    saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
> +    saverr = do_mknod_symlink(req, dir, name, mode, rdev, link);
>      if (saverr) {
>          goto out;
>      }
>  
> -    res = mknod_wrapper(dir->fd, name, link, mode, rdev);
> -
> -    saverr = errno;
> -
> -    lo_restore_cred(&old, lo->change_umask && !S_ISLNK(mode));
> -
> -    if (res == -1) {
> -        goto out;
> -    }
> -
>      saverr = lo_do_lookup(req, parent, name, &e, NULL);
>      if (saverr) {
>          goto out;
> @@ -2001,13 +2151,16 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
>      return 0;
>  }
>  
> -static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
> -                        const char *name, mode_t mode,
> -                        struct fuse_file_info *fi, int* open_fd)
> +static int do_create_nosecctx(fuse_req_t req, struct lo_inode *parent_inode,
> +                               const char *name, mode_t mode,
> +                               struct fuse_file_info *fi, int *open_fd)
>  {
> -    int err = 0, fd;
> +    int err, fd;
>      struct lo_cred old = {};
>      struct lo_data *lo = lo_data(req);
> +    int flags;
> +
> +    flags = fi->flags | O_CREAT | O_EXCL;
>  
>      err = lo_change_cred(req, &old, lo->change_umask);
>      if (err) {
> @@ -2015,13 +2168,106 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
>      }
>  
>      /* Try to create a new file but don't open existing files */
> -    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
> -    if (fd == -1) {
> -        err = errno;
> -    } else {
> +    fd = openat(parent_inode->fd, name, flags, mode);
> +    err = fd == -1 ? errno : 0;
> +    lo_restore_cred(&old, lo->change_umask);
> +    if (!err) {
>          *open_fd = fd;
>      }
> -    lo_restore_cred(&old, lo->change_umask);
> +    return err;
> +}
> +
> +static int do_create_secctx_fscreate(fuse_req_t req,
> +                                     struct lo_inode *parent_inode,
> +                                     const char *name, mode_t mode,
> +                                     struct fuse_file_info *fi, int *open_fd)
> +{
> +    int err = 0, fd = -1, fscreate_fd = -1;
> +    struct lo_data *lo = lo_data(req);
> +
> +    err = open_set_proc_fscreate(lo, req->secctx.ctx, req->secctx.ctxlen,
> +                                 &fscreate_fd);
> +    if (err) {
> +        return err;
> +    }
> +
> +    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
> +
> +    close_reset_proc_fscreate(fscreate_fd);
> +    if (!err) {
> +        *open_fd = fd;
> +    }
> +    return err;
> +}
> +
> +static int do_create_secctx_noatomic(fuse_req_t req,
> +                                     struct lo_inode *parent_inode,
> +                                     const char *name, mode_t mode,
> +                                     struct fuse_file_info *fi,
> +                                     const char *secctx_name, int *open_fd)
> +{
> +    int err = 0, fd = -1;
> +
> +    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
> +    if (err) {
> +        goto out;
> +    }
> +
> +    /* Set security context. This is not atomic w.r.t file creation */
> +    err = fsetxattr(fd, secctx_name, req->secctx.ctx, req->secctx.ctxlen, 0);
> +    err = err == -1 ? errno : 0;
> +out:
> +    if (!err) {
> +        *open_fd = fd;
> +    } else {
> +        if (fd != -1) {
> +            close(fd);
> +            unlinkat(parent_inode->fd, name, 0);
> +        }
> +    }
> +    return err;
> +}
> +
> +static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
> +                        const char *name, mode_t mode,
> +                        struct fuse_file_info *fi, int *open_fd)
> +{
> +    struct lo_data *lo = lo_data(req);
> +    char *mapped_name = NULL;
> +    int err;
> +    const char *ctxname = req->secctx.name;
> +    bool secctx_enabled = req->secctx.ctxlen;
> +
> +    if (secctx_enabled && lo->xattrmap) {
> +        err = xattr_map_client(lo, req->secctx.name, &mapped_name);
> +        if (err < 0) {
> +            return -err;
> +        }
> +
> +        ctxname = mapped_name;
> +    }
> +
> +    if (secctx_enabled) {
> +        /*
> +         * If security.selinux has not been remapped and selinux is enabled,
> +         * use fscreate to set context before file creation.
> +         * Otherwise fallback to non-atomic method of file creation
> +         * and xattr settting.
> +         */
> +        if (!mapped_name && lo->use_fscreate) {
> +            err = do_create_secctx_fscreate(req, parent_inode, name, mode, fi,
> +                                            open_fd);
> +            goto out;

This can turn into another nested } else { and you don't need the out:

Dave
> +        }
> +
> +        err = do_create_secctx_noatomic(req, parent_inode, name, mode, fi,
> +                                        ctxname, open_fd);
> +    } else {
> +        err = do_create_nosecctx(req, parent_inode, name, mode, fi, open_fd);
> +    }
> +
> +out:
> +    g_free(mapped_name);
>      return err;
>  }
>  
> @@ -2856,11 +3102,6 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
>      return -ENODATA;
>  }
>  
> -#define FCHDIR_NOFAIL(fd) do {                         \
> -        int fchdir_res = fchdir(fd);                   \
> -        assert(fchdir_res == 0);                       \
> -    } while (0)
> -
>  static bool block_xattr(struct lo_data *lo, const char *name)
>  {
>      /*
> @@ -3522,6 +3763,15 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
>          exit(1);
>      }
>  
> +    /* Get the /proc/self/task descriptor */
> +    lo->proc_self_task = open("/proc/self/task/", O_PATH);
> +    if (lo->proc_self_task == -1) {
> +        fuse_log(FUSE_LOG_ERR, "open(/proc/self/task, O_PATH): %m\n");
> +        exit(1);
> +    }
> +
> +    lo->use_fscreate = is_fscreate_usable(lo);
> +
>      /*
>       * We only need /proc/self/fd. Prevent ".." from accessing parent
>       * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
> @@ -3738,6 +3988,14 @@ static void setup_chroot(struct lo_data *lo)
>          exit(1);
>      }
>  
> +    lo->proc_self_task = open("/proc/self/task", O_PATH);
> +    if (lo->proc_self_fd == -1) {
> +        fuse_log(FUSE_LOG_ERR, "open(\"/proc/self/task\", O_PATH): %m\n");
> +        exit(1);
> +    }
> +
> +    lo->use_fscreate = is_fscreate_usable(lo);
> +
>      /*
>       * Make the shared directory the file system root so that FUSE_OPEN
>       * (lo_open()) cannot escape the shared directory by opening a symlink.
> @@ -3923,6 +4181,10 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
>          close(lo->proc_self_fd);
>      }
>  
> +    if (lo->proc_self_task >= 0) {
> +        close(lo->proc_self_task);
> +    }
> +
>      if (lo->root.fd >= 0) {
>          close(lo->root.fd);
>      }
> @@ -3950,6 +4212,7 @@ int main(int argc, char *argv[])
>          .posix_lock = 0,
>          .allow_direct_io = 0,
>          .proc_self_fd = -1,
> +        .proc_self_task = -1,
>          .user_killpriv_v2 = -1,
>          .user_posix_acl = -1,
>      };
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


