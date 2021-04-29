Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F145336E3B9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 05:33:29 +0200 (CEST)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbxQf-00040E-3w
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 23:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lbxPl-0003Yw-NV
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:32:33 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:24830)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lbxPh-0002m1-JR
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1619667149; x=1651203149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=clghu7n79jLu/7CbDeVQDoc0FArKq45SbeKhoJHwJ7I=;
 b=TSrh4n+evHoRmm5ADAwd36GK8RwbLBOyRSd9PdhcJXq09tzfpelr6f8V
 6eezVQ7FrbxMs5FxdLEkbN6QTrVpw22eyGlkXlyIUAOh1sutM3+rKqEpH
 vxJHTduGT2h6DlK+CoGxWolUIdvsW0BFLXyyfNe5H+6Eaai/5nUs6Prv0 c=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Apr 2021 20:32:26 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg04-sd.qualcomm.com with ESMTP; 28 Apr 2021 20:32:25 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0389B8FF; Wed, 28 Apr 2021 22:32:25 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) remove unused functions
Date: Wed, 28 Apr 2021 22:32:22 -0500
Message-Id: <1619667142-29636-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove gen_read_reg and gen_set_byte

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/genptr.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 55c7cd8..f93f895 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -28,12 +28,6 @@
 #undef QEMU_GENERATE
 #include "gen_tcg.h"
 
-static inline TCGv gen_read_reg(TCGv result, int num)
-{
-    tcg_gen_mov_tl(result, hex_gpr[num]);
-    return result;
-}
-
 static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
 {
     tcg_gen_mov_tl(pred, hex_pred[num]);
@@ -319,11 +313,6 @@ static inline void gen_set_half_i64(int N, TCGv_i64 result, TCGv src)
     tcg_temp_free_i64(src64);
 }
 
-static inline void gen_set_byte(int N, TCGv result, TCGv src)
-{
-    tcg_gen_deposit_tl(result, result, src, N * 8, 8);
-}
-
 static void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
 {
     TCGv_i64 src64 = tcg_temp_new_i64();
-- 
2.7.4


