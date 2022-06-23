Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469E557E6E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:05:33 +0200 (CEST)
Received: from localhost ([::1]:53666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OOi-0002iz-Cn
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OJc-0003Ny-6e
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:00:17 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:25902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OJX-0004LQ-IQ
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 11:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=YAMC3EPpIqtFyDGUcDijXZ2GAiU/pq6D/Xa0gNSTttA=;
 b=qk7ULHR0b5U4X+VTFDLG19DeRSUNgPbt7iuCuO/iD8EP2+AVTkuPdL9+
 ANEBXO93sHaIy2mktelvoh/DjS8KuVOwNlzOkXe2PKlJvN4RDYpBzAShN
 bm6piVl1+ntzHHaFr8/QXfz24cbAxGg4OxDL6H9ii5YI3giNmCZ1UMkJ1 8=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,216,1650924000"; d="scan'208";a="42601024"
Received: from clt-128-93-179-2.vpn.inria.fr (HELO [128.93.179.2])
 ([128.93.179.2]) by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 17:00:10 +0200
Subject: [PATCH 4/4] tests: acpi: q35: update expected blobs
 *.hmat-noinitiators
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Message-ID: <494d1f48-c361-6cf9-2b4d-199b2014ca17@inria.fr>
Date: Thu, 23 Jun 2022 17:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1FeOZDCar85nRobKLcgoGqvvleLLWRQpC"
Received-SPF: pass client-ip=192.134.164.83;
 envelope-from=Brice.Goglin@inria.fr; helo=mail2-relais-roc.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1FeOZDCar85nRobKLcgoGqvvleLLWRQpC
Content-Type: multipart/mixed; boundary="J4Olosu2gIEpZOexvLqHTSq92V3aLm1qT";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <494d1f48-c361-6cf9-2b4d-199b2014ca17@inria.fr>
Subject: [PATCH 4/4] tests: acpi: q35: update expected blobs
 *.hmat-noinitiators
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>

--J4Olosu2gIEpZOexvLqHTSq92V3aLm1qT
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

expected HMAT:

[000h 0000   4]                    Signature : "HMAT"    [Heterogeneous M=
emory Attributes Table]
[004h 0004   4]                 Table Length : 00000120
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 4F
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                     Reserved : 00000000

[028h 0040   2]               Structure Type : 0000 [Memory Proximity Dom=
ain Attributes]
[02Ah 0042   2]                     Reserved : 0000
[02Ch 0044   4]                       Length : 00000028
[030h 0048   2]        Flags (decoded below) : 0001
             Processor Proximity Domain Valid : 1
[032h 0050   2]                    Reserved1 : 0000
[034h 0052   4] Attached Initiator Proximity Domain : 00000000
[038h 0056   4]      Memory Proximity Domain : 00000000
[03Ch 0060   4]                    Reserved2 : 00000000
[040h 0064   8]                    Reserved3 : 0000000000000000
[048h 0072   8]                    Reserved4 : 0000000000000000

[050h 0080   2]               Structure Type : 0000 [Memory Proximity Dom=
ain Attributes]
[052h 0082   2]                     Reserved : 0000
[054h 0084   4]                       Length : 00000028
[058h 0088   2]        Flags (decoded below) : 0001
             Processor Proximity Domain Valid : 1
[05Ah 0090   2]                    Reserved1 : 0000
[05Ch 0092   4] Attached Initiator Proximity Domain : 00000001
[060h 0096   4]      Memory Proximity Domain : 00000001
[064h 0100   4]                    Reserved2 : 00000000
[068h 0104   8]                    Reserved3 : 0000000000000000
[070h 0112   8]                    Reserved4 : 0000000000000000

[078h 0120   2]               Structure Type : 0000 [Memory Proximity Dom=
ain Attributes]
[07Ah 0122   2]                     Reserved : 0000
[07Ch 0124   4]                       Length : 00000028
[080h 0128   2]        Flags (decoded below) : 0000
             Processor Proximity Domain Valid : 0
[082h 0130   2]                    Reserved1 : 0000
[084h 0132   4] Attached Initiator Proximity Domain : 00000080
[088h 0136   4]      Memory Proximity Domain : 00000002
[08Ch 0140   4]                    Reserved2 : 00000000
[090h 0144   8]                    Reserved3 : 0000000000000000
[098h 0152   8]                    Reserved4 : 0000000000000000

[0A0h 0160   2]               Structure Type : 0001 [System Locality Late=
ncy and Bandwidth Information]
[0A2h 0162   2]                     Reserved : 0000
[0A4h 0164   4]                       Length : 00000040
[0A8h 0168   1]        Flags (decoded below) : 00
                             Memory Hierarchy : 0
[0A9h 0169   1]                    Data Type : 00
[0AAh 0170   2]                    Reserved1 : 0000
[0ACh 0172   4] Initiator Proximity Domains # : 00000002
[0B0h 0176   4]   Target Proximity Domains # : 00000003
[0B4h 0180   4]                    Reserved2 : 00000000
[0B8h 0184   8]              Entry Base Unit : 0000000000002710
[0C0h 0192   4] Initiator Proximity Domain List : 00000000
[0C4h 0196   4] Initiator Proximity Domain List : 00000001
[0C8h 0200   4] Target Proximity Domain List : 00000000
[0CCh 0204   4] Target Proximity Domain List : 00000001
[0D0h 0208   4] Target Proximity Domain List : 00000002
[0D4h 0212   2]                        Entry : 0001
[0D6h 0214   2]                        Entry : 0002
[0D8h 0216   2]                        Entry : 0003
[0DAh 0218   2]                        Entry : 0002
[0DCh 0220   2]                        Entry : 0001
[0DEh 0222   2]                        Entry : 0003

[0E0h 0224   2]               Structure Type : 0001 [System Locality Late=
ncy and Bandwidth Information]
[0E2h 0226   2]                     Reserved : 0000
[0E4h 0228   4]                       Length : 00000040
[0E8h 0232   1]        Flags (decoded below) : 00
                             Memory Hierarchy : 0
[0E9h 0233   1]                    Data Type : 03
[0EAh 0234   2]                    Reserved1 : 0000
[0ECh 0236   4] Initiator Proximity Domains # : 00000002
[0F0h 0240   4]   Target Proximity Domains # : 00000003
[0F4h 0244   4]                    Reserved2 : 00000000
[0F8h 0248   8]              Entry Base Unit : 0000000000000001
[100h 0256   4] Initiator Proximity Domain List : 00000000
[104h 0260   4] Initiator Proximity Domain List : 00000001
[108h 0264   4] Target Proximity Domain List : 00000000
[10Ch 0268   4] Target Proximity Domain List : 00000001
[110h 0272   4] Target Proximity Domain List : 00000002
[114h 0276   2]                        Entry : 000A
[116h 0278   2]                        Entry : 0005
[118h 0280   2]                        Entry : 0001
[11Ah 0282   2]                        Entry : 0005
[11Ch 0284   2]                        Entry : 000A
[11Eh 0286   2]                        Entry : 0001

Raw Table Data: Length 288 (0x120)

     0000: 48 4D 41 54 20 01 00 00 02 4F 42 4F 43 48 53 20  // HMAT ....O=
BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ..=
=2E.BXPC
     0020: 01 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ..........=
=2E.(...
     0030: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ..........=
=2E.....
     0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ..........=
=2E.....
     0050: 00 00 00 00 28 00 00 00 01 00 00 00 01 00 00 00  // ....(.....=
=2E.....
     0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ..........=
=2E.....
     0070: 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00  // ..........=
=2E.(...
     0080: 00 00 00 00 80 00 00 00 02 00 00 00 00 00 00 00  // ..........=
=2E.....
     0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ..........=
=2E.....
     00A0: 01 00 00 00 40 00 00 00 00 00 00 00 02 00 00 00  // ....@.....=
=2E.....
     00B0: 03 00 00 00 00 00 00 00 10 27 00 00 00 00 00 00  // .........'=
=2E.....
     00C0: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ..........=
=2E.....
     00D0: 02 00 00 00 01 00 02 00 03 00 02 00 01 00 03 00  // ..........=
=2E.....
     00E0: 01 00 00 00 40 00 00 00 00 03 00 00 02 00 00 00  // ....@.....=
=2E.....
     00F0: 03 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // ..........=
=2E.....
     0100: 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00  // ..........=
=2E.....
     0110: 02 00 00 00 0A 00 05 00 01 00 05 00 0A 00 01 00  // ..........=
=2E.....

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
---
  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
  tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
  tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
  tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
  tests/qtest/bios-tables-test-allowed-diff.h   |   5 -----
  6 files changed, 5 deletions(-)

diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/a=
cpi/q35/APIC.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..d904d4a70ddecbb79a83a267a=
f8e26f925e9f4c6 100644
GIT binary patch
literal 144
zcmZ<^@N}NQz`(%h?d0$55v<@85#X!<1dKp25F11@Fg*ANra6G>KwJ(+MhMNs1fiLk
tK{O)|Nb<lx5Xr;^#2^NU#mWk#c|j~rP8f>|r~o3y%?)O;u>A)b0RWi;3;_TD

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/a=
cpi/q35/DSDT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..c767d11cb1d088f613c49e55a=
7139cccababf66c 100644
GIT binary patch
literal 8553
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
E0Xe$wY5)KL

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/FACP.acpihmat-noinitiator b/tests/data/a=
cpi/q35/FACP.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a8f6a8961109d01059aceef9f=
1869cde09a2f10c 100644
GIT binary patch
literal 244
zcmZ>BbPo8!z`($~-O1nCBUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
z$X0-fGcm9T0LA|E|L2FOWMD92VqjR>!oa}D!NBm72O<iWged~jj0!*k$y^{03>bk1
YBHITON2VDSAnpK(F*YFF1LDH~0P8Id0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/a=
cpi/q35/HMAT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6494d11b9fff54f8c403ec9e4=
893fdff72bde9c9 100644
GIT binary patch
literal 288
zcmaJ)F%Ezr5IZ0&Og@24pP{g@7)*5VIX>Ms;S4dxCU-4Odz5uKq7kt*)m-+N&Mij(
zmQa%w6GZ=3D3|IM0X_Ak#IabYaQ2iTvR&x~t&7@Gj;A7o|>w!;|gr;lRa*AB0!)_xEV
I&r86*0dKzu0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/a=
cpi/q35/SRAT.acpihmat-noinitiator
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a11d3119ab3538d9cf821a4fe=
0fccb0f1dc96359 100644
GIT binary patch
literal 312
zcmWFzatyIxWME)?>E!S15v<@85#X!<1VAAM5F12;FdPVA@EK9%8JW=3Dd%*cF34Y)~A
u1{YiayE>qSVDJGh4QBww88zTMCa6LfjpA-b4Y)81R2_^)QwNnLKmh<Kp$P#1

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
index ae025e3a3e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
  /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
-"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
-"tests/data/acpi/q35/FACP.acpihmat-noinitiator",
-"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
-"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
--=20
2.30.2




--J4Olosu2gIEpZOexvLqHTSq92V3aLm1qT--

--1FeOZDCar85nRobKLcgoGqvvleLLWRQpC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK0f/kFAwAAAAAACgkQRJGQ8yNavTu6
4RAAqpsmBAWqZJmQrB6HpeloJua2cvVvYCGIRzj75wJZUbLF7ZdNmf0akj2QOrXDnr/f9Bh/mFhc
KlhItctCSvrQoVF0lG5RhiJjA5siV9FPyicz181371bel7jXZekm0aJ5dgXtH/ctKnWi3K7sVLQp
amvMjf/TKX3Qnk9Mg8LORULWofTVk9JMKITlBLN/DNtb1Fy9gcDhTRKrqs3bq/PDvNmFAOcwaeRX
66YSK8vpfHrnhrqiogDQhANdZ3ioGswWjQdqVxBaZDS2+P3s+N+SYRRO4VKUT9ZhXFOJYuwkhv1c
2mkVehBow11EKmy7wVPUFFYNCRLaA71p8+DZvQ0oBKNBgjWXcgOoHSG1PvSSRmkySP/nC4OtjvXf
EgCs0LlTQxk0aRoVR4Cp6IJ+2aHg7NRn7a2+8ZjkVjXnBjFESh4kPlJ5JKaMmWSX+uFk4QozoCJy
tDu94SWuQqUur6FmYeOHzBCGDX4ZGYa0cKiAIPqDj44gUj8BIh8/uEjDdfcBUYgYmFy3BdqQsEPI
3NuAVimjbBeGK4NwWNdZTSaisO70KtH0ba9pIafvQv+Tz7rmJ4eDCLvcdHm/ONdZT+YNc2Sx5UYe
YNzvWb7+uBBDx4jhXpDZqM6m3KXyQ3jNK0vDtGhFo/XBHVFu9IdYuEbLkQtv3lSv040JBjXV3T9R
eQU=
=ylOG
-----END PGP SIGNATURE-----

--1FeOZDCar85nRobKLcgoGqvvleLLWRQpC--

