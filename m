Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA3429ECE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:42:11 +0200 (CEST)
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maCQM-0006i0-Ii
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM9-0000R1-LD
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:50 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:46379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCLy-0004z6-Kt
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CEF28C407CF2;
 Tue, 12 Oct 2021 09:37:34 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c06c3e76-1195-4e45-992e-2dcdd11963cb,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/18] aspeed/smc: Rename AspeedSMCFlash 'id' to 'cs'
Date: Tue, 12 Oct 2021 09:37:17 +0200
Message-ID: <20211012073728.257748-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 23fd6bff-7443-4965-9083-f028f83a0e41
X-Ovh-Tracer-Id: 4268849496881597289
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'cs' is a more appropriate name to index SPI flash devices.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 30 +++++++++++++++---------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 097bb6aaf5f8..40b6926b3e02 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -33,7 +33,7 @@ struct AspeedSMCState;
 typedef struct AspeedSMCFlash {
     struct AspeedSMCState *controller;
 
-    uint8_t id;
+    uint8_t cs;
 
     MemoryRegion mmio;
 } AspeedSMCFlash;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 3e4221311a6d..643cde832396 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -352,20 +352,20 @@ static inline int aspeed_smc_flash_mode(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
 
-    return s->regs[s->r_ctrl0 + fl->id] & CTRL_CMD_MODE_MASK;
+    return s->regs[s->r_ctrl0 + fl->cs] & CTRL_CMD_MODE_MASK;
 }
 
 static inline bool aspeed_smc_is_writable(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
 
-    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
+    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->cs));
 }
 
 static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
-    int cmd = (s->regs[s->r_ctrl0 + fl->id] >> CTRL_CMD_SHIFT) & CTRL_CMD_MASK;
+    int cmd = (s->regs[s->r_ctrl0 + fl->cs] >> CTRL_CMD_SHIFT) & CTRL_CMD_MASK;
 
     /*
      * In read mode, the default SPI command is READ (0x3). In other
@@ -393,7 +393,7 @@ static inline int aspeed_smc_flash_is_4byte(const AspeedSMCFlash *fl)
     if (asc->segments == aspeed_2400_spi1_segments) {
         return s->regs[s->r_ctrl0] & CTRL_AST2400_SPI_4BYTE;
     } else {
-        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->id));
+        return s->regs[s->r_ce_ctrl] & (1 << (CTRL_EXTENDED0 + fl->cs));
     }
 }
 
@@ -401,9 +401,9 @@ static void aspeed_smc_flash_do_select(AspeedSMCFlash *fl, bool unselect)
 {
     AspeedSMCState *s = fl->controller;
 
-    trace_aspeed_smc_flash_select(fl->id, unselect ? "un" : "");
+    trace_aspeed_smc_flash_select(fl->cs, unselect ? "un" : "");
 
-    qemu_set_irq(s->cs_lines[fl->id], unselect);
+    qemu_set_irq(s->cs_lines[fl->cs], unselect);
 }
 
 static void aspeed_smc_flash_select(AspeedSMCFlash *fl)
@@ -423,11 +423,11 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     AspeedSegments seg;
 
-    asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->id], &seg);
+    asc->reg_to_segment(s, s->regs[R_SEG_ADDR0 + fl->cs], &seg);
     if ((addr % seg.size) != addr) {
         aspeed_smc_error("invalid address 0x%08x for CS%d segment : "
                          "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]",
-                         addr, fl->id, seg.addr, seg.addr + seg.size);
+                         addr, fl->cs, seg.addr, seg.addr + seg.size);
         addr %= seg.size;
     }
 
@@ -437,7 +437,7 @@ static uint32_t aspeed_smc_check_segment_addr(const AspeedSMCFlash *fl,
 static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
 {
     const AspeedSMCState *s = fl->controller;
-    uint32_t r_ctrl0 = s->regs[s->r_ctrl0 + fl->id];
+    uint32_t r_ctrl0 = s->regs[s->r_ctrl0 + fl->cs];
     uint32_t dummy_high = (r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1;
     uint32_t dummy_low = (r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3;
     uint32_t dummies = ((dummy_high << 2) | dummy_low) * 8;
@@ -506,7 +506,7 @@ static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
         aspeed_smc_error("invalid flash mode %d", aspeed_smc_flash_mode(fl));
     }
 
-    trace_aspeed_smc_flash_read(fl->id, addr, size, ret,
+    trace_aspeed_smc_flash_read(fl->cs, addr, size, ret,
                                 aspeed_smc_flash_mode(fl));
     return ret;
 }
@@ -563,7 +563,7 @@ static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
     AspeedSMCState *s = fl->controller;
     uint8_t addr_width = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
 
-    trace_aspeed_smc_do_snoop(fl->id, s->snoop_index, s->snoop_dummies,
+    trace_aspeed_smc_do_snoop(fl->cs, s->snoop_index, s->snoop_dummies,
                               (uint8_t) data & 0xff);
 
     if (s->snoop_index == SNOOP_OFF) {
@@ -616,7 +616,7 @@ static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
     AspeedSMCState *s = fl->controller;
     int i;
 
-    trace_aspeed_smc_flash_write(fl->id, addr, size, data,
+    trace_aspeed_smc_flash_write(fl->cs, addr, size, data,
                                  aspeed_smc_flash_mode(fl));
 
     if (!aspeed_smc_is_writable(fl)) {
@@ -668,12 +668,12 @@ static void aspeed_smc_flash_update_ctrl(AspeedSMCFlash *fl, uint32_t value)
     unselect = (value & CTRL_CMD_MODE_MASK) != CTRL_USERMODE;
 
     /* A change of CTRL_CE_STOP_ACTIVE from 0 to 1, unselects the CS */
-    if (!(s->regs[s->r_ctrl0 + fl->id] & CTRL_CE_STOP_ACTIVE) &&
+    if (!(s->regs[s->r_ctrl0 + fl->cs] & CTRL_CE_STOP_ACTIVE) &&
         value & CTRL_CE_STOP_ACTIVE) {
         unselect = true;
     }
 
-    s->regs[s->r_ctrl0 + fl->id] = value;
+    s->regs[s->r_ctrl0 + fl->cs] = value;
 
     s->snoop_index = unselect ? SNOOP_OFF : SNOOP_START;
 
@@ -1184,7 +1184,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
         snprintf(name, sizeof(name), TYPE_ASPEED_SMC ".flash.%d", i);
 
-        fl->id = i;
+        fl->cs = i;
         fl->controller = s;
         memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_ops,
                               fl, name, asc->segments[i].size);
-- 
2.31.1


