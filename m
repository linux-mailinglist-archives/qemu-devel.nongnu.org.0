Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37A359143
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 03:16:58 +0200 (CEST)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUflZ-00089P-QQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 21:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfd1-0005qC-Nt
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:07 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6275)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lUfcz-0001F4-Su
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 21:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617930485; x=1649466485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ytCIHyzTxcVjz9DjlmeCv6xwmvcrInHSrRGstqBC3EA=;
 b=t+SYam+sZ188LAEqnXBWEtbXtaKa3uUyjBya6zG/7HmMDFe1N9mtUTx5
 laeW+hX2QcqpB7/s/GN2PstGoNMKI4m42JPI1qfOEAq5WUUmIhysgW7jc
 EKLBSAMRXODk1c0PvbfNh1giZ7OkNVpJ6U7B0EA3mtvKLk+unK/2a5yrf 0=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Apr 2021 18:07:58 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 08 Apr 2021 18:07:57 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 6A73914D9; Thu,  8 Apr 2021 20:07:56 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/26] Hexagon (target/hexagon) remove unused
 carry_from_add64 function
Date: Thu,  8 Apr 2021 20:07:36 -0500
Message-Id: <1617930474-31979-9-git-send-email-tsimpson@quicinc.com>
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/arch.c   | 13 -------------
 target/hexagon/arch.h   |  1 -
 target/hexagon/macros.h |  2 --
 3 files changed, 16 deletions(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 09de124..699e2cf 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -76,19 +76,6 @@ uint64_t deinterleave(uint64_t src)
     return myeven | (myodd << 32);
 }
 
-uint32_t carry_from_add64(uint64_t a, uint64_t b, uint32_t c)
-{
-    uint64_t tmpa, tmpb, tmpc;
-    tmpa = fGETUWORD(0, a);
-    tmpb = fGETUWORD(0, b);
-    tmpc = tmpa + tmpb + c;
-    tmpa = fGETUWORD(1, a);
-    tmpb = fGETUWORD(1, b);
-    tmpc = tmpa + tmpb + fGETUWORD(1, tmpc);
-    tmpc = fGETUWORD(1, tmpc);
-    return tmpc;
-}
-
 int32_t conv_round(int32_t a, int n)
 {
     int64_t val;
diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
index 1f7f036..6e0b0d9 100644
--- a/target/hexagon/arch.h
+++ b/target/hexagon/arch.h
@@ -22,7 +22,6 @@
 
 uint64_t interleave(uint32_t odd, uint32_t even);
 uint64_t deinterleave(uint64_t src);
-uint32_t carry_from_add64(uint64_t a, uint64_t b, uint32_t c);
 int32_t conv_round(int32_t a, int n);
 void arch_fpop_start(CPUHexagonState *env);
 void arch_fpop_end(CPUHexagonState *env);
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index cfcb817..8cb211d 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -341,8 +341,6 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
 #define fWRITE_LC0(VAL) WRITE_RREG(HEX_REG_LC0, VAL)
 #define fWRITE_LC1(VAL) WRITE_RREG(HEX_REG_LC1, VAL)
 
-#define fCARRY_FROM_ADD(A, B, C) carry_from_add64(A, B, C)
-
 #define fSET_OVERFLOW() SET_USR_FIELD(USR_OVF, 1)
 #define fSET_LPCFG(VAL) SET_USR_FIELD(USR_LPCFG, (VAL))
 #define fGET_LPCFG (GET_USR_FIELD(USR_LPCFG))
-- 
2.7.4


