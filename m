Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CEE33AF94
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:08:01 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLk8m-0000pn-RT
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lLk7q-0000NG-4E
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:07:02 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lLk7k-000544-8X
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:07:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 547F324FA9E;
 Mon, 15 Mar 2021 11:06:44 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 11:06:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00419aa523e-6705-4eb3-b59d-eb2cd4c186b4,
 C2FE56B6373390384040EEB24197F6B99D02A218) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 15 Mar 2021 11:06:30 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 3/3] virtiofsd: Don't allow empty filenames
Message-ID: <20210315110630.5ae99490@bahia.lan>
In-Reply-To: <20210314233604.GC223210@redhat.com>
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-4-groug@kaod.org>
 <20210314233604.GC223210@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: a2e20645-1fb0-460d-aa91-1952276993b5
X-Ovh-Tracer-Id: 3581487605795625437
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvledguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgleevtdfhleeukeefueejveeuuddvudejvdejveeilefhjedtgfelheevueevheenucffohhmrghinhepohhpvghnghhrohhuphdrohhrghdprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehvihhrthhiohdqfhhssehrvgguhhgrthdrtghomh
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Mar 2021 19:36:04 -0400
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Fri, Mar 12, 2021 at 03:10:03PM +0100, Greg Kurz wrote:
> > POSIX.1-2017 clearly stipulates that empty filenames aren't
> > allowed ([1] and [2]). Since virtiofsd is supposed to mirror
> > the host file system hierarchy and the host can be assumed to
> > be linux, we don't really expect clients to pass requests with
> > an empty path in it. If they do so anyway, this would eventually
> > cause an error when trying to create/lookup the actual inode
> > on the underlying POSIX filesystem. But this could still confuse
> > some code that wouldn't be ready to cope with this.
> > 
> > Filter out empty names coming from the client at the top level,
> > so that the rest doesn't have to care about it. This is done
> > everywhere we already call is_safe_path_component(), but
> > in a separate helper since the usual error for empty path
> > names is ENOENT instead of EINVAL.
> > 
> > [1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_170
> > [2] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_13
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> Hi Greg,
> 
> Minor nit, if you happen to respin this patch, it probably should come
> before the first patch in series. Once we make it clear that file server
> is not expecting empty path in these top level functions, then it is
> easy to clear AT_EMPTY_PATH in function these paths are calling as
> appropriate.
> 

The patch order is chronological : I just spotted the AT_EMPTY_PATH
oddity before coming up with the bigger hammer of patch 3. But you're
right, it probably makes more sense to do the other way around.

> What about lo_create(). Should we put a check in there as well.
> 

Good catch ! I'll post a v2 then ;)

> We are passed xattr names in lo_getxattr()/lo_removexattr()/lo_setxattr().
> In general, should we put an empty in_name check there as well and
> probably simply return -EINVAL.
> 

An empty xattr name doesn't likely make sense either, even if this
isn't written down anywhere, not in an explicit manner at least.

The kernel checks this in setxattr() and errors out with -ERANGE
in this case.

        error = strncpy_from_user(kname, name, sizeof(kname));
        if (error == 0 || error == sizeof(kname))
                error = -ERANGE;
        if (error < 0)
                return error;

Same goes for the other *xattr() syscalls, i.e. nothing nasty can ever
happen with an empty xattr name since this is always considered as an
error by the kernel. Not sure this would bring much to also check this
in QEMU. This is a bit different from the empty path name case because
an empty path name is valid for syscalls that support AT_EMPTY_PATH,
and we just want to make sure these are never exercised with names
from the client.

Cheers,

--
Greg

> Thanks
> Vivek
> 
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 35 ++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index f63016d35626..bff9dc2cd26d 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -237,6 +237,11 @@ static bool is_safe_path_component(const char *path)
> >      return !is_dot_or_dotdot(path);
> >  }
> >  
> > +static bool is_empty(const char *name)
> > +{
> > +    return name[0] == '\0';
> > +}
> > +
> >  static struct lo_data *lo_data(fuse_req_t req)
> >  {
> >      return (struct lo_data *)fuse_req_userdata(req);
> > @@ -1083,6 +1088,11 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
> >      fuse_log(FUSE_LOG_DEBUG, "lo_lookup(parent=%" PRIu64 ", name=%s)\n", parent,
> >               name);
> >  
> > +    if (is_empty(name)) {
> > +        fuse_reply_err(req, ENOENT);
> > +        return;
> > +    }
> > +
> >      /*
> >       * Don't use is_safe_path_component(), allow "." and ".." for NFS export
> >       * support.
> > @@ -1174,6 +1184,11 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
> >      struct fuse_entry_param e;
> >      struct lo_cred old = {};
> >  
> > +    if (is_empty(name)) {
> > +        fuse_reply_err(req, ENOENT);
> > +        return;
> > +    }
> > +
> >      if (!is_safe_path_component(name)) {
> >          fuse_reply_err(req, EINVAL);
> >          return;
> > @@ -1246,6 +1261,11 @@ static void lo_link(fuse_req_t req, fuse_ino_t ino, fuse_ino_t parent,
> >      char procname[64];
> >      int saverr;
> >  
> > +    if (is_empty(name)) {
> > +        fuse_reply_err(req, ENOENT);
> > +        return;
> > +    }
> > +
> >      if (!is_safe_path_component(name)) {
> >          fuse_reply_err(req, EINVAL);
> >          return;
> > @@ -1323,6 +1343,11 @@ static void lo_rmdir(fuse_req_t req, fuse_ino_t parent, const char *name)
> >      struct lo_inode *inode;
> >      struct lo_data *lo = lo_data(req);
> >  
> > +    if (is_empty(name)) {
> > +        fuse_reply_err(req, ENOENT);
> > +        return;
> > +    }
> > +
> >      if (!is_safe_path_component(name)) {
> >          fuse_reply_err(req, EINVAL);
> >          return;
> > @@ -1352,6 +1377,11 @@ static void lo_rename(fuse_req_t req, fuse_ino_t parent, const char *name,
> >      struct lo_inode *newinode = NULL;
> >      struct lo_data *lo = lo_data(req);
> >  
> > +    if (is_empty(name) || is_empty(newname)) {
> > +        fuse_reply_err(req, ENOENT);
> > +        return;
> > +    }
> > +
> >      if (!is_safe_path_component(name) || !is_safe_path_component(newname)) {
> >          fuse_reply_err(req, EINVAL);
> >          return;
> > @@ -1405,6 +1435,11 @@ static void lo_unlink(fuse_req_t req, fuse_ino_t parent, const char *name)
> >      struct lo_inode *inode;
> >      struct lo_data *lo = lo_data(req);
> >  
> > +    if (is_empty(name)) {
> > +        fuse_reply_err(req, ENOENT);
> > +        return;
> > +    }
> > +
> >      if (!is_safe_path_component(name)) {
> >          fuse_reply_err(req, EINVAL);
> >          return;
> > -- 
> > 2.26.2
> > 
> > _______________________________________________
> > Virtio-fs mailing list
> > Virtio-fs@redhat.com
> > https://listman.redhat.com/mailman/listinfo/virtio-fs
> 


