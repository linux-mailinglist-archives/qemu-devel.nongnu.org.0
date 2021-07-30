Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA13DB1CF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 05:11:10 +0200 (CEST)
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9IvV-0001rs-PM
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 23:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m9It5-0004U3-J4; Thu, 29 Jul 2021 23:08:39 -0400
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253]:10394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m9It4-0000LS-0O; Thu, 29 Jul 2021 23:08:39 -0400
IronPort-SDR: uQFik81F3B4PUk9z3hK/ESJ7SrbSborC0l5/d3xsJFA1erIxXMYCGF3LAyJs86dB3pi/yn7bU/
 2PU9E2rJfUg8vgF2z1l/Ho1gRYuU55GR/Qn6nRY0aTd6wb/ZWP/h+EbBAXOaEJF6828c5X8nOS
 QB5Owa1tETXZEoGC7GvNO+wRJufDK0+P2RTV0MSVZHr26+MYSdNRO6FTiqNzmzfkInSr8Gx3jn
 xYSt9ZIRLORRYju7WsceqMGqdlKsPBDPz+Z9tCWjP1czpf5PU9iFiLrfpy1IXNRTSB6fJ424TH
 M6lFOXFDi19roAET46dQnA5d
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="26286142"
X-IronPort-AV: E=Sophos;i="5.84,280,1620658800"; d="scan'208";a="26286142"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa8.hc1455-7.c3s2.iphmx.com with ESMTP; 30 Jul 2021 12:08:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CE6496C9A6;
 Fri, 30 Jul 2021 12:08:33 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1023F6CA7F;
 Fri, 30 Jul 2021 12:08:33 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om3.fujitsu.com (Postfix) with ESMTP id AE4904007084D;
 Fri, 30 Jul 2021 12:08:32 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target-arm: delete ARM_FEATURE_A64FX
Date: Fri, 30 Jul 2021 12:08:19 +0900
Message-Id: <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: neutral client-ip=139.138.61.253;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa8.hc1455-7.c3s2.iphmx.com
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

The ARM_FEATURE_A64FX property was added,
but there is no function that uses this property yet,
so it will be removed until a function that uses it is added.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 target/arm/cpu.h   | 1 -
 target/arm/cpu64.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1b0c7b91ec..9f0a5f84d5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2145,7 +2145,6 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
     ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
-    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor HPC extensions support */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a15f9c0c55..dd72300e88 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -856,7 +856,6 @@ static void aarch64_a64fx_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     cpu->dtb_compatible = "arm,a64fx";
-    set_feature(&cpu->env, ARM_FEATURE_A64FX);
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-- 
2.27.0


