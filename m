Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38846E4B4B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 14:41:33 +0200 (CEST)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNyuK-0002iL-AA
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 08:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iNyrk-0007ua-SQ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:38:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iNyrj-00064o-AU
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:38:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27388
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iNyrj-00064a-6l
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 08:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572007130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rbjXHYwdVpgef9JMp3oocgDI/ChhvwygFrnLxTp6t3c=;
 b=FPV+d9p2xCA0VYqFnvQ1KAKp8wGhzoEeCc3Bo/rY3s3TBsruN8DDjXvJpqTSQdyRdq1rck
 OeFSxNFAOegATTgC8N8tBdHHx7mBvPhzj5D5YIz3WiwdgwEIeidIFbX5z6FNE0yngJADoH
 iTa6OjkbFbLZcHhgPwTFb+nPF4jRUcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-D6_V3-_3NSqGEx9lnl9BZQ-1; Fri, 25 Oct 2019 08:38:46 -0400
X-MC-Unique: D6_V3-_3NSqGEx9lnl9BZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0036D1005509;
 Fri, 25 Oct 2019 12:38:46 +0000 (UTC)
Received: from localhost (ovpn-117-215.ams2.redhat.com [10.36.117.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5682C5D71C;
 Fri, 25 Oct 2019 12:38:44 +0000 (UTC)
Date: Fri, 25 Oct 2019 14:38:43 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Dietmar Maurer <dietmar@proxmox.com>
Subject: Re: [PATCH v4] yield_until_fd_readable: make it work with any
 AioContect
Message-ID: <20191025123843.GC13314@stefanha-x1.localdomain>
References: <20191024045610.9071-1-dietmar@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20191024045610.9071-1-dietmar@proxmox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lCAWRPmW1mITcIfM"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 06:56:10AM +0200, Dietmar Maurer wrote:
> Simply use qemu_get_current_aio_context().
>=20
> Signed-off-by: Dietmar Maurer <dietmar@proxmox.com>
> ---
> Changelog for v4:
>=20
> - avoid unsafe cast and keep fd_coroutine_enter()
>=20
> Changelog for v3:
>=20
> - use (IOHandler *) instead of ((void (*)(void *))
> - coding style: fix max line length
>=20
> Changelog for v2:
>=20
> - use correct read handler in aio_set_fd_handler (instead of write handle=
r)
>=20
>  util/qemu-coroutine-io.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--lCAWRPmW1mITcIfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2y7NMACgkQnKSrs4Gr
c8gRywf/cc6k5yThpLdqoukdQVb5R/W6SM3eEMT20rmeSeYPpsYWkvq3La8RIKAl
qc3MyYMfWbHcbN7WzsBvY6P7Wa6qzYST7JwDmkhjQsUAR7LZ0B+yhEjSWAmithhw
+ECvqLgGEXi+Ybq4D2fQAvzAcntJ21O7JR2AhZHf4I8svvzywjJ4VME37Z2Yxgk6
Dn4WcZHhBGNE0imJeJ0TL4GlCJAaXudg/oWCkTkXNG3sRPZu11X8dCQAfQ3xTWE+
QbOvM1kitBHBteRLsy6k/a7q4FnkBefqNivu9pLFDMcPSOT4ZoWfuA/35CsYkM8E
XG+cVbX7NbaQDEJvJrNFFo+fyTOyzg==
=wO7z
-----END PGP SIGNATURE-----

--lCAWRPmW1mITcIfM--


