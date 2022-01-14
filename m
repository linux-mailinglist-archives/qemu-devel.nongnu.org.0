Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71848E56E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:18:56 +0100 (CET)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HnT-0004KI-IC
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1n8GwX-00020n-Do; Fri, 14 Jan 2022 02:24:13 -0500
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252]:22606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1n8GwV-0002x5-9G; Fri, 14 Jan 2022 02:24:13 -0500
IronPort-SDR: SLemEI3a07OYuzkM0iWbffbogRQnllrBCGRRim8Pb8+QZBI+Vv7Ut164PNdLyzHFpRu47ca+T8
 eZkRwSDbvnBXQt0UO9DotvlpChk5fIW8Q+cdINBfgkJ6HvyFNd9SmZ7kIIw/vCy4jnfKSYa82b
 DendjtO3Elo1/lCE/sEhTONFt7dClZls6TXoBP0UA7E1B7tnWPfjrm0B8BaZISuzTkP0QwXZFO
 +s0IIe7x8Ax5OZha7yr501dcquvpTS8EfZJHHP02gkqdGPVwZBM8np1C7dgtQDM0Ukq/k3J0u1
 Hzedj3nCcbjD39jYxmEhpDWM
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="37952417"
X-IronPort-AV: E=Sophos;i="5.88,287,1635174000"; d="scan'208";a="37952417"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 14 Jan 2022 16:24:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68310E6CA1;
 Fri, 14 Jan 2022 16:24:04 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AD26BDA89;
 Fri, 14 Jan 2022 16:24:03 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om2.fujitsu.com (Postfix) with ESMTP id 714C1404558A4;
 Fri, 14 Jan 2022 16:24:03 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org, mst@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Default enable the virtualization option(VHE) on
 A64FX
Date: Fri, 14 Jan 2022 16:24:37 +0900
Message-Id: <20220114072438.3085054-1-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: neutral client-ip=139.138.61.252;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa7.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At A64FX specification, VHE is enabled by default, so
the virtualization option should be enabled when -cpu a64fx
is specified.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 hw/arm/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b45b52c90e..56acf5cc7e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1932,6 +1932,12 @@ static void machvirt_init(MachineState *machine)
     firmware_loaded = virt_firmware_init(vms, sysmem,
                                          secure_sysmem ?: sysmem);
 
+    /* A64FX proceesor is supported the ARMv8.1-VHE */
+    if (!vms->virt &&
+            !strncmp(machine->cpu_type, ARM_CPU_TYPE_NAME("a64fx"), 13)) {
+        vms->virt = true;
+    }
+
     /* If we have an EL3 boot ROM then the assumption is that it will
      * implement PSCI itself, so disable QEMU's internal implementation
      * so it doesn't get in the way. Instead of starting secondary
-- 
2.27.0


