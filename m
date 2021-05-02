Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279A0370D7A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:57:14 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDWz-0005A9-5g
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKh-0001K7-Af
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:31 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKa-00059h-4q
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m12so1904521pgr.9
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8Pf8ZpwZ1pQBiqGaJFMNS/iHJ5hjxHqBDOnzStfgWc=;
 b=iSEQKrcZAr/ZNnSFYX2TVtX6nItnF6qzUca1k4YaXK6+yBm+nWIfGXDRw6rTI1gyPm
 1Eraqy0bj6QMX+zzkspul3HyLfLuSxZT5uuIom0frZgLOF9rdQsvUxNFD/Dp67MRey5n
 fO88GNrtfKK8TL9NYDhUGDo5Dg7oMOklnWIJGXrw8vp1T1E3ZcRcNkrniO0TH2XWL1a7
 veD9emWJXexSu6sEYLXYPD/Tm26XqZHlbWxRgEi+pBAp4vlqdFix0WnkoQfmLZMiYSkW
 RN9vebXcYqRmPoQ8P/aCfr32eertUQFecdwYlLMV74L5m2Xv0LfFa6dR5fxjxqYFCmE9
 wi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8Pf8ZpwZ1pQBiqGaJFMNS/iHJ5hjxHqBDOnzStfgWc=;
 b=nzfDKYHyXXu94cQNYN8/gXTZ+T7LxbmBC1R+3e3ZQyG/eMhBpWJhfGkehohxGrk7ck
 DNB8bKBegM6ovFoLhOKbG/TAUllf2stgfhen1Z05+P8LVXLhzWr8kl2+zz/TsqoSUBIn
 3mM28bYg95TGg2KcwAJE+CoHwrHfy2NC5XxJhQaB5uOew9T9ueN//HCq/6KB0JjhPFKm
 ZsQ5oC3oe6l3NRXNi/b5enAfzQYK8aRmz2wwNz8Ky7DxwX/TQceJWR9cyWj6v5bp8gom
 18Hsv14/LQ6DkKkEiHV5kWsqIFpdCNSBeKjQNjadVYf6eIy2jFf5R4dmtzVHwvoU55QN
 tOfw==
X-Gm-Message-State: AOAM532rgjy2444KXCxWnI8JeMtGRggZrMpbVyOsqa27VSEFHAjiCYZI
 fzzfDtaZupRXeEseWq+7iiQhPVS4Czqsog==
X-Google-Smtp-Source: ABdhPJxYDncYHit1jS2nDeAvs/WQ+lla1u5ZfCAYvkQ6TGspIFW8M0o6t80xOzh9xsQsVQD1NBoWJA==
X-Received: by 2002:a65:5888:: with SMTP id d8mr13601996pgu.23.1619966662902; 
 Sun, 02 May 2021 07:44:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/31] target/hexagon: Change DECODE_MAPPED_REG operand name
 to OPNUM
Date: Sun,  2 May 2021 07:43:51 -0700
Message-Id: <20210502144419.1659844-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Reported-by: Richard Henderson <<richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1615784049-26215-1-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
index c9bacaa1ee..1c9c07412a 100644
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
2.25.1


