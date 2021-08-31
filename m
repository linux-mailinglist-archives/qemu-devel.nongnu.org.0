Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA93FC43A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 10:34:24 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKzDr-0004VH-NX
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 04:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9V-0005tk-TQ; Tue, 31 Aug 2021 04:29:55 -0400
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252]:60598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9P-0007xM-Ra; Tue, 31 Aug 2021 04:29:51 -0400
IronPort-SDR: OBLYWRqgT2DDPQ1ax6Ika7sto3GDry/BdcXyYTTS9VY7vF+gtA872Cr9PpmtED2FMNWdVAylM+
 PB4pGD+BM+0BfCM9yLfc8ko6APFEoV2m7RiVsdCG7Pje0oj3aNTUfTFyqqFS5WJ+nhRGFOWlC1
 F95Uy+52bmmWpy/pbp6cXWZKzcK3k3uXe1eJkrLPiWKcQdtD7EUP0GYJ463PmQeLh2wMfJizDF
 Ay3rwZ2th8e9ZhQU3K5xfXzOEUH6SXSa3sAslIpJt/IQcemyUPvj+Ku0uXp4Hj6ukNXDAqmhDi
 GA8gDXWOYvYY1kcUr2k87B0r
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="21313590"
X-IronPort-AV: E=Sophos;i="5.84,365,1620658800"; d="scan'208";a="21313590"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa7.hc1455-7.c3s2.iphmx.com with ESMTP; 31 Aug 2021 17:29:43 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4430D6CCAB;
 Tue, 31 Aug 2021 17:29:43 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90CBF56F9A;
 Tue, 31 Aug 2021 17:29:42 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om3.fujitsu.com (Postfix) with ESMTP id 6039040198668;
 Tue, 31 Aug 2021 17:29:42 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v6 2/3] hw/arm/virt: target-arm: Add A64FX processor support
 to virt machine
Date: Tue, 31 Aug 2021 17:29:39 +0900
Message-Id: <20210831082940.2811719-3-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
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
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add -cpu a64fx to use A64FX processor when -machine virt option is specified.
In addition, add a64fx to the Supported guest CPU types in the virt.rst document.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 docs/system/arm/virt.rst | 1 +
 hw/arm/virt.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 59acf0eeaf..850787495b 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -55,6 +55,7 @@ Supported guest CPU types:
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
+- ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 86c8a4ca3d..3fa4295a78 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.27.0


