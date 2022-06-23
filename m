Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B742A557E67
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:03:00 +0200 (CEST)
Received: from localhost ([::1]:44016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OMF-0004Vb-8h
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OIw-0002BH-FX
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:59:34 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:25856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OIt-00045Q-BY
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=S/pY5i7eORyT4O+d9H5WcZ2sVnhZuWWmMTG6ShObrac=;
 b=KUWYgCA3XmBFxoFTU/3lkNetrtnwAxFOgl58R9olKm3SRKYOb0CtBeXG
 3q5/v3+9aLuYmzk6S9VKAYrFSxXkUMo7Ka6N1Je/DU32UPFwp8ABE2BPe
 li/273vXMeq3jOnriOvii5u4smvi4WFb+S8hSC3pPxF0Vd0Qv32Vlx1mE M=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,216,1650924000"; d="scan'208";a="42600833"
Received: from clt-128-93-179-2.vpn.inria.fr (HELO [128.93.179.2])
 ([128.93.179.2]) by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 16:59:30 +0200
Subject: [PATCH 3/4] tests: acpi: q35: add test for hmat nodes without
 initiators
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Message-ID: <919b45dd-9f21-85f9-fb05-f71a9da805e7@inria.fr>
Date: Thu, 23 Jun 2022 16:59:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="36GZ846bkjV31f0wnnq4uf6wR6HHpaa8q"
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
--36GZ846bkjV31f0wnnq4uf6wR6HHpaa8q
Content-Type: multipart/mixed; boundary="xmVlh7id6IXrOjJDvaWofgdWIgt0NZk6H";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <919b45dd-9f21-85f9-fb05-f71a9da805e7@inria.fr>
Subject: [PATCH 3/4] tests: acpi: q35: add test for hmat nodes without
 initiators
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>

--xmVlh7id6IXrOjJDvaWofgdWIgt0NZk6H
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
  tests/qtest/bios-tables-test.c | 45 ++++++++++++++++++++++++++++++++++
  1 file changed, 45 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
index 359916c228..1252b166ff 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1461,6 +1461,50 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
      test_acpi_tcg_acpi_hmat(MACHINE_PC);
  }
 =20
+static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine =3D MACHINE_Q35;
+    data.variant =3D ".acpihmat-noinitiator";
+    test_acpi_one(" -machine hmat=3Don"
+                  " -smp 4"
+                  " -m 128M"
+                  " -object memory-backend-ram,size=3D32M,id=3Dram0"
+                  " -object memory-backend-ram,size=3D32M,id=3Dram1"
+                  " -object memory-backend-ram,size=3D64M,id=3Dram2"
+                  " -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1"
+                  " -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3"
+                  " -numa node,nodeid=3D2,memdev=3Dram2"
+                  " -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-latency,latency=3D10"
+                  " -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-bandwidth,bandwidth=3D10485760"
+                  " -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-latency,latency=3D20"
+                  " -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-bandwidth,bandwidth=3D5242880"
+                  " -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-latency,latency=3D30"
+                  " -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-bandwidth,bandwidth=3D1048576"
+                  " -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-latency,latency=3D20"
+                  " -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-bandwidth,bandwidth=3D5242880"
+                  " -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-latency,latency=3D10"
+                  " -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-bandwidth,bandwidth=3D10485760"
+                  " -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-latency,latency=3D30"
+                  " -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dm=
emory,"
+                  "data-type=3Daccess-bandwidth,bandwidth=3D1048576",
+                  &data);
+    free_test_data(&data);
+}
+
  static void test_acpi_erst(const char *machine)
  {
      gchar *tmp_path =3D g_dir_make_tmp("qemu-test-erst.XXXXXX", NULL);
@@ -1803,6 +1847,7 @@ int main(int argc, char *argv[])
          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);=

          qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_=
hmat);
          qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat=
);
+        qtest_add_func("acpi/q35/acpihmat-noinitiator", test_acpi_q35_tc=
g_acpi_hmat_noinitiator);
          qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst=
);
          qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
          qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
--=20
2.30.2




--xmVlh7id6IXrOjJDvaWofgdWIgt0NZk6H--

--36GZ846bkjV31f0wnnq4uf6wR6HHpaa8q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK0f9EFAwAAAAAACgkQRJGQ8yNavTtT
3g//fo25WwX2sDksNrD4mwwpuHwSjOnDBbK+z1rRyYEbKaAZPaKSLZ8BecIROC39V9SzOqw5Yien
xP62bsMBW9ZDDtBw601BAYFibbWToLPiUAsiUQnSGHS/T/vd2yOzmoxXBLWXnbQMuWSwplKIxgHa
HchATj3x3pLhOPV5zBnn+YGtIlpzmNv2VFVWx6UvIyD1X1xJS31f0s00GXyyiEWVGCGwott+JFT4
mrYJd/ABtRGnujBv688NXsAXdgFnL+f/+rn6FLPlqq1NiSM5u75nVft2n8sZrbdYB/EJf35li803
qcpf9wRfaZtXM3F0G6YglQJrAaL31Z8HX2336YgTh6f8g+qqjGmIWsDqcMFCG9oWJ/PUcVqV6rOJ
2HNORiIG8dtsC6KwPERDLCk0WCIZDejQXgFnhbMZzuFS/gLkWDWvkd0pSWTSxUDjL05NA2C8XGfz
zD0NuwZagKu/holjAvLpJd6V5Q/gw0s6YaZbT2IkOWFgA/5xTtVLOCeW3PmNVkRxltHEgMq/lUqj
rspcQ4/hEdUHF9X1aCyDtvhF6aFI76A3xPFjNSyidsrIic18R7pqA7T7idK3EUCzmgey//f3h8pC
pGbAZgkXqFlfiktuAGxwe+9rtWTfr6Th5XhPj/GztU7zIbQDKK2C0FiMPlKepUYpsZKPYRMk9mBp
0DM=
=a4dx
-----END PGP SIGNATURE-----

--36GZ846bkjV31f0wnnq4uf6wR6HHpaa8q--

