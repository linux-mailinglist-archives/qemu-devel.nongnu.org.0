Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185517119B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 08:43:29 +0100 (CET)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7DpP-0002HD-3X
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 02:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j7DnQ-0001oJ-Mq
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:41:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j7DnP-0000G0-G9
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:41:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31287
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j7DnP-0000Ey-8V
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582789282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hkhXBtKcR0sEpW010FbwV12eMFODPRQhBEl29BngsU=;
 b=ZRpsOa96mU+wWyB2Q07p50RvZt5CPc8AiyAca0WA62MvR2Tl16Sbkk3GFeIgB1m00z75CC
 gT14BTtY2CP/Yw0FjgpaHVUbznzMOq0j25JJEJsXS8W1pVoC77EWdjSxKvD/E7C+v1TEqi
 XvP286jHhQ84p/TF3FQAa/zfXuCXClQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-kKotR2T_Pf6D0PnsT_JJSg-1; Thu, 27 Feb 2020 02:41:20 -0500
X-MC-Unique: kKotR2T_Pf6D0PnsT_JJSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26AF0800053;
 Thu, 27 Feb 2020 07:41:19 +0000 (UTC)
Received: from localhost (ovpn-117-38.ams2.redhat.com [10.36.117.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46F8E1001B0B;
 Thu, 27 Feb 2020 07:41:16 +0000 (UTC)
Date: Thu, 27 Feb 2020 07:41:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH v4 0/5] vhost-user block device backend implementation
Message-ID: <20200227074114.GB83512@stefanha-x1.localdomain>
References: <20200218050711.8133-1-coiby.xu@gmail.com>
 <20200219163815.GD1085125@stefanha-x1.localdomain>
 <CAJAkqrXaqmT2pR4K1x06AeQZHvUWp-fcqnbKZq_45czO96v5PA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJAkqrXaqmT2pR4K1x06AeQZHvUWp-fcqnbKZq_45czO96v5PA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 11:18:41PM +0800, Coiby Xu wrote:
> Hi Stefan,
>=20
> Thank you for reviewing my code!
>=20
> I tried to reach you on IRC. But somehow either you missed my message
> or I missed your reply. So I will reply by email instead.
>=20
> If we use qio_channel_set_aio_fd_handler to monitor G_IO_IN event,
> i.e. use vu_dispatch as the read handler, then we can re-use
> vu_message_read. And "removing the blocking recv from libvhost-user"
> isn't necessary because "the operation of poll() and ppoll() is not
> affected by the O_NONBLOCK flag" despite that we use
> qio_channel_set_blocking before calling qio_channel_set_aio_fd_handler
> to make recv non-blocking.

I'm not sure I understand.  poll() just says whether the file descriptor
is readable.  It does not say whether enough bytes are readable :).  So
our callback will be invoked if there is 1 byte ready, but when we try
to read 20 bytes either it will block (without O_NONBLOCK) or return
only 1 byte (with O_NONBLOCK).  Neither case is okay, so I expect that
code changes will be necessary.

But please go ahead and send the next revision and I'll take a look.

Stefan

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5XcpoACgkQnKSrs4Gr
c8g/CwgApuQoUw/A8uzAnpNEdCTDthY3A4mSCrEWOyt7yQMQ3MGerWHMid23v3D/
kj7sQKMGCwgj7U5ZdetBbjuXT3/fUKmgEKvsy/fbLH3p0KZtj6PIyu15eQkfmcX6
tCl1UUSsqUOJRN2UJ+bhnc8l44TrHq89sgo+uHyroFZOkZJcB2pFOP+Wo0JQttj1
+T3IMV1uf71D453EWyCvly9I79N5Y+fxlGsn7FIa1nnGF6eMRzLqc/8DPOlxPpSe
3MYTzCOPGqF8ubLS7HRX/bjq2uoaASy+ysu/nKnBAs+QlVLyJ12cEk9Mk6//UTxk
uaYYh4Ph+y/UJlU5yQSdmhcDTSff+Q==
=jgAp
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--


