Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3029511CCD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 20:31:45 +0200 (CEST)
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njmRy-0004fg-Ma
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 14:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1njmQ8-0003nt-HL; Wed, 27 Apr 2022 14:29:48 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:59600)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1njmQ6-0002LV-AS; Wed, 27 Apr 2022 14:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651084186; x=1682620186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uvEVLcjbte7FUnGEr0kc8pgLqVSnOIhic38bp6Hg524=;
 b=U3EHf78wisQIVfjux26UYA0h+J5bA7SH1aQ/bczLmFldFIanqWDlEIxh
 P3ohe6mCE0770JyPICpbwNaW+Z+fkSdr3MCpXzc/ZG7o55FGmIhJ2TuzI
 ILrG33EiY3gUeAQWN+qOgYIfWe0c4XuGQuY79MmRdFB4WNOz+55MWTUnT Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Apr 2022 11:29:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 11:29:43 -0700
Received: from qc-i7.qualcomm.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.47.97.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 11:29:41 -0700
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] hw/arm: add versioning to sbsa-ref machine DT
Date: Wed, 27 Apr 2022 19:29:34 +0100
Message-ID: <20220427182934.27075-1-quic_llindhol@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.47.97.222)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_llindhol@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Radoslaw Biernacki <rad@semihalf.com>
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

These properties are both introduced with the value 0.
(Hence, a machine where the DT is lacking these nodes is equivalent
to version 0.0.)

Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/sbsa-ref.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 2387401963..e05f6056c7 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -190,6 +190,9 @@ static void create_fdt(SBSAMachineState *sms)
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
 
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);
+
     if (ms->numa_state->have_numa_distance) {
         int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
         uint32_t *matrix = g_malloc0(size);
-- 
2.30.2


