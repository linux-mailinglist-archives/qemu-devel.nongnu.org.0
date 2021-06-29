Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11F3B72EF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:06:22 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDRU-0003xx-6X
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@hnick-a01.vmware.com>)
 id 1ly9Ys-0000Qy-9J; Tue, 29 Jun 2021 04:57:42 -0400
Received: from host5-81-53-87.range5-81.btcentralplus.com ([5.81.53.87]:64269
 helo=hnick-a01.vmware.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hnick@hnick-a01.vmware.com>)
 id 1ly9Yq-0007xP-Nq; Tue, 29 Jun 2021 04:57:42 -0400
Received: by hnick-a01.vmware.com (Postfix, from userid 501)
 id 00C0CBDE2ED; Tue, 29 Jun 2021 09:15:51 +0100 (BST)
From: Nick Hudson <hnick@vmware.com>
To: 
Subject: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Date: Tue, 29 Jun 2021 09:15:51 +0100
Message-Id: <20210629081551.14133-1-hnick@vmware.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=5.81.53.87;
 envelope-from=hnick@hnick-a01.vmware.com; helo=hnick-a01.vmware.com
X-Spam_score_int: 27
X-Spam_score: 2.7
X-Spam_bar: ++
X-Spam_report: (2.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.301,
 RCVD_IN_PBL=3.335, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Jun 2021 08:59:28 -0400
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
2.31.1


