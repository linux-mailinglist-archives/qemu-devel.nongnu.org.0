Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5431997E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 06:19:10 +0100 (CET)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAQrE-0006gG-SC
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 00:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAQpq-000676-Kc
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 00:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAQpf-0004HZ-PH
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 00:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613107050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=12NdF1zJrWZ4ZB7kkRLLxEBgh98uIKenpBvMWPE50qI=;
 b=W9xMQziVzTetCAhTjNkGL6hJlPziIgFUW088FrmDazzyrs6kqM5i9M3N4xkLpLCm4aFsr/
 uR7c/jSPEOx4HcPXx0yD+VbV1Pz3Av6GnGQ2uT6/8rvtnCJrtfyJe89u5+RdeJtlobc5kR
 zqKl7S2usKpjZpDRpivkV2Qq3OMDNbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-YivRDAXSPlWjgwCrFtL9ZQ-1; Fri, 12 Feb 2021 00:17:27 -0500
X-MC-Unique: YivRDAXSPlWjgwCrFtL9ZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C5FC364D9;
 Fri, 12 Feb 2021 05:17:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-146.rdu2.redhat.com
 [10.10.112.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2945810013D7;
 Fri, 12 Feb 2021 05:17:21 +0000 (UTC)
Date: Fri, 12 Feb 2021 00:17:19 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 03/24] python: create qemu packages
Message-ID: <YCYPX4vDrlidCFxc@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-4-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G5XVj4Co2TYokBi6"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

--G5XVj4Co2TYokBi6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:35PM -0500, John Snow wrote:
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

IMO this is fine as it is.

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
>  tests/acceptance/boot_linux.py              |  3 +-
>  tests/qemu-iotests/300                      |  4 +-
>  tests/qemu-iotests/iotests.py               |  2 +-
>  tests/vm/basevm.py                          |  3 +-
>  14 files changed, 70 insertions(+), 25 deletions(-)
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
>=20
> diff --git a/python/qemu/.isort.cfg b/python/.isort.cfg
> similarity index 100%
> rename from python/qemu/.isort.cfg
> rename to python/.isort.cfg
> diff --git a/python/qemu/__init__.py b/python/qemu/__init__.py
> deleted file mode 100644
> index 4ca06c34a41..00000000000
> --- a/python/qemu/__init__.py
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# QEMU library
> -#
> -# Copyright (C) 2015-2016 Red Hat Inc.
> -# Copyright (C) 2012 IBM Corp.
> -#
> -# Authors:
> -#  Fam Zheng <famz@redhat.com>
> -#
> -# This work is licensed under the terms of the GNU GPL, version 2.  See
> -# the COPYING file in the top-level directory.
> -#
> diff --git a/python/qemu/.flake8 b/python/qemu/machine/.flake8
> similarity index 100%
> rename from python/qemu/.flake8
> rename to python/qemu/machine/.flake8
> diff --git a/python/qemu/machine/__init__.py b/python/qemu/machine/__init=
__.py
> new file mode 100644
> index 00000000000..27b0b19abd3
> --- /dev/null
> +++ b/python/qemu/machine/__init__.py
> @@ -0,0 +1,41 @@
> +"""
> +QEMU development and testing library.
> +
> +This library provides a few high-level classes for driving QEMU from a
> +test suite, not intended for production use.
> +
> +- QEMUMachine: Configure and Boot a QEMU VM
> + - QEMUQtestMachine: VM class, with a qtest socket.
> +
> +- QEMUQtestProtocol: Connect to, send/receive qtest messages.
> +
> +- list_accel: List available accelerators
> +- kvm_available: Probe for KVM support
> +- tcg_available: Probe for TCG support
> +"""
> +
> +# Copyright (C) 2020 John Snow for Red Hat Inc.
> +# Copyright (C) 2015-2016 Red Hat Inc.
> +# Copyright (C) 2012 IBM Corp.
> +#
> +# Authors:
> +#  John Snow <jsnow@redhat.com>
> +#  Fam Zheng <fam@euphon.net>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +
> +from .accel import kvm_available, list_accel, tcg_available
> +from .machine import QEMUMachine
> +from .qtest import QEMUQtestMachine, QEMUQtestProtocol
> +
> +
> +__all__ =3D (
> +    'list_accel',
> +    'kvm_available',
> +    'tcg_available',
> +    'QEMUMachine',
> +    'QEMUQtestProtocol',
> +    'QEMUQtestMachine',
> +)
> diff --git a/python/qemu/accel.py b/python/qemu/machine/accel.py
> similarity index 100%
> rename from python/qemu/accel.py
> rename to python/qemu/machine/accel.py
> diff --git a/python/qemu/console_socket.py b/python/qemu/machine/console_=
socket.py
> similarity index 100%
> rename from python/qemu/console_socket.py
> rename to python/qemu/machine/console_socket.py
> diff --git a/python/qemu/machine.py b/python/qemu/machine/machine.py
> similarity index 98%
> rename from python/qemu/machine.py
> rename to python/qemu/machine/machine.py
> index 7a40f4604be..dd6ce289350 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -38,8 +38,14 @@
>      Type,
>  )
> =20
> -from . import console_socket, qmp
> -from .qmp import QMPMessage, QMPReturnValue, SocketAddrT
> +from qemu.qmp import (
> +    QEMUMonitorProtocol,
> +    QMPMessage,
> +    QMPReturnValue,
> +    SocketAddrT,
> +)
> +
> +from . import console_socket
> =20
>

You're moving the files and "isorting" those imports.  Intentional?
IMO a clear isort followed by a move is preferred.

>  LOG =3D logging.getLogger(__name__)
> @@ -139,7 +145,7 @@ def __init__(self,
>          self._events: List[QMPMessage] =3D []
>          self._iolog: Optional[str] =3D None
>          self._qmp_set =3D True   # Enable QMP monitor by default.
> -        self._qmp_connection: Optional[qmp.QEMUMonitorProtocol] =3D None
> +        self._qmp_connection: Optional[QEMUMonitorProtocol] =3D None
>          self._qemu_full_args: Tuple[str, ...] =3D ()
>          self._temp_dir: Optional[str] =3D None
>          self._launched =3D False
> @@ -315,7 +321,7 @@ def _pre_launch(self) -> None:
>              if self._remove_monitor_sockfile:
>                  assert isinstance(self._monitor_address, str)
>                  self._remove_files.append(self._monitor_address)
> -            self._qmp_connection =3D qmp.QEMUMonitorProtocol(
> +            self._qmp_connection =3D QEMUMonitorProtocol(
>                  self._monitor_address,
>                  server=3DTrue,
>                  nickname=3Dself._name
> @@ -535,7 +541,7 @@ def set_qmp_monitor(self, enabled: bool =3D True) -> =
None:
>          self._qmp_set =3D enabled
> =20
>      @property
> -    def _qmp(self) -> qmp.QEMUMonitorProtocol:
> +    def _qmp(self) -> QEMUMonitorProtocol:
>          if self._qmp_connection is None:
>              raise QEMUMachineError("Attempt to access QMP with no connec=
tion")
>          return self._qmp_connection
> diff --git a/python/qemu/pylintrc b/python/qemu/machine/pylintrc
> similarity index 100%
> rename from python/qemu/pylintrc
> rename to python/qemu/machine/pylintrc
> diff --git a/python/qemu/qtest.py b/python/qemu/machine/qtest.py
> similarity index 99%
> rename from python/qemu/qtest.py
> rename to python/qemu/machine/qtest.py
> index 39a0cf62fe9..53926e434a7 100644
> --- a/python/qemu/qtest.py
> +++ b/python/qemu/machine/qtest.py
> @@ -26,8 +26,9 @@
>      TextIO,
>  )
> =20
> +from qemu.qmp import SocketAddrT
> +
>  from .machine import QEMUMachine
> -from .qmp import SocketAddrT
> =20
> =20
>  class QEMUQtestProtocol:
> diff --git a/python/qemu/qmp.py b/python/qemu/qmp/__init__.py
> similarity index 96%
> rename from python/qemu/qmp.py
> rename to python/qemu/qmp/__init__.py
> index 2cd4d43036c..9606248a3d2 100644
> --- a/python/qemu/qmp.py
> +++ b/python/qemu/qmp/__init__.py
> @@ -1,4 +1,14 @@
> -""" QEMU Monitor Protocol Python class """
> +"""
> +QEMU Monitor Protocol (QMP) development library & tooling.
> +
> +This package provides a fairly low-level class for communicating to QMP
> +protocol servers, as implemented by QEMU, the QEMU Guest Agent, and the
> +QEMU Storage Daemon. This library is not intended for production use.
> +
> +`QEMUMonitorProtocol` is the primary class of interest, and all errors
> +raised derive from `QMPError`.
> +"""
> +
>  # Copyright (C) 2009, 2010 Red Hat Inc.
>  #
>  # Authors:
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux=
.py
> index bcd923bb4a0..212365fd185 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -12,8 +12,7 @@
> =20
>  from avocado_qemu import Test, BUILD_DIR
> =20
> -from qemu.accel import kvm_available
> -from qemu.accel import tcg_available
> +from qemu.machine import kvm_available, tcg_available
>

There are a few extra files where a similar change is needed:

  $ git grep -E '(kvm|tcg)_available'
  tests/acceptance/virtio-gpu.py:from qemu.accel import kvm_available
  tests/acceptance/virtiofs_submounts.py:from qemu.accel import kvm_availab=
le
  tests/vm/aarch64vm.py:from qemu.accel import kvm_available

- Cleber.

--G5XVj4Co2TYokBi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAmD1wACgkQZX6NM6Xy
CfOWYA//WZzNes3UGwcc0B8/HGuIKgxR5hJIIavk7A/1MSdjCjCFsuJgbcVDhLn+
y3q4Y4NDJtLP/C7RuIEidT2Rv9X9vBFblM+d9pfykI//cOUtw2lDsVBLEO37DQDQ
LaDklCskmLBrN4yOEzWF5MzJT0kpqsxigvIO8QlaZJGuN6CsN980e8I0cFFOql3u
+cAdhbEAiStSpS5VzYoJVzhAn5BF8A5O000mY78KwReqL8MhCeAIrhD23s6XAWmY
xpoFDdSTiNYhjPu810RRL/d5CmLNM8/ri5dDHtWXAR+BE3QRCreGkXZyE7BLdS5z
2yVAr4JfCH4ScVJcXjcVoerZQg2vLphE345kKjTM6+abhpOejzvafPxjkUrGHKrA
RAmukMvBxN7nWnRERNj5lIjG+8zf7UkAZ1h5Csh5bY7K2KKwHBM0Gzl2KrbOuea9
lWujpNvDEDJVPbV+kezBA7kZBrDA14rpvdLT94j3rEGO7cV0dmOW8+kE9wAlA+Q2
6htScyNdUWceP/B7m1I4qyKHLl6ICpD6oSLafaK2Rsogr968NXt7V5xEFL1gP/My
Gaq1orTTww870NtvVxsFpiSZAuRUObFSrV5oWLpkHf79b/RlFeujK5mBRbgUQC4Q
UC8KQTn+tyH2v58Nk8f8hKXOLARaFgRruiP7P2Y1G4dv0d9EqVk=
=6cc0
-----END PGP SIGNATURE-----

--G5XVj4Co2TYokBi6--


