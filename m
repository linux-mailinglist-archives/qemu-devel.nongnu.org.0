Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6D733AA9A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 05:57:38 +0100 (CET)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfIP-0008Df-LJ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 00:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfG1-0006R5-LK
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:55:11 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:45843)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfFy-0003uA-IB
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615784106; x=1647320106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B1990lTxkGx//MuKLvhCghNZ+3k3tRGjwGF7O7d5OBo=;
 b=HYJ1RXObV+ouK0S9+K/JESkL3jO6ATBLwbVTecOaOyw7Qks1hN0V2ULF
 MZQ2iwP8uEzd3dyxGuSW+A5OHJlynTyqBLxL0S9mQP7X2v7ddg3CS14ib
 K/CA2udB4KPvaC2H99TxFoVuePdA3B9tTA54uB8HuBvWV1eNYriqujH2v k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Mar 2021 21:55:05 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 14 Mar 2021 21:55:02 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 7F768C90; Sun, 14 Mar 2021 23:55:01 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) remove unnecessary semicolons
Date: Sun, 14 Mar 2021 23:55:00 -0500
Message-Id: <1615784100-26459-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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

Address feedback from Richard Henderson <<richard.henderson@linaro.org>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_tcg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index e044dea..a30048e 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -83,9 +83,9 @@
 #define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
-#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE;
+#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
-#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE;
+#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE
 #define fGEN_TCG_L2_loadrh_pr(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadrh_pi(SHORTCODE)       SHORTCODE
 #define fGEN_TCG_L2_loadri_pr(SHORTCODE)       SHORTCODE
-- 
2.7.4


