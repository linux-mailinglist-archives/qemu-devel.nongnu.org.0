Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2BD3A5A95
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:19:27 +0200 (CEST)
Received: from localhost ([::1]:52650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsXVu-0001KU-U5
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXT7-0005cB-Mb
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:33 -0400
Received: from mr85p00im-ztdg06021101.me.com ([17.58.23.180]:55117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXT6-0001R4-3w
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623618991; bh=SYeyreoJ2Lw38+CIeH/PXgqofHJhNw7AEVREYG0+pfo=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=IcU7sJnPlsAfNKDh1BQo2Bw6NVaZmIdC4MPPVA3RzCy7WKxUohL+f/TojmV/m61ES
 aHU3cUUouofdJMN1MygGpk/r6CmdKvoA+P5S4GbL0+SQI23/AJ1Xbw9Loc7GmOQoJn
 RjBHvCGqRGWqH+LuL9WVnKbqm3sR0Vzir6Ey+pt+QU3nPYpb0DikH4HQOQz80vCdTN
 S0DJmMJqVV80VPQ0NL9xbhMfbGcn7JdPttxv/Q3yaRih4esA+uXD6WhazkuDGjsFIL
 Rl5sStCOnoh0qGiPIGCWvCW9tsyetBkehXW5pV0aAW3OfcpaKRGOU3haY6/rX88nN5
 uDvJ20onJI/6g==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id B625E340545;
 Sun, 13 Jun 2021 21:16:30 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>,
	richard.henderson@linaro.org
Subject: [PATCH 2/4] alpha: Set minimum PCI device ID to 1 to match Clipper
 IRQ mappings.
Date: Sun, 13 Jun 2021 14:15:47 -0700
Message-Id: <20210613211549.18094-3-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210613211549.18094-1-thorpej@me.com>
References: <20210613211549.18094-1-thorpej@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-13=5F09:2021-06-11=5F06,2021-06-13=5F09,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106130151
Received-SPF: pass client-ip=17.58.23.180; envelope-from=thorpej@me.com;
 helo=mr85p00im-ztdg06021101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we are emulating a Clipper device topology, we need to set the
minimum PCI device ID to 1, as there is no IRQ mapping for a device
at ID 0 (see sys_dp264.c:clipper_map_irq()).

- Add a 'devfn_min' argument to typhoon_init().  Pass that argument
  along to pci_register_root_bus().
- In clipper_init(), pass PCI_DEVFN(1, 0) as the minimum PCI device
  ID/function.

Signed-off-by: Jason Thorpe <thorpej@me.com>
---
 hw/alpha/alpha_sys.h | 2 +-
 hw/alpha/dp264.c     | 5 +++--
 hw/alpha/typhoon.c   | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index e2c02e2bbe..4835b3d5ee 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -11,7 +11,7 @@
 
 
 PCIBus *typhoon_init(MemoryRegion *, ISABus **, qemu_irq *, AlphaCPU *[4],
-                     pci_map_irq_fn);
+                     pci_map_irq_fn, uint8_t devfn_min);
 
 /* alpha_pci.c.  */
 extern const MemoryRegionOps alpha_pci_ignore_ops;
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 1017ecf330..ac97104464 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -76,9 +76,10 @@ static void clipper_init(MachineState *machine)
     cpus[0]->env.trap_arg1 = 0;
     cpus[0]->env.trap_arg2 = smp_cpus;
 
-    /* Init the chipset.  */
+    /* Init the chipset.  Because we're using CLIPPER IRQ mappings,
+       the minimum PCI device IdSel is 1.  */
     pci_bus = typhoon_init(machine->ram, &isa_bus, &rtc_irq, cpus,
-                           clipper_pci_map_irq);
+                           clipper_pci_map_irq, PCI_DEVFN(1, 0));
 
     /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
     mc146818_rtc_init(isa_bus, 1900, rtc_irq);
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 87020cbe0d..fa31a2f286 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -815,7 +815,8 @@ static void typhoon_alarm_timer(void *opaque)
 }
 
 PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
-                     AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq)
+                     AlphaCPU *cpus[4], pci_map_irq_fn sys_map_irq,
+                     uint8_t devfn_min)
 {
     MemoryRegion *addr_space = get_system_memory();
     DeviceState *dev;
@@ -885,7 +886,7 @@ PCIBus *typhoon_init(MemoryRegion *ram, ISABus **isa_bus, qemu_irq *p_rtc_irq,
     b = pci_register_root_bus(dev, "pci",
                               typhoon_set_irq, sys_map_irq, s,
                               &s->pchip.reg_mem, &s->pchip.reg_io,
-                              0, 64, TYPE_PCI_BUS);
+                              devfn_min, 64, TYPE_PCI_BUS);
     phb->bus = b;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-- 
2.30.2


