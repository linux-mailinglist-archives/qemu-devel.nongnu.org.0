Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B38370D75
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:50:49 +0200 (CEST)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDQk-0007tc-AY
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKj-0001OQ-Bf
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:33 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKg-0005Cb-6d
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id q9so1896770pgl.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUDOODL8OY/WyPfVJS6CSPQqXcHEI2wa1hK51LclNQc=;
 b=erU8ZQaoDZwZuYnzKkqHu2frWzp0uzhbkjF2zv+JnBk+IC1XhgeBgpTH+HNo0PjAU4
 bqV9o2tLuBUBASMEovqtUDT5TNmnL4RcaEXbelSJTDATkRt81ly65Kte9LkKiBAhJhfE
 2BMyVsPbIKBIJYckIVXs9TQLOajLjdfDuDdFb3UlWjzyNamC8GedZVV8vxfcLdS8/GuI
 NLoYNQN5++yFAQAlLi9W2F/DpYTyvzqkx+vjtxCKoI6fgKdNj9RFulDaWLpqnDbS1Cky
 4P0HUE4bGKUwpIvQ5Uia3UgZ7lemFS6IN3CaOHrpGXEWYkVaXvBRqZfeJ4nsPK7aIubZ
 BlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUDOODL8OY/WyPfVJS6CSPQqXcHEI2wa1hK51LclNQc=;
 b=pUT/McRgsXCcJPkjDBGu/3KRxHTVbBiijoVxtS0mBcrE1seBmxDtdGNSVtIN6npy/k
 jaa6xDHMw+kZi65CFu7kWArVkubL0Us5eKnYq4KU6PfWRFkmVSUvNqzzSX/gT5ctnard
 qXVLZXvtS1/ioa2UwtGKybAHfLyFQYdOVCU/Zh5uKl1zw/n8ZaMvAI4SWF17vrzmzz+y
 aznfM3jE1TlFL8TpjpNntDY4YM/MzaFjqWX0nZUYXjFT4yeHFUQQvKJZC5IaNoxqnprq
 nEhMsKVYmvsKK8aOM4wTnMovycCp0+jQfMaAJrE1tpPl27/6K0vj4R/9FmIXfBiZD1LJ
 gkQA==
X-Gm-Message-State: AOAM531ZHhBpSRc13dM3BjpTE9uySZSjXfkWv2W/aDAtteT+rQNzT4A9
 nUpKLQ+NLbY9LqJFewNcxB+5/Bixt4KIJw==
X-Google-Smtp-Source: ABdhPJxI3nCmZ6YsmuMn8FioUKEU8rS7J1FuYoSwl0excFVGrXauSFg/DRSNerpkz+Kz2sPk/18/tg==
X-Received: by 2002:a63:10:: with SMTP id 16mr14216006pga.143.1619966668967;
 Sun, 02 May 2021 07:44:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/31] Hexagon (target/hexagon) remove unused
 carry_from_add64 function
Date: Sun,  2 May 2021 07:44:01 -0700
Message-Id: <20210502144419.1659844-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-9-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/arch.h   |  1 -
 target/hexagon/macros.h |  2 --
 target/hexagon/arch.c   | 13 -------------
 3 files changed, 16 deletions(-)

diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
index 1f7f03693a..6e0b0d9a24 100644
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
index cfcb8173ba..8cb211dfde 100644
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
diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 09de124818..699e2cfb8f 100644
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
-- 
2.25.1


