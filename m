Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBDC31D3EF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 03:27:21 +0100 (CET)
Received: from localhost ([::1]:45252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCCYj-0007XF-1Z
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 21:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCCXq-000723-9e
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 21:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCCXo-0003xM-FW
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 21:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613528783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRkI7IlrP/UhwWiNrxsqX2g2G1irQrOyNIUrw+uNITg=;
 b=jIyG2EJG+NV06M0MhDdre9uKERfKC2vn6ZL7Nmbw+BqHFJfNLhafcVtKQoEmBcNvCeTX2a
 Phuq6VH8zt/S2kmsgIJo+KbxCAE5i2IR51QLDvqpLBHqrqG7T23UgHp+HjjFrmomyd28uK
 AuRzJrZrDQoAHNsnoOXWQC3Wwfn8jJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-HUy_DdH_MAe1jAg38mfLkw-1; Tue, 16 Feb 2021 21:26:21 -0500
X-MC-Unique: HUy_DdH_MAe1jAg38mfLkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 227EB593B1;
 Wed, 17 Feb 2021 02:26:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 682AB5D9C0;
 Wed, 17 Feb 2021 02:26:11 +0000 (UTC)
Date: Tue, 16 Feb 2021 21:26:09 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 06/24] python: add VERSION file
Message-ID: <YCx+wUXGX60DGoIP@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-7-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S0uu8lJDfU9/HNiv"
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

--S0uu8lJDfU9/HNiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:38PM -0500, John Snow wrote:
> Python infrastructure as it exists today is not capable reliably of
> single-sourcing a package version from a parent directory. The authors
> of pip are working to correct this, but as of today this is not possible.
>=20
> The problem is that when using pip to build and install a python
> package, it copies files over to a temporary directory and performs its
> build there. This loses access to any information in the parent
> directory, including git itself.
>=20
> Further, Python versions have a standard (PEP 440) that may or may not
> follow QEMU's versioning. In general, it does; but naturally QEMU does
> not follow PEP 440. To avoid any automatically-generated conflict, a
> manual version file is preferred.
>=20
>=20
> I am proposing:
>=20
> - Python tooling follows the QEMU version, indirectly, but with a major
>   version of 0 to indicate that the API is not expected to be
>   stable. This would mean version 0.5.2.0, 0.5.1.1, 0.5.3.0, etc.
>=20
> - In the event that a Python package needs to be updated independently
>   of the QEMU version, a pre-release alpha version should be preferred,
>   but *only* after inclusion to the qemu development or stable branches.
>=20
>   e.g. 0.5.2.0a1, 0.5.2.0a2, and so on should be preferred prior to
>   5.2.0's release.
>=20
> - The Python core tooling makes absolutely no version compatibility
>   checks or constraints. It *may* work with releases of QEMU from the
>   past or future, but it is not required to.
>=20
>   i.e., "qemu.machine" will, for now, remain in lock-step with QEMU.
>=20
> - We reserve the right to split the qemu package into independently
>   versioned subpackages at a later date. This might allow for us to
>   begin versioning QMP independently from QEMU at a later date, if
>   we so choose.
>=20
>=20
> Implement this versioning scheme by adding a VERSION file and setting it
> to 0.6.0.0a1.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/VERSION   | 1 +
>  python/setup.cfg | 1 +
>  2 files changed, 2 insertions(+)
>  create mode 100644 python/VERSION
>=20

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--S0uu8lJDfU9/HNiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsfsEACgkQZX6NM6Xy
CfO+nBAAnIhHLB/RPQkePLm2qafaZq2qjGI1QMz/5AuEE/eYK7YeBOdFCdJs9WoO
c3ljIrFJgEZbtZ8zOoT5a/zHPYmfjVa2jVk6uXS8bX5gF7nIJniEUg5ciJxstGA+
wg/CSUzw55gxxg9RQREso/dRJuOMgye8s+ulsg1jSIo0Y3jUOcmBNGxEluAd0OWE
OLmsXZuHpARRSUC9LyBlj2dTbSnqkwugaGQBQp88Jyb+fhC/haFzQ2UlEb7HrQKG
HnbyxXKGajS+vWXKD+AKTuPNVxCTm/CdzSuUt5u7e7UKL0n9w+bWq3yb7Fi40Z0x
e/3042Tdp9dIshvWF103OHBD4qVeLhk0ZYhw3HYlQYf9D39384WEujpgIts7ejMA
id4IwHeoMok4MlILWely2QcU+h2Wx0uv6/IiNx11lmpRnMhCRQwA3frhLV897dTA
XgGFBnUJ41AeVWkN6hjeR8XlUuW+ge7haB6Si1cmClqhB9dm8IL1zfYEkSDpcqjg
BR0NIvv/UshW4VpnQlhK1SBfwEQ+SVQfp85kIN3eR/fajX6Z1FTyYlHi+qZqMKj6
EzHY146BKOcv5lXVNXchWzKJSuf3KptlvaITl0w4S2o0+blaKPmHabtQhSVa953T
CF1PreNxuKMrM8eKlyI5rEn/v0jiXAgwZw1c9vz0XZ7/MVuB3/g=
=RsEt
-----END PGP SIGNATURE-----

--S0uu8lJDfU9/HNiv--


