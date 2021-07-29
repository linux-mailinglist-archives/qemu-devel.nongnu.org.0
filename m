Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1191D3D9F2A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:08:09 +0200 (CEST)
Received: from localhost ([::1]:43572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m915M-0004MS-56
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m914B-0002wK-Vz
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m914A-0005Ed-58
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WaYQleQD+G14uKonyMY4wxN97UMxchMMmF3MBMueNXg=;
 b=UE3doi3pgg+HXXVNYSAk5Dz7zEjMXwFFpR8UHmhPllLFnNixzroXGijP7EJQZJoLnELpgj
 DrZv8i7WnKQ1zHwF65EK6BUz5pa3v8NYjjKzwKeFI6hABQvWsuZxGR8flbGQyyjq7pcDIt
 E3ZEe+qiO1sb/LWdMh+40mpNwHqyv+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-bpaJtCxaPUqWGEQZxUDG-g-1; Thu, 29 Jul 2021 04:06:51 -0400
X-MC-Unique: bpaJtCxaPUqWGEQZxUDG-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 346EB800D55;
 Thu, 29 Jul 2021 08:06:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221DE10016F7;
 Thu, 29 Jul 2021 08:06:45 +0000 (UTC)
Date: Thu, 29 Jul 2021 09:06:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC 03/19] vfio-user: define VFIO Proxy and communication
 functions
Message-ID: <YQJhlZwTygy8FdqV@stefanha-x1.localdomain>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cd9d5d6214d957db61120d9c3cbdc99e799a3baa.1626675354.git.elena.ufimtseva@oracle.com>
 <YQA1kC1P5k2vRd4O@stefanha-x1.localdomain>
 <090CD4E1-D3B1-46CB-AB05-158321095D74@oracle.com>
MIME-Version: 1.0
In-Reply-To: <090CD4E1-D3B1-46CB-AB05-158321095D74@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QmKxKLO9PGb283Gk"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QmKxKLO9PGb283Gk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 06:08:26PM +0000, John Johnson wrote:
>=20
>=20
> > On Jul 27, 2021, at 9:34 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Sun, Jul 18, 2021 at 11:27:42PM -0700, Elena Ufimtseva wrote:
> >> From: John G Johnson <john.g.johnson@oracle.com>
> >>=20
> >> Add user.c and user.h files for vfio-user with the basic
> >> send and receive functions.
> >>=20
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/vfio/user.h                | 120 ++++++++++++++
> >> include/hw/vfio/vfio-common.h |   2 +
> >> hw/vfio/user.c                | 286 ++++++++++++++++++++++++++++++++++
> >> MAINTAINERS                   |   4 +
> >> hw/vfio/meson.build           |   1 +
> >> 5 files changed, 413 insertions(+)
> >> create mode 100644 hw/vfio/user.h
> >> create mode 100644 hw/vfio/user.c
> >=20
> > The multi-threading, coroutine, and blocking I/O requirements of
> > vfio_user_recv() and vfio_user_send_reply() are unclear to me. Please
> > document them so it's clear what environment they can be called from. I
> > guess they are not called from coroutines and proxy->ioc is a blocking
> > IOChannel?
> >=20
>=20
> =09Yes to both, moreover, a block comment above vfio_user_recv() would
> be useful.  The call to setup vfio_user_recv() as the socket handler isn=
=E2=80=99t
> in this patch, do you want the series re-org=E2=80=99d?

That would help with review, thanks!

Stefan

--QmKxKLO9PGb283Gk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmECYZQACgkQnKSrs4Gr
c8hOsggAil8JTVa9oboq3oaQtv2LpZsL6YZEGww8X8NRiZCj8/Z8IPAwbu2W06ed
iNhbvCNDjULj22tc6l2kg+j4N5kDANTrcC6dyyidYTA5KJ9K7B2b19J+xlvIvMAn
mpPhL9a1I99B18kCrVaUeJasKIKQK+QH4LHlChYTGcliLXmAtQJSLlgUYfPicrfe
re5wAddPHopheLjmEihcMmG4albSDMKnc5aAnp7s5hWKruBZ7yLwsviOKT7KqpvC
xisnd/DNaDkITXKHOmXRTEikW4ycS0gOo1hPf2L6mw4oUxx+pLiP5aw4CpLv2UF6
MGK3mxfcXbKfRXc14zp1g0Rs3uFmig==
=ZX2B
-----END PGP SIGNATURE-----

--QmKxKLO9PGb283Gk--


