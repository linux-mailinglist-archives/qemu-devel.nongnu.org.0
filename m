Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E096EB122
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 14:24:53 +0100 (CET)
Received: from localhost ([::1]:50046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQARX-0005yW-V1
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 09:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iQANT-00023r-Dy
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 09:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iQANP-00082F-9u
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 09:20:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37944
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iQANP-00081S-5n
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 09:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572528033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBd/1Y2w7spXmCrBTL/oURjtVV1rXrB+Fur+s81859I=;
 b=RBCiWAWyrx0MnG5PIT7bNINWtjfRdr229vfKH2Civt36yuLHfvljsF6VTgIBprJHPPZi2f
 vCYL1nnBqyP/Q/4z/iYtwSHf9ThumL78Cz/nnH473Fh+eSUoNsDihq04c5qpErl1+w7s5q
 4WFHYGbbcY/ni/aR9b4cAXnSkgG3iyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-s49PeGTzMu2VqO3QsVZaqQ-1; Thu, 31 Oct 2019 09:20:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2E45107ACC0;
 Thu, 31 Oct 2019 13:20:27 +0000 (UTC)
Received: from work-vm (ovpn-116-247.ams2.redhat.com [10.36.116.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AA2E5C290;
 Thu, 31 Oct 2019 13:20:25 +0000 (UTC)
Date: Thu, 31 Oct 2019 13:20:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/30] virtiofs daemon (base)
Message-ID: <20191031132022.GA3128@work-vm>
References: <20191021105832.36574-1-dgilbert@redhat.com>
 <20191029185004-mutt-send-email-mst@kernel.org>
 <20191030104700.GA3114@work-vm>
 <20191030203315-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191030203315-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: s49PeGTzMu2VqO3QsVZaqQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, piaojun@huawei.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, eguan@linux.alibaba.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Wed, Oct 30, 2019 at 10:47:00AM +0000, Dr. David Alan Gilbert wrote:
> > * Michael S. Tsirkin (mst@redhat.com) wrote:
> > > On Mon, Oct 21, 2019 at 11:58:02AM +0100, Dr. David Alan Gilbert (git=
) wrote:
> > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > >=20
> > > > Hi,
> > > >   This is the 1st set for the virtiofsd - a daemon
> > > > that implements the user space side of virtiofs.
> > > >=20
> > > >   The kernel and qemu device parts recently went in,
> > > > so the daemon is the only thing missing to have a working
> > > > set.
> > >=20
> > >=20
> > > So I went back and forth on this but this is huge
> > > and there's not a lot of time for review.
> > > So I parked it + the security patches on a next branch in my tree.
> > > I will rebase once after rc1 is out, and then stop.
> >=20
> > Thanks; I'll work on the extra sets that can go later (the
> > threading and cleanups+fixes).
> >=20
> > Dave
>=20
>=20
> Apropos I would really like to figure out
> a better way to know that we did not miss
> anything when adding the security patchset.

Yep, it's worth at least having a lot of eyes on it, and better
finding some more automation for the path checking.

Dave

>=20
> > >=20
> > > >   This set is the absolute minimal base set of patches;
> > > > it's not yet safe to use (from security or correctness);
> > > >=20
> > > > I'll follow up with ~3 more series in the next few days
> > > > with:
> > > >=20
> > > >     a) Security patches that add sandboxing and checking
> > > >        compared with normal fuse - that makes it safe.
> > > >     b) Performance improvements including threading
> > > >     c) Other fixes, including correctness.
> > > >=20
> > > > but, this is a good start and gets things rolling.
> > > >=20
> > > > The set pulls in a big chunk of the upstream libfuse library
> > > > (unmodified so that it's easy to check it really is upstream),
> > > > chops all the stuff out we don't need and then adds the
> > > > new transport we need.
> > > >=20
> > > > For new files I've formatted the code according to qemu
> > > > standards; for files that are from upstream libfuse
> > > > I've kept with their standards for ease of future updating.
> > > >=20
> > > > We can't just link with libfuse, since we have to make ABI incompat=
ible
> > > > changes for the new transport.
> > > >=20
> > > > Running this daemon is typically done with:
> > > >=20
> > > >    ./virtiofsd -o vhost_user_socket=3D/path/socket -o source=3D/pat=
h/to/fs
> > > >=20
> > > > connected to a qemu that's then started with:
> > > >    -chardev socket,id=3Dchar0,path=3D/path/socket -device vhost-use=
r-fs-pci,queue-size=3D1024,chardev=3Dchar0,tag=3Dmyfs
> > > >=20
> > > > and then in the guest mount with:
> > > >    mount -t virtiofs myfs /mnt
> > > >=20
> > > > Our development branch is: https://gitlab.com/virtio-fs/qemu/tree/v=
irtio-fs-dev
> > > >=20
> > > > Dave
> > > >=20
> > > >=20
> > > > Dr. David Alan Gilbert (22):
> > > >   virtiofsd: Pull in upstream headers
> > > >   virtiofsd: Pull in kernel's fuse.h
> > > >   virtiofsd: Add auxiliary .c's
> > > >   virtiofsd: Add fuse_lowlevel.c
> > > >   virtiofsd: Add passthrough_ll
> > > >   virtiofsd: Trim down imported files
> > > >   virtiofsd: Fix fuse_daemonize ignored return values
> > > >   virtiofsd: Fix common header and define for QEMU builds
> > > >   virtiofsd: fuse: Make iov_length usable outside fuse_lowlevel.c
> > > >   virtiofsd: Add options for virtio
> > > >   virtiofsd: Open vhost connection instead of mounting
> > > >   virtiofsd: Start wiring up vhost-user
> > > >   virtiofsd: Add main virtio loop
> > > >   virtiofsd: get/set features callbacks
> > > >   virtiofsd: Start queue threads
> > > >   virtiofsd: Poll kick_fd for queue
> > > >   virtiofsd: Start reading commands from queue
> > > >   virtiofsd: Send replies to messages
> > > >   virtiofsd: Keep track of replies
> > > >   virtiofsd: Add Makefile wiring for virtiofsd contrib
> > > >   virtiofsd: Fast path for virtio read
> > > >   virtiofs: Add maintainers entry
> > > >=20
> > > > Stefan Hajnoczi (7):
> > > >   virtiofsd: remove mountpoint dummy argument
> > > >   virtiofsd: remove unused notify reply support
> > > >   virtiofsd: add -o source=3DPATH to help output
> > > >   virtiofsd: add --fd=3DFDNUM fd passing option
> > > >   virtiofsd: make -f (foreground) the default
> > > >   virtiofsd: add vhost-user.json file
> > > >   virtiofsd: add --print-capabilities option
> > > >=20
> > > > Vivek Goyal (1):
> > > >   virtiofsd: Make fsync work even if only inode is passed in
> > > >=20
> > > >  .gitignore                                  |    1 +
> > > >  MAINTAINERS                                 |    8 +
> > > >  Makefile                                    |    9 +
> > > >  Makefile.objs                               |    1 +
> > > >  contrib/virtiofsd/50-qemu-virtiofsd.json.in |    5 +
> > > >  contrib/virtiofsd/Makefile.objs             |   10 +
> > > >  contrib/virtiofsd/buffer.c                  |  318 +++
> > > >  contrib/virtiofsd/fuse.h                    | 1268 ++++++++++
> > > >  contrib/virtiofsd/fuse_common.h             |  823 +++++++
> > > >  contrib/virtiofsd/fuse_i.h                  |  131 ++
> > > >  contrib/virtiofsd/fuse_kernel.h             |  858 +++++++
> > > >  contrib/virtiofsd/fuse_log.c                |   40 +
> > > >  contrib/virtiofsd/fuse_log.h                |   82 +
> > > >  contrib/virtiofsd/fuse_loop_mt.c            |   54 +
> > > >  contrib/virtiofsd/fuse_lowlevel.c           | 2302 +++++++++++++++=
++++
> > > >  contrib/virtiofsd/fuse_lowlevel.h           | 2024 +++++++++++++++=
+
> > > >  contrib/virtiofsd/fuse_misc.h               |   59 +
> > > >  contrib/virtiofsd/fuse_opt.c                |  422 ++++
> > > >  contrib/virtiofsd/fuse_opt.h                |  271 +++
> > > >  contrib/virtiofsd/fuse_signals.c            |   90 +
> > > >  contrib/virtiofsd/fuse_virtio.c             |  717 ++++++
> > > >  contrib/virtiofsd/fuse_virtio.h             |   33 +
> > > >  contrib/virtiofsd/helper.c                  |  300 +++
> > > >  contrib/virtiofsd/passthrough_helpers.h     |   76 +
> > > >  contrib/virtiofsd/passthrough_ll.c          | 1341 +++++++++++
> > > >  docs/interop/vhost-user.json                |    4 +-
> > > >  26 files changed, 11246 insertions(+), 1 deletion(-)
> > > >  create mode 100644 contrib/virtiofsd/50-qemu-virtiofsd.json.in
> > > >  create mode 100644 contrib/virtiofsd/Makefile.objs
> > > >  create mode 100644 contrib/virtiofsd/buffer.c
> > > >  create mode 100644 contrib/virtiofsd/fuse.h
> > > >  create mode 100644 contrib/virtiofsd/fuse_common.h
> > > >  create mode 100644 contrib/virtiofsd/fuse_i.h
> > > >  create mode 100644 contrib/virtiofsd/fuse_kernel.h
> > > >  create mode 100644 contrib/virtiofsd/fuse_log.c
> > > >  create mode 100644 contrib/virtiofsd/fuse_log.h
> > > >  create mode 100644 contrib/virtiofsd/fuse_loop_mt.c
> > > >  create mode 100644 contrib/virtiofsd/fuse_lowlevel.c
> > > >  create mode 100644 contrib/virtiofsd/fuse_lowlevel.h
> > > >  create mode 100644 contrib/virtiofsd/fuse_misc.h
> > > >  create mode 100644 contrib/virtiofsd/fuse_opt.c
> > > >  create mode 100644 contrib/virtiofsd/fuse_opt.h
> > > >  create mode 100644 contrib/virtiofsd/fuse_signals.c
> > > >  create mode 100644 contrib/virtiofsd/fuse_virtio.c
> > > >  create mode 100644 contrib/virtiofsd/fuse_virtio.h
> > > >  create mode 100644 contrib/virtiofsd/helper.c
> > > >  create mode 100644 contrib/virtiofsd/passthrough_helpers.h
> > > >  create mode 100644 contrib/virtiofsd/passthrough_ll.c
> > > >=20
> > > > --=20
> > > > 2.23.0
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


