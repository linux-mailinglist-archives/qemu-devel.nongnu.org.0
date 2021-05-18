Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8DD387B2E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:33:47 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0n5-0006I1-1p
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lj0kr-0004UF-50
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lj0kp-0003bw-65
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621348286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DN02eIMWCvw3ENwQ7C/v/uDok2IwVDthSn5rfjahUXA=;
 b=BiG4ZMCpJDqsIXnunvPe5BI99vpTy3gORmMgThkCRZnN7rlDfwMef0fpUUSzWdr1N7FwNu
 JM7GqbeYqeasGKBijoxJwtk5gJ2gjyqGh0KvOtg51fhXSX0k0nWy1hochnDt177yQ1qiT0
 vRvdpnqyYQW32VLUGcC2nqIjaYfs1Z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-1oQRtPVINCGaE2xYH3nyjw-1; Tue, 18 May 2021 10:31:22 -0400
X-MC-Unique: 1oQRtPVINCGaE2xYH3nyjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5263F1926DC3;
 Tue, 18 May 2021 14:31:21 +0000 (UTC)
Received: from localhost (ovpn-115-22.phx2.redhat.com [10.3.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F9455D9C0;
 Tue, 18 May 2021 14:31:11 +0000 (UTC)
Date: Tue, 18 May 2021 10:31:04 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 02/25] python: create qemu packages
Message-ID: <20210518143104.GF917386@amachine.somewhere>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:18PM -0400, John Snow wrote:
> move python/qemu/*.py to python/qemu/[machine, qmp]/*.py and update impor=
t
> directives across the tree.
>=20
> This is done to create a PEP420 namespace package, in which we may
> create subpackages. To do this, the namespace directory ("qemu") should
> not have any modules in it. Those files will go into new 'machine' and 'q=
mp'
> subpackages instead.
>=20
> Implement machine/__init__.py making the top-level classes and functions
> from its various modules available directly inside the package. Change
> qmp.py to qmp/__init__.py similarly, such that all of the useful QMP
> library classes are available directly from "qemu.qmp" instead of
> "qemu.qmp.qmp".
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
>=20
>=20
> ---
>=20
> Note for reviewers: in the next patch, I add a utils sub-package and
> move qemu/machine/accel.py to qemu/utils/accel.py. If we like it that
> way, we can squash it in here if we want, or just leave it as its own
> follow-up patch, I am just leaving it as something that will be easy to
> un-do or change for now.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/{qemu =3D> }/.isort.cfg                |  0
>  python/qemu/__init__.py                     | 11 ------
>  python/qemu/{ =3D> machine}/.flake8           |  0
>  python/qemu/machine/__init__.py             | 41 +++++++++++++++++++++
>  python/qemu/{ =3D> machine}/accel.py          |  0
>  python/qemu/{ =3D> machine}/console_socket.py |  0
>  python/qemu/{ =3D> machine}/machine.py        | 16 +++++---
>  python/qemu/{ =3D> machine}/pylintrc          |  0
>  python/qemu/{ =3D> machine}/qtest.py          |  3 +-
>  python/qemu/{qmp.py =3D> qmp/__init__.py}     | 12 +++++-
>  tests/acceptance/avocado_qemu/__init__.py   |  4 +-
>  tests/acceptance/virtio-gpu.py              |  2 +-
>  tests/qemu-iotests/300                      |  4 +-
>  tests/qemu-iotests/iotests.py               |  2 +-
>  tests/vm/aarch64vm.py                       |  2 +-
>  tests/vm/basevm.py                          |  3 +-
>  16 files changed, 73 insertions(+), 27 deletions(-)
>  rename python/{qemu =3D> }/.isort.cfg (100%)
>  delete mode 100644 python/qemu/__init__.py
>  rename python/qemu/{ =3D> machine}/.flake8 (100%)
>  create mode 100644 python/qemu/machine/__init__.py
>  rename python/qemu/{ =3D> machine}/accel.py (100%)
>  rename python/qemu/{ =3D> machine}/console_socket.py (100%)
>  rename python/qemu/{ =3D> machine}/machine.py (98%)
>  rename python/qemu/{ =3D> machine}/pylintrc (100%)
>  rename python/qemu/{ =3D> machine}/qtest.py (99%)
>  rename python/qemu/{qmp.py =3D> qmp/__init__.py} (96%)
>

Hi John,

Thanks for this!  I went through it and it LGTM.  I've tested it with
iotests, acceptance and with a vm-build-fedora.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCjz6IACgkQZX6NM6Xy
CfOmkBAAriTcWMovWuaUdmHddVh7+rCnNYWJZSKeGFQhQ2l40Yu1luwXHg+Nb8Fq
x9Qh1UWwdH2BkUXUFod0Mq04bWaED6WJbY3dYMCaUw7CINR3nRLezVaLujHr1OZq
nvHANHpiqso3GkMk41EOkBtsjKfk2sDxRXVd9IUUqJeaD7vuIJ9m031mQjNXnERC
R+QEhwWdAfcjL4Okoez+cTDaAhUgsA+xFudPddOpFnCy6c1+5mxn+9B4a60dCjoI
K2+jst6cFhpfPohjmE/9LiuaM1ttHs6KRkOW/Q8GHEa21MOb+C6RlLXdrJFtVUiG
5P5orj7mjN5B0QnSbnU2uFW3mc86JxUDxMHTdLKmAKEx4WVWERPEBszPDRlsiFQP
E+wYzCZqAmLCNrLZGty4Cu3vor8YZruIl0F1gWdfTg3rKKZbisDBk723A7AoWktG
W2z2DPzOFF76CfT+V9Q6Oz9F0vawXXlndwDKT11FZ4er8Oqm5fk4toguc6FWmsk+
zUyblFndxjGXD5BHu7d5mcG93IkQDLaThWtGlHTR8FmraiDHJ7X8OODxOdPe9s4g
voR9SRYxBIfb83H2mw1oeBxn8pGz1vb0nXZP0XqIYmYVqIfR0KWzTcO/sl5HQ/0j
uJIUH2bIfg+kTv+suU6LUtFHrv8FPZMSZMmHpzI1lc/yOol0Rbg=
=/iPY
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--


