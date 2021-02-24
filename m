Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC45323BB4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:58:42 +0100 (CET)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsoT-00078Z-Nq
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEsnM-0006Dp-HM
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEsnK-0005xO-OJ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614167850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mZpK812un7vhFuws04IhooteJ1+LiRP80Kq1zs52zug=;
 b=cF6vglV4BjsQomwvufcnOi7FNiTv1FqdtPH+v14Y0g9Vaur295/nrkwyWRuMQvg9Ycthrc
 boLxtiqHYtd0JtTtkRt+8Nt/2aGwH/hCKPUyuc86bK69/UtXpr9hMFU/2d9sK7vnopQP1D
 DzmSF8RL9G2q9wFgfw9hKyYZBtBKEfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-6T4N6ZDzOc6w_k5i8D6z_Q-1; Wed, 24 Feb 2021 06:57:27 -0500
X-MC-Unique: 6T4N6ZDzOc6w_k5i8D6z_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50CF7193578B;
 Wed, 24 Feb 2021 11:57:26 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB89010016F0;
 Wed, 24 Feb 2021 11:57:25 +0000 (UTC)
Date: Wed, 24 Feb 2021 11:57:24 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] docs/devel: re-organise the developers guide into
 sections
Message-ID: <YDY/JL2XUv/GttA9@stefanha-x1.localdomain>
References: <20210223105146.6695-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210223105146.6695-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mmKbYe6zHZURyxBX"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mmKbYe6zHZURyxBX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 10:51:46AM +0000, Alex Benn=E9e wrote:
> The list of sub-sections was getting a bit long and sporadically
> organised. Let's try and impose some order on this hairball of
> documentation.
>=20
> [AJB: RFC because I wonder if we should make a more concerted effort
> to move bits of the wiki into a canonical maintained document. There
> is also probably a need for a quickbuild or tldr section of the
> build-system for users who just want to build something.]
>=20
> Based-on: 20210223095931.16908-1-alex.bennee@linaro.org
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  docs/devel/index.rst                 | 32 ++++++----------------------
>  docs/devel/multi-thread-tcg.rst      |  5 +++--
>  docs/devel/section-apis.rst          | 16 ++++++++++++++
>  docs/devel/section-building.rst      | 13 +++++++++++
>  docs/devel/section-concepts.rst      | 21 ++++++++++++++++++
>  docs/devel/section-process.rst       | 11 ++++++++++
>  docs/devel/section-tcg-emulation.rst | 19 +++++++++++++++++
>  docs/devel/section-testing.rst       | 20 +++++++++++++++++
>  docs/devel/tcg-icount.rst            |  6 +++---
>  docs/devel/testing.rst               |  6 +++---
>  10 files changed, 115 insertions(+), 34 deletions(-)
>  create mode 100644 docs/devel/section-apis.rst
>  create mode 100644 docs/devel/section-building.rst
>  create mode 100644 docs/devel/section-concepts.rst
>  create mode 100644 docs/devel/section-process.rst
>  create mode 100644 docs/devel/section-tcg-emulation.rst
>  create mode 100644 docs/devel/section-testing.rst

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--mmKbYe6zHZURyxBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2PyQACgkQnKSrs4Gr
c8jHDQf+Py/1RuI3VUmiyUOiumhsUy0KpAKR+j4zHhW57cuANaXhRFDEl/9ZQx1t
6oCR1v0wWaevuAwZacMizg4Icgq4QqcQzUI3Ie2O/ltrNDfaI11tGgK0pHgmdVv0
Bej6qRFg1NOVqbZES4Q3E0pJ0ir3nrx2rNRPymd06O0AOb++pLhrx3to1DX4Lwvg
hdM63KSPTIaUsg9JWyLUpLJsNrj5qlLHdQ0jpnHTiGjS5sRvB5oGjzX6luzdHJhN
IvRVL5YthUW8if0mKgMFq4E8UAwGcru8/kaFHLG3/LOM3Gb9gWyWsnMqgGtdu4bP
hZxTC+fRIf72aocX6g4jItsrTWybCA==
=yXr8
-----END PGP SIGNATURE-----

--mmKbYe6zHZURyxBX--


