Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B3B2F32B3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:13:05 +0100 (CET)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKPx-0002Bf-10
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzKKB-0006Z2-El
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzKK9-0004lq-OI
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610460423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TlUvoG78ag/ozTr78BbiRru+634UxGD687JsjqL9bCI=;
 b=Kx7BQ4atmLz9gDX2XUs2mU04k4623f+5ajojmJ+vU7519fiHlQs5c8twAarGuQPZ7MfQ9X
 ktOTEZ5tE4S6vm855A8KD990Iv66+r0aKt0bEdFR05nztGGvqAgTfp3MQtkmfe5/VvIJ8u
 7Vfbn+QMFtN7EKDE3IMryTa/aMM9Dj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-1xBBOA-KOU6s7jjhTJOCng-1; Tue, 12 Jan 2021 09:06:59 -0500
X-MC-Unique: 1xBBOA-KOU6s7jjhTJOCng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8923180365F;
 Tue, 12 Jan 2021 14:06:57 +0000 (UTC)
Received: from localhost (ovpn-115-99.ams2.redhat.com [10.36.115.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3329819744;
 Tue, 12 Jan 2021 14:06:57 +0000 (UTC)
Date: Tue, 12 Jan 2021 14:06:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/3] trace: convert docs to rST and feature "log"
 backend in quickstart
Message-ID: <20210112140656.GA203591@stefanha-x1.localdomain>
References: <20201216160923.722894-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201216160923.722894-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 04:09:20PM +0000, Stefan Hajnoczi wrote:
> v2:
>  * Simplify quickstart for the "log" trace backend that is enabled by def=
ault
>    [Peter]
>  * Don't show ./configure --enable-trace-backends=3Dlog example since it'=
s built
>    by default (changed to --enable-trace-backends=3Dsimple,dtrace) [Peter=
]
>=20
> Convert tracing.txt to rST and add it to the generated developer document=
ation.
>=20
> Peter Maydell suggested making the "log" backend the recommended backend =
in the
> quickstart documentation. It's easier to use than the "simple" backend. T=
he
> final patch updates the documentation to do this.
>=20
> Stefan Hajnoczi (3):
>   trace: fix simpletrace doc mismerge
>   tracing: convert documentation to rST
>   trace: recommend "log" backend for getting started with tracing
>=20
>  docs/devel/index.rst                    |   1 +
>  docs/devel/{tracing.txt =3D> tracing.rst} | 185 ++++++++++++++----------
>  2 files changed, 107 insertions(+), 79 deletions(-)
>  rename docs/devel/{tracing.txt =3D> tracing.rst} (84%)
>=20
> --=20
> 2.29.2
>=20

Thanks, applied to my tracing tree:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/9rQAACgkQnKSrs4Gr
c8i/aggAkCUu4tGgxhBCJrVD0iiPzd2INucCE9n3Ynqn6xIoUGLF7G+ppvrNNOMy
ESXD4Yu/oSf/JnKTK1dWcW7zCLg4IG5/SttaPWIGFNyP7vmYG6c0Wz4XQT35VLks
Gtxv5XJ+RqEeUF1yO1LaPXG4nbtH+P/KFz4xrn9GbtkoNG1IPQesiS08dxPnANm7
ql2frciZuWIogIxXL8ArUntaP4qAwkKfSvmY+rjTD+srvcK8nwMTPjrzYJ33OGc1
1yooUGIB0yNqBOuQxpoX1bHwDoDcZkaJCLcTtzNfykOB8MZGlhxRFUhE0c/XbXeR
b08AAdChBpQolDYn6uu1dgq8fdeOUg==
=4bz2
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--


