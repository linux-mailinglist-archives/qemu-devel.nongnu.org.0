Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC53390A94
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:36:02 +0200 (CEST)
Received: from localhost ([::1]:33478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldmT-00019e-Ur
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldlG-0007rq-Ov
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldlD-0002K1-Bk
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621974879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oi1DSh479TAx8W9jYebTLN9Qqhck1ugcpgEgtwTPnZI=;
 b=XSdJIRVW9dnYJ2ZeszPXI7ZyrUZq3QxO4WIwXl3KMW+BLja/h8ZWClGK7SocMqG+qWeSuC
 cxH1MZdzEdy6Z4Yi3DXJm3Um0RhOgzcXK/mfWOXx+p0DLTDXtPF16gMr0g0yVknGg3n+2s
 AHQotyxV2PvzINn0dxpbEgLVGjDQbUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-HjDDVEmEPoiKG4Fj0hJMcg-1; Tue, 25 May 2021 16:34:37 -0400
X-MC-Unique: HjDDVEmEPoiKG4Fj0hJMcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3278F80DDE2;
 Tue, 25 May 2021 20:34:36 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91A2163EB;
 Tue, 25 May 2021 20:34:28 +0000 (UTC)
Date: Tue, 25 May 2021 16:34:24 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 18/25] python/qemu: add isort to pipenv
Message-ID: <20210525203424.GD1567491@amachine.somewhere>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-19-jsnow@redhat.com>
 <YK0eIsUzQho7zEcA@localhost.localdomain>
 <b2ac6611-30d0-0a4b-26e8-8bf0fd7bbe7c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b2ac6611-30d0-0a4b-26e8-8bf0fd7bbe7c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 01:21:25PM -0400, John Snow wrote:
> On 5/25/21 11:56 AM, Cleber Rosa wrote:
> > On Wed, May 12, 2021 at 07:12:34PM -0400, John Snow wrote:
> > > isort 5.0.0 through 5.0.4 has a bug that causes it to misinterpret
> > > certain "from ..." clauses that are not related to imports.
> > >=20
> > > isort < 5.1.1 has a bug where it does not handle comments near import
> > > statements correctly.
> > >=20
> > > Require 5.1.2 or greater.
> > >=20
> > > isort can be run with 'isort -c qemu' from the python root.
> > >=20
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   python/Pipfile      | 1 +
> > >   python/Pipfile.lock | 4 ++--
> > >   2 files changed, 3 insertions(+), 2 deletions(-)
> >=20
> > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> >=20
>=20
> Thanks. I have also updated the commit message a little bit:
>=20
> isort can be run (in "check" mode) with 'isort -c qemu' from the python
> root. isort can also be used to fix/rewrite import order automatically
> by using 'isort qemu'.
>=20
> --js

OK, sounds even better!

- Cleber.

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtX1AACgkQZX6NM6Xy
CfMW0Q//Yw/KJlA3t6l+Nwmji8c5MaYWOO1f/EFrn8wQZXRshcIylhlbQ7cD7r+O
uFkuEGHeCr20bApRt2r4hsfSsInMbqU11g8ypTATRnc7naE2qoTSLRk75cMPTFZY
ojYm8qHIiKedaZRtd+UBSzxbZD35TUN0cM8yrtz6X2T5enrUf752LqK4dKgXlm0i
/bWwWKJbK2a3r/w1veVOUU4ZCyVkiaRR8M1k1VyMUc5nNtUNYKFzrIZEhp32irQg
9wlLtBOe33oZxEzYKkr/6evh4XVNDfr/MDisy+i/9HvnSzFssmPgIkEc03Tj90hG
vHZWFUkVkcNWFEymmMTM9F3VTP0bc0U7IZ1+I/pYtfQebxpUIElVRDWC1o0zzZ48
KXRy+C2/FO8GKlVBbGACWBxmDGx1RVR8bmp/uFFYcpC90QuJ04tNF/222S6+N9Qv
W7VA1ZuXg5ryX/LDfVHEMK5zTN0c72Umg8k+2dF5BLK2jKxZfZRtQwH/L5fFAHx9
HOhcSGJf6EnnurCL/b2EaksWf9knigVjCUfWNV27H/63GH1ckVjeVyPD9QxQKzza
x5eORVepFHQy5dgxGOtHt/XUvzeJjuQDqSW9pvupgAgGQdNQ2ZfLyQMRwkVSjgjT
6VQ1F/DB7GJPhSsN+HgIsc8kpNOGl4PS4T6ypBGEBrQFd4x/7js=
=4n3u
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--


