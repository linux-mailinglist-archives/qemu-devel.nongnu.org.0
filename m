Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B680E36FF81
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWwm-0000Jl-JD
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW9-0000K1-Fq; Fri, 30 Apr 2021 13:01:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6351
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcWW6-0002WQ-Dw; Fri, 30 Apr 2021 13:01:28 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGX8da144722; Fri, 30 Apr 2021 13:01:17 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388k4bxn2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 13:01:17 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGxpXt023609;
 Fri, 30 Apr 2021 17:01:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 384akh9ujs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 17:01:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UH1Csr32964946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 17:01:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CF814C059;
 Fri, 30 Apr 2021 17:01:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 602794C046;
 Fri, 30 Apr 2021 17:01:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 17:01:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BE07122016C;
 Fri, 30 Apr 2021 19:01:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/18] tests/qtest: Rename m25p80 test in aspeed_smc test
Date: Fri, 30 Apr 2021 19:01:04 +0200
Message-Id: <20210430170108.10261-5-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430170108.10261-1-clg@kaod.org>
References: <20210430170108.10261-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W9kvAyKNzLV9SH9Ty8XbYGcrIKtyZbJy
X-Proofpoint-GUID: W9kvAyKNzLV9SH9Ty8XbYGcrIKtyZbJy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=783 adultscore=0 clxscore=1034 impostorscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104300109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The m25p80 test depends on the Aspeed SMC controller to test our
SPI-NOR flash support. Reflect this dependency by changing the name.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210407171637.777743-17-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} | 12 ++++++------
 tests/qtest/meson.build                          |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename tests/qtest/{m25p80-test.c =3D> aspeed_smc-test.c} (96%)

diff --git a/tests/qtest/m25p80-test.c b/tests/qtest/aspeed_smc-test.c
similarity index 96%
rename from tests/qtest/m25p80-test.c
rename to tests/qtest/aspeed_smc-test.c
index f860cef5f08f..87b40a0ef186 100644
--- a/tests/qtest/m25p80-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -367,12 +367,12 @@ int main(int argc, char **argv)
                                "-drive file=3D%s,format=3Draw,if=3Dmtd",
                                tmp_path);
=20
-    qtest_add_func("/m25p80/read_jedec", test_read_jedec);
-    qtest_add_func("/m25p80/erase_sector", test_erase_sector);
-    qtest_add_func("/m25p80/erase_all",  test_erase_all);
-    qtest_add_func("/m25p80/write_page", test_write_page);
-    qtest_add_func("/m25p80/read_page_mem", test_read_page_mem);
-    qtest_add_func("/m25p80/write_page_mem", test_write_page_mem);
+    qtest_add_func("/ast2400/smc/read_jedec", test_read_jedec);
+    qtest_add_func("/ast2400/smc/erase_sector", test_erase_sector);
+    qtest_add_func("/ast2400/smc/erase_all",  test_erase_all);
+    qtest_add_func("/ast2400/smc/write_page", test_write_page);
+    qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
+    qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
=20
     ret =3D g_test_run();
=20
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index f241ba0636a3..966bc93efa43 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -162,7 +162,8 @@ qtests_npcm7xx =3D \
    'npcm7xx_watchdog_timer-test'] + \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
 qtests_aspeed =3D \
-  ['aspeed_hace-test']
+  ['aspeed_hace-test',
+   'aspeed_smc-test']
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) =
+ \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-ap=
b-dualtimer-test'] : []) + \
@@ -173,7 +174,6 @@ qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) +=
 \
   ['arm-cpu-features',
    'microbit-test',
-   'm25p80-test',
    'test-arm-mptimer',
    'boot-serial-test',
    'hexloader-test']
--=20
2.26.3


