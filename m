Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B3B3792D4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:35:16 +0200 (CEST)
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7wA-0006Nz-If
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg7uP-0004tZ-Nh
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg7uK-0005Wz-Mj
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620660799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yNyrVd/s0JQcIHsiHYk2DrC+0BRh2d4vxFxS2daZ9ec=;
 b=IylSsNzZdpE1AmLkqGRGegNENIE9f98pR/zbUP3fhD0bo3YKn0MYJkHxfughAXNLUFWHOs
 k+mO971CRlafUJWERCNMKlESakiJZRL+WdXEZtY2HEGy/PTTHpDkxSsPfzuFsnl1Wd9Wvv
 ATVnwPdbCTN9INZGaCEBPh8/P9G1aJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-zgEBjZc1OSieK-JhwXel9g-1; Mon, 10 May 2021 11:33:11 -0400
X-MC-Unique: zgEBjZc1OSieK-JhwXel9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 620169F92F;
 Mon, 10 May 2021 15:32:47 +0000 (UTC)
Received: from localhost (ovpn-113-44.ams2.redhat.com [10.36.113.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81B741079148;
 Mon, 10 May 2021 15:32:46 +0000 (UTC)
Date: Mon, 10 May 2021 16:32:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if
 client asked for it
Message-ID: <YJlSHZ0vzNtCAjkJ@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-27-dgilbert@redhat.com>
 <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
 <20210506160223.GA277745@redhat.com>
 <YJj3RSxXKZHxmiKu@stefanha-x1.localdomain>
 <20210510152324.GB150402@horse>
MIME-Version: 1.0
In-Reply-To: <20210510152324.GB150402@horse>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TZHSXQMGR2rhF11L"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: virtio-fs@redhat.com, groug@kaod.org,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TZHSXQMGR2rhF11L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 11:23:24AM -0400, Vivek Goyal wrote:
> On Mon, May 10, 2021 at 10:05:09AM +0100, Stefan Hajnoczi wrote:
> > On Thu, May 06, 2021 at 12:02:23PM -0400, Vivek Goyal wrote:
> > > On Thu, May 06, 2021 at 04:37:04PM +0100, Stefan Hajnoczi wrote:
> > > > On Wed, Apr 28, 2021 at 12:01:00PM +0100, Dr. David Alan Gilbert (g=
it) wrote:
> > > > > From: Vivek Goyal <vgoyal@redhat.com>
> > > > >=20
> > > > > If qemu guest asked to drop CAP_FSETID upon write, send that info
> > > > > to qemu in SLAVE_FS_IO message so that qemu can drop capability
> > > > > before WRITE. This is to make sure that any setuid bit is killed
> > > > > on fd (if there is one set).
> > > > >=20
> > > > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > >=20
> > > > I'm not sure if the QEMU FSETID patches make sense. QEMU shouldn't =
be
> > > > running with FSETID because QEMU is untrusted. FSETGID would allow =
QEMU
> > > > to create setgid files, thereby potentially allowing an attacker to=
 gain
> > > > any GID.
> > >=20
> > > Sure, its not recommended to run QEMU as root, but we don't block tha=
t
> > > either and I do regularly test with qemu running as root.
> > >=20
> > > >=20
> > > > I think it's better not to implement QEMU FSETID functionality at a=
ll
> > > > and to handle it another way.
> > >=20
> > > One way could be that virtiofsd tries to clear setuid bit after I/O
> > > has finished. But that will be non-atomic operation and it is filled
> > > with perils as it requires virtiofsd to know what all kernel will
> > > do if this write has been done with CAP_FSETID dropped.
> > >=20
> > > > In the worst case I/O requests should just
> > > > fail, it seems like a rare case anyway:
> > >=20
> > > Is there a way for virtiofsd to know if qemu is running with CAP_FSET=
ID
> > > or not. If there is one, it might be reasonable to error out. If we
> > > don't know, then we can't fail all the operations.
> > >=20
> > > > I/O to a setuid/setgid file with
> > > > a memory buffer that is not mapped in virtiofsd.
> > >=20
> > > With DAX it is easily triggerable. User has to append to a setuid fil=
e
> > > in virtiofs and this path will trigger.
> > >=20
> > > I am fine with not supporting this patch but will also need a reaoson=
able
> > > alternative solution.
> >=20
> > One way to avoid this problem is by introducing DMA read/write function=
s
> > into the vhost-user protocol that can be used by all device types, not
> > just virtio-fs.
> >=20
> > Today virtio-fs uses the IO slave request when it cannot access a regio=
n
> > of guest memory. It sends the file descriptor to QEMU and QEMU performs
> > the pread(2)/pwrite(2) on behalf of virtiofsd.
> >=20
> > I mentioned in the past that this solution is over-specialized. It
> > doesn't solve the larger problem that vhost-user processes do not have
> > full access to the guest memory space (e.g. DAX window).
> >=20
> > Instead of sending file I/O requests over to QEMU, the vhost-user
> > protocol should offer DMA read/write requests so any vhost-user process
> > can access the guest memory space where vhost's shared memory mechanism
> > is insufficient.
> >=20
> > Here is how it would work:
> >=20
> > 1. Drop the IO slave request, replace it with DMA read/write slave
> >    requests.
> >=20
> >    Note that these new requests can also be used in environments where
> >    maximum vIOMMU isolation is needed for security reasons and sharing
> >    all of guest RAM with the vhost-user process is considered
> >    unacceptable.
> >=20
> > 2. When virtqueue buffer mapping fails, send DMA read/write slave
> >    requests to transfer the data from/to QEMU. virtiofsd calls
> >    pread(2)/pwrite(2) itself with virtiofsd's Linux capabilities.
>=20
> Can you elaborate a bit more how will this new DMA read/write vhost-user
> commands can be implemented. I am assuming its not a real DMA and just
> sort of emulation of DMA. Effectively we have two processes and one
> process needs to read/write to/from address space of other process.
>=20
> We were also wondering if we can make use of process_vm_readv()
> and process_vm_write() syscalls to achieve this. But this atleast
> requires virtiofsd to be more priviliged than qemu and also virtiofsd
> needs to know where DAX mapping window is. We briefly discussed this here=
.
>=20
> https://lore.kernel.org/qemu-devel/20210421200746.GH1579961@redhat.com/

I wasn't thinking of directly allowing QEMU virtual memory access via
process_vm_readv/writev(). That would be more efficient but requires
privileges and also exposes internals of QEMU's virtual memory layout
and vIOMMU translation to the vhost-user process.

Instead I was thinking about VHOST_USER_DMA_READ/WRITE messages
containing the address (a device IOVA, it could just be a guest physical
memory address in most cases) and the length. The WRITE message would
also contain the data that the vhost-user device wishes to write. The
READ message reply would contain the data that the device read from
QEMU.

QEMU would implement this using QEMU's address_space_read/write() APIs.

So basically just a new vhost-user protocol message to do a memcpy(),
but with guest addresses and vIOMMU support :).

The vhost-user device will need to do bounce buffering so using these
new messages is slower than zero-copy I/O to shared guest RAM.

Stefan

--TZHSXQMGR2rhF11L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCZUhAACgkQnKSrs4Gr
c8gdwQf+LlzfNvwjF9zHdOrWAPZl8sinO/o3knfhX4c5gpG6I65/yb0HPnlxmq3n
I5PKSwZDvtTjOE6kSCxucEHL3pHguPdh2JGQFLPOSSjxDfPm/jAum+txrNyy04zK
gB2RcOATea8vL/1nTjjnfxNM4Rh71ppnbcHbPBvVTIzoVU0VAqfXlzqH2i3CUT1N
2wLtG4JhTfM0BQt3i9Ql++90Dlu1M6LD0R8wdTL0qhdTu8RzFEaJDzALr6nxhQxW
8PUxnzz2lQnaqb9tRPt8Xt9ySEYhH95ElqaOeHV9HJ3X1t92bdrPUANfmasiBz0+
hmxk7kpcEKG+wangEvZjciiMXXFAkg==
=2250
-----END PGP SIGNATURE-----

--TZHSXQMGR2rhF11L--


