Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375635915D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 03:24:15 +0200 (CEST)
Received: from localhost ([::1]:51792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUfsc-0000Xx-7U
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 21:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfdW-0006XM-Ta
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:38 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6259)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfdV-0001DR-4R
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617930517; x=1649466517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ED/WXV/vDcybZkRJKhvSY84juapDoZ5oCSBTBaK0Bds=;
 b=F1FG2ZT1peQHGElGPxjT5mJsHdZ3tjzHGPiiImYvNld/SeZBi6Zcd/2V
 8oWUV4X3+BPOoFWLfoRg0j1AIWRf5uW/qyWxAZDeU5/Z4TP70Wu0tDGdL
 RWLCTz2Xz7uwhdI1wWRzIIyU4p3j34hM1OLFMDn8opCiMQjYqlaGJCPLF c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2021 18:07:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 08 Apr 2021 18:07:58 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 887E4156E; Thu,  8 Apr 2021 20:07:56 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/26] Hexagon (target/hexagon) cleanup reg_field_info
 definition
Date: Thu,  8 Apr 2021 20:07:42 -0500
Message-Id: <1617930474-31979-15-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
References: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
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

Include size in declaration
Remove {0, 0} entry

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/reg_fields.c | 3 +--
 target/hexagon/reg_fields.h | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/hexagon/reg_fields.c b/target/hexagon/reg_fields.c
index bdcab79..6713203 100644
--- a/target/hexagon/reg_fields.c
+++ b/target/hexagon/reg_fields.c
@@ -18,10 +18,9 @@
 #include "qemu/osdep.h"
 #include "reg_fields.h"
 
-const RegField reg_field_info[] = {
+const RegField reg_field_info[NUM_REG_FIELDS] = {
 #define DEF_REG_FIELD(TAG, START, WIDTH)    \
       { START, WIDTH },
 #include "reg_fields_def.h.inc"
-      { 0, 0 }
 #undef DEF_REG_FIELD
 };
diff --git a/target/hexagon/reg_fields.h b/target/hexagon/reg_fields.h
index d3c86c9..9e2ad5d 100644
--- a/target/hexagon/reg_fields.h
+++ b/target/hexagon/reg_fields.h
@@ -23,8 +23,6 @@ typedef struct {
     int width;
 } RegField;
 
-extern const RegField reg_field_info[];
-
 enum {
 #define DEF_REG_FIELD(TAG, START, WIDTH) \
     TAG,
@@ -33,4 +31,6 @@ enum {
 #undef DEF_REG_FIELD
 };
 
+extern const RegField reg_field_info[NUM_REG_FIELDS];
+
 #endif
-- 
2.7.4


