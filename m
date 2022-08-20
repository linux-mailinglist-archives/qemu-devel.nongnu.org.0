Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2F59AEB3
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 16:37:27 +0200 (CEST)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPPbJ-0002wN-NM
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 10:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK8-0005DO-6e
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:40 -0400
Received: from mail-out-3.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:48]:17474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1oPPK2-0003ls-Fh
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 10:19:39 -0400
X-IPAS-Result: =?us-ascii?q?A2DlBABk7ABj/5sagoZaHgEBCxIMQIZNhE6RDIEWnASBa?=
 =?us-ascii?q?AsBAQEBAQEBAQEIAUIEAQGFAwIChGQmOBMBAgQBAQEBAwIDAQEBAQEBAwEBB?=
 =?us-ascii?q?gEBAQEBAQYEgRyFL0aGRScPAUEFLQMFAiYCSxQOBYJ9gyOpGoExgQGEcIUSC?=
 =?us-ascii?q?QGBByyIEIIah3uBFYJzhR83MIMJgmUEliiDJhw4AwkEBwUsHkIDCx8OFgUIC?=
 =?us-ascii?q?RcSEBACBBEaCwYDFj4JAgQOA0AIDQMRBAMPGAkSCBAEBgMxDCULAxQMAQYDB?=
 =?us-ascii?q?gUDAQMbAxQDBSQHAxkPIw0NBB8MAwMFJQMCAhsHAgIDAgYVBgICNhg5CAQIB?=
 =?us-ascii?q?CsjDwUCBy8FBC8CHgQFBhEIAhYCBgQEBAQVAhAIAggnFwcTMxkBBTInEAkhH?=
 =?us-ascii?q?CgQBQYTAyBvBQc+DygzNTkrHRsKgRIqKRUDBAQDAgYTAwMiAhAuMQMVBikTE?=
 =?us-ascii?q?i0HK3UJAgMibgMDBCgsAwk+BwkiJj0FBVs6BQMDECI9BgMJAwIpPJsMAYEPS?=
 =?us-ascii?q?4EwPgU7GsFAB4IWoUlMlnECkgGXB6I1WoQnAgQCBAUCFoF4gX5xgzZRFwIPn?=
 =?us-ascii?q?HJzOwIGAQoBAQMJilwBAQ?=
IronPort-Data: A9a23:1hZCFa1p5Bh/B07xp/bD5W5zkn2cJEfYwER7XKvMYLTBsI5bpzFRm
 zAXCG7Xa/zeY2qhc98nat6woEJT7cDQzNNhQVdt3Hw8FHgiRegppDi6BhqqY3nCfpWroGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9BGQ7InQLlbGILes1htZGEk1E0/NtTo5w7Rj2t4y2YDja++wk
 YqaT/P3aQfNNwFcbzp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFontR5fMebS4K8bhL
 wr15OzjojmJr09F5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2Pc0MS9qZzu1c99Z6
 40Uu8yCSCQVYO7SpdYBSiZHHHk9MvgTkFPHCSDXXc279XL6U1bchs40SWtwJ5IE+qN+DSdC+
 JT0KhhUNUzF3rnuhujlDLAx26zPL+GyVG8bkm1nxzDQFrA8Rp3DRqjOzcVHwDd1j8lFHfvYI
 cYUAdZqRE2eM00QYQ9PUvrSms+xvSD+WQRJiW6IhqAG7GfQ6BYo27nUZY+9ltuiAJ89clyjj
 nvL+nm8DhwEOdi3zz2D/XSxwOjVkkvTQI8OGaf+8/d7jFCXwkQXCRsfT1z9puO24nNSQPpFN
 FAU9zprtvJ3/gqxUcX9GhS05nKJ1vIBZ+dt/yQBwFnl4sLpD8yxXwDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:STOvd6OtiZsGwsBcTuejsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYU8qKRMdcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnPDf6gylNyri9vNMkY
 dMGpIOcuEZADJB/KHHCAXTKadF/DGMmprY4Ns3wB1WPGdXgnhbnn5E49CgYzVLeDU=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,251,1654552800"; d="scan'208";a="168873002"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 20 Aug 2022 16:19:27 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:e70b:29db:1db5:28bf)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Sat, 20 Aug 2022 16:19:25 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v3 0/9] Add ARM Cortex-R52 cpu
Date: Sat, 20 Aug 2022 16:19:05 +0200
Message-ID: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e70b:29db:1db5:28bf]
X-ClientProxiedBy: rwthex-w4-b.rwth-ad.de (2a00:8a60:1:e500::26:167) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:48;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-3.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Thanks for the review!
Here is v3:

v3:
PATCH 2 (Don't add all MIDR aliases for cores that immplement PMSA):
fixed the comment and changed to single element instead of array.
Also the alias is not added for all PMSA CPUs as Peter suggested.
PATCH 3 (Make RVBAR available for all ARMv8 CPUs):
Added the missing RVBAR register as alias to RVBAR_ELx.
Tested that this code actually takes the lower 32 bits
of RVBAR_ELx as RVBAR.

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
  target/arm: Don't add all MIDR aliases for cores that immplement PMSA
  target/arm: Make RVBAR available for all ARMv8 CPUs
  target/arm: Make stage_2_format for cache attributes optional
  target/arm: Add ARMCacheAttrs to the signature of pmsav8_mpu_lookup
  target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
  target/arm: Add PMSAv8r registers
  target/arm: Add PMSAv8r functionality
  target/arm: Add ARM Cortex-R52 cpu

 target/arm/cpu.c          |   6 +-
 target/arm/cpu.h          |  11 ++
 target/arm/cpu_tcg.c      |  42 +++++++
 target/arm/debug_helper.c |   3 +-
 target/arm/helper.c       | 223 +++++++++++++++++++++++++++++++++++---
 target/arm/internals.h    |  16 +--
 target/arm/m_helper.c     |   3 +-
 target/arm/ptw.c          | 191 +++++++++++++++++++++++++++-----
 target/arm/tlb_helper.c   |   3 +-
 9 files changed, 444 insertions(+), 54 deletions(-)

-- 
2.25.1


