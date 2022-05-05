Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CC151BE58
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:44:20 +0200 (CEST)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZu7-000107-Dz
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nmZpx-0007CJ-Ew
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:40:01 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:59824)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nmZpu-0007ja-43
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651750798; x=1683286798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8dS1PT67125I2Gjo/88Oynj+576VIoAudaJTP8DXyoI=;
 b=Le3Q2v5FZ8vQGUjnjdkP0Qra2vBiZbfh+qTRLxVnsV0c6P/aRSVNWyIF
 w+hHzK23XRJ+9UabY2atDkYzYXRMgTscZ2Zn173/Qj/+eFRHKP8scDeJU
 3cHPomR55U+81GVwkCFAKQMUT68gmB8Cgj5wJLuNsksKosKjB1niQi7Jf k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 May 2022 04:39:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 04:39:55 -0700
Received: from qc-i7.qualcomm.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.47.97.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 5 May 2022
 04:39:54 -0700
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Radoslaw Biernacki
 <rad@semihalf.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2] hw/arm: add versioning to sbsa-ref machine DT
Date: Thu, 5 May 2022 12:39:47 +0100
Message-ID: <20220505113947.75714-1-quic_llindhol@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_llindhol@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sbsa-ref machine is continuously evolving. Some of the changes we
want to make in the near future, to align with real components (e.g.
the GIC-700), will break compatibility for existing firmware.

Introduce two new properties to the DT generated on machine generation:
- machine-version-major
  To be incremented when a platform change makes the machine
  incompatible with existing firmware.
- machine-version-minor
  To be incremented when functionality is added to the machine
  without causing incompatibility with existing firmware.
  to be reset to 0 when machine-version-major is incremented.

This versioning scheme is *neither*:
- A QEMU versioned machine type; a given version of QEMU will emulate
  a given version of the platform.
- A reflection of level of SBSA (now SystemReady SR) support provided.

The version will increment on guest-visible functional changes only,
akin to a revision ID register found on a physical platform.

These properties are both introduced with the value 0.
(Hence, a machine where the DT is lacking these nodes is equivalent
to version 0.0.)

Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Cédric Le Goater <clg@kaod.org>
---

Changes since v1:
- More detail added to commit message.
- Verbose comment added adjacent to code additions.

 hw/arm/sbsa-ref.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 2387401963..d0c25ddfcf 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -190,6 +190,20 @@ static void create_fdt(SBSAMachineState *sms)
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
 
+    /*
+     * This versioning scheme is for informing platform fw only. It is neither:
+     * - A QEMU versioned machine type; a given version of QEMU will emulate
+     *   a given version of the platform.
+     * - A reflection of level of SBSA (now SystemReady SR) support provided.
+     *
+     * machine-version-major: updated when changes breaking fw compatibility
+     *                        are introduced.
+     * machine-version-minor: updated when features are added that don't break
+     *                        fw compatibility.
+     */
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);
+
     if (ms->numa_state->have_numa_distance) {
         int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
         uint32_t *matrix = g_malloc0(size);
-- 
2.30.2


