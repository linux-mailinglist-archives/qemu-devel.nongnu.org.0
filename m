Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F1E9A57
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Oct 2019 11:48:37 +0100 (CET)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPlWm-0003ZH-B1
	for lists+qemu-devel@lfdr.de; Wed, 30 Oct 2019 06:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iPlVe-0002F9-4l
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 06:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iPlVc-0002z5-28
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 06:47:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47316
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iPlVb-0002xm-PH
 for qemu-devel@nongnu.org; Wed, 30 Oct 2019 06:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572432441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmVyt0FWnI2IgNweRYjVmSFbaBxHefK04fV3NVmHImE=;
 b=CfevMXwpDMbIfRZXiT5ODjVBU6w1xTndoGFj7ekzm30oRe60vMvUBJkzOCAo4bmEFG20yB
 FWSgnD0QUQ2IjsEgsm+af7QFU78g70zcf7SjcE2RiN/BllvOrovht1xqdSvGn78dKlH/QB
 SbPOqIEFiwAdDwO3H4fPyZNODUuZ+kM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-xkCB351_PpawL6TeehLlSQ-1; Wed, 30 Oct 2019 06:47:14 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23F0D8017DF;
 Wed, 30 Oct 2019 10:47:13 +0000 (UTC)
Received: from work-vm (ovpn-116-18.ams2.redhat.com [10.36.116.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A2711001B07;
 Wed, 30 Oct 2019 10:47:02 +0000 (UTC)
Date: Wed, 30 Oct 2019 10:47:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/30] virtiofs daemon (base)
Message-ID: <20191030104700.GA3114@work-vm>
References: <20191021105832.36574-1-dgilbert@redhat.com>
 <20191029185004-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191029185004-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: xkCB351_PpawL6TeehLlSQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
> On Mon, Oct 21, 2019 at 11:58:02AM +0100, Dr. David Alan Gilbert (git) wr=
ote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >=20
> > Hi,
> >   This is the 1st set for the virtiofsd - a daemon
> > that implements the user space side of virtiofs.
> >=20
> >   The kernel and qemu device parts recently went in,
> > so the daemon is the only thing missing to have a working
> > set.
>=20
>=20
> So I went back and forth on this but this is huge
> and there's not a lot of time for review.
> So I parked it + the security patches on a next branch in my tree.
> I will rebase once after rc1 is out, and then stop.

Thanks; I'll work on the extra sets that can go later (the
threading and cleanups+fixes).

Dave

>=20
> >   This set is the absolute minimal base set of patches;
> > it's not yet safe to use (from security or correctness);
> >=20
> > I'll follow up with ~3 more series in the next few days
> > with:
> >=20
> >     a) Security patches that add sandboxing and checking
> >        compared with normal fuse - that makes it safe.
> >     b) Performance improvements including threading
> >     c) Other fixes, including correctness.
> >=20
> > but, this is a good start and gets things rolling.
> >=20
> > The set pulls in a big chunk of the upstream libfuse library
> > (unmodified so that it's easy to check it really is upstream),
> > chops all the stuff out we don't need and then adds the
> > new transport we need.
> >=20
> > For new files I've formatted the code according to qemu
> > standards; for files that are from upstream libfuse
> > I've kept with their standards for ease of future updating.
> >=20
> > We can't just link with libfuse, since we have to make ABI incompatible
> > changes for the new transport.
> >=20
> > Running this daemon is typically done with:
> >=20
> >    ./virtiofsd -o vhost_user_socket=3D/path/socket -o source=3D/path/to=
/fs
> >=20
> > connected to a qemu that's then started with:
> >    -chardev socket,id=3Dchar0,path=3D/path/socket -device vhost-user-fs=
-pci,queue-size=3D1024,chardev=3Dchar0,tag=3Dmyfs
> >=20
> > and then in the guest mount with:
> >    mount -t virtiofs myfs /mnt
> >=20
> > Our development branch is: https://gitlab.com/virtio-fs/qemu/tree/virti=
o-fs-dev
> >=20
> > Dave
> >=20
> >=20
> > Dr. David Alan Gilbert (22):
> >   virtiofsd: Pull in upstream headers
> >   virtiofsd: Pull in kernel's fuse.h
> >   virtiofsd: Add auxiliary .c's
> >   virtiofsd: Add fuse_lowlevel.c
> >   virtiofsd: Add passthrough_ll
> >   virtiofsd: Trim down imported files
> >   virtiofsd: Fix fuse_daemonize ignored return values
> >   virtiofsd: Fix common header and define for QEMU builds
> >   virtiofsd: fuse: Make iov_length usable outside fuse_lowlevel.c
> >   virtiofsd: Add options for virtio
> >   virtiofsd: Open vhost connection instead of mounting
> >   virtiofsd: Start wiring up vhost-user
> >   virtiofsd: Add main virtio loop
> >   virtiofsd: get/set features callbacks
> >   virtiofsd: Start queue threads
> >   virtiofsd: Poll kick_fd for queue
> >   virtiofsd: Start reading commands from queue
> >   virtiofsd: Send replies to messages
> >   virtiofsd: Keep track of replies
> >   virtiofsd: Add Makefile wiring for virtiofsd contrib
> >   virtiofsd: Fast path for virtio read
> >   virtiofs: Add maintainers entry
> >=20
> > Stefan Hajnoczi (7):
> >   virtiofsd: remove mountpoint dummy argument
> >   virtiofsd: remove unused notify reply support
> >   virtiofsd: add -o source=3DPATH to help output
> >   virtiofsd: add --fd=3DFDNUM fd passing option
> >   virtiofsd: make -f (foreground) the default
> >   virtiofsd: add vhost-user.json file
> >   virtiofsd: add --print-capabilities option
> >=20
> > Vivek Goyal (1):
> >   virtiofsd: Make fsync work even if only inode is passed in
> >=20
> >  .gitignore                                  |    1 +
> >  MAINTAINERS                                 |    8 +
> >  Makefile                                    |    9 +
> >  Makefile.objs                               |    1 +
> >  contrib/virtiofsd/50-qemu-virtiofsd.json.in |    5 +
> >  contrib/virtiofsd/Makefile.objs             |   10 +
> >  contrib/virtiofsd/buffer.c                  |  318 +++
> >  contrib/virtiofsd/fuse.h                    | 1268 ++++++++++
> >  contrib/virtiofsd/fuse_common.h             |  823 +++++++
> >  contrib/virtiofsd/fuse_i.h                  |  131 ++
> >  contrib/virtiofsd/fuse_kernel.h             |  858 +++++++
> >  contrib/virtiofsd/fuse_log.c                |   40 +
> >  contrib/virtiofsd/fuse_log.h                |   82 +
> >  contrib/virtiofsd/fuse_loop_mt.c            |   54 +
> >  contrib/virtiofsd/fuse_lowlevel.c           | 2302 +++++++++++++++++++
> >  contrib/virtiofsd/fuse_lowlevel.h           | 2024 ++++++++++++++++
> >  contrib/virtiofsd/fuse_misc.h               |   59 +
> >  contrib/virtiofsd/fuse_opt.c                |  422 ++++
> >  contrib/virtiofsd/fuse_opt.h                |  271 +++
> >  contrib/virtiofsd/fuse_signals.c            |   90 +
> >  contrib/virtiofsd/fuse_virtio.c             |  717 ++++++
> >  contrib/virtiofsd/fuse_virtio.h             |   33 +
> >  contrib/virtiofsd/helper.c                  |  300 +++
> >  contrib/virtiofsd/passthrough_helpers.h     |   76 +
> >  contrib/virtiofsd/passthrough_ll.c          | 1341 +++++++++++
> >  docs/interop/vhost-user.json                |    4 +-
> >  26 files changed, 11246 insertions(+), 1 deletion(-)
> >  create mode 100644 contrib/virtiofsd/50-qemu-virtiofsd.json.in
> >  create mode 100644 contrib/virtiofsd/Makefile.objs
> >  create mode 100644 contrib/virtiofsd/buffer.c
> >  create mode 100644 contrib/virtiofsd/fuse.h
> >  create mode 100644 contrib/virtiofsd/fuse_common.h
> >  create mode 100644 contrib/virtiofsd/fuse_i.h
> >  create mode 100644 contrib/virtiofsd/fuse_kernel.h
> >  create mode 100644 contrib/virtiofsd/fuse_log.c
> >  create mode 100644 contrib/virtiofsd/fuse_log.h
> >  create mode 100644 contrib/virtiofsd/fuse_loop_mt.c
> >  create mode 100644 contrib/virtiofsd/fuse_lowlevel.c
> >  create mode 100644 contrib/virtiofsd/fuse_lowlevel.h
> >  create mode 100644 contrib/virtiofsd/fuse_misc.h
> >  create mode 100644 contrib/virtiofsd/fuse_opt.c
> >  create mode 100644 contrib/virtiofsd/fuse_opt.h
> >  create mode 100644 contrib/virtiofsd/fuse_signals.c
> >  create mode 100644 contrib/virtiofsd/fuse_virtio.c
> >  create mode 100644 contrib/virtiofsd/fuse_virtio.h
> >  create mode 100644 contrib/virtiofsd/helper.c
> >  create mode 100644 contrib/virtiofsd/passthrough_helpers.h
> >  create mode 100644 contrib/virtiofsd/passthrough_ll.c
> >=20
> > --=20
> > 2.23.0
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


