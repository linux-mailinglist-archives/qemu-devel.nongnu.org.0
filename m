Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24D45FE503
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:10:26 +0200 (CEST)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6PJ-0003pV-OJ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63M-0002jJ-P9
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63K-0005Gq-84
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGWfq6eTVwMpCraC7JzJ6/JuO3n3PCIS41bQQLFgqiA=;
 b=bMklFlyNtXKbRG5InGEOsdxzMdySreo28QbZ5frU7icQM61vsiRIvCfEVbf+wUnJQpB4g9
 CbBRG3k0Q6pd8ImurfTNuqtcKcGjp9L79NWOwFi4nAHEaktQMplioLVW1rFllMXQgHoyZw
 xWU+nWOyaquhzRrr2f8V8pUacCdJEKs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-WVpjkkBlONSYu9PztdtSBg-1; Thu, 13 Oct 2022 17:47:40 -0400
X-MC-Unique: WVpjkkBlONSYu9PztdtSBg-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr29-20020a1709073f9d00b0078333782c48so1469958ejc.10
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jGWfq6eTVwMpCraC7JzJ6/JuO3n3PCIS41bQQLFgqiA=;
 b=1FSd5e2hjqUdE+3F4shNk/P2HESFpQg0XP0DYX+dj6qVSy8UZk6zYMCZQBH7VTgRjG
 Gc/2TqsjlTuNA2kP9z2BzoNKHDRWSul2bR03sytIfxnJH0DOgFZNjjxDrBcv00IU/YhZ
 uwA/sOzcr7rxauQt7EXddmPwzLphZttfdJ5wVgeVZfAI4QWo6TAFfHZUB7hD5YSbqUIr
 +CfITSKj7FjcvFIn9MT5aMrEfBhpKNERTabiBadr54VDyU6BM32H2aCy3EuYTwZnFJcb
 x6Yi4HqsztcT6vPXonaLiK44KmPbGd59fYLohBiuD0aeRJQN4eJ6+WEXzPPnN8o5eEZg
 JWIg==
X-Gm-Message-State: ACrzQf2YiSDYf+WIj0D19Qa+cXFo5jKgiud/wTQ7cUt1XWQ5VwmThJnM
 uptxTxBCt9u3E61INHDYS2Ajm6iM3PHYd5r3oXPK2Evjp/1kIj6a9PUiI5ozF7x9Rd4V8tDri5J
 1cngtPy1oTLwVr01KS2QDs9l4JRewXCxUO7wggumhwDwtbftHvN1Ns8BxP0UEW5h6XFI=
X-Received: by 2002:a17:907:3207:b0:741:3a59:738d with SMTP id
 xg7-20020a170907320700b007413a59738dmr1326019ejb.110.1665697659135; 
 Thu, 13 Oct 2022 14:47:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6NoW1SM7y52zu9GAs0c0bnL9Ae7q17q2GPUVgpoMwqNblOzAARAdacmS1v2v3ndVt7+vf24A==
X-Received: by 2002:a17:907:3207:b0:741:3a59:738d with SMTP id
 xg7-20020a170907320700b007413a59738dmr1326011ejb.110.1665697658903; 
 Thu, 13 Oct 2022 14:47:38 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a50d48b000000b00458947539desm494103edi.78.2022.10.13.14.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 15/35] target/i386: implement additional AVX comparison
 operators
Date: Thu, 13 Oct 2022 23:46:31 +0200
Message-Id: <20221013214651.672114-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new implementation of SSE will cover AVX from the get go, so include
the 24 extra comparison operators that are only available with the VEX
prefix.

Based on a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 38 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h | 27 +++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 8bb7293975..18d217ebf5 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1075,10 +1075,21 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
         }                                                                   \
     }
 
+static inline bool FPU_EQU(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_unordered);
+}
+static inline bool FPU_GE(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_greater);
+}
 #define FPU_EQ(x) (x == float_relation_equal)
 #define FPU_LT(x) (x == float_relation_less)
 #define FPU_LE(x) (x <= float_relation_equal)
+#define FPU_GT(x) (x == float_relation_greater)
 #define FPU_UNORD(x) (x == float_relation_unordered)
+/* We must make sure we evaluate the argument in case it is a signalling NAN */
+#define FPU_FALSE(x) (x == float_relation_equal && 0)
 
 #define FPU_CMPQ(size, a, b) \
     float ## size ## _compare_quiet(a, b, &env->sse_status)
@@ -1098,6 +1109,33 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
 SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
+
 #undef SSE_HELPER_CMP
 
 #if SHIFT == 1
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 32ffa8445b..e7866a8395 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -237,6 +237,33 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
 SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
+
 #if SHIFT == 1
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
-- 
2.37.3


