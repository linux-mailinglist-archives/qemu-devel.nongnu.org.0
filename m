Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F414EEE18
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:27:54 +0200 (CEST)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHJh-0005f9-Qx
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:27:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHEm-0007j2-FP
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:48 -0400
Received: from [2607:f8b0:4864:20::234] (port=35446
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naHEk-0006y4-SH
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:22:48 -0400
Received: by mail-oi1-x234.google.com with SMTP id e4so2806717oif.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hR2ubnJbTaR/99ZxIVHKnu/SsnV6lFaufZKu6ufkBwc=;
 b=w53LLeTF/FjRLW8+OQPpqfYzRL4IsXbrnAppHQqmTr58ljRXUzFJjNBIKk7yU7acfS
 UQlVKxNVPDlde2zCz33ZGZesUVoH5kRRsKl6KJXpiNAB02qE36gqEU/+gOg6310gF8lK
 lcxDp5iervWv3jzMnfjnTex6gPWo/jxqi4o0b+Tj/pyqocOaRMhR0NWvmivG/73mPLco
 6W+lY28zN3u/GepK6JDtnowwkEzOHS2oUqOdBwD1WwA5nCgeFCMaoBQk9Nxvi8ixTRDL
 r8NJL7hyHRRMEifzo1DnF+bX9OgNguR3dAee9k5a1dRX24EGwfYikNqx2EeNHAIi8B+j
 MCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hR2ubnJbTaR/99ZxIVHKnu/SsnV6lFaufZKu6ufkBwc=;
 b=6QB1yktLq+tDjiGov4Xx16JWVxAdfoh1+mqcxoiWQMzxfk7ljl2hdXPe2KjQsdisjO
 S+MgEY9wBuflVAkI2m2/cNecr8eEf9T6rUrRnKau3nSny7Q88qOGCL/hnkSzIQ0nTRtL
 MT64krpE/1MzBaBLsOUxvzI+aZW7M8AeSeyufgsjiWOmYVS1Wjh0juNbZlM55yLM9Pwd
 A5EVjG2z1FirDj0Awu7zZ6Txjc9m0b+3TrhqTClWCPXTy3ioercQ4mixDLihMyiUopms
 8q7/fXGl+zQzHGaiCbQ+O0ZYOMHdXDUo4kLaHKuMPuhWoYWEft9Qf2y0AAQKtT2JBN5j
 MBCA==
X-Gm-Message-State: AOAM533GMk5o/C4GJQSfKNeSqVd4C1XzVGdmqJtBttcB95uFzzXMrgJg
 wjhpYYFUXsOVBcBbcSVypRPr3pDmhFJGX5bE4+8=
X-Google-Smtp-Source: ABdhPJx5LDoGhaqWtiRG4w62I1vrz7AE998Iurl9Fd4bJ2vSClBD5/JtKSscfKIFJJnW1/w7BH3gvQ==
X-Received: by 2002:a05:6808:1294:b0:2f7:5e83:f0f with SMTP id
 a20-20020a056808129400b002f75e830f0fmr4948992oiw.77.1648819365818; 
 Fri, 01 Apr 2022 06:22:45 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 x1-20020a4ae781000000b00320d5d238efsm1006935oov.3.2022.04.01.06.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 06:22:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] softfloat: Use FloatRelation for fracN_cmp
Date: Fri,  1 Apr 2022 07:22:40 -0600
Message-Id: <20220401132240.79730-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401132240.79730-1-richard.henderson@linaro.org>
References: <20220401132240.79730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the caller, partsN_compare, is now exclusively
using FloatRelation, it's clearer to use it here too.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 7e62fcf414..9f2d4e7a29 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -957,21 +957,23 @@ static void frac128_allones(FloatParts128 *a)
 
 #define frac_allones(A)  FRAC_GENERIC_64_128(allones, A)(A)
 
-static int frac64_cmp(FloatParts64 *a, FloatParts64 *b)
+static FloatRelation frac64_cmp(FloatParts64 *a, FloatParts64 *b)
 {
-    return a->frac == b->frac ? 0 : a->frac < b->frac ? -1 : 1;
+    return (a->frac == b->frac ? float_relation_equal
+            : a->frac < b->frac ? float_relation_less
+            : float_relation_greater);
 }
 
-static int frac128_cmp(FloatParts128 *a, FloatParts128 *b)
+static FloatRelation frac128_cmp(FloatParts128 *a, FloatParts128 *b)
 {
     uint64_t ta = a->frac_hi, tb = b->frac_hi;
     if (ta == tb) {
         ta = a->frac_lo, tb = b->frac_lo;
         if (ta == tb) {
-            return 0;
+            return float_relation_equal;
         }
     }
-    return ta < tb ? -1 : 1;
+    return ta < tb ? float_relation_less : float_relation_greater;
 }
 
 #define frac_cmp(A, B)  FRAC_GENERIC_64_128(cmp, A)(A, B)
-- 
2.25.1


