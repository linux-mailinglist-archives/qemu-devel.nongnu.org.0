Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE84645C8F8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 16:42:03 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpuPK-0000my-D3
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 10:42:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mpuO8-000846-Ca
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:40:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mpuO5-0002n4-Hp
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637768443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=40SVEpyhHk0BAbSifffhLYfPgFT7ml48+8wpkLof9dM=;
 b=gZcmFkyH9WWRocTpHHUXy8fy5gon9dxMzfW7inod0pEOWnjz7d3YfLq65tJWWI0BshZnYC
 +eT2wK1sTXZyzmWs01MhnQGTFVmpiIAGTpPiHEY1Zf4Z8lUqMo+Zb3PZRb0jVgcm6RIEVo
 n6A3TED905GwYOwkeu3ho0owEhfnuMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-NV2VXczFN1-7Zfln4ujmIA-1; Wed, 24 Nov 2021 10:40:39 -0500
X-MC-Unique: NV2VXczFN1-7Zfln4ujmIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16E53EC1A1;
 Wed, 24 Nov 2021 15:40:38 +0000 (UTC)
Received: from localhost (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14BCE60C17;
 Wed, 24 Nov 2021 15:40:28 +0000 (UTC)
Date: Wed, 24 Nov 2021 15:40:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [qemu-web PATCH v4] Add Sponsors page
Message-ID: <YZ5c7LVptW6cpp0l@stefanha-x1.localdomain>
References: <20211124103028.484302-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124103028.484302-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ekEcNGC0J20zbxa8"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Thomas Markey <admin@fosshost.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair23@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ekEcNGC0J20zbxa8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 11:30:28AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Add a page listing QEMU sponsors.
>=20
> For now, only mention Fosshost which requested to be listed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
>=20
> Cc: Thomas Markey <admin@fosshost.org>
> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Since v3:
> - don't explicitly state /what/ we're using the resource for,
>   just that we've been granted it (danpb)
> - only list Fosshost again (Stefan)
> ---
>  _includes/footer.html | 3 +++
>  assets/css/style.css  | 6 +++++-
>  sponsors.md           | 9 +++++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644 sponsors.md

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ekEcNGC0J20zbxa8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGeXOwACgkQnKSrs4Gr
c8hX5Qf/YtEtjXYm2++Xt6P5mOwWiUSldKTUpX5JL1tn/IH8XyUf3bD4t87t/sVq
28ccLRQa7FbfiXvdmlEgH4SP73H/DJ8GdcQCFQpeNZ9Xpcn6XlbJWUIEkk7BhBhO
bA/NbRRR1UmmQBvvWhXlL2orDWyjxvlJdDp545NVBJHFduLHJVrSUvvSSS3d94jl
zKFhyfVYDUfnaBm329NUZtdaaYTH5l6WGkb8R6ovqan24zhaxWUMHjC767ERWitm
fDH8el5vd/y/jLWv0Rl8PiIQL9PEccjTu8G0Yrugv36LSGVZjMFYex4ZVwnky/nj
DNBnGM70FE9wGU0kjSmKif1P/DP8kA==
=Y69u
-----END PGP SIGNATURE-----

--ekEcNGC0J20zbxa8--


