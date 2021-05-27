Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585BE3933BB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:27:05 +0200 (CEST)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIqe-0006Os-EC
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIkf-00056j-2q
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmIii-0006K7-H3
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622132332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rjE7+GsFqFoUFpOOUNOBJ4mOoYZvSfqoC2KqJo1jFOw=;
 b=gbQy9Ur/ouM8dfoeqB39XxY6ex4Khum4xuHKW+ux5sdOJo3NyB8xdnJ+uHBJmS9gNsRQ8T
 FLF/tmVG1tIE/2d/+XWQ3HHDt0Rl3k4sMUGzo9lEHqCafAdBThFX8mZTh4Dupc8cRpneNh
 5xNdk8hmBUHnP0rZysPXtU/Cwr1bHeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-YC7rEh8WNRCpk0Q05DTO2w-1; Thu, 27 May 2021 12:18:49 -0400
X-MC-Unique: YC7rEh8WNRCpk0Q05DTO2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD1B119253C4;
 Thu, 27 May 2021 16:18:47 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99CC719D9B;
 Thu, 27 May 2021 16:18:41 +0000 (UTC)
Date: Thu, 27 May 2021 12:03:52 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 09/31] python: create qemu packages
Message-ID: <20210527160352.GB1916721@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-10-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210526002454.124728-10-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:24:32PM -0400, John Snow wrote:
> move python/qemu/*.py to python/qemu/[machine, qmp, utils]/*.py and
> update import directives across the tree.
>=20
> This is done to create a PEP420 namespace package, in which we may
> create subpackages. To do this, the namespace directory ("qemu") should
> not have any modules in it. Those files will go into new 'machine',
> 'qmp' and 'utils' subpackages instead.
>=20
> Implement machine/__init__.py making the top-level classes and functions
> from its various modules available directly inside the package. Change
> qmp.py to qmp/__init__.py similarly, such that all of the useful QMP
> library classes are available directly from "qemu.qmp" instead of
> "qemu.qmp.qmp".
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/{qemu =3D> }/.isort.cfg                |  0
>  python/qemu/__init__.py                     | 11 -------
>  python/qemu/{ =3D> machine}/.flake8           |  0
>  python/qemu/machine/__init__.py             | 33 +++++++++++++++++++++
>  python/qemu/{ =3D> machine}/console_socket.py |  0
>  python/qemu/{ =3D> machine}/machine.py        | 16 ++++++----
>  python/qemu/{ =3D> machine}/pylintrc          |  0
>  python/qemu/{ =3D> machine}/qtest.py          |  3 +-
>  python/qemu/{qmp.py =3D> qmp/__init__.py}     | 12 +++++++-
>  python/qemu/{utils.py =3D> utils/__init__.py} | 18 +++++++++--
>  python/qemu/{ =3D> utils}/accel.py            |  0
>  tests/acceptance/avocado_qemu/__init__.py   |  9 +++---
>  tests/acceptance/virtio-gpu.py              |  2 +-
>  tests/qemu-iotests/300                      |  4 +--
>  tests/qemu-iotests/iotests.py               |  2 +-
>  tests/vm/aarch64vm.py                       |  2 +-
>  tests/vm/basevm.py                          |  3 +-
>  17 files changed, 83 insertions(+), 32 deletions(-)
>  rename python/{qemu =3D> }/.isort.cfg (100%)
>  delete mode 100644 python/qemu/__init__.py
>  rename python/qemu/{ =3D> machine}/.flake8 (100%)
>  create mode 100644 python/qemu/machine/__init__.py
>  rename python/qemu/{ =3D> machine}/console_socket.py (100%)
>  rename python/qemu/{ =3D> machine}/machine.py (98%)
>  rename python/qemu/{ =3D> machine}/pylintrc (100%)
>  rename python/qemu/{ =3D> machine}/qtest.py (99%)
>  rename python/qemu/{qmp.py =3D> qmp/__init__.py} (96%)
>  rename python/qemu/{utils.py =3D> utils/__init__.py} (66%)
>  rename python/qemu/{ =3D> utils}/accel.py (100%)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCvwugACgkQZX6NM6Xy
CfM7LhAArIsJSx+Vz54RlvWACotD/2a4Jf+qjMfJPh9283LPGar3R3w8znGYT5n3
noPlli57XcFdRmR2u6ewOJqTFjyUVsohE0wQzDeGF3rpYiIZ29OOed7pfYbpJPra
acH67XPWWsW42yZMWPsCJSIE4gegSpBnIxmD5tdeLduR6vFhR26GFAUTflO71cmM
feqiKk5Hf47xG/RaKGdxyUvOzZVBNbeZPHv5xuTKik2JQaGAi+Yg3K4zQf35hAuW
4IoI4K6kSuwAAtnxJRZWYnPouqLL2qYy3cXjCPDp874S4itF3CYiOk3zNVfva/LU
Q4Fn+Dkw5TszAsK+tW26qmIQeOE59NAU2X3/NMgW3sGBQnSg8Gmu4ZaJm9Ab0vhz
aYUMdbxb4dvH1vRoZZtjAM65YMwmza5zNAhrMaoTZe8JVWj8dgMrL18kr/MP2E3u
SJ3gbf2iFcx/AaR6gb4JrjZ4lokk7OkAaM2wKLqQe6GHwAOfet/s/Y/FZzIYmXcv
WeZjEOAHCltc/uQ6cyurijA+UJMRw43ZE+uNw1uFsgK45I0641t7iqB4ntH0R01v
INEVuIsi1MJ8b3j7sykvruQ5YJ1dgTNDZYwmMYhu9q6F4SRh5jqyC0WY2v2dBRzt
4iq0WPdCdqMJVSA2Zf/paY4EL8gYgWUqPRdmAALgVGEfnnPR9zs=
=/3lH
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--


