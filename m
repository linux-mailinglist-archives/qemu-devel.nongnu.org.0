Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0958F3043E1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:32:09 +0100 (CET)
Received: from localhost ([::1]:34590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4RGB-0004Ra-Vz
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4R6g-00005A-Qa
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:22:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4R6X-00079y-Sf
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611678124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BYPuer9zYHlhzhptZ4WXyj1I4dmGQYVz4ZAltTTorwM=;
 b=DYnxkXqzHjwiO7vjRCtKfEmS7R8gIid+vhVTmBgkHy51wHdn/fBLBqkITNtvenbOjHHZsm
 c+dMb6jhNn8uzqo0bC4W0YhcglcklA5lJGu9OlbSmWhIpYRlOsmOj7eO66t3Hh0cJN4xsI
 mInpBoZQsYy9Pxf6JUlO/Gugnugzg80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-l-aQq7JeOgyCirtCVD5q-g-1; Tue, 26 Jan 2021 11:22:02 -0500
X-MC-Unique: l-aQq7JeOgyCirtCVD5q-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2C898030AF;
 Tue, 26 Jan 2021 16:22:00 +0000 (UTC)
Received: from localhost (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41C6A60636;
 Tue, 26 Jan 2021 16:22:00 +0000 (UTC)
Date: Tue, 26 Jan 2021 16:21:59 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] trace: make the 'log' backend timestamp configurable
Message-ID: <20210126162159.GC271392@stefanha-x1.localdomain>
References: <20210125113507.224287-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125113507.224287-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 11:35:05AM +0000, Stefan Hajnoczi wrote:
> Zoltan reminded me that the 'log' backend prints tids/timestamps and this=
 can
> be unwanted in some cases. It's easier to look at trace output without th=
em and
> in some cases parsing is also more convenient with them.
>=20
> Extend -msg timestamp=3Don|off to control the 'log' backend's tid/timesta=
mp output.
>=20
> Stefan Hajnoczi (2):
>   error: rename error_with_timestamp to message_with_timestamp
>   trace: make the 'log' backend timestamp configurable
>=20
>  docs/devel/tracing.txt           |  3 +++
>  include/qemu/error-report.h      |  2 +-
>  softmmu/vl.c                     |  2 +-
>  util/qemu-error.c                |  4 ++--
>  scripts/tracetool/backend/log.py | 19 +++++++++++++------
>  5 files changed, 20 insertions(+), 10 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Thanks, applied to my master tree:
https://gitlab.com/stefanha/qemu/commits/master

Stefan

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAQQacACgkQnKSrs4Gr
c8hAnQf+OZ8cjOQDZmo2Jw75YKf73RkU86/1GkfA0K+heY4tdHoIghutDeVHFQJ0
NyOBRaI2rSigJQjEzP8u1vtwkT96dESGciu909E6Nzda1h7uUQtkMyI7LN9LWa2u
3StH9rRenyq1EdJWNgo7envuoCzVu2pTcHmZzTM62Vds2MI2tbJXqhFoHykmYCDa
fdPuuMYME+nWPvBvXir+ldtK1cPExbXA/ABIuhuEVrcBg/ofam04Oj8EM+OX97fA
tIkl1uLpHgbx1n6lP2IbcxLZ8lMzNH0h59GMFSyIdpROV752oH/aJo46dUuVKx2j
cMrsX9UtxAYhmaRx/CKPsttC6NJLQw==
=P9e6
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--


