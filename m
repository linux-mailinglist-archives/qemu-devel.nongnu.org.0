Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424E35801F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:59:04 +0200 (CEST)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURRH-00066h-3w
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lURMw-0004zP-Jc; Thu, 08 Apr 2021 05:54:34 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:59153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lURMu-0005En-2V; Thu, 08 Apr 2021 05:54:34 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EF85B10AC;
 Thu,  8 Apr 2021 05:54:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 08 Apr 2021 05:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xTQvI/qo2+JODtMkQWtk3KCXMOa
 7Pqc7a/2u0XaXG6M=; b=BrZEDcQWcqPZZ/Ny7RI9UCSTAZaHpvnt9s/tDluTug8
 WeBU5rrGw9PevMB+VaITrJ2UopumqrE4UdwTBDDa+am/YXhXiogyaafV7GLAEYFY
 0FIt5Dv4TH2JuwU6Fg7jTVQDhTUmxWNxxKhGwxggCCFABcjqwMK0squXw8rqA8bm
 NLn1aLZmtO9SXK6GxhDfn0UskA5KsRYDuVG4j8gCS26xvRvKeuyCTp8J3VNot78S
 7pMQJTnb65jW3clouHRwTmDmAuXYaHLpcUD3ysuWrEdYX6l7TZirQ9v77StYwcY+
 1PfQP7XdOBl0RSVT5kiJTqjQxjv80rxf/mQEq+0h+fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xTQvI/
 qo2+JODtMkQWtk3KCXMOa7Pqc7a/2u0XaXG6M=; b=Ht17aZyIZVbvv3yt4KRprs
 NXbWI801ENbMmEGBFlv09MxbGbsn1SXDU50I21l5fCYY4Y1fvCBsBGoIVj5rw8Hs
 tnF4WHuWJinI/i0fY3DPXLPvJr/mNf4DfqAHU+xOh+BpbXQ8ysXNEQ3Lej6TmLGc
 dzRGtSvuWmiK/38rIrv3kKe9oULQG5siyQlsCZzAuJXcXuoRNO7+gCnKKTs+d/eH
 TU7KOx0N3/HNkcgYhZneYQ6VJsCvQUcbHrwxk95eg7i/3aEKur4sHhcdW1A4zU3l
 5dZ7URC2t/H6ft71OJEWd6g/6ZCApHnLc6xaqLrXiz2bmiDAsyU1XW+7ckpaEj7g
 ==
X-ME-Sender: <xms:1dJuYDEp6HtEwOsOXz_p1D_fBkN-Cp88xcCyaEthLoWJDaZ9Zp8PVA>
 <xme:1dJuYAWs_RU2I3WbQXAHTxoCRP1IK5ivtbBnFJKfL0_LGocH535TYwbpk66MHzMGM
 bFe_cJ-9BYlImnNSus>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehveetffetieegudejgeeggfevleelveduvddvvdeftdevuedtudduuddutdek
 heenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgpdhinhhfrhgruggvrggurd
 horhhgnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1dJuYFIUiydfba3GN0fEH62-hu-12-EYVySHguW9hKcklBwAzZHGlg>
 <xmx:1dJuYBG_9OaYPeeB8IYQ618kX61ft2bFkounoEzZ8A8KTxQj6pQtSQ>
 <xmx:1dJuYJVkzlcAGgPmQOXdMTDHBIzJ4OY28BCxArok4HlarSi-o_cJ_A>
 <xmx:1dJuYMSIzgDnUSsR7N5YMs3EMBDAffw1zlIar62GqG36p8Gs1op38Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D21D24005B;
 Thu,  8 Apr 2021 05:54:27 -0400 (EDT)
Date: Thu, 8 Apr 2021 11:54:25 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] docs: add nvme emulation documentation
Message-ID: <YG7S0bU7x0EFGEeE@apples.localdomain>
References: <20210408095028.382751-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TQFE3ai86h5kZute"
Content-Disposition: inline
In-Reply-To: <20210408095028.382751-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TQFE3ai86h5kZute
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Are documentation updates acceptable for -rc3?

On Apr  8 11:50, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Remove the docs/specs/nvme.txt and replace it with proper documentation
>in docs/system/nvme.rst.
>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> docs/specs/nvme.txt   |  23 -----
> docs/system/index.rst |   1 +
> docs/system/nvme.rst  | 212 ++++++++++++++++++++++++++++++++++++++++++
> MAINTAINERS           |   2 +-
> 4 files changed, 214 insertions(+), 24 deletions(-)
> delete mode 100644 docs/specs/nvme.txt
> create mode 100644 docs/system/nvme.rst
>
>diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
>deleted file mode 100644
>index 56d393884e7a..000000000000
>--- a/docs/specs/nvme.txt
>+++ /dev/null
>@@ -1,23 +0,0 @@
>-NVM Express Controller
>-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-
>-The nvme device (-device nvme) emulates an NVM Express Controller.
>-
>-
>-Reference Specifications
>-------------------------
>-
>-The device currently implements most mandatory features of NVMe v1.3d, see
>-
>-  https://nvmexpress.org/resources/specifications/
>-
>-for the specification.
>-
>-
>-Known issues
>-------------
>-
>-* The accounting numbers in the SMART/Health are reset across power cycles
>-
>-* Interrupt Coalescing is not supported and is disabled by default in vol=
ation
>-  of the specification.
>diff --git a/docs/system/index.rst b/docs/system/index.rst
>index 02d07071810f..b05af716a973 100644
>--- a/docs/system/index.rst
>+++ b/docs/system/index.rst
>@@ -23,6 +23,7 @@ Contents:
>    net
>    virtio-net-failover
>    usb
>+   nvme
>    ivshmem
>    linuxboot
>    generic-loader
>diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>new file mode 100644
>index 000000000000..ab760d9888f9
>--- /dev/null
>+++ b/docs/system/nvme.rst
>@@ -0,0 +1,212 @@
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+NVMe Emulation
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+
>+QEMU provides NVMe emulation through the ``nvme``, ``nvme-ns`` and
>+``nvme-subsys`` devices.
>+
>+See the following sections for specific information on
>+
>+  * `Adding NVMe Devices`_, `additional namespaces`_ and `NVM subsystems`=
_.
>+  * Configuration of `Optional Features`_ such as `Controller Memory Buff=
er`_,
>+    `Simple Copy`_, `Zoned Namespaces`_, `metadata`_ and `End-to-End Data
>+    Protection`_,
>+
>+Adding NVMe Devices
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+
>+Controller Emulation
>+--------------------
>+
>+The QEMU emulated NVMe controller implements version 1.4 of the NVM Expre=
ss
>+specification. All mandatory features are implement with a couple of exce=
ptions
>+and limitations:
>+
>+  * Accounting numbers in the SMART/Health log page are reset when the de=
vice
>+    is power cycled.
>+  * Interrupt Coalescing is not supported and is disabled by default.
>+
>+The simplest way to attach an NVMe controller on the QEMU PCI bus is to a=
dd the
>+following parameters:
>+
>+.. code-block:: console
>+
>+    -drive file=3Dnvm.img,if=3Dnone,id=3Dnvm
>+    -device nvme,serial=3Ddeadbeef,drive=3Dnvm
>+
>+There are a number of optional general parameters for the ``nvme`` device=
=2E Some
>+are mentioned here, but see ``-device nvme,help`` to list all possible
>+parameters.
>+
>+``max_ioqpairs=3DUINT32`` (default: ``64``)
>+  Set the maximum number of allowed I/O queue pairs. This replaces the
>+  deprecated ``num_queues`` parameter.
>+
>+``msix_qsize=3DUINT16`` (default: ``65``)
>+  The number of MSI-X vectors that the device should support.
>+
>+``mdts=3DUINT8`` (default: ``7``)
>+  Set the Maximum Data Transfer Size of the device.
>+
>+``use-intel-id`` (default: ``off``)
>+  Since QEMU 5.2, the device uses a QEMU allocated "Red Hat" PCI Device a=
nd
>+  Vendor ID. Set this to ``on`` to revert to the unallocated Intel ID
>+  previously used.
>+
>+Additional Namespaces
>+---------------------
>+
>+In the simplest possible invocation sketched above, the device only suppo=
rt a
>+single namespace with the namespace identifier ``1``. To support multiple
>+namespaces and additional features, the ``nvme-ns`` device must be used.
>+
>+.. code-block:: console
>+
>+   -device nvme,id=3Dnvme-ctrl-0,serial=3Ddeadbeef
>+   -drive file=3Dnvm-1.img,if=3Dnone,id=3Dnvm-1
>+   -device nvme-ns,drive=3Dnvm-1
>+   -drive file=3Dnvm-2.img,if=3Dnone,id=3Dnvm-2
>+   -device nvme-ns,drive=3Dnvm-2
>+
>+The namespaces defined by the ``nvme-ns`` device will attach to the most
>+recently defined ``nvme-bus`` that is created by the ``nvme`` device. Nam=
espace
>+identifers are allocated automatically, starting from ``1``.
>+
>+There are a number of parameters available:
>+
>+``nsid`` (default: ``0``)
>+  Explicitly set the namespace identifier.
>+
>+``uuid`` (default: *autogenerated*)
>+  Set the UUID of the namespace. This will be reported as a "Namespace UU=
ID"
>+  descriptor in the Namespace Identification Descriptor List.
>+
>+``bus``
>+  If there are more ``nvme`` devices defined, this parameter may be used =
to
>+  attach the namespace to a specific ``nvme`` device (identified by an ``=
id``
>+  parameter on the controller device).
>+
>+NVM Subsystems
>+--------------
>+
>+Additional features becomes available if the controller device (``nvme``)=
 is
>+linked to an NVM Subsystem device (``nvme-subsys``).
>+
>+The NVM Subsystem emulation allows features such as shared namespaces and
>+multipath I/O.
>+
>+.. code-block:: console
>+
>+   -device nvme-subsys,id=3Dnvme-subsys-0,nqn=3Dsubsys0
>+   -device nvme,serial=3Da,subsys=3Dnvme-subsys-0
>+   -device nvme,serial=3Db,subsys=3Dnvme-subsys-0
>+
>+This will create an NVM subsystem with two controllers. Having controllers
>+linked to an ``nvme-subsys`` device allows additional ``nvme-ns`` paramet=
ers:
>+
>+``shared`` (default: ``off``)
>+  Specifies that the namespace will be attached to all controllers in the
>+  subsystem. If set to ``off`` (the default), the namespace will remain a
>+  private namespace and may only be attached to a single controller at a =
time.
>+
>+``detached`` (default: ``off``)
>+  If set to ``on``, the namespace will be be available in the subsystem, =
but
>+  not attached to any controllers initially.
>+
>+Thus, adding
>+
>+.. code-block:: console
>+
>+   -drive file=3Dnvm-1.img,if=3Dnone,id=3Dnvm-1
>+   -device nvme-ns,drive=3Dnvm-1,nsid=3D1,shared=3Don
>+   -drive file=3Dnvm-2.img,if=3Dnone,id=3Dnvm-2
>+   -device nvme-ns,drive=3Dnvm-2,nsid=3D3,detached=3Don
>+
>+will cause NSID 1 will be a shared namespace (due to ``shared=3Don``) tha=
t is
>+initially attached to both controllers. NSID 3 will be a private namespace
>+(i.e. only attachable to a single controller at a time) and will not be
>+attached to any controller initially (due to ``detached=3Don``).
>+
>+Optional Features
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+
>+Controller Memory Buffer
>+------------------------
>+
>+``nvme`` device parameters related to the Controller Memory Buffer suppor=
t:
>+
>+``cmb_size_mb=3DUINT32`` (default: ``0``)
>+  This adds a Controller Memory Buffer of the given size at offset zero i=
n BAR
>+  2.
>+
>+``legacy-cmb`` (default: ``off``)
>+  By default, the device uses the "v1.4 scheme" for the Controller Memory
>+  Buffer support (i.e, the CMB is initially disabled and must be explicit=
ly
>+  enabled by the host). Set this to ``on`` to behave as a v1.3 device wrt=
=2E the
>+  CMB.
>+
>+Simple Copy
>+-----------
>+
>+The device includes support for TP 4065 ("Simple Copy Command"). Copy com=
mand
>+limits may be set with the ``mssrl``, ``mcl`` and ``msrc=3DUINT8`` ``nvme=
-ns``
>+device parameters.
>+
>+Zoned Namespaces
>+----------------
>+
>+A namespaces may be "Zoned" as defined by TP 4053 ("Zoned Namespaces"). S=
et
>+``zoned=3Don`` on an ``nvme-ns`` device to configure it as a zoned namesp=
ace.
>+
>+The namespace may be configured with additional parameters
>+
>+``zoned.zone_size=3DSIZE`` (default: ``128MiB``)
>+  Define the zone size (``ZSZE``).
>+
>+``zoned.zone_capacity=3DSIZE`` (default: ``0``)
>+  Define the zone capacity (``ZCAP``). If left at the default (``0``), th=
e zone
>+  capacity will equal the zone size.
>+
>+``zoned.descr_ext_size=3DUINT32`` (default: ``0``)
>+  Set the Zone Descriptor Extension Size (``ZDES``). Must be a multiple o=
f 64
>+  bytes.
>+
>+``zoned.cross_read=3DBOOL`` (default: ``off``)
>+  Set to ``on`` to allow reads to cross zone boundaries.
>+
>+``zoned.max_active=3DUINT32`` (default: ``0``)
>+  Set the maximum number of active resources (``MAR``). The default (``0`=
`)
>+  allows all zones to be active.
>+
>+``zoned.max_open=3DUINT32`` (default: ``0``)
>+  Set the maximum number of open resources (``MOR``). The default (``0``)
>+  allows all zones to be open. If ``zoned.max_active`` is specified, this=
 value
>+  must be less than or equal to that.
>+
>+Metadata
>+--------
>+
>+The virtual namespace device supports LBA metadata in the form separate
>+metadata (``MPTR``-based) and extended LBAs.
>+
>+``ms=3DUINT16`` (default: ``0``)
>+  Defines the number of metadata bytes per LBA.
>+
>+``mset=3DUINT8`` (default: ``0``)
>+  Set to ``1`` to enable extended LBAs.
>+
>+End-to-End Data Protection
>+--------------------------
>+
>+The virtual namespace device supports DIF- and DIX-based protection infor=
mation
>+(depending on ``mset``).
>+
>+``pi=3DUINT8`` (default: ``0``)
>+  Enable protection information of the specified type (type ``1``, ``2`` =
or
>+  ``3``).
>+
>+``pil=3DUINT8`` (default: ``0``)
>+  Controls the location of the protection information within the metadata=
=2E Set
>+  to ``1`` to transfer protection information as the first eight bytes of
>+  metadata. Otherwise, the protection information is transferred as the l=
ast
>+  eight bytes.
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 58f342108e9e..04beb34e7ec4 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -1974,7 +1974,7 @@ S: Supported
> F: hw/block/nvme*
> F: include/block/nvme.h
> F: tests/qtest/nvme-test.c
>-F: docs/specs/nvme.txt
>+F: docs/system/nvme.rst
> T: git git://git.infradead.org/qemu-nvme.git nvme-next
>
> megasas
>--=20
>2.31.1
>

--TQFE3ai86h5kZute
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBu0tAACgkQTeGvMW1P
DelC6AgAonVyvRycbo1aW/SwVABGyrxrUuU28BkippGpKCscnpr9WCII4Sf/5bRE
JGESoWW4FfMfa/GkWW1or++plEdEcdbc1DlhZedoh4s7wiZ+CG72LKMYDhlEaOuc
FVRI4frO9oS0cTNQFLmZ9bXpCk1v8KOSvlu/XcHL8/q1X2G+r/zKPWgSokFHYfnq
12+jH+6URWl2keJ5iZhmI33LDQj4pDkb0RLz1M+NaxFzvmwISg+/gL9uO9xf9Nkk
CuefMAlDMMlRlGassPmGtlrfw1rp798DpOBy+0iKhk0KPFBO2c+fKvzENQ6smvbA
m2244pwe3capLMD8Ne8k+Y/c9+v5Og==
=tMw5
-----END PGP SIGNATURE-----

--TQFE3ai86h5kZute--

