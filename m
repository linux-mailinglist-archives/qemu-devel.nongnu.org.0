Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C2475E47
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:12:32 +0100 (CET)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXpP-0001kt-U1
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcS-0005T4-Ld
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:08 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:32953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcK-0003Vl-Gb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.249])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 40276212E1;
 Wed, 15 Dec 2021 16:58:59 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:58 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001f5725d16-2cf6-44b3-8410-073e51d33ca5,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 010/102] ivshmem-test.c: enable test_ivshmem_server for ppc64
 arch
Date: Wed, 15 Dec 2021 17:57:15 +0100
Message-ID: <20211215165847.321042-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8d82fe79-3992-497a-b899-8edaa133b940
X-Ovh-Tracer-Id: 2221119041323895660
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

This test, if enabled by hand, was failing when the ivhsmem device was
being declared as DEVICE_NATIVE_ENDIAN with the following error:

/ppc64/ivshmem/pair: OK
/ppc64/ivshmem/server:
**
ERROR:/home/danielhb/qemu/tests/qtest/ivshmem-test.c:367:test_ivshmem_server:
assertion failed (ret != 0): (0 != 0)
Aborted

After the endianness change done in the previous patch, we can verify in
both a a Power 9 little-endian host and in a Power 8 big-endian host
that this test is now passing:

$ QTEST_QEMU_BINARY=./ppc64-softmmu/qemu-system-ppc64 ./tests/qtest/ivshmem-test -m slow
/ppc64/ivshmem/single: OK
/ppc64/ivshmem/hotplug: OK
/ppc64/ivshmem/memdev: OK
/ppc64/ivshmem/pair: OK
/ppc64/ivshmem/server: OK

Let's keep it that way by officially enabling it for ppc64.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211124092948.335389-3-danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/ivshmem-test.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index dfa69424ed90..fe94dd3b96fa 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -463,7 +463,6 @@ static gchar *mktempshm(int size, int *fd)
 int main(int argc, char **argv)
 {
     int ret, fd;
-    const char *arch = qtest_get_arch();
     gchar dir[] = "/tmp/ivshmem-test.XXXXXX";
 
     g_test_init(&argc, &argv, NULL);
@@ -488,9 +487,7 @@ int main(int argc, char **argv)
     qtest_add_func("/ivshmem/memdev", test_ivshmem_memdev);
     if (g_test_slow()) {
         qtest_add_func("/ivshmem/pair", test_ivshmem_pair);
-        if (strcmp(arch, "ppc64") != 0) {
-            qtest_add_func("/ivshmem/server", test_ivshmem_server);
-        }
+        qtest_add_func("/ivshmem/server", test_ivshmem_server);
     }
 
 out:
-- 
2.31.1


