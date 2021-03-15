Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C3E33AA97
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 05:55:44 +0100 (CET)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfGZ-00067q-6Z
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 00:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfF9-0004oY-1d
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:54:15 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:6839)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfF7-0003Mn-EC
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615784053; x=1647320053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j7k23yGUe9T6ctDwbywBKwiZR+6e51RIBDjodvK+mfo=;
 b=LnwXlX5cMVs85hbimyqFOrKgLth/hIcILKiQ+SOYm6gy+MVEcQ+Q26eg
 UeLvqCzZYnwWRI8ecsUkacBxsNMIiWjttR9z1F2lYUyFpUZuSEUW8gQCH
 +oo51CuscgTG4QCMLg8cTXWLt7weDao3eaaVUJSv3vVdHzRZvIoWLpZu1 s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Mar 2021 21:54:12 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 14 Mar 2021 21:54:11 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 8A64CC90; Sun, 14 Mar 2021 23:54:11 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) change DECODE_MAPPED_REG operand
 name to OPNUM
Date: Sun, 14 Mar 2021 23:54:09 -0500
Message-Id: <1615784049-26215-1-git-send-email-tsimpson@quicinc.com>
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
 target/hexagon/decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
index c9bacaa..1c9c074 100644
--- a/target/hexagon/decode.c
+++ b/target/hexagon/decode.c
@@ -48,8 +48,8 @@ enum {
 DEF_REGMAP(R_16,  16, 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23)
 DEF_REGMAP(R__8,  8,  0, 2, 4, 6, 16, 18, 20, 22)
 
-#define DECODE_MAPPED_REG(REGNO, NAME) \
-    insn->regno[REGNO] = DECODE_REGISTER_##NAME[insn->regno[REGNO]];
+#define DECODE_MAPPED_REG(OPNUM, NAME) \
+    insn->regno[OPNUM] = DECODE_REGISTER_##NAME[insn->regno[OPNUM]];
 
 typedef struct {
     const struct DectreeTable *table_link;
-- 
2.7.4


