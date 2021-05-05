Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F9A37483D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 20:54:45 +0200 (CEST)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leMfU-00057c-7R
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 14:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1leMe0-0004d0-SK
 for qemu-devel@nongnu.org; Wed, 05 May 2021 14:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1leMdt-0005GK-VY
 for qemu-devel@nongnu.org; Wed, 05 May 2021 14:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620240781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezT8mOSwWO06goNK+CmRyw7YAeqCfnbCUWH9/kMObNE=;
 b=NLM6WRKFRtllahrz+UUKevgViQAnmLJw1QMHEsmVoIGOY0Io8B+m8XjNILO0HRf4Kxq7GY
 9JB60Qq/Hy4f/1ncaOx+QiC/XH4lPYhOl8+fFbzSK5iS/8tivNp2jKVVfLSwAkuL+rDZwy
 OFT5wBgrmkyOULpawQbdOFEg10in7vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-DEo3dZPQNr-JdpazMfhRug-1; Wed, 05 May 2021 14:52:59 -0400
X-MC-Unique: DEo3dZPQNr-JdpazMfhRug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E18D18B62AD;
 Wed,  5 May 2021 18:52:58 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-239.rdu2.redhat.com [10.10.114.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 029D019C9B;
 Wed,  5 May 2021 18:52:43 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 83A5222054F; Wed,  5 May 2021 14:52:42 -0400 (EDT)
Date: Wed, 5 May 2021 14:52:42 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 v2 2/2] virtiofsd: Add support for FUSE_SYNCFS request
Message-ID: <20210505185242.GC244258@redhat.com>
References: <20210426152135.842037-1-groug@kaod.org>
 <20210426152135.842037-3-groug@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210426152135.842037-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: kvm@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 26, 2021 at 05:21:35PM +0200, Greg Kurz wrote:
> Honor the expected behavior of syncfs() to synchronously flush all
> data and metadata on linux systems.
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
> index 58e32fc96369..918ab11f54c2 100644
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
> +        req->se->op.syncfs(req, arg->flags);
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
> index 3bf786b03485..220bb3db4898 100644
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
> +     * @param flags not used yet
> +     */
> +    void (*syncfs)(fuse_req_t req, uint64_t flags);
>  };
>  
>  /**
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 1553d2ef454f..6790a2f6fe10 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3124,6 +3124,34 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
>      }
>  }
>  
> +static void lo_syncfs(fuse_req_t req, uint64_t flags)
> +{
> +    struct lo_data *lo = lo_data(req);
> +    int fd, ret;
> +
> +    /* No flags supported yet */
> +    if (flags) {
> +        fuse_reply_err(req, EINVAL);
> +        return;
> +    }
> +
> +    fd = lo_inode_open(lo, &lo->root, O_RDONLY);
> +    if (fd < 0) {
> +        fuse_reply_err(req, errno);
> +        return;
> +    }
> +
> +    /*
> +     * FIXME: this is suboptimal because it will also flush unrelated
> +     *        writes not coming from the client. This can dramatically
> +     *        increase the time spent in syncfs() if some process is
> +     *        writing lots of data on the same filesystem as virtiofsd.
> +     */
> +    ret = syncfs(fd);

Hi Greg,

As we discussed in the community call that this works only if there are
no other filesystems mounted as submounts under exported directory.

We proably need to find a way to call syncfs() on all the filesystems
which are submounts of exported directory. Might not be easy at all.

Just mentioning it here so that we have a note about the limitation of
current patch.

Vivek

> +    fuse_reply_err(req, ret < 0 ? errno : 0);
> +    close(fd);
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


