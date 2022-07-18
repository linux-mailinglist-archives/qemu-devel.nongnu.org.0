Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A092F578163
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 13:57:51 +0200 (CEST)
Received: from localhost ([::1]:55102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPNm-0007LF-As
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 07:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oDPL1-0001ab-IU
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:55:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:58953)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oDPKw-0006AD-Cp
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658145294; x=1689681294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b5ykuol9EGNBtS3/ajkgKNXBlmko4i9vcxFpTSOxeeI=;
 b=FgVBABgIE70ymYMxpeRRRMCnlU5M6xGX+UMrs4sW75m/88zGD1tezEtn
 lnJKhAA9xcflaf5pHhCLVnnXemF9Az+0UMOqqeVR6fFrncOUYBwLh9JoI
 1WfZVbyy+wPe5TxcWqsP2XY87h0p9gVSKZD1/ktVWpS0tmcbVk4ozX1y8 4=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 18 Jul 2022 04:54:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 04:54:50 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 04:54:49 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 18 Jul 2022 04:54:48 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, Tobias Roehmel <quic_trohmel@quicinc.com>
Subject: [PATCH v2 0/9] Add Cortex-R52
Date: Mon, 18 Jul 2022 13:54:24 +0200
Message-ID: <20220718115433.802-1-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out.qualcomm.com
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

v2:
PATCH 1:
I have left the flag in for now because there there is a lot of use for it in the MPU translation code.
The PMSAv8r differs in quite a view ways from the implementation in the Cortex-M. I think using
!ARM_FEATURE_M in all of those cases might run into problems down the road when new things are added.
But I'll gladly change that if those concerns are not valid.
PATCH 2:
Patch was moved and I removed the ATCM... registers.
PATCH 3:
The issue here is that the R52 has the MPUIR register which shares the encoding with one of the
MIDR alias registers. It's now changed to not add that register for ARM_FEATURE_V8_R.
PATCH 4:
Added RVBAR for all v8 CPUs instead of just ARMv8r
PATCH 7:
Instead of setting TTBCR_EAE to 1, change all functions that rely on that value and are
relevant for Cortex-R52
PATCH 10:
SPSR_hyp changes removed
PATCH 11:
Removed the r52_machine. The issue with adding the Cortex-R52 to the virt board is that target_page.bits
is expected to be 12 but is set to 10 for ARM_FEATURE_PMSA. Simply changing that or using
virt2.7(which doesn't have that restriction) leads to problems with memory accesses. It might be
best to model an existing board.

These patches add the ARM Cortex-R52. The biggest addition is an implementation of the armv8-r MPU.

All information is taken from:
- ARM Cortex-R52 TRM revision r1p3
- ARM Architecture Reference Manual Supplement
    -ARMv8 for the ARMv8-R AArch32 architecture profile Version A.c

Functionality that is not implemented:
- Changing between single and double precision floats
- Some hypervisor related functionality (HCR.T(R)VM,HADFSR,...)

Tobias Röhmel (9):
  target/arm: Add ARM_FEATURE_V8_R
  target/arm: Don't add all MIDR aliases for Cortex-R
  target/arm: Make RVBAR available for all ARMv8 CPUs
  target/arm: Make stage_2_format for cache attributes optional
  target/arm: Add ARMCacheAttrs to the signature of pmsav8_mpu_lookup
  target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
  target/arm: Add PMSAv8r registers
  target/arm: Add PMSAv8r functionality
  target/arm: Add ARM Cortex-R52 cpu

 target/arm/cpu.c          |   6 +-
 target/arm/cpu.h          |  11 +++
 target/arm/cpu_tcg.c      |  42 +++++++++
 target/arm/debug_helper.c |   3 +-
 target/arm/helper.c       | 183 +++++++++++++++++++++++++++++++++++-
 target/arm/internals.h    |  16 ++--
 target/arm/m_helper.c     |   3 +-
 target/arm/ptw.c          | 191 ++++++++++++++++++++++++++++++++------
 target/arm/tlb_helper.c   |   3 +-
 9 files changed, 417 insertions(+), 41 deletions(-)

-- 
2.25.1


