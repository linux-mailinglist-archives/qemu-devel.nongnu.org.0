Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC4377EF5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:07:37 +0200 (CEST)
Received: from localhost ([::1]:35190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1t2-0005kX-I4
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg1qs-0003Zh-39
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lg1qp-0000NP-36
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620637518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4cy9sPc9l46dMoXVgtZ/muvfNoIYVg/uCDiKBuVHWGI=;
 b=cVry37wvRxJJJ7ZN2gePiHxRNtV7XQXaQuT+bEAcCLLXzC5j/MgN8LF7WGN1fXh/uCyI4/
 NZ1nyuUMuCXJ7XwIwBamUjJeMbd5KzBCRSfU4rD0DkcEjt/FbT7FXd8ygsCrphzBnmraXw
 5S+mDRskv9hIjV3PyWoBWJ/QiWUBLDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-mq4ZrDy8MUeZ2pSopoNpNg-1; Mon, 10 May 2021 05:05:15 -0400
X-MC-Unique: mq4ZrDy8MUeZ2pSopoNpNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92A998049CA;
 Mon, 10 May 2021 09:05:14 +0000 (UTC)
Received: from localhost (ovpn-115-117.ams2.redhat.com [10.36.115.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFADA19C45;
 Mon, 10 May 2021 09:05:10 +0000 (UTC)
Date: Mon, 10 May 2021 10:05:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if
 client asked for it
Message-ID: <YJj3RSxXKZHxmiKu@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-27-dgilbert@redhat.com>
 <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
 <20210506160223.GA277745@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210506160223.GA277745@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w7Kh2C8x/BnrcDxV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

--w7Kh2C8x/BnrcDxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 12:02:23PM -0400, Vivek Goyal wrote:
> On Thu, May 06, 2021 at 04:37:04PM +0100, Stefan Hajnoczi wrote:
> > On Wed, Apr 28, 2021 at 12:01:00PM +0100, Dr. David Alan Gilbert (git) =
wrote:
> > > From: Vivek Goyal <vgoyal@redhat.com>
> > >=20
> > > If qemu guest asked to drop CAP_FSETID upon write, send that info
> > > to qemu in SLAVE_FS_IO message so that qemu can drop capability
> > > before WRITE. This is to make sure that any setuid bit is killed
> > > on fd (if there is one set).
> > >=20
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> >=20
> > I'm not sure if the QEMU FSETID patches make sense. QEMU shouldn't be
> > running with FSETID because QEMU is untrusted. FSETGID would allow QEMU
> > to create setgid files, thereby potentially allowing an attacker to gai=
n
> > any GID.
>=20
> Sure, its not recommended to run QEMU as root, but we don't block that
> either and I do regularly test with qemu running as root.
>=20
> >=20
> > I think it's better not to implement QEMU FSETID functionality at all
> > and to handle it another way.
>=20
> One way could be that virtiofsd tries to clear setuid bit after I/O
> has finished. But that will be non-atomic operation and it is filled
> with perils as it requires virtiofsd to know what all kernel will
> do if this write has been done with CAP_FSETID dropped.
>=20
> > In the worst case I/O requests should just
> > fail, it seems like a rare case anyway:
>=20
> Is there a way for virtiofsd to know if qemu is running with CAP_FSETID
> or not. If there is one, it might be reasonable to error out. If we
> don't know, then we can't fail all the operations.
>=20
> > I/O to a setuid/setgid file with
> > a memory buffer that is not mapped in virtiofsd.
>=20
> With DAX it is easily triggerable. User has to append to a setuid file
> in virtiofs and this path will trigger.
>=20
> I am fine with not supporting this patch but will also need a reaosonable
> alternative solution.

One way to avoid this problem is by introducing DMA read/write functions
into the vhost-user protocol that can be used by all device types, not
just virtio-fs.

Today virtio-fs uses the IO slave request when it cannot access a region
of guest memory. It sends the file descriptor to QEMU and QEMU performs
the pread(2)/pwrite(2) on behalf of virtiofsd.

I mentioned in the past that this solution is over-specialized. It
doesn't solve the larger problem that vhost-user processes do not have
full access to the guest memory space (e.g. DAX window).

Instead of sending file I/O requests over to QEMU, the vhost-user
protocol should offer DMA read/write requests so any vhost-user process
can access the guest memory space where vhost's shared memory mechanism
is insufficient.

Here is how it would work:

1. Drop the IO slave request, replace it with DMA read/write slave
   requests.

   Note that these new requests can also be used in environments where
   maximum vIOMMU isolation is needed for security reasons and sharing
   all of guest RAM with the vhost-user process is considered
   unacceptable.

2. When virtqueue buffer mapping fails, send DMA read/write slave
   requests to transfer the data from/to QEMU. virtiofsd calls
   pread(2)/pwrite(2) itself with virtiofsd's Linux capabilities.

Stefan

--w7Kh2C8x/BnrcDxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCY90UACgkQnKSrs4Gr
c8h3BwgAlI/ulK96gITaB0xcY0/luVnA4z75w7jGSqtRYR0y6o6YN/n5u2BVBG4f
iG1gi/KEAkNCgQ0c9WWyxZ9nc67gkaH7flriZm468HeE3bcMbY/cSN6CL9domICz
2OP/Zto5FudIvGh8zub0+A+Z2F+rxl/yHVTqaIntccEnmaif+OYScRdL6Y/X+w2h
hPm1AqX0GWpxAEABh+DiW4HhYisoZL/02qDgAPd9J4ODP1MbujExtP5+UjWN5wFJ
giEYCyQCtktPISDBx0D7ZLY74g0/kc1mExAoiZBP0tCFOlwP8g16uugadvECNrHm
hAEEYkUcKBkIXKhxCBa4yGe5LI/1JA==
=9W8O
-----END PGP SIGNATURE-----

--w7Kh2C8x/BnrcDxV--


