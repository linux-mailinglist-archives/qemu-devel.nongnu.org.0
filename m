Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA476932DD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:34:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQtlS-0003hb-A5; Sat, 11 Feb 2023 12:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pQtlO-0003hF-Es
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:34:14 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pQtlM-0001QI-18
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:34:13 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 0DCD35C0095;
 Sat, 11 Feb 2023 12:34:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 11 Feb 2023 12:34:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1676136849; x=1676223249; bh=hgoBwlChWQ6oVj0t2G+1fZrKZ
 96mJhODfFQhdTZiJsA=; b=hNb2oQpRDH4HVKRxDCbncy9J6FonMer4ZCkDCtGwB
 QKm+/k0iTgDTsE6D9fz3HYv0N0dTzo8eTjxNp18voWoyM9/xRtO+GEIbSXz9FaJ/
 kDyF63//ipH/XU6xGROi9zvGeiu5gQPz0Kc4GMYF6X3ssGg7fC7Ug6z8XCSeH2K9
 ej1xPDN1J6xsRtLE/jNO1aP9zVzB44H5YUagZrOABH1pjQC1ovStfJ2VYrqmljve
 0VW1tMmgyFOjdX3QeTFzYVg9T/5mHxa2Oyhi721pFyqZ2eEoyXrI69RDk/kZylU0
 2xcCSt3bvh+HhTHsNVVL9Ad7nikL8/gm4/34dShCNxB0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1676136849; x=1676223249; bh=hgoBwlChWQ6oVj0t2G+1fZrKZ96mJhODfFQ
 hdTZiJsA=; b=TTiI/C00FZvNBbjN7q+vm3vqc47LvkMeWI9tqOMWKRjHa44L7k5
 EOeS2yxaUgkerpkolo4pcD19glqu+ujSjQrJaH7ncEivxE0rv6uZDBW3/BHgrDWd
 EDCbd3AEJ3BeCZ/bHUJTTAx32Zksf/vNumnKmD/WBYzyBn47S7S99OQagdOq0Vil
 5tvrmVk7W+2sA9jJEjUuD6FBdvS77/prMbCgeiRJAsNrnlt6kZIXma0l6bZafMf0
 PgrnEN+eX/x33yjHa2jtf0mRyjPG7cqdHJFPWAAoAIp3iK0o8T38dW9tRdbCwwtk
 ikFRTjPD+yjGDfG8KWukztRvggqNjiob6wA==
X-ME-Sender: <xms:kNHnY6m0_qjgBm0Kra_06fzBVdpgi2ZdA4-Y6FmiQuESiEvOh2iZxw>
 <xme:kNHnYx3ehCzvs2z8l3aiamiSuWlGJb2kn9XWA4Cw4Ggv9iRlb1tGUqfU9jUfZUA6L
 Zs6FY8axDywTvji6HY>
X-ME-Received: <xmr:kNHnY4r4PDTkIxOrSaXARlTbz9tehMD1NO5mqAe8XkiKlRo04O1rK-6DWU4t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehjedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedutdduveeileejje
 etffehueejudehgfffjeduhfeuleeludfffefgffevkeenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:kNHnY-k6XRVyRqCwFVOa-P25tOrY7qdvaJrgQ_Fe9AErvi_4ws9UkA>
 <xmx:kNHnY40vr3QPdIeyF4FRE_d99XdokEwymta-Bsn5urGiWs8Y0Gne3A>
 <xmx:kNHnY1uJMrDvsYY4Yk7JuGOGNiqCCL0tZ6ZPoIXZh-bYwxwDWuwKBQ>
 <xmx:kdHnY2DBSQiUqjr4FMI2-g697MwCB9cnY7FYQla5goxs1AbeQSfhKg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 11 Feb 2023 12:34:07 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, laurent@vivier.eu, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] linux-user/mips: Low down switchable NaN2008 requirement
Date: Sat, 11 Feb 2023 17:34:01 +0000
Message-Id: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Previously switchable NaN2008 requires fcsr31.nan2008 to be writable
for guest. However as per MIPS arch spec this bit can never be writable.
This cause NaN2008 ELF to be rejected by QEMU.

NaN2008 can be enabled on R2~R5 processors, just make it available
unconditionally.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 linux-user/mips/cpu_loop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index d5c1c7941d..b5c2ca4a3e 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -301,8 +301,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     }
     if (((info->elf_flags & EF_MIPS_NAN2008) != 0) !=
         ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) != 0)) {
-        if ((env->active_fpu.fcr31_rw_bitmask &
-              (1 << FCR31_NAN2008)) == 0) {
+        if (!(env->insn_flags & ISA_MIPS_R2)) {
             fprintf(stderr, "ELF binary's NaN mode not supported by CPU\n");
             exit(1);
         }
-- 
2.37.1 (Apple Git-137.1)


