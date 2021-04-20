Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D159365FE2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 20:59:31 +0200 (CEST)
Received: from localhost ([::1]:55894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYvar-0002Ct-SK
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 14:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYvZa-0001ms-A5
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 14:58:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lYvZW-0004pu-3R
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 14:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618945083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kG9k71SlT0lHLzxXKtAxFFqJgiDj2s6uol77zG+I2AU=;
 b=NARTyTt7vbLI2fwU9VRCjE0g4/p9Wf1W/eWJlwex6DfinHR8IRqVViUOkAlIzQuyd+9B2L
 ytaPYRNimfHc2muIro9Xb3CGwnlHF3LY/wy8T83862TWds+Z9HM+EsVWaMGWB0ZuRDNAP8
 9dCciETJn+zAguN2Mp5E6hFW61R6Fcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-oINuKb5NPLCPtIGKJKldSQ-1; Tue, 20 Apr 2021 14:57:26 -0400
X-MC-Unique: oINuKb5NPLCPtIGKJKldSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB0BA8030C4;
 Tue, 20 Apr 2021 18:57:24 +0000 (UTC)
Received: from horse.redhat.com (ovpn-119-80.rdu2.redhat.com [10.10.119.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 568C05C1A1;
 Tue, 20 Apr 2021 18:57:20 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id ECFE422054F; Tue, 20 Apr 2021 14:57:19 -0400 (EDT)
Date: Tue, 20 Apr 2021 14:57:19 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [for-6.1 2/2] virtiofsd: Add support for FUSE_SYNCFS
 request
Message-ID: <20210420185719.GD1529659@redhat.com>
References: <20210419151142.276439-1-groug@kaod.org>
 <20210419151142.276439-3-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210419151142.276439-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 05:11:42PM +0200, Greg Kurz wrote:
> Honor the expected behavior of syncfs() to synchronously flush all
> data and metadata on linux systems. Like the ->sync_fs() superblock
> operation in the linux kernel, FUSE_SYNCFS has a 'wait' argument that
> tells whether the server should wait for outstanding I/Os to complete
> before replying to the client. Anything virtiofsd can do to flush
> the caches implies blocking syscalls, so nothing is done if waiting
> isn't requested.
> 
> Flushing is done with syncfs(). This is suboptimal as it will also
> flush writes performed by any other process on the same file system,
> and thus add an unbounded time penalty to syncfs(). This may be
> optimized in the future, but enforce correctness first.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/fuse_lowlevel.c       | 19 ++++++++++++++++++
>  tools/virtiofsd/fuse_lowlevel.h       | 13 ++++++++++++
>  tools/virtiofsd/passthrough_ll.c      | 29 +++++++++++++++++++++++++++
>  tools/virtiofsd/passthrough_seccomp.c |  1 +
>  4 files changed, 62 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 58e32fc96369..2d0c47a7a60e 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1870,6 +1870,24 @@ static void do_lseek(fuse_req_t req, fuse_ino_t nodeid,
>      }
>  }
>  
> +static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
> +                      struct fuse_mbuf_iter *iter)
> +{
> +    struct fuse_syncfs_in *arg;
> +
> +    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> +    if (!arg) {
> +        fuse_reply_err(req, EINVAL);
> +        return;
> +    }
> +
> +    if (req->se->op.syncfs) {
> +        req->se->op.syncfs(req, arg->wait);
> +    } else {
> +        fuse_reply_err(req, ENOSYS);
> +    }
> +}
> +
>  static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>                      struct fuse_mbuf_iter *iter)
>  {
> @@ -2267,6 +2285,7 @@ static struct {
>      [FUSE_RENAME2] = { do_rename2, "RENAME2" },
>      [FUSE_COPY_FILE_RANGE] = { do_copy_file_range, "COPY_FILE_RANGE" },
>      [FUSE_LSEEK] = { do_lseek, "LSEEK" },
> +    [FUSE_SYNCFS] = { do_syncfs, "SYNCFS" },
>  };
>  
>  #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
> diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> index 3bf786b03485..b5ac42c31799 100644
> --- a/tools/virtiofsd/fuse_lowlevel.h
> +++ b/tools/virtiofsd/fuse_lowlevel.h
> @@ -1225,6 +1225,19 @@ struct fuse_lowlevel_ops {
>       */
>      void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
>                    struct fuse_file_info *fi);
> +
> +    /**
> +     * Synchronize file system content
> +     *
> +     * If this request is answered with an error code of ENOSYS,
> +     * this is treated as success and future calls to syncfs() will
> +     * succeed automatically without being sent to the filesystem
> +     * process.
> +     *
> +     * @param req request handle
> +     * @param wait whether to wait for outstanding I/Os to complete
> +     */
> +    void (*syncfs)(fuse_req_t req, int wait);
>  };
>  
>  /**
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 1553d2ef454f..6b66f3208be0 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3124,6 +3124,34 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
>      }
>  }
>  
> +static void lo_syncfs(fuse_req_t req, int wait)
> +{
> +    if (wait) {
> +        struct lo_data *lo = lo_data(req);
> +        int fd, ret;
> +
> +        fd = lo_inode_open(lo, &lo->root, O_RDONLY);
> +        if (fd < 0) {
> +            fuse_reply_err(req, errno);
> +            return;
> +        }
> +
> +        /*
> +         * FIXME: this is suboptimal because it will also flush unrelated
> +         *        writes not coming from the client. This can dramatically
> +         *        increase the time spent in syncfs() if some process is
> +         *        writing lots of data on the same filesystem as virtiofsd.
> +         */
> +        ret = syncfs(fd);
> +        /* syncfs() never fails on a valid fd */

Where does this come from. man page says.

       syncfs() can fail for at least the following reason:

       EBADF  fd is not a valid file descriptor.

It says "can fail for at least the following reason". Its not ruling out
failures due to other reasons?

Also kernel implementation of syscall is as follows.

SYSCALL_DEFINE1(syncfs, int, fd)
{
	if (!f.file)
                return -EBADF;
        sb = f.file->f_path.dentry->d_sb;

        down_read(&sb->s_umount);
        ret = sync_filesystem(sb);
        up_read(&sb->s_umount);

        ret2 = errseq_check_and_advance(&sb->s_wb_err, &f.file->f_sb_err);

        fdput(f);
        return ret ? ret : ret2;
}

So it explicityly capture error code from sync_filesystem() and 
errseq_check_and_advance() and returns one of them.

> +        assert(ret == 0);
> +
> +        close(fd);
> +    }
> +
> +    fuse_reply_err(req, 0);

This probably could be better strucutred as.


	if (!wait)
		goto out;

	/* Rest of the logic to call syncfs() */
out:
	fuse_reply_err(req, ret);

Vivek

> +}

> +
>  static void lo_destroy(void *userdata)
>  {
>      struct lo_data *lo = (struct lo_data *)userdata;
> @@ -3184,6 +3212,7 @@ static struct fuse_lowlevel_ops lo_oper = {
>      .copy_file_range = lo_copy_file_range,
>  #endif
>      .lseek = lo_lseek,
> +    .syncfs = lo_syncfs,
>      .destroy = lo_destroy,
>  };
>  
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index 62441cfcdb95..343188447901 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -107,6 +107,7 @@ static const int syscall_allowlist[] = {
>      SCMP_SYS(set_robust_list),
>      SCMP_SYS(setxattr),
>      SCMP_SYS(symlinkat),
> +    SCMP_SYS(syncfs),
>      SCMP_SYS(time), /* Rarely needed, except on static builds */
>      SCMP_SYS(tgkill),
>      SCMP_SYS(unlinkat),
> -- 
> 2.26.3
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


