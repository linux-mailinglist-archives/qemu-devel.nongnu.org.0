Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C120B38F2A7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:57:28 +0200 (CEST)
Received: from localhost ([::1]:35974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEpT-0001v0-Bt
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llEnb-0008Ra-OD
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llEnZ-0005mu-Nw
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621878927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mYo3ecuQAKA8YAomepdwyyUz/M1OygfZNAkqt/9779w=;
 b=GvK8WJbnYk8fNplvoUomikUAkm7XCl6WLcvwEzl9nNV+VqiWZYa8yAAE0Ly5MGpZ601ogu
 gZBuxB5XGZ2tLsrQtk9Irdk+jHYjHweMNEkVIYfclHR7ebOklyq8gJwt/5MQF0prRLRXqT
 d2PWYYu0Bw8pW365ENj0Dfae614K474=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-p7FXsr5KPtyY6Ovty7lo1Q-1; Mon, 24 May 2021 13:55:24 -0400
X-MC-Unique: p7FXsr5KPtyY6Ovty7lo1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 843A7A0CBA;
 Mon, 24 May 2021 17:55:23 +0000 (UTC)
Received: from localhost (ovpn-114-16.phx2.redhat.com [10.3.114.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1F555C230;
 Mon, 24 May 2021 17:55:16 +0000 (UTC)
Date: Mon, 24 May 2021 13:51:58 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Willian Rampazzo <willianr@redhat.com>
Subject: Re: [RFC 1/1] acceptance tests: bump Avocado version to 88.1
Message-ID: <20210524175158.GB1567491@amachine.somewhere>
References: <20210520204747.210764-1-willianr@redhat.com>
 <20210520204747.210764-2-willianr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520204747.210764-2-willianr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 05:47:47PM -0300, Willian Rampazzo wrote:
> Besides some internal changes, new features, and bug fixes, on the QEMU s=
ide,
> this version fixes the following message seen when running the acceptance
> tests: "Error running method "pre_tests" of plugin "fetchasset": 'bytes'
> object has no attribute 'encode'".
>=20
> The release notes are available at
> https://avocado-framework.readthedocs.io/en/latest/releases/88_0.html.
>=20
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 91f3a343b9..a21b59b443 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,5 @@
>  # Add Python module requirements, one per line, to be installed
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> -avocado-framework=3D=3D85.0
> +avocado-framework=3D=3D88.1
>  pycdlib=3D=3D1.11.0
> --=20
> 2.31.1
>=20

I'll be including that bump (and discarding the previous one) on my
upcoming PR.

Acked-by: Cleber Rosa <crosa@redhat.com>

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCr574ACgkQZX6NM6Xy
CfOTshAArFTYMQXcHPdFOWFLNRjmAIgH44bQt5CkEKI6BZafPtHacbYeK5SAEgSg
BQexnXWspfaExIxDNGVvB79b0LNqeFeV3g8RV/9VXhlOmzh+J5e+AUyg1upnvaGy
NqukNbteexJPoY5MbYk01u628IPdB7ISWcZ77Qm1eakNGWYavQn1d+CgMNy+dse2
hLm4mdyVm5o4I8tDh19RL+NoGJ9E7933pHmJfWTsXHIaznbCXiqzqy8CjtioPiym
pFiCmakPMb3cwx3LKzAB0IBhxb0CXi5BECld9dfFrox/MAJJcFWSwaHmde97Su29
xQz3Do0YEHumOjLJosO19xinPjLXVXHaj4AybfTFUgthWkQzWTL9zPsabZMQjQjy
M2SZYt8dzbabLNgUkSDtMma1ajhxuWibI/hjExZuIEvM3hzoLglFznkbSWDzLykx
S+vGb7dzwoDCsQE490p1Ou6DlMEl7eoGoVllz483CwWMH5MWEiPjSxn3T2XaC9jl
UQXdJDqT9X1aHcS8xsWuYkr0sBgqVX9GLCk8MY8XzTUUXDiCPRd+L2Bhhdh+3Tsz
gGEha6ZAT995FvJUEjIASG1y0QRHJwvMZAis7vko2W+pUyKG9I+qjZDzp2RW/AcK
wUAqoE4bRziorCvDmhrMvKlrVJKmKOHYCI6QTqm79QDvosQsWn8=
=0F0P
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--


