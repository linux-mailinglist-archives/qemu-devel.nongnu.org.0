Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305AB342D3F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 15:21:11 +0100 (CET)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNcTV-000293-Ku
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 10:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@13thmonkey.org>)
 id 1lNcOB-0001NY-9I
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 10:15:43 -0400
Received: from [2001:985:56db:1:7862:6dc3:593f:2f31] (port=65016
 helo=dropje.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@13thmonkey.org>) id 1lNcO7-0008Ok-2M
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 10:15:36 -0400
Received: by dropje.13thmonkey.org (Postfix, from userid 103)
 id A3D97C1EE9A; Sat, 20 Mar 2021 15:15:18 +0100 (CET)
Date: Sat, 20 Mar 2021 15:15:18 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: Is accel/stubs/ still needed? (resent)
Message-ID: <YFYDdlMsVQ75UFHj@dropje.13thmonkey.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qKDzBz4ANoY4I6AU"
Content-Disposition: inline
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2001:985:56db:1:7862:6dc3:593f:2f31 (failed)
Received-SPF: pass client-ip=2001:985:56db:1:7862:6dc3:593f:2f31;
 envelope-from=reinoud@13thmonkey.org; helo=dropje.13thmonkey.org
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qKDzBz4ANoY4I6AU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
 
a quick question. I forgot to add my accel/stubs/nvmm-stub.h to
accel/stubs/meson.build but even when I disable NVMM explicitly or build it on
a NetBSD platform that does not support NVMM, it just compiled. So, is it
actually still used?

With regards,
Reinoud


--qKDzBz4ANoY4I6AU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELRHWktq6GkG74/X0gpw3AEPIqmgFAmBWA3QACgkQgpw3AEPI
qmiGmggAlYvg84MEb+bNsr16IMF90IS7pQuPyIkqtTONGFI7a2YtY4qzlzhYD5bm
NnGLHEPQfQj2DmofiTz/9H+7DJbslzHRK3ngzHPOjjtJeTts93gCTZYPM/EG4ZeW
+2JznR4RfXa/lKD9g7wQ5aFTkJQvCAN6sII/77/yhY41SD3vSzko1y/dKkDCVS2e
asOM6j9EqP9Cvi3VSCfPBYRQSAbSh7O83DxLoRdw/OdhxyrxmhxibuThcR8XPVoU
v2GZJ4Q67KKG3BUqHA/9H7bqzqD0R0utrbqTn0c1raRxYcd90eZkLkxSVbCbRGW1
YXZ0Q6Y3ILDEJH5JeJ0/tBJ2KqSwXA==
=+EWQ
-----END PGP SIGNATURE-----

--qKDzBz4ANoY4I6AU--

