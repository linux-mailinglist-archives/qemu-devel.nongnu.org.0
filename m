Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD370374F48
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:16:26 +0200 (CEST)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXJB-0005vm-Q3
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1leXHZ-0005Oc-Oo
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:14:45 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:44837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1leXHU-0003MX-Vx
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:14:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 176AC275CC1;
 Thu,  6 May 2021 08:14:30 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 6 May 2021
 08:14:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002c35e9a4b-82c2-4398-9a74-d8a1be0523f7,
 A011F864E236C67B2AFE342ECDF08F9E86568858) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 6 May 2021 08:14:28 +0200
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [for-6.1 v2 2/2] virtiofsd: Add support for FUSE_SYNCFS request
Message-ID: <20210506081428.69d73bbc@bahia.lan>
In-Reply-To: <20210505185242.GC244258@redhat.com>
References: <20210426152135.842037-1-groug@kaod.org>
 <20210426152135.842037-3-groug@kaod.org>
 <20210505185242.GC244258@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c78b824e-59e7-468b-825f-a6735cd090d1
X-Ovh-Tracer-Id: 9891312157052475826
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdefledguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 May 2021 14:52:42 -0400
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Mon, Apr 26, 2021 at 05:21:35PM +0200, Greg Kurz wrote:
> > Honor the expected behavior of syncfs() to synchronously flush all
> > data and metadata on linux systems.
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
> > index 58e32fc96369..918ab11f54c2 100644
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
> > +        req->se->op.syncfs(req, arg->flags);
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
> > index 3bf786b03485..220bb3db4898 100644
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
> > +     * @param flags not used yet
> > +     */
> > +    void (*syncfs)(fuse_req_t req, uint64_t flags);
> >  };
> >  
> >  /**
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index 1553d2ef454f..6790a2f6fe10 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -3124,6 +3124,34 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
> >      }
> >  }
> >  
> > +static void lo_syncfs(fuse_req_t req, uint64_t flags)
> > +{
> > +    struct lo_data *lo = lo_data(req);
> > +    int fd, ret;
> > +
> > +    /* No flags supported yet */
> > +    if (flags) {
> > +        fuse_reply_err(req, EINVAL);
> > +        return;
> > +    }
> > +
> > +    fd = lo_inode_open(lo, &lo->root, O_RDONLY);
> > +    if (fd < 0) {
> > +        fuse_reply_err(req, errno);
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * FIXME: this is suboptimal because it will also flush unrelated
> > +     *        writes not coming from the client. This can dramatically
> > +     *        increase the time spent in syncfs() if some process is
> > +     *        writing lots of data on the same filesystem as virtiofsd.
> > +     */
> > +    ret = syncfs(fd);
> 
> Hi Greg,
> 

Hi Vivek,

> As we discussed in the community call that this works only if there are
> no other filesystems mounted as submounts under exported directory.
> 
> We proably need to find a way to call syncfs() on all the filesystems
> which are submounts of exported directory. Might not be easy at all.
> 

I must confess I didn't investigate this case. I'll start looking.

> Just mentioning it here so that we have a note about the limitation of
> current patch.
> 

Sure. I'll add a note for that.

> Vivek
> 
> > +    fuse_reply_err(req, ret < 0 ? errno : 0);
> > +    close(fd);
> > +}
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
> 


