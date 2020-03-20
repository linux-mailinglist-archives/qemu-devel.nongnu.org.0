Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD218D3A1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 17:10:07 +0100 (CET)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFKDm-0006Pm-4M
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 12:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39863)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jFKAI-00020o-Nd
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 12:06:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jFKAH-0001cv-HW
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 12:06:30 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34714)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jFKAH-0001cR-Br
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 12:06:29 -0400
Received: by mail-pj1-x1044.google.com with SMTP id q16so3592087pje.1
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9N6FLF8sUw4XVnPIwBVzCdAPTwyubp1J/tKDvqzTiXA=;
 b=sinYBWdKPXM87ZyspIJS8N8F+GXUJppxt202/ZQkT99Eg8bR4pvRLUmgByGD0hx0xI
 nJFDBVddSlbNtOc6IsVeOcW7Tm6L5sPKvCgsoaOmuUD1XJlE+tis5nD6VRBTKIlAk5DF
 F3dSjk8o9T72oL00+HtVlQoDUpngTeVf5XJDLApLB4dZptJSlUEcLDh7ToUMgw/0JSa3
 1mURHO/iqOuys/U9K3Ghrxbtn/e38w0ZJHpYIX2m3ib4knFoZLLa9ncbXOVHwRwdHJj2
 TFxbgDdYz0RszcBptnHmH4N+Hg9u7TCGO2TPSUb8Y9QJEvorDknLz6jlFl39uxdiKDgP
 tulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9N6FLF8sUw4XVnPIwBVzCdAPTwyubp1J/tKDvqzTiXA=;
 b=igcLGy2zSxRwtkFd7BjCMkftq2oovvZjJG9dr2x9tEFg9ZTLYAIe97bdmFgoTE5FFT
 usmilYxeoIXKsmUWTykDfxdq6sOkXm/AmYrJHxEgDatibfBaZAxRckjsEoBz2epOL+Wd
 GbTYpUW3Y57xHIvVgjxI4FqRIrsmSc83JwbVW8nLvg/Eqqa6UTOmKPbVa3pJ3sqnIERE
 SeMfsq2Yr950tCwum+XcS55tjgFOLKVwnevoTx+d6V7T+lG+TpqzdRh1DKVAxU65LTnz
 P4rnmihFhYKF1nPOqhOTzAkCnu5jaPTy0IpXQ4qUAfe0KEtFKgR/fajJULokBeB25cFG
 yXig==
X-Gm-Message-State: ANhLgQ0lZPLyEVcRmqUffm9NUZbDAXTF1TZby6NpZs21qgb7TSbUY/PZ
 jXXh1FecxG+wCDod11nZw/UNa62YIrA=
X-Google-Smtp-Source: ADFU+vv5jD6NaTiHidXgK0P+b1zwJQakVbWlD9CCBU8oZzxYkyml4HWfQSix+JohtFRh/Im48ygFUg==
X-Received: by 2002:a17:902:eb49:: with SMTP id
 i9mr8953254pli.91.1584720388077; 
 Fri, 20 Mar 2020 09:06:28 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id nu13sm5272745pjb.22.2020.03.20.09.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 09:06:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Move computation of index in handle_simd_dupe
Date: Fri, 20 Mar 2020 09:06:22 -0700
Message-Id: <20200320160622.8040-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320160622.8040-1-richard.henderson@linaro.org>
References: <20200320160622.8040-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reports a BAD_SHIFT with ctz32(imm5), with imm5 == 0.
This is an invalid encoding, but we diagnose that just below
by rejecting size > 3.  Avoid the warning by sinking the
computation of index below the check.

Reported-by: Coverity (CID 1421965)
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 032478614c..7580e46367 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7422,7 +7422,7 @@ static void handle_simd_dupe(DisasContext *s, int is_q, int rd, int rn,
                              int imm5)
 {
     int size = ctz32(imm5);
-    int index = imm5 >> (size + 1);
+    int index;
 
     if (size > 3 || (size == 3 && !is_q)) {
         unallocated_encoding(s);
@@ -7433,6 +7433,7 @@ static void handle_simd_dupe(DisasContext *s, int is_q, int rd, int rn,
         return;
     }
 
+    index = imm5 >> (size + 1);
     tcg_gen_gvec_dup_mem(size, vec_full_reg_offset(s, rd),
                          vec_reg_offset(s, rn, index, size),
                          is_q ? 16 : 8, vec_full_reg_size(s));
-- 
2.20.1


