Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB7437366
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 10:00:03 +0200 (CEST)
Received: from localhost ([::1]:33870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdpT8-0007To-FP
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 04:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQy-0004WK-TB
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:57:48 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:44421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQm-0002u7-My
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:57:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3B2A321254;
 Fri, 22 Oct 2021 07:57:34 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 09:57:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0035341de25-87ff-4429-958e-2b2dc9f332c6,
 74C1FF3A6B8BFE8186BF38A421BAA83045AEA3E9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/3] speed/sdhci: Add trace events
Date: Fri, 22 Oct 2021 09:57:30 +0200
Message-ID: <20211022075730.484692-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022075730.484692-1-clg@kaod.org>
References: <20211022075730.484692-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1d5129bf-bcef-4604-a633-773c270a8075
X-Ovh-Tracer-Id: 7993044914382736236
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvjedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20211018132609.160008-6-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/aspeed_sdhci.c | 5 +++++
 hw/sd/trace-events   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 3299844de6dc..df1bdf1fa4ed 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -14,6 +14,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 
 #define ASPEED_SDHCI_INFO            0x00
 #define  ASPEED_SDHCI_INFO_SLOT1     (1 << 17)
@@ -60,6 +61,8 @@ static uint64_t aspeed_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
         }
     }
 
+    trace_aspeed_sdhci_read(addr, size, (uint64_t) val);
+
     return (uint64_t)val;
 }
 
@@ -68,6 +71,8 @@ static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
 {
     AspeedSDHCIState *sdhci = opaque;
 
+    trace_aspeed_sdhci_write(addr, size, val);
+
     switch (addr) {
     case ASPEED_SDHCI_INFO:
         /* The RESET bit automatically clears. */
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 3cc2ef89ba6b..94a00557b26f 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -68,3 +68,7 @@ pl181_fifo_push(uint32_t data) "FIFO push 0x%08" PRIx32
 pl181_fifo_pop(uint32_t data) "FIFO pop 0x%08" PRIx32
 pl181_fifo_transfer_complete(void) "FIFO transfer complete"
 pl181_data_engine_idle(void) "data engine idle"
+
+# aspeed_sdhci.c
+aspeed_sdhci_read(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
+aspeed_sdhci_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
-- 
2.31.1


