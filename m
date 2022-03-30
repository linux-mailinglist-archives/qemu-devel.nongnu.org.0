Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151A4EC303
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:09:14 +0200 (CEST)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZX8T-0001az-4B
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:09:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZX68-0008GD-12
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:06:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZX65-0001H8-07
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648642003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WF3Y6wSAhjVL90I5Zq3P6Xa0Jj8xsBfWt9fmuGVr6mI=;
 b=EY40jLuFZgubkgvCOBvJWPBi3DKSVmarqx2nxTOc8YWFJ2ST1CLhQQYM3iBumZ0vRIH7BM
 5yCnH9/u1apANaXBNdb4rc3boq/rbRiKm3LynMbhXD6xuLYQe6IuYijKu0jrmTeKSBX7Fb
 mZYu4Pth6VAlApehrt4cmGMuTF8lfaE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-dVwkvtUbPZy-IKgexgCh3g-1; Wed, 30 Mar 2022 08:06:40 -0400
X-MC-Unique: dVwkvtUbPZy-IKgexgCh3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F953380450B;
 Wed, 30 Mar 2022 12:06:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4798C1121314;
 Wed, 30 Mar 2022 12:06:39 +0000 (UTC)
Date: Wed, 30 Mar 2022 13:06:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 1/5] trace: fix compilation with lttng-ust >= 2.13
Message-ID: <YkRHzqi0y/dA1Ptw@stefanha-x1.localdomain>
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pt5p326PevMT0P9s"
Content-Disposition: inline
In-Reply-To: <20220328084717.367993-2-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Pt5p326PevMT0P9s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2022 at 12:47:13PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> On Fedora 36, with lttng-ust 2.13.1, compilation fails with:
>=20
> In file included from trace/trace-ust-all.h:49085,
>                  from trace/trace-ust-all.c:13:
> /usr/include/lttng/tracepoint-event.h:67:10: error: #include expects "FIL=
ENAME" or <FILENAME>
>    67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> In lttng-ust commit 41858e2b6e8 ("Fix: don't do macro expansion in
> tracepoint file name") from 2012, starting from lttng-ust 2.1, the API
> was changed to expect TRACEPOINT_INCLUDE to be defined as a string.
>=20
> In lttng-ust commit d2966b4b0b2 ("Remove TRACEPOINT_INCLUDE_FILE
> macro"), in 2021, the compatibility macro was removed.
>=20
> Use the "new" API from 2012, and bump the version requirement to 2.1 to
> fix compilation with >=3D 2.13.
>=20
> According to repology, all distributions we support have >=3D 2.1 (centos
> 8 has oldest with 2.8.1 afaict)
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build                              | 4 ++--
>  scripts/tracetool/format/ust_events_h.py | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Thank you!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Pt5p326PevMT0P9s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJER84ACgkQnKSrs4Gr
c8hyCAgAgBWCwx138hMb1OBxp4jl8wVXw92ueIFHUubpdxFw9e8wlN3uwO02eLJ/
6Zv0abjSKk09r5sgieOTbhwUAEL7s8oGJNRY5vVTISp5EUwjOaQQSBGDEpnnVxAo
BQfIu3ZhyZn7ZXQz3mEkUSzuIHKPluZGO/ssqJGiTB84FbH8m2bnTBPj0p8n3FiF
hBtbnVbgGLb5Fr3owGH/i1584yRUQNEgKBOelM5f00FyDM4PPNsRo2OD+Yx04xY0
bEcx2V6vPC/vY+FFlb7Y+vG39ExdQORYVgReDsmc0diviFLSMEQEPrHxcYey4ELP
HOCtiJ9ERkr/s3puE1+GGPvZ9Jmuqg==
=2b0Q
-----END PGP SIGNATURE-----

--Pt5p326PevMT0P9s--


