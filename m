Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE2331D3BD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 02:22:33 +0100 (CET)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCBY0-0003Cr-DI
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 20:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCBWm-0002gb-Mi
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 20:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCBWj-0005pr-MT
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 20:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613524871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K0vANPDDWd4WoHw8a4u1q0xzcFZUfC6L+RMY7qr2bAk=;
 b=Z9WDk0ZY4VUSMcpRQz5XigifEeiF9JlxkvBTRHcVFlb360bzt19VoQgXlXEYckSFlCzPJY
 cMlTAwWH/Yae8O0itVtJeYy2lSkCVQM81oOPorsujnIHk9YEEEGyln59js2ENPPAWt+ZEH
 j4D7uNPqn0b+qD/wDNQRr+y/ORQbwAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-wrqBHb-VNfKujoaFKhqcLw-1; Tue, 16 Feb 2021 20:21:09 -0500
X-MC-Unique: wrqBHb-VNfKujoaFKhqcLw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45D031E564;
 Wed, 17 Feb 2021 01:21:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22EF260C15;
 Wed, 17 Feb 2021 01:21:01 +0000 (UTC)
Date: Tue, 16 Feb 2021 20:20:59 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 04/24] python: create utils sub-package
Message-ID: <YCxve8e5KpN0mOfv@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-5-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/dPj2vVLyn8QAEPo"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

--/dPj2vVLyn8QAEPo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:36PM -0500, John Snow wrote:
> Create a space for miscellaneous things that don't belong strictly in
> "qemu.machine" nor "qemu.qmp" packages.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/__init__.py         |  8 --------
>  python/qemu/utils/__init__.py           | 23 +++++++++++++++++++++++
>  python/qemu/{machine =3D> utils}/accel.py |  0
>  tests/acceptance/boot_linux.py          |  2 +-
>  tests/acceptance/virtio-gpu.py          |  2 +-
>  tests/acceptance/virtiofs_submounts.py  |  2 +-
>  tests/vm/aarch64vm.py                   |  2 +-
>  tests/vm/basevm.py                      |  3 ++-
>  8 files changed, 29 insertions(+), 13 deletions(-)
>  create mode 100644 python/qemu/utils/__init__.py
>  rename python/qemu/{machine =3D> utils}/accel.py (100%)
>=20
> diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init=
__.py
> index 27b0b19abd3..891a8f784b5 100644
> --- a/python/qemu/machine/__init__.py
> +++ b/python/qemu/machine/__init__.py
> @@ -8,10 +8,6 @@
>   - QEMUQtestMachine: VM class, with a qtest socket.
> =20
>  - QEMUQtestProtocol: Connect to, send/receive qtest messages.
> -
> -- list_accel: List available accelerators
> -- kvm_available: Probe for KVM support
> -- tcg_available: Probe for TCG support
>  """
> =20
>  # Copyright (C) 2020 John Snow for Red Hat Inc.
> @@ -26,15 +22,11 @@
>  # the COPYING file in the top-level directory.
>  #
> =20
> -from .accel import kvm_available, list_accel, tcg_available
>  from .machine import QEMUMachine
>  from .qtest import QEMUQtestMachine, QEMUQtestProtocol
> =20
> =20
>  __all__ =3D (
> -    'list_accel',
> -    'kvm_available',
> -    'tcg_available',
>      'QEMUMachine',
>      'QEMUQtestProtocol',
>      'QEMUQtestMachine',
> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.p=
y
> new file mode 100644
> index 00000000000..edf807a93e5
> --- /dev/null
> +++ b/python/qemu/utils/__init__.py
> @@ -0,0 +1,23 @@
> +"""
> +QEMU development and testing utilities
> +
> +This library provides a small handful of utilities for performing variou=
s tasks
> +not directly related to the launching of a VM.
> +
> +The only module included at present is accel; its public functions are
> +repeated here for your convenience:
> +
> +- list_accel: List available accelerators
> +- kvm_available: Probe for KVM support
> +- tcg_available: Prove for TCG support
> +"""
> +
> +# pylint: disable=3Dimport-error
> +from .accel import kvm_available, list_accel, tcg_available
> +
> +
> +__all__ =3D (
> +    'list_accel',
> +    'kvm_available',
> +    'tcg_available',
> +)
> diff --git a/python/qemu/machine/accel.py b/python/qemu/utils/accel.py
> similarity index 100%
> rename from python/qemu/machine/accel.py
> rename to python/qemu/utils/accel.py
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux=
.py
> index 212365fd185..824cf03d5f4 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -12,7 +12,7 @@
> =20
>  from avocado_qemu import Test, BUILD_DIR
> =20
> -from qemu.machine import kvm_available, tcg_available
> +from qemu.utils import kvm_available, tcg_available
> =20

With the latest changes merged earlier Today, this won't be necessary
anymore on boot_linux.py, but the equivalent change will be necessary
on tests/acceptance/avocado_qemu/__init__.py.

With the change mentioned above (which you would catch on a rebase):

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--/dPj2vVLyn8QAEPo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsb3gACgkQZX6NM6Xy
CfN03w/7BQn+KPvZ5QKB/JvJfX8DOHwFa1rA90yA5ha2KfKlkWltOcGznSRs96aX
OXwptuh7XvwCQQRCYTPT/c2C0apCabFXscReqC8CtYtmYHZ9oe2Kes8EPTY3QvLE
2D619TyNwx16sJLitdg8gt3GAimiQ6DQiw0aycBU8BBby91JVS/8XJ43gYqOS5Rj
0pau0fYkIhOETrxck/aeMrqzU120XfXjQcwV9OHLlhYC/vdKJm4ji+MS/DTQPPSO
i3LSq3/Ofu4H+8vTJAL6deXGWmIMW+U6PfH3zjcy655EqPZY6DDapP0DEuMVKbF5
zoOt8vauPJUrGrXzlY9QAsdR4WwuImOgtScyGQ9eRJaQJByJIiJUH4vs4Rvkib6B
mN1TuN2t7pHBUG/NiFrVt8aYG50+lBrNGovrheHxFH++4atr6QQBGxrLmk8RVYDh
OV6mtj+OoT3aI4Cytbp8Jsn6CmJvR0QDsPOWGuMILIeMqUK4WFjyR4NThxNYc4k7
YmxBmLpTh3fHV1e/yJWgnK09N+1thDQ0gFTfnI7OJj+kJwRvndY47Wl6zkRIniwB
suDjy8sbRcnktEr3TT7hZiDFsaHzDKe8zaF/pLLsMG1xeeDIlOwFzvzwZ70W2AN1
38Z5RjE4hvk7V5Qj9r2zYJeZq3xjFFpoCCwtGFso5ueDZH7eMmw=
=rkF3
-----END PGP SIGNATURE-----

--/dPj2vVLyn8QAEPo--


