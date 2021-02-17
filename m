Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FAE31D4A6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 05:39:58 +0100 (CET)
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCEd3-0001Eg-8U
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 23:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEcC-0000ov-Nt
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:39:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCEcA-0003ax-Gp
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 23:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613536739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=633FGaLSs4MvvFS6HH1qbusKRdDtCUYtah6X+gdUY54=;
 b=G4Yviyq0s6AaNVOmNEqRpPnFyv+Ks3b7wB2EUcM1OFWMYiVRvrulDSlyd4qt38quuOy0sv
 JinJlJ9DpMlZVyqQWRocXWKxwgHQ89MyMOjsCBLVlGiDa/lxvw53DfxyUyV3znClnOdoXk
 9jBOSyz26G4dcOvNQtH9l3ACT1/Q6SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-TIakjTkxPV6C6Bfq5xMiUA-1; Tue, 16 Feb 2021 23:38:55 -0500
X-MC-Unique: TIakjTkxPV6C6Bfq5xMiUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C1E3C290;
 Wed, 17 Feb 2021 04:38:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A8B5C648;
 Wed, 17 Feb 2021 04:38:48 +0000 (UTC)
Date: Tue, 16 Feb 2021 23:38:46 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 15/24] python: add mypy to pipenv
Message-ID: <YCyd1jN4e3VxHSkx@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-16-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-16-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gC54PmY/FZBHh/hF"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gC54PmY/FZBHh/hF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:47PM -0500, John Snow wrote:
> 0.730 appears to be about the oldest version that works with the
> features we want, including nice human readable output (to make sure
> iotest 297 passes), and type-parameterized Popen generics.
>=20
> 0.770, however, supports adding 'strict' to the config file, so require
> at least 0.770.
>=20
> Now that we are checking a namespace package, we need to tell mypy to
> allow PEP420 namespaces, so modify the mypy config as part of the move.
>=20
> mypy can now be run from the python root by typing 'mypy qemu'.
>

 $ mypy qemu=20
 qemu/utils/accel.py: error: Source file found twice under different module=
 names: 'qmp' and 'qemu.qmp'
 Found 1 error in 1 file (errors prevented further checking)

I guess you meant 'mypy -p qemu'.

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Pipfile      |  1 +
>  python/Pipfile.lock | 37 ++++++++++++++++++++++++++++++++++++-
>  python/setup.cfg    |  1 +
>  3 files changed, 38 insertions(+), 1 deletion(-)
>=20

With that change,

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--gC54PmY/FZBHh/hF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsndQACgkQZX6NM6Xy
CfOzXg/+MnkX+6lw/S3J5MMge5q8vRpAd2i/kBITcjVROy3e0efz40mjnGPaEC1J
7vhrNCjcgLHfjGdyUDfFW8Re7lAInzwpVh2t9wIDZQov8KcOLWML6mn2gy2myzBz
v5c/+vMaHtJpB/17IWNiSZsV2VtdhmNZsvGQsXnCTyapyZYUd4x1Cn/SVwqUyxQo
mfBS5R/vFC6ps3dR/eK9oj0/WJ1k3d6gaEHRFD7TeHG2BqF/fG6L1ISoUA/r7um5
lgD0ET74hIuM5yBAaTFaAGZPc6xsN1cClZUvErdND/++OUiR7qwHr6JDLj1i7hhV
rHIM9vhuhPqqC/j8Y9kEx9LsqvexCJd0GhOvmYsldQqaWkLMucwlwLos4N+brhe+
xS/VKdixcafrcZsaLmpLh9KCNwfdMYdhKkttCuv0rV3pRRczPjADFk0PfUDyjqs0
7xEL21Nea7AsAodWkonPgRXFOjAhVm6n4a0jWEBh3wMw9xY1vb1R/psHe790snB5
mm3BS9BthNmvyJn9EPfqyO6hEvTKTJXmFWGgzvvc8rF3U7tXliYHPDNeycAN6lG/
fQyR+h0eZ4DBzZr7Mn8d9g/nVHyKLSKWCWyhW68h9LJbwFhGo/aG5n/P5qy425PM
TPaVmWx1rSQof1ANj7s29PVhkfvpRN2cHVsduwnwtpijVCYbv24=
=MKDZ
-----END PGP SIGNATURE-----

--gC54PmY/FZBHh/hF--


