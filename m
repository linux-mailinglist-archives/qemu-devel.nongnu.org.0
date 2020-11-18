Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCEF2B79F7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:06:53 +0100 (CET)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJQS-0008PA-Tc
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfJIR-0005SA-OK
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfJIP-000096-H5
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605689912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iiPGoO3hTdwgre3C1oODGkFspv4MEstQIg4rOfGIu8=;
 b=E8IJYILGqrPqPa5u2o1ZNRTKLWAukVUK14/o2Xqd0X8Trpuc0mfLuGLa8s1kJdNpnijoLz
 EGN6loSrLOd6uzVyR6VVPFoFVzB1g7vxO8vLQm+XngjSlwFzB4IPJtekrr1WARYhEw/Tao
 Iy0WmdSfPoOgumZbTGTkUdS4j9LQQpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-rHs_xRdQODWzewFeJNQZkQ-1; Wed, 18 Nov 2020 03:58:30 -0500
X-MC-Unique: rHs_xRdQODWzewFeJNQZkQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DAD1108BD08
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 08:58:28 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 341E05D9CA;
 Wed, 18 Nov 2020 08:58:28 +0000 (UTC)
Date: Wed, 18 Nov 2020 08:58:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 0/2] libvhost-user: lower dependency on QEMU headers
Message-ID: <20201118085826.GC182763@stefanha-x1.localdomain>
References: <20201118080902.30033-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118080902.30033-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 12:09:00PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Hi,
>=20
> libvhost-user is meant to be free of glib dependency, and easily
> copyable/reusable outside of QEMU. Clean-up some dependencies that crept =
in
> recently (the one remaining is qemu/atomic.h, from which a subset is used=
)
>=20
> Marc-Andr=E9 Lureau (2):
>   libvhost-user: replace qemu/bswap.h with glibc endian.h
>   libvhost-user: replace qemu/memfd.h usage
>=20
>  contrib/libvhost-user/libvhost-user.c | 127 +++++++++++++++++---------
>  1 file changed, 83 insertions(+), 44 deletions(-)

Let's find a way to enforce this. How about a libvhost-user-only build
in the CI system without glib2-devel? Also maybe a way to poison QEMU
headers? It might be simpler to move contrib/libvhost-user to a separate
git repo though.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+04jIACgkQnKSrs4Gr
c8jngwf/UPQgBt3cOgoq1FhgwEPLTa+bdSpPXkZmYQYfvUEkW3hxUcR0/Hir9/mm
mYQ07Uf1SNZnufa+2x5svmdnqP2ia4V3pKLCVnFfTU9XieOSsbq9bFrzjDRpQurL
+Qz5U8Aq3KCTm7/fX5hStPDUgZB9CyZPrzL/nyJuHmR1c0HeXByh8Src2WvRhACx
0vfqh3PqVk5dtBEQKlxMwufMezFMn5AZH+W7VDj5wM7fADE5RlBsJyplCNeuT3nH
f7tzoA7V6nAXHiVAO79WE5aGyYtBJG4323tfEe9EYZoFFad25U+H9rG+WLZNxQRL
mil3cpynsjCGvsPz+Ku4G0/91dHA8g==
=kUTq
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--


