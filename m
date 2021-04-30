Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A036FEF7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:55:19 +0200 (CEST)
Received: from localhost ([::1]:37032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWQA-00017w-HA
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW5A-0000sW-Gp; Fri, 30 Apr 2021 12:33:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lcW55-00072x-6n; Fri, 30 Apr 2021 12:33:36 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UGXGOO051802; Fri, 30 Apr 2021 12:33:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388m5nu4mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 12:33:23 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13UGXMsH053039;
 Fri, 30 Apr 2021 12:33:22 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388m5nu4kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 12:33:22 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UGPZA4025311;
 Fri, 30 Apr 2021 16:33:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 384ay8hu7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 16:33:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UGXH9F26280256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 16:33:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D70DF11C052;
 Fri, 30 Apr 2021 16:33:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74F1811C050;
 Fri, 30 Apr 2021 16:33:17 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 16:33:17 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A571422016C;
 Fri, 30 Apr 2021 18:33:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/18] tests/qtest: Add test for Aspeed HACE
Date: Fri, 30 Apr 2021 18:33:08 +0200
Message-Id: <20210430163309.4182922-9-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430163309.4182922-1-clg@kaod.org>
References: <20210430163309.4182922-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: afiMGT3w6PH05I_kFkc2KYZ4LNZ8xu0X
X-Proofpoint-ORIG-GUID: esdE0m8RRKEbFVo-UcYrz4rmIkhK_wV1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_10:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104300109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

This adds a test for the Aspeed Hash and Crypto (HACE) engine. It tests
the currently implemented behavior of the hash functionality.

The tests are similar, but are cut/pasted instead of broken out into a
common function so the assert machinery produces useful output when a
test fails.

Co-developed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Co-developed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210409000253.1475587-4-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_hace-test.c | 469 +++++++++++++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 tests/qtest/meson.build        |   3 +
 3 files changed, 473 insertions(+)
 create mode 100644 tests/qtest/aspeed_hace-test.c

diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-tes=
t.c
new file mode 100644
index 000000000000..09ee31545e41
--- /dev/null
+++ b/tests/qtest/aspeed_hace-test.c
@@ -0,0 +1,469 @@
+/*
+ * QTest testcase for the ASPEED Hash and Crypto Engine
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright 2021 IBM Corp.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+#include "qemu-common.h"
+#include "qemu/bitops.h"
+
+#define HACE_CMD                 0x10
+#define  HACE_SHA_BE_EN          BIT(3)
+#define  HACE_MD5_LE_EN          BIT(2)
+#define  HACE_ALGO_MD5           0
+#define  HACE_ALGO_SHA1          BIT(5)
+#define  HACE_ALGO_SHA224        BIT(6)
+#define  HACE_ALGO_SHA256        (BIT(4) | BIT(6))
+#define  HACE_ALGO_SHA512        (BIT(5) | BIT(6))
+#define  HACE_ALGO_SHA384        (BIT(5) | BIT(6) | BIT(10))
+#define  HACE_SG_EN              BIT(18)
+
+#define HACE_STS                 0x1c
+#define  HACE_RSA_ISR            BIT(13)
+#define  HACE_CRYPTO_ISR         BIT(12)
+#define  HACE_HASH_ISR           BIT(9)
+#define  HACE_RSA_BUSY           BIT(2)
+#define  HACE_CRYPTO_BUSY        BIT(1)
+#define  HACE_HASH_BUSY          BIT(0)
+#define HACE_HASH_SRC            0x20
+#define HACE_HASH_DIGEST         0x24
+#define HACE_HASH_KEY_BUFF       0x28
+#define HACE_HASH_DATA_LEN       0x2c
+#define HACE_HASH_CMD            0x30
+/* Scatter-Gather Hash */
+#define SG_LIST_LEN_LAST         BIT(31)
+struct AspeedSgList {
+        uint32_t len;
+        uint32_t addr;
+} __attribute__ ((__packed__));
+
+/*
+ * Test vector is the ascii "abc"
+ *
+ * Expected results were generated using command line utitiles:
+ *
+ *  echo -n -e 'abc' | dd of=3D/tmp/test
+ *  for hash in sha512sum sha256sum md5sum; do $hash /tmp/test; done
+ *
+ */
+static const uint8_t test_vector[] =3D {0x61, 0x62, 0x63};
+
+static const uint8_t test_result_sha512[] =3D {
+    0xdd, 0xaf, 0x35, 0xa1, 0x93, 0x61, 0x7a, 0xba, 0xcc, 0x41, 0x73, 0x=
49,
+    0xae, 0x20, 0x41, 0x31, 0x12, 0xe6, 0xfa, 0x4e, 0x89, 0xa9, 0x7e, 0x=
a2,
+    0x0a, 0x9e, 0xee, 0xe6, 0x4b, 0x55, 0xd3, 0x9a, 0x21, 0x92, 0x99, 0x=
2a,
+    0x27, 0x4f, 0xc1, 0xa8, 0x36, 0xba, 0x3c, 0x23, 0xa3, 0xfe, 0xeb, 0x=
bd,
+    0x45, 0x4d, 0x44, 0x23, 0x64, 0x3c, 0xe8, 0x0e, 0x2a, 0x9a, 0xc9, 0x=
4f,
+    0xa5, 0x4c, 0xa4, 0x9f};
+
+static const uint8_t test_result_sha256[] =3D {
+    0xba, 0x78, 0x16, 0xbf, 0x8f, 0x01, 0xcf, 0xea, 0x41, 0x41, 0x40, 0x=
de,
+    0x5d, 0xae, 0x22, 0x23, 0xb0, 0x03, 0x61, 0xa3, 0x96, 0x17, 0x7a, 0x=
9c,
+    0xb4, 0x10, 0xff, 0x61, 0xf2, 0x00, 0x15, 0xad};
+
+static const uint8_t test_result_md5[] =3D {
+    0x90, 0x01, 0x50, 0x98, 0x3c, 0xd2, 0x4f, 0xb0, 0xd6, 0x96, 0x3f, 0x=
7d,
+    0x28, 0xe1, 0x7f, 0x72};
+
+/*
+ * The Scatter-Gather Test vector is the ascii "abc" "def" "ghi", broken
+ * into blocks of 3 characters as shown
+ *
+ * Expected results were generated using command line utitiles:
+ *
+ *  echo -n -e 'abcdefghijkl' | dd of=3D/tmp/test
+ *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
+ *
+ */
+static const uint8_t test_vector_sg1[] =3D {0x61, 0x62, 0x63, 0x64, 0x65=
, 0x66};
+static const uint8_t test_vector_sg2[] =3D {0x67, 0x68, 0x69};
+static const uint8_t test_vector_sg3[] =3D {0x6a, 0x6b, 0x6c};
+
+static const uint8_t test_result_sg_sha512[] =3D {
+    0x17, 0x80, 0x7c, 0x72, 0x8e, 0xe3, 0xba, 0x35, 0xe7, 0xcf, 0x7a, 0x=
f8,
+    0x23, 0x11, 0x6d, 0x26, 0xe4, 0x1e, 0x5d, 0x4d, 0x6c, 0x2f, 0xf1, 0x=
f3,
+    0x72, 0x0d, 0x3d, 0x96, 0xaa, 0xcb, 0x6f, 0x69, 0xde, 0x64, 0x2e, 0x=
63,
+    0xd5, 0xb7, 0x3f, 0xc3, 0x96, 0xc1, 0x2b, 0xe3, 0x8b, 0x2b, 0xd5, 0x=
d8,
+    0x84, 0x25, 0x7c, 0x32, 0xc8, 0xf6, 0xd0, 0x85, 0x4a, 0xe6, 0xb5, 0x=
40,
+    0xf8, 0x6d, 0xda, 0x2e};
+
+static const uint8_t test_result_sg_sha256[] =3D {
+    0xd6, 0x82, 0xed, 0x4c, 0xa4, 0xd9, 0x89, 0xc1, 0x34, 0xec, 0x94, 0x=
f1,
+    0x55, 0x1e, 0x1e, 0xc5, 0x80, 0xdd, 0x6d, 0x5a, 0x6e, 0xcd, 0xe9, 0x=
f3,
+    0xd3, 0x5e, 0x6e, 0x4a, 0x71, 0x7f, 0xbd, 0xe4};
+
+
+static void write_regs(QTestState *s, uint32_t base, uint32_t src,
+                       uint32_t length, uint32_t out, uint32_t method)
+{
+        qtest_writel(s, base + HACE_HASH_SRC, src);
+        qtest_writel(s, base + HACE_HASH_DIGEST, out);
+        qtest_writel(s, base + HACE_HASH_DATA_LEN, length);
+        qtest_writel(s, base + HACE_HASH_CMD, HACE_SHA_BE_EN | method);
+}
+
+static void test_md5(const char *machine, const uint32_t base,
+                     const uint32_t src_addr)
+
+{
+    QTestState *s =3D qtest_init(machine);
+
+    uint32_t digest_addr =3D src_addr + 0x01000000;
+    uint8_t digest[16] =3D {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(s, base, src_addr, sizeof(test_vector), digest_addr, HACE=
_ALGO_MD5);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0x00000200)=
;
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_md5, sizeof(digest));
+
+    qtest_quit(s);
+}
+
+static void test_sha256(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s =3D qtest_init(machine);
+
+    const uint32_t digest_addr =3D src_addr + 0x1000000;
+    uint8_t digest[32] =3D {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(s, base, src_addr, sizeof(test_vector), digest_addr, HACE=
_ALGO_SHA256);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0x00000200)=
;
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sha256, sizeof(digest));
+
+    qtest_quit(s);
+}
+
+static void test_sha512(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s =3D qtest_init(machine);
+
+    const uint32_t digest_addr =3D src_addr + 0x1000000;
+    uint8_t digest[64] =3D {0};
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr, test_vector, sizeof(test_vector));
+
+    write_regs(s, base, src_addr, sizeof(test_vector), digest_addr, HACE=
_ALGO_SHA512);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0x00000200)=
;
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sha512, sizeof(digest));
+
+    qtest_quit(s);
+}
+
+static void test_sha256_sg(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s =3D qtest_init(machine);
+
+    const uint32_t src_addr_1 =3D src_addr + 0x1000000;
+    const uint32_t src_addr_2 =3D src_addr + 0x2000000;
+    const uint32_t src_addr_3 =3D src_addr + 0x3000000;
+    const uint32_t digest_addr =3D src_addr + 0x4000000;
+    uint8_t digest[32] =3D {0};
+    struct AspeedSgList array[] =3D {
+        {  cpu_to_le32(sizeof(test_vector_sg1)),
+           cpu_to_le32(src_addr_1) },
+        {  cpu_to_le32(sizeof(test_vector_sg2)),
+           cpu_to_le32(src_addr_2) },
+        {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
+           cpu_to_le32(src_addr_3) },
+    };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr_1, test_vector_sg1, sizeof(test_vector_sg=
1));
+    qtest_memwrite(s, src_addr_2, test_vector_sg2, sizeof(test_vector_sg=
2));
+    qtest_memwrite(s, src_addr_3, test_vector_sg3, sizeof(test_vector_sg=
3));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr,
+               (sizeof(test_vector_sg1)
+                + sizeof(test_vector_sg2)
+                + sizeof(test_vector_sg3)),
+               digest_addr, HACE_ALGO_SHA256 | HACE_SG_EN);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0x00000200)=
;
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sg_sha256, sizeof(digest));
+
+    qtest_quit(s);
+}
+
+static void test_sha512_sg(const char *machine, const uint32_t base,
+                        const uint32_t src_addr)
+{
+    QTestState *s =3D qtest_init(machine);
+
+    const uint32_t src_addr_1 =3D src_addr + 0x1000000;
+    const uint32_t src_addr_2 =3D src_addr + 0x2000000;
+    const uint32_t src_addr_3 =3D src_addr + 0x3000000;
+    const uint32_t digest_addr =3D src_addr + 0x4000000;
+    uint8_t digest[64] =3D {0};
+    struct AspeedSgList array[] =3D {
+        {  cpu_to_le32(sizeof(test_vector_sg1)),
+           cpu_to_le32(src_addr_1) },
+        {  cpu_to_le32(sizeof(test_vector_sg2)),
+           cpu_to_le32(src_addr_2) },
+        {  cpu_to_le32(sizeof(test_vector_sg3) | SG_LIST_LEN_LAST),
+           cpu_to_le32(src_addr_3) },
+    };
+
+    /* Check engine is idle, no busy or irq bits set */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Write test vector into memory */
+    qtest_memwrite(s, src_addr_1, test_vector_sg1, sizeof(test_vector_sg=
1));
+    qtest_memwrite(s, src_addr_2, test_vector_sg2, sizeof(test_vector_sg=
2));
+    qtest_memwrite(s, src_addr_3, test_vector_sg3, sizeof(test_vector_sg=
3));
+    qtest_memwrite(s, src_addr, array, sizeof(array));
+
+    write_regs(s, base, src_addr,
+               (sizeof(test_vector_sg1)
+                + sizeof(test_vector_sg2)
+                + sizeof(test_vector_sg3)),
+               digest_addr, HACE_ALGO_SHA512 | HACE_SG_EN);
+
+    /* Check hash IRQ status is asserted */
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0x00000200)=
;
+
+    /* Clear IRQ status and check status is deasserted */
+    qtest_writel(s, base + HACE_STS, 0x00000200);
+    g_assert_cmphex(qtest_readl(s, base + HACE_STS), =3D=3D, 0);
+
+    /* Read computed digest from memory */
+    qtest_memread(s, digest_addr, digest, sizeof(digest));
+
+    /* Check result of computation */
+    g_assert_cmpmem(digest, sizeof(digest),
+                    test_result_sg_sha512, sizeof(digest));
+
+    qtest_quit(s);
+}
+
+struct masks {
+    uint32_t src;
+    uint32_t dest;
+    uint32_t len;
+};
+
+static const struct masks ast2600_masks =3D {
+    .src  =3D 0x7fffffff,
+    .dest =3D 0x7ffffff8,
+    .len  =3D 0x0fffffff,
+};
+
+static const struct masks ast2500_masks =3D {
+    .src  =3D 0x3fffffff,
+    .dest =3D 0x3ffffff8,
+    .len  =3D 0x0fffffff,
+};
+
+static const struct masks ast2400_masks =3D {
+    .src  =3D 0x0fffffff,
+    .dest =3D 0x0ffffff8,
+    .len  =3D 0x0fffffff,
+};
+
+static void test_addresses(const char *machine, const uint32_t base,
+                           const struct masks *expected)
+{
+    QTestState *s =3D qtest_init(machine);
+
+    /*
+     * Check command mode is zero, meaning engine is in direct access mo=
de,
+     * as this affects the masking behavior of the HASH_SRC register.
+     */
+    g_assert_cmphex(qtest_readl(s, base + HACE_CMD), =3D=3D, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), =3D=3D, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), =3D=3D, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), =3D=3D, 0=
);
+
+
+    /* Check that the address masking is correct */
+    qtest_writel(s, base + HACE_HASH_SRC, 0xffffffff);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), =3D=3D, expect=
ed->src);
+
+    qtest_writel(s, base + HACE_HASH_DIGEST, 0xffffffff);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), =3D=3D, exp=
ected->dest);
+
+    qtest_writel(s, base + HACE_HASH_DATA_LEN, 0xffffffff);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), =3D=3D, e=
xpected->len);
+
+    /* Reset to zero */
+    qtest_writel(s, base + HACE_HASH_SRC, 0);
+    qtest_writel(s, base + HACE_HASH_DIGEST, 0);
+    qtest_writel(s, base + HACE_HASH_DATA_LEN, 0);
+
+    /* Check that all bits are now zero */
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_SRC), =3D=3D, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DIGEST), =3D=3D, 0);
+    g_assert_cmphex(qtest_readl(s, base + HACE_HASH_DATA_LEN), =3D=3D, 0=
);
+
+    qtest_quit(s);
+}
+
+/* ast2600 */
+static void test_md5_ast2600(void)
+{
+    test_md5("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha256_ast2600(void)
+{
+    test_sha256("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha256_sg_ast2600(void)
+{
+    test_sha256_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha512_ast2600(void)
+{
+    test_sha512("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_sha512_sg_ast2600(void)
+{
+    test_sha512_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
+}
+
+static void test_addresses_ast2600(void)
+{
+    test_addresses("-machine ast2600-evb", 0x1e6d0000, &ast2600_masks);
+}
+
+/* ast2500 */
+static void test_md5_ast2500(void)
+{
+    test_md5("-machine ast2500-evb", 0x1e6e3000, 0x80000000);
+}
+
+static void test_sha256_ast2500(void)
+{
+    test_sha256("-machine ast2500-evb", 0x1e6e3000, 0x80000000);
+}
+
+static void test_sha512_ast2500(void)
+{
+    test_sha512("-machine ast2500-evb", 0x1e6e3000, 0x80000000);
+}
+
+static void test_addresses_ast2500(void)
+{
+    test_addresses("-machine ast2500-evb", 0x1e6e3000, &ast2500_masks);
+}
+
+/* ast2400 */
+static void test_md5_ast2400(void)
+{
+    test_md5("-machine palmetto-bmc", 0x1e6e3000, 0x40000000);
+}
+
+static void test_sha256_ast2400(void)
+{
+    test_sha256("-machine palmetto-bmc", 0x1e6e3000, 0x40000000);
+}
+
+static void test_sha512_ast2400(void)
+{
+    test_sha512("-machine palmetto-bmc", 0x1e6e3000, 0x40000000);
+}
+
+static void test_addresses_ast2400(void)
+{
+    test_addresses("-machine palmetto-bmc", 0x1e6e3000, &ast2400_masks);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("ast2600/hace/addresses", test_addresses_ast2600);
+    qtest_add_func("ast2600/hace/sha512", test_sha512_ast2600);
+    qtest_add_func("ast2600/hace/sha256", test_sha256_ast2600);
+    qtest_add_func("ast2600/hace/md5", test_md5_ast2600);
+
+    qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
+    qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
+
+    qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
+    qtest_add_func("ast2500/hace/sha512", test_sha512_ast2500);
+    qtest_add_func("ast2500/hace/sha256", test_sha256_ast2500);
+    qtest_add_func("ast2500/hace/md5", test_md5_ast2500);
+
+    qtest_add_func("ast2400/hace/addresses", test_addresses_ast2400);
+    qtest_add_func("ast2400/hace/sha512", test_sha512_ast2400);
+    qtest_add_func("ast2400/hace/sha256", test_sha256_ast2400);
+    qtest_add_func("ast2400/hace/md5", test_md5_ast2400);
+
+    return g_test_run();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c594..0d8814650900 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1026,6 +1026,7 @@ F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
+F: tests/qtest/*aspeed*
=20
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c7673892179..f241ba0636a3 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -161,12 +161,15 @@ qtests_npcm7xx =3D \
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test'] + \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
+qtests_aspeed =3D \
+  ['aspeed_hace-test']
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) =
+ \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-ap=
b-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-ti=
mer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb=
-watchdog-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-te=
st'] : []) +         \
+  (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : [])=
 + \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) +=
 \
   ['arm-cpu-features',
    'microbit-test',
--=20
2.26.3


