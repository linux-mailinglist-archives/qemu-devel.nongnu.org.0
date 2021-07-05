Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C433BB689
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 07:02:05 +0200 (CEST)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Gk8-0002ZY-8y
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 01:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0Ger-0008Sv-Dx; Mon, 05 Jul 2021 00:56:37 -0400
Received: from ozlabs.org ([203.11.71.1]:32933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0Gep-0002FY-A7; Mon, 05 Jul 2021 00:56:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GJD1914N9z9sX1; Mon,  5 Jul 2021 14:56:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625460989;
 bh=17p7umslx7f6GDAJlE+eo13oSAhK230MPURndHmn+P0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VzTCBpSPq1hSJXVNb2+97v/fgFMVIsz348Qi9UME9Id/jDpaZqC/j8H1/CG3+db1f
 WklLe7c6ESiJDhfpRb6Ni57qrX8va39Y7IzyuAbf19UYVKJAoQIth86No1wXH/aoKo
 L2PV4axPbdRc1/seWrFgbamIjdj3a5hAKYn53Q/k=
Date: Mon, 5 Jul 2021 14:52:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 1/3] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
Message-ID: <YOKQBhdJcDMm2noC@yekko>
References: <20210621205907.244841-1-danielhb413@gmail.com>
 <20210621205907.244841-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/B9kilp6eRzRL1fV"
Content-Disposition: inline
In-Reply-To: <20210621205907.244841-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/B9kilp6eRzRL1fV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 05:59:05PM -0300, Daniel Henrique Barboza wrote:
> At this moment we only provide one event to report a hotunplug error,
> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
> machine is now able to report unplug errors for other device types, such
> 	as CPUs.

Something seems to have gone weirdly wrong with the formatting here.

> 	Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
> 	create a generic DEVICE_UNPLUG_ERROR event that can be used by all
> 	unplug errors in the future.
>=20
> 	With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecate=
d.
>=20
> 	Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Apart from that
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> 	---
> 	 docs/system/deprecated.rst | 10 ++++++++++
> 	 qapi/machine.json          |  6 +++++-
> 	 qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
> 	 3 files changed, 41 insertions(+), 2 deletions(-)
>=20
> 	diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> 	index e2e0090878..c8200d99d4 100644
> 	--- a/docs/system/deprecated.rst
> 	+++ b/docs/system/deprecated.rst
> 	@@ -192,6 +192,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA,=
 which is deprecated
> 	 (the ISA has never been upstreamed to a compiler toolchain). Therefore
> 	 this CPU is also deprecated.
> 	=20
> 	+
> 	+QEMU API (QAPI) events
> 	+----------------------
> 	+
> 	+``MEM_UNPLUG_ERROR`` (since 6.1)
> 	+''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> 	+
> 	+Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
> 	+
> 	+
> 	 System emulator machines
> 	 ------------------------
> 	=20
> 	diff --git a/qapi/machine.json b/qapi/machine.json
> 	index e4d0f9b24f..91dc520734 100644
> 	--- a/qapi/machine.json
> 	+++ b/qapi/machine.json
> 	@@ -1271,6 +1271,9 @@
> 	 #
> 	 # @msg: Informative message
> 	 #
> 	+# Features:
> 	+# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR inste=
ad.
> 	+#
> 	 # Since: 2.4
> 	 #
> 	 # Example:
> 	@@ -1283,4 +1286,5 @@
> 	 #
> 	 ##
> 	 { 'event': 'MEM_UNPLUG_ERROR',
> 	-  'data': { 'device': 'str', 'msg': 'str' } }
> 	+  'data': { 'device': 'str', 'msg': 'str' },
> 	+  'features': ['deprecated'] }
> 	diff --git a/qapi/qdev.json b/qapi/qdev.json
> 	index b83178220b..349d7439fa 100644
> 	--- a/qapi/qdev.json
> 	+++ b/qapi/qdev.json
> 	@@ -84,7 +84,9 @@
> 	 #        This command merely requests that the guest begin the hot remo=
val
> 	 #        process.  Completion of the device removal process is signaled=
 with a
> 	 #        DEVICE_DELETED event. Guest reset will automatically complete =
removal
> 	-#        for all devices.
> 	+#        for all devices. If an error in the hot removal process is det=
ected,
> 	+#        the device will not be removed and a DEVICE_UNPLUG_ERROR event=
 is
> 	+#        sent.
> 	 #
> 	 # Since: 0.14
> 	 #
> 	@@ -124,3 +126,26 @@
> 	 ##
> 	 { 'event': 'DEVICE_DELETED',
> 	   'data': { '*device': 'str', 'path': 'str' } }
> 	+
> 	+##
> 	+# @DEVICE_UNPLUG_ERROR:
> 	+#
> 	+# Emitted when a device hot unplug error occurs.
> 	+#
> 	+# @device: device name
> 	+#
> 	+# @msg: Informative message
> 	+#
> 	+# Since: 6.1
> 	+#
> 	+# Example:
> 	+#
> 	+# <- { "event": "DEVICE_UNPLUG_ERROR"
> 	+#      "data": { "device": "dimm1",
> 	+#                "msg": "Memory hotunplug rejected by the guest for dev=
ice dimm1"
> 	+#      },
> 	+#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
> 	+#
> 	+##
> 	+{ 'event': 'DEVICE_UNPLUG_ERROR',
> 	+  'data': { 'device': 'str', 'msg': 'str' } }
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/B9kilp6eRzRL1fV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDikAYACgkQbDjKyiDZ
s5JsvRAAm/EYhC5PI4I68eUD641s81l3VI7DGVf/i8/CA2cys6fNgNWGF7eCPTrb
v5o5Cf3XpPcLA/YfUL+PYr3dZi5GmjSPKLYwPk3q0Ia8+TWjyHsPa8oW5zJqCI0f
ROdROdD28ulPM0LvBRQ+aZgr2dMEDfvWn8pHl6OhWUp2IZTzTb1IWB4lotipGoNE
CYiOaKD24//x8GvPkc2knBd9Af49hUvFEA9IFE3wawwiYyvThnsZ+enl8cSZxhv8
rUHFFa4+SC1e9jh4tnrqUSp0+XAhLGupvfkV8eA2KqmgA+Um1OhcdvfGbSoQvyil
2tp75FhZldLh6DLGqZ94gZaHsxzc0QpU8VV0Fc9bfy5YpDT8x7T1BBHOZAa0HS26
zJRc16lQ/rUGIMbumiN3AYU+p8y+wwkOak0O02N4Ss6sPm7zCIyRfO9NJ6vHiYh9
HQfiNkLVX8E8ZObNepfU+QLXQ4kockHl9qN3jl7KqTcNuclpJ9LHH24PBvg1v4RD
JJ3rCt38eJY3ZDI/mx69Cv1VEAjeOWcq4u6wpntghnyueo7+tDVPiEumS58F6N8P
Gtra0KQmVs+Rbk3qIts+aPURej+uIBXzRRH50cvP5k5/HbrJG3ULZTorYZzf4sn4
eV7t71SwtrJ/tqQM+/XWg8LvspcckrhUwNGWDDyf7/Q07baRiJM=
=aq5p
-----END PGP SIGNATURE-----

--/B9kilp6eRzRL1fV--

