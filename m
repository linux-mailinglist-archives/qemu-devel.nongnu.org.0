Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29CC450737
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:38:44 +0100 (CET)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd87-0001vD-Un
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mmd1A-0004dw-HF
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:31:32 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:52070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mmd18-0004lQ-8q
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:31:32 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-89-95D1NPEqBcw5Dy8UCJQ-1; Mon, 15 Nov 2021 09:31:19 -0500
X-MC-Unique: 89-95D1NPEqBcw5Dy8UCJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03B0D10247A6;
 Mon, 15 Nov 2021 14:30:59 +0000 (UTC)
Received: from bahia (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A315D9CA;
 Mon, 15 Nov 2021 14:30:13 +0000 (UTC)
Date: Mon, 15 Nov 2021 15:30:11 +0100
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [for-6.1 v3 0/3] virtiofsd: Add support for FUSE_SYNCFS request
Message-ID: <20211115153011.06b9f08e@bahia>
In-Reply-To: <YYwiGN7pfdyH9543@redhat.com>
References: <20210510155539.998747-1-groug@kaod.org>
 <YYwiGN7pfdyH9543@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Nov 2021 14:48:40 -0500
Vivek Goyal <vgoyal@redhat.com> wrote:

> Hi Greg,
>=20
> I don't see FUSE_SYNCFS support in virtiofsd. I see that kernel=20
> patches got merged. Did you post another version of patches?
>=20

Hi Vivek,

Unfortunately no and I'm really not sure I can get time to do
so. Sorry for that... :-\

Please feel free to take over.

Cheers,

--
Greg

> Will be nice to add syncfs support in virtiofsd/virtiofsd_rs as well.=20
>=20
> Thanks
> Vivek
>=20
> On Mon, May 10, 2021 at 05:55:36PM +0200, Greg Kurz wrote:
> > FUSE_SYNCFS allows the client to flush the host page cache.
> > This isn't available in upstream linux yet, but the following
> > tree can be used to test:
> >=20
> > https://gitlab.com/gkurz/linux/-/tree/virtio-fs-sync
> >=20
> > v3: - track submounts and do per-submount syncfs() (Vivek)
> >     - based on new version of FUSE_SYNCFS (still not upstream)
> >       https://listman.redhat.com/archives/virtio-fs/2021-May/msg00025.h=
tml
> >=20
> > v2: - based on new version of FUSE_SYNCFS
> >       https://listman.redhat.com/archives/virtio-fs/2021-April/msg00166=
.html
> >     - propagate syncfs() errors to client (Vivek)
> >=20
> > Greg Kurz (3):
> >   Update linux headers to 5.13-rc1 + FUSE_SYNCFS
> >   virtiofsd: Track mounts
> >   virtiofsd: Add support for FUSE_SYNCFS request
> >=20
> >  .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |  35 -
> >  include/standard-headers/drm/drm_fourcc.h     |  23 +-
> >  include/standard-headers/linux/ethtool.h      | 109 ++-
> >  include/standard-headers/linux/fuse.h         |  27 +-
> >  include/standard-headers/linux/input.h        |   2 +-
> >  include/standard-headers/linux/virtio_ids.h   |   2 +
> >  .../standard-headers/rdma/vmw_pvrdma-abi.h    |   7 +
> >  linux-headers/asm-generic/unistd.h            |  13 +-
> >  linux-headers/asm-mips/unistd_n32.h           | 752 +++++++--------
> >  linux-headers/asm-mips/unistd_n64.h           | 704 +++++++-------
> >  linux-headers/asm-mips/unistd_o32.h           | 844 ++++++++---------
> >  linux-headers/asm-powerpc/kvm.h               |   2 +
> >  linux-headers/asm-powerpc/unistd_32.h         | 857 +++++++++---------
> >  linux-headers/asm-powerpc/unistd_64.h         | 801 ++++++++--------
> >  linux-headers/asm-s390/unistd_32.h            |   5 +
> >  linux-headers/asm-s390/unistd_64.h            |   5 +
> >  linux-headers/asm-x86/kvm.h                   |   1 +
> >  linux-headers/asm-x86/unistd_32.h             |   5 +
> >  linux-headers/asm-x86/unistd_64.h             |   5 +
> >  linux-headers/asm-x86/unistd_x32.h            |   5 +
> >  linux-headers/linux/kvm.h                     | 134 +++
> >  linux-headers/linux/userfaultfd.h             |  36 +-
> >  linux-headers/linux/vfio.h                    |  35 +
> >  tools/virtiofsd/fuse_lowlevel.c               |  11 +
> >  tools/virtiofsd/fuse_lowlevel.h               |  12 +
> >  tools/virtiofsd/passthrough_ll.c              |  80 +-
> >  tools/virtiofsd/passthrough_seccomp.c         |   1 +
> >  27 files changed, 2465 insertions(+), 2048 deletions(-)
> >=20
> > --=20
> > 2.26.3
> >=20
> >=20
>=20


