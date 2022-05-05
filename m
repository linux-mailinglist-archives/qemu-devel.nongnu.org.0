Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3151BE4F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:41:31 +0200 (CEST)
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZrN-0006r0-Ni
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nmZnv-0005Fq-2z
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:37:55 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:54636)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1nmZns-0007Kc-OR
 for qemu-devel@nongnu.org; Thu, 05 May 2022 07:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651750672; x=1683286672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KfdhKqcjfgpoTGtwR/CqeEOejIUJzirghrJv9mQvnP8=;
 b=S1uUUYaliP+ur3GwJVogIm0hTEOHkcbyCv4n2sGyM3Lh+PmP1YydkCq8
 XOIguRXcvpATkjeyADpMA4Fv4th0ZMsOI5OF5cudgRDCvLhKdH4uYNaVA
 uxW1YONF6sDI3zhUTQndoXmhi/RkLcynVY3pAdOmNhuvVQFD1ES0wgqtp o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 05 May 2022 04:37:49 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 04:37:49 -0700
Received: from qc-i7.qualcomm.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.47.97.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 5 May 2022
 04:37:47 -0700
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Leif Lindholm <leif@nuviainc.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] MAINTAINERS/.mailmap: update email for Leif Lindholm
Date: Thu, 5 May 2022 12:37:40 +0100
Message-ID: <20220505113740.75565-1-quic_llindhol@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NUVIA was acquired by Qualcomm in March 2021, but kept functioning on
separate infrastructure for a transitional period. We've now switched
over to contributing as Qualcomm Innocation Center (quicinc), so update
my email address to reflect this.

Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---

Changes since v1:
- Redirect both historic addresses to quicinc.com.

 .mailmap    | 3 ++-
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 2976a675ea..8c326709cf 100644
--- a/.mailmap
+++ b/.mailmap
@@ -62,7 +62,8 @@ Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
-Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
+Leif Lindholm <quic_llindhol@quicinc.com> <leif.lindholm@linaro.org>
+Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>
 Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
 Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 218c9459b6..cd013850c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -889,7 +889,7 @@ F: include/hw/ssi/imx_spi.h
 SBSA-REF
 M: Radoslaw Biernacki <rad@semihalf.com>
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Leif Lindholm <leif@nuviainc.com>
+R: Leif Lindholm <quic_llindhol@quicinc.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
-- 
2.30.2


