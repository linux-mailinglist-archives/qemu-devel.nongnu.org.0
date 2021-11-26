Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3145ED1B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:56:19 +0100 (CET)
Received: from localhost ([::1]:40404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZpy-0005W5-Vh
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZlz-00016L-AE
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:52:11 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:57181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZlv-0007Bm-CX
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:52:10 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id ECB2D21048;
 Fri, 26 Nov 2021 11:52:00 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:52:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005785dcbd0-25ba-46b8-8947-f9d2da20c848,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL for-6.2 2/2] tests/tcg/ppc64le: Fix compile flags for
 byte_reverse
Date: Fri, 26 Nov 2021 12:51:57 +0100
Message-ID: <20211126115157.2737402-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115157.2737402-1-clg@kaod.org>
References: <20211126115157.2737402-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3f167950-3369-400d-8a16-05fabb7825d4
X-Ovh-Tracer-Id: 14582655594083617583
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

With a host compiler new enough to recognize power10 insns,
CROSS_CC_HAS_POWER10 is true, but we do not supply the -cpu
option to the compiler, resulting in

/tmp/ccAVdYJd.s: Assembler messages:
/tmp/ccAVdYJd.s:49: Error: unrecognized opcode: `brh'
/tmp/ccAVdYJd.s:78: Error: unrecognized opcode: `brw'
/tmp/ccAVdYJd.s:107: Error: unrecognized opcode: `brd'
make[2]: *** [byte_reverse] Error 1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/tcg/ppc64le/Makefile.target | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 5e65b1590dba..ba2fde5ff1c3 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -9,18 +9,12 @@ PPC64LE_TESTS=bcdsub
 endif
 bcdsub: CFLAGS += -mpower8-vector
 
-PPC64LE_TESTS += byte_reverse
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+PPC64LE_TESTS += byte_reverse
+endif
+byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
-else
-byte_reverse:
-	$(call skip-test, "BUILD of $@", "missing compiler support")
-run-byte_reverse:
-	$(call skip-test, "RUN of byte_reverse", "not built")
-run-plugin-byte_reverse-with-%:
-	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
-endif
 
 PPC64LE_TESTS += signal_save_restore_xer
 
-- 
2.31.1


