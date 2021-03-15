Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A100E33AA9F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 05:59:03 +0100 (CET)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfJm-00025x-NO
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 00:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfGC-0006YX-JM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:55:20 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:17025)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfGA-00040q-Ez
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615784118; x=1647320118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KZY8h9xvBDeKK+YqRGLf6UhI3mcUaJGUBBOmHKm75RM=;
 b=mf42Ms7nYiwGTUTMMAC/5NSvz62T0yrcHMhch8IVT8ZcpCuoOSSpQwKm
 nGnPH5edSBUyzJ74Cn5JBeJ90rTCoqE9fBvLkdCxHdUtQ4e1x1Mk5mb+c
 uvesunCzwN543hjBz4K/HAQJ9ld1OIyrTXUn6rADuHGL+yDr2frAbyYVV U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Mar 2021 21:55:17 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 14 Mar 2021 21:55:16 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 82195C90; Sun, 14 Mar 2021 23:55:16 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) fix typo in comment
Date: Sun, 14 Mar 2021 23:55:15 -0500
Message-Id: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, tsimpson@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-of-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 9f19007..7361a07 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -297,7 +297,7 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
 }
 
 /*
- * Hexagon FP operations return ~0 insteat of NaN
+ * Hexagon FP operations return ~0 instead of NaN
  * The hex_check_sfnan/hex_check_dfnan functions perform this check
  */
 static float32 hex_check_sfnan(float32 x)
-- 
2.7.4


