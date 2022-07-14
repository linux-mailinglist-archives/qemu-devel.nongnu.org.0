Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F279575399
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:01:09 +0200 (CEST)
Received: from localhost ([::1]:35458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC2D6-0000y6-B9
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 13:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0EU-0000ok-OF
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:27 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:23126)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0EL-0002nG-8v
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657810457; x=1689346457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BoaBosvleHxK9xy4H22GSn5PxcrgH4jri4jtzLeNm6U=;
 b=n63h22dTi2t1qh0Vo51ZXxrVY1zkyIC2dmW7DhjLFKOikd7TfepU8Wro
 Elo7oQelVoif0N9NlXrf+gzx9rBZy/qrjcb9AZdfvU1BSMDMsG9+zqsL3
 TkHBrPJP1OjQghOpYl+aWTieFyOEYMZk8NHNJi35qubKvksTCQK+rW+Ea I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Jul 2022 07:54:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 07:54:13 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:13 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:11 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, Tobias Roehmel <quic_trohmel@quicinc.com>
Subject: [PATCH 00/11] Add Cortex-R52
Date: Thu, 14 Jul 2022 16:53:44 +0200
Message-ID: <20220714145355.7225-1-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jul 2022 12:46:13 -0400
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

These patches add the ARM Cortex-R52. The biggest addition is
an implementation of the armv8-r MPU.
The last patch adds a machine that combines the new core with
an UART and a GIC. This machine can run many samples of
the Zephyr OS.

All information is taken from:
- ARM Cortex-R52 TRM revision r1p3
- ARM Architecture Reference Manual Supplement
    -ARMv8 for the ARMv8-R AArch32 architecture profile Version A.c

Functionality that is not implemented:
- Changing between single and double precision floats
- Some hypervisor related functionality (HCR.T(R)VM,HADFSR,...)

Tobias Röhmel (11):
  target/arm: Add ARM_FEATURE_V8_R
  target/arm: Add ARM Cortex-R52 cpu
  target/arm: Add v8R MIDR register
  target/arm: Make RVBAR available for non AARCH64 CPUs
  target/arm: Make stage_2_format for cache attributes optional
  target/arm: Add ARMCacheAttrs to the signature of pmsav8_mpu_lookup
  target/arm: Enable TTBCR_EAE for ARM_FEATURE_V8_R
  target/arm Add PMSAv8r registers
  target/arm: Add PMSAv8r functionality
  target/arm: Make SPSR_hyp accessible for Cortex-R52
  hw/arm: Add R52 machine

 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |   5 +
 hw/arm/meson.build                      |   1 +
 hw/arm/r52_machine.c                    | 133 +++++++++++++++
 hw/arm/r52_virt.c                       | 217 ++++++++++++++++++++++++
 include/hw/arm/r52_virt.h               |  61 +++++++
 target/arm/cpu.c                        |  10 +-
 target/arm/cpu.h                        |  11 ++
 target/arm/cpu_tcg.c                    |  54 ++++++
 target/arm/helper.c                     | 184 +++++++++++++++++++-
 target/arm/internals.h                  |  13 +-
 target/arm/m_helper.c                   |   3 +-
 target/arm/op_helper.c                  |   8 +
 target/arm/ptw.c                        | 191 ++++++++++++++++++---
 target/arm/translate.c                  |   5 +-
 15 files changed, 859 insertions(+), 38 deletions(-)
 create mode 100644 hw/arm/r52_machine.c
 create mode 100644 hw/arm/r52_virt.c
 create mode 100644 include/hw/arm/r52_virt.h

-- 
2.25.1


