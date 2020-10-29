Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B4929F6E4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 22:31:20 +0100 (CET)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYFVt-0001cu-Jo
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 17:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1kYFTV-0000wH-NF
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 17:28:49 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:13068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1kYFTT-0002Am-Ks
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 17:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604006922;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=yzOJi92QyuKrPSSP9wPN56EsM3FskH9G3K29Kk19fHo=;
 b=icA3rPjKvwrsbKPVNCtI1yUN+iQFTcNyRgkcycru1vzLkVnIkrypbTbGnW1FUxL11P
 T/lAiHbn5+soYm6sTLWbllrBjM886lLoqJZsdi5wGgrKR1JKOdGcwgKVfMQSyg+gGxZD
 psO6NvooxoMTJ67DnTZP7nM7aH/ZqIeEaxTuvAy3Y7RitmProuZJSwQ9quRxVaaxEygL
 JxsZXzqGCkKirtRy12zKbKhN91Iig8wXmVgMxfTvJIoyreBk3GGPnd1gbez0CNf+C8o9
 MrEYOeQnmdWcVpePVTcw+hEqRk9lR5GnB2u5Xf+bZReKaBZfPm6PRZyBRuCTLD+xrBxO
 plNw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+r+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9TLSg4gU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <qemu-devel@nongnu.org>;
 Thu, 29 Oct 2020 22:28:42 +0100 (CET)
Date: Thu, 29 Oct 2020 22:28:34 +0100
From: Olaf Hering <olaf@aepfle.de>
To: qemu-devel@nongnu.org
Subject: regression in meson build, binaries lost reproducibility
Message-ID: <20201029222834.35ba9c18.olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/X0PPmwYcZY2sdtd/l_wXd4/"; protocol="application/pgp-signature"
Received-SPF: none client-ip=81.169.146.220; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 17:28:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--Sig_/X0PPmwYcZY2sdtd/l_wXd4/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Up to qemu.git#v5.0.0 the produced binaries are all reproducible, when buil=
t from the same source with same configuration at different times on differ=
ent hosts and filesystems. See https://reproducible-builds.org/ for hints w=
hy this might be a good idea.

Now with qemu.git#master this feature was lost. I briefly looked through th=
e meson.build files for potential sources of error, like using wildcards fo=
r filelists. But it seems all to-be-compiled files are explicitly listed.

Is anyone familiar with the build process and has an idea why this feature =
was lost?

Olaf

--Sig_/X0PPmwYcZY2sdtd/l_wXd4/
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl+bNAMACgkQ86SN7mm1
DoD5ig/8CDB4gEM5d0D8FVHvk39LRLJrQvCeyJehQp7EgHZfbZ9W3+1xE2t5/6jT
hbuA7jjqQRDE95/nJ2zGoi5bxvxY7Oyt+ffFo1P+yZtj/xTwi15Y76/cIoC5k0fp
ytnHRGePw1rYej1+hDSor2Oeik4sxjCR40ajkPVWlgkHi1EZqW9yR6+MjNwK2ikO
VUjty5wLs061e3bX7JSSKV7l/GLA9pCiloNucjNjO1ZCdQtTC3RbwPeoprzqxPw5
L6d5digCCJi0kwjfLeZjGrkHxrBodVOGIGx2UXiHfJeG9K9cd4YTrmo8ftJYafdW
9ASLKMRZBBUBgBj7ky3ytYv/ObzKUEQy/ThS5kwJIEfggs1lAND/JDB4Zdl2yaiM
vghv7PDUxFx6COLih1lZB70iP5vJ7FgkoLD1nQUefatfSwrz3+szlCJNL0mVBVnv
Ww3/sXiguo3V3QBmoHxJjTVqECfDirUYqdhlAgyHrZTjuQYntsNH1b89p+YYuEnP
LVzTHC86NXrGM4Yj3bUBrpAnxQu9jqXCcwJ2qeYbrwOTAb0xjT7KAicpU7Ks29i+
ayWFCllPDeNLM8MSgD/6burQtWtYVvrJRrS3b6HsfgZXmX0Dmhs+LFNgzHj/w75M
pcSqodjK5z0CNb7HVcOtpQc3gQbVdj9b+8xhrQR+YndkPiI9h9c=
=MgP+
-----END PGP SIGNATURE-----

--Sig_/X0PPmwYcZY2sdtd/l_wXd4/--

