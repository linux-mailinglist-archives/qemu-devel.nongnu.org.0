Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2223DB1C4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 05:09:57 +0200 (CEST)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9IuJ-0006qo-D1
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 23:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m9It7-0004YA-8x; Thu, 29 Jul 2021 23:08:41 -0400
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252]:51468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m9It5-0000N0-BC; Thu, 29 Jul 2021 23:08:41 -0400
IronPort-SDR: pkEpPCrxCbA0DLr1B6QEVvon00pb8BhVRbvR2bTwf+T4Air9H4DuGFGi4uXkZT5SIn4kh1YrAI
 koaQ4qzQMB1fXDsdnID87Ng96Az4MlA9ovy71kJj9hxLF/Volbr1WcW9IeMYYJomjtjXv82+a+
 IRHQ03QJkpFfeiHh+ronFajBWKIovHjktcEkC1E3akxyOvj0ywO06p3Ofe39EeHMF8ttpZEsqC
 q5JlsaV8V13RlR8A+h5C7/yp/UW80YPc6aFGl4hE86Fnh71Tqtc8qoAW17swp3kmXvRm/laRGw
 ePqPEj6viTjcWdpPkKml4mZ9
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="17133618"
X-IronPort-AV: E=Sophos;i="5.84,280,1620658800"; d="scan'208";a="17133618"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 30 Jul 2021 12:08:35 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EECF46ABE3;
 Fri, 30 Jul 2021 12:08:34 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E1CCF0A25;
 Fri, 30 Jul 2021 12:08:34 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om3.fujitsu.com (Postfix) with ESMTP id 28FA44007084D;
 Fri, 30 Jul 2021 12:08:34 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target-arm: cpu64: Add support for Fujitsu A64FX
Date: Fri, 30 Jul 2021 12:08:20 +0900
Message-Id: <20210730030821.231106-3-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
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
Cc: ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove unused definitions, change of appearance and fix for patch consistency
https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg04789.html
https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg04790.html

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 docs/system/arm/virt.rst | 1 -
 hw/arm/virt.c            | 1 -
 target/arm/cpu64.c       | 9 +++------
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 5329e952cf..27652adfae 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -55,7 +55,6 @@ Supported guest CPU types:
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
-- ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3b8a26a420..81eda46b0b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -202,7 +202,6 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
-    ARM_CPU_TYPE_NAME("a64fx"),
 };
 
 static bool cpu_type_valid(const char *cpu)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dd72300e88..2b66e30133 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -847,10 +847,6 @@ static void aarch64_max_initfn(Object *obj)
                         cpu_max_set_sve_max_vq, NULL, NULL);
 }
 
-static const ARMCPRegInfo a64fx_cp_reginfo[] = {
-    /* TODO  Add A64FX specific HPC extensinos registers */
-    REGINFO_SENTINEL
-};
 static void aarch64_a64fx_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -887,19 +883,20 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    define_arm_cp_regs(cpu, a64fx_cp_reginfo);
+    /* TODO:  Add A64FX specific HPC extension registers */
 
     aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
+
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
-    { .name = "max",                .initfn = aarch64_max_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
+    { .name = "max",                .initfn = aarch64_max_initfn },
 };
 
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
-- 
2.27.0


