Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B623B3B72E6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:04:32 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDPj-0001oT-At
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1ly9K7-0002dn-QA; Tue, 29 Jun 2021 04:42:27 -0400
Received: from ex13-edg-ou-002.vmware.com ([208.91.0.190]:33762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <hnick@vmware.com>)
 id 1ly9K5-0006YL-Tr; Tue, 29 Jun 2021 04:42:27 -0400
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 29 Jun 2021 01:27:14 -0700
Received: from bos2-arm-build.eng.vmware.com (bos2-arm-build.eng.vmware.com
 [10.118.233.19])
 by sc9-mailhost2.vmware.com (Postfix) with SMTP id 107202022A;
 Tue, 29 Jun 2021 01:27:13 -0700 (PDT)
Received: by bos2-arm-build.eng.vmware.com (sSMTP sendmail emulation);
 Tue, 29 Jun 2021 09:27:13 +0100
From: <hnick@vmware.com>
To: 
Subject: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Date: Tue, 29 Jun 2021 09:27:13 +0100
Message-ID: <20210629082713.31396-1-hnick@vmware.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: hnick@vmware.com does not
 designate permitted sender hosts)
Received-SPF: pass client-ip=208.91.0.190; envelope-from=hnick@vmware.com;
 helo=EX13-EDG-OU-002.vmware.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Jun 2021 08:59:26 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Nick Hudson <hnick@vmware.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Nick Hudson <hnick@vmware.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a66c1f0b9e..7267af7924 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      * We don't implement the configurable EL0 access.
      */
     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
+      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
       .type = ARM_CP_ALIAS,
       .access = PL1_R, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
-- 
2.17.1


