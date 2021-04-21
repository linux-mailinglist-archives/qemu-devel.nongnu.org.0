Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA7A366664
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 09:46:06 +0200 (CEST)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ7Yk-0004Oe-0B
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 03:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lZ7XE-0003yQ-HM
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 03:44:32 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:50763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lZ7XC-0005mm-41
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 03:44:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6198F9C13F06;
 Wed, 21 Apr 2021 09:44:25 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Apr
 2021 09:44:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002e2e40fd4-2e69-424c-9b86-4e3ea8ce89ee,
 50F065E079F855668D79ED56DF61EE5F1F64E411) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 21 Apr 2021 09:44:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [for-6.1 2/2] virtiofsd: Add support for
 FUSE_SYNCFS request
Message-ID: <20210421094423.59e105f5@bahia.lan>
In-Reply-To: <20210420185719.GD1529659@redhat.com>
References: <20210419151142.276439-1-groug@kaod.org>
 <20210419151142.276439-3-groug@kaod.org>
 <20210420185719.GD1529659@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 083d9b10-8ec5-42bd-9a86-52c534d2dd2a
X-Ovh-Tracer-Id: 15553462789816097248
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddtjedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdefgfdtgeeluddujeejleffgffhhedtieeggffguddvgfekvefgfeettdejheevnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehvihhrthhiohdqfhhssehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 20 Apr 2021 14:57:19 -0400
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Mon, Apr 19, 2021 at 05:11:42PM +0200, Greg Kurz wrote:
> > Honor the expected behavior of syncfs() to synchronously flush all
> > data and metadata on linux systems. Like the ->sync_fs() superblock
> > operation in the linux kernel, FUSE_SYNCFS has a 'wait' argument that
> > tells whether the server should wait for outstanding I/Os to complete
> > before replying to the client. Anything virtiofsd can do to flush
> > the caches implies blocking syscalls, so nothing is done if waiting
> > isn't requested.
> > 
> > Flushing is done with syncfs(). This is suboptimal as it will also
> > flush writes performed by any other process on the same file system,
> > and thus add an unbounded time penalty to syncfs(). This may be
> > optimized in the future, but enforce correctness first.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  tools/virtiofsd/fuse_lowlevel.c       | 19 ++++++++++++++++++
> >  tools/virtiofsd/fuse_lowlevel.h       | 13 ++++++++++++
> >  tools/virtiofsd/passthrough_ll.c      | 29 +++++++++++++++++++++++++++
> >  tools/virtiofsd/passthrough_seccomp.c |  1 +
> >  4 files changed, 62 insertions(+)
> > 
> > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> > index 58e32fc96369..2d0c47a7a60e 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.c
> > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > @@ -1870,6 +1870,24 @@ static void do_lseek(fuse_req_t req, fuse_ino_t nodeid,
> >      }
> >  }
> >  
> > +static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
> > +                      struct fuse_mbuf_iter *iter)
> > +{
> > +    struct fuse_syncfs_in *arg;
> > +
> > +    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > +    if (!arg) {
> > +        fuse_reply_err(req, EINVAL);
> > +        return;
> > +    }
> > +
> > +    if (req->se->op.syncfs) {
> > +        req->se->op.syncfs(req, arg->wait);
> > +    } else {
> > +        fuse_reply_err(req, ENOSYS);
> > +    }
> > +}
> > +
> >  static void do_init(fuse_req_t req, fuse_ino_t nodeid,
> >                      struct fuse_mbuf_iter *iter)
> >  {
> > @@ -2267,6 +2285,7 @@ static struct {
> >      [FUSE_RENAME2] = { do_rename2, "RENAME2" },
> >      [FUSE_COPY_FILE_RANGE] = { do_copy_file_range, "COPY_FILE_RANGE" },
> >      [FUSE_LSEEK] = { do_lseek, "LSEEK" },
> > +    [FUSE_SYNCFS] = { do_syncfs, "SYNCFS" },
> >  };
> >  
> >  #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
> > diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> > index 3bf786b03485..b5ac42c31799 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.h
> > +++ b/tools/virtiofsd/fuse_lowlevel.h
> > @@ -1225,6 +1225,19 @@ struct fuse_lowlevel_ops {
> >       */
> >      void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
> >                    struct fuse_file_info *fi);
> > +
> > +    /**
> > +     * Synchronize file system content
> > +     *
> > +     * If this request is answered with an error code of ENOSYS,
> > +     * this is treated as success and future calls to syncfs() will
> > +     * succeed automatically without being sent to the filesystem
> > +     * process.
> > +     *
> > +     * @param req request handle
> > +     * @param wait whether to wait for outstanding I/Os to complete
> > +     */
> > +    void (*syncfs)(fuse_req_t req, int wait);
> >  };
> >  
> >  /**
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index 1553d2ef454f..6b66f3208be0 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -3124,6 +3124,34 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
> >      }
> >  }
> >  
> > +static void lo_syncfs(fuse_req_t req, int wait)
> > +{
> > +    if (wait) {
> > +        struct lo_data *lo = lo_data(req);
> > +        int fd, ret;
> > +
> > +        fd = lo_inode_open(lo, &lo->root, O_RDONLY);
> > +        if (fd < 0) {
> > +            fuse_reply_err(req, errno);
> > +            return;
> > +        }
> > +
> > +        /*
> > +         * FIXME: this is suboptimal because it will also flush unrelated
> > +         *        writes not coming from the client. This can dramatically
> > +         *        increase the time spent in syncfs() if some process is
> > +         *        writing lots of data on the same filesystem as virtiofsd.
> > +         */
> > +        ret = syncfs(fd);
> > +        /* syncfs() never fails on a valid fd */
> 
> Where does this come from. man page says.
> 
>        syncfs() can fail for at least the following reason:
> 
>        EBADF  fd is not a valid file descriptor.
> 
> It says "can fail for at least the following reason". Its not ruling out
> failures due to other reasons?
> 
> Also kernel implementation of syscall is as follows.
> 
> SYSCALL_DEFINE1(syncfs, int, fd)
> {
> 	if (!f.file)
>                 return -EBADF;
>         sb = f.file->f_path.dentry->d_sb;
> 
>         down_read(&sb->s_umount);
>         ret = sync_filesystem(sb);
>         up_read(&sb->s_umount);
> 
>         ret2 = errseq_check_and_advance(&sb->s_wb_err, &f.file->f_sb_err);
> 
>         fdput(f);
>         return ret ? ret : ret2;
> }
> 
> So it explicityly capture error code from sync_filesystem() and 
> errseq_check_and_advance() and returns one of them.
> 

You're right. I'll drop the assert() and propagate the
error code.

> > +        assert(ret == 0);
> > +
> > +        close(fd);
> > +    }
> > +
> > +    fuse_reply_err(req, 0);
> 
> This probably could be better strucutred as.
> 
> 
> 	if (!wait)
> 		goto out;
> 
> 	/* Rest of the logic to call syncfs() */
> out:
> 	fuse_reply_err(req, ret);
> 

Will do.

> Vivek
> 

Cheers,

--
Greg

> > +}
> 
> > +
> >  static void lo_destroy(void *userdata)
> >  {
> >      struct lo_data *lo = (struct lo_data *)userdata;
> > @@ -3184,6 +3212,7 @@ static struct fuse_lowlevel_ops lo_oper = {
> >      .copy_file_range = lo_copy_file_range,
> >  #endif
> >      .lseek = lo_lseek,
> > +    .syncfs = lo_syncfs,
> >      .destroy = lo_destroy,
> >  };
> >  
> > diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> > index 62441cfcdb95..343188447901 100644
> > --- a/tools/virtiofsd/passthrough_seccomp.c
> > +++ b/tools/virtiofsd/passthrough_seccomp.c
> > @@ -107,6 +107,7 @@ static const int syscall_allowlist[] = {
> >      SCMP_SYS(set_robust_list),
> >      SCMP_SYS(setxattr),
> >      SCMP_SYS(symlinkat),
> > +    SCMP_SYS(syncfs),
> >      SCMP_SYS(time), /* Rarely needed, except on static builds */
> >      SCMP_SYS(tgkill),
> >      SCMP_SYS(unlinkat),
> > -- 
> > 2.26.3
> > 
> > _______________________________________________
> > Virtio-fs mailing list
> > Virtio-fs@redhat.com
> > https://listman.redhat.com/mailman/listinfo/virtio-fs
> 


