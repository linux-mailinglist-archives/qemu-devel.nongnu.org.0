Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480665BF049
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:39:38 +0200 (CEST)
Received: from localhost ([::1]:38580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaltx-0001hK-A2
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzn-0006H2-9K
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzk-00022Q-4a
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qNlguD+njmm2618TYLP1T4Fj6fykhZdMOk4HXO6te4=;
 b=VpY7Y91iRsdH3rda3J2/MXga088W/lpD2zRYtcsDgu13R18dvPXGynhvsA8T3phgmGIRR+
 x+2vv8mKNIai7gvgRfzTseKcOOoaq62UaOK07RIErvbPlsQLiA3pn9/IQ2VKyjYSTFWeYE
 KB3T8/pFijtgA5hpfJgj0y3kaYhe1yI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-opfu15tQM9SSS8t3dlpUAQ-1; Tue, 20 Sep 2022 13:25:13 -0400
X-MC-Unique: opfu15tQM9SSS8t3dlpUAQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h13-20020a056402280d00b004528c8400afso2343728ede.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8qNlguD+njmm2618TYLP1T4Fj6fykhZdMOk4HXO6te4=;
 b=zAlqA7+tvm7GhC+x+Y8i9iEEhhLE9ZwMFHXurKn2XSs1y+mOZ8eh7+WDawLxKLwm/V
 KjsiupHGBmf5XTlYJUv0fXP5k/PyPZ1QTBSqL72yaJ3un+f/zhPuj8fGGunLuJ1eLWDO
 PvRuo9hACD0MNAmgARxkkLeywoZUbh98fNbdbTur0Nk+s1Cp9Tjl2ubqCpNyrm7piGAg
 O3CFqy3sLgZq6ukj49a3+KLx1VKLTvvwBObVoLdIX2Ezkxtmo+uB/G3zsD1EqBTVhkES
 X7hvcrKivM4iZ/qWm1jR5h8sWTSjUGMXFRBD5cTlgVngiugzIeo8kZX341MJXIFN2xqJ
 j76Q==
X-Gm-Message-State: ACrzQf0ER8Sl7vmn4nXG8sj6S/gamMySYaOkBlF1j8kO1b3nQ6TO9uj0
 iC6AN/ARUQtVjlYEiffUFtfZf+/v0z5x9aLQMUv/YX0DXK3eP9hwYQhUT145w1TahZOJuxi3s+W
 G+UCNviRnA8C6+ud6wIzyzmk8vCuSoWJ5b+MHtqfwFOIRmjAtEg1YIiLAyBq7Qnle6sg=
X-Received: by 2002:a17:907:724b:b0:780:49ab:4b66 with SMTP id
 ds11-20020a170907724b00b0078049ab4b66mr18029476ejc.67.1663694711772; 
 Tue, 20 Sep 2022 10:25:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zyfXra/VcooDJi91fwqUYX7OjlSobMq3RdXDN1J6geGN2NKFLzZ9SSQPWMWJ8cWTEqa3VKg==
X-Received: by 2002:a17:907:724b:b0:780:49ab:4b66 with SMTP id
 ds11-20020a170907724b00b0078049ab4b66mr18029454ejc.67.1663694711444; 
 Tue, 20 Sep 2022 10:25:11 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1709062bd000b00730bfe6adc4sm200151ejg.37.2022.09.20.10.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 01/37] target/i386: Define XMMReg and access macros,
 align ZMM registers
Date: Tue, 20 Sep 2022 19:24:31 +0200
Message-Id: <20220920172507.95568-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

This will be used for emission and endian adjustments of gvec operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822223722.1697758-2-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h | 56 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b9..8311b69c88 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1233,18 +1233,34 @@ typedef struct SegmentCache {
     uint32_t flags;
 } SegmentCache;
 
-#define MMREG_UNION(n, bits)        \
-    union n {                       \
-        uint8_t  _b_##n[(bits)/8];  \
-        uint16_t _w_##n[(bits)/16]; \
-        uint32_t _l_##n[(bits)/32]; \
-        uint64_t _q_##n[(bits)/64]; \
-        float32  _s_##n[(bits)/32]; \
-        float64  _d_##n[(bits)/64]; \
-    }
+typedef union MMXReg {
+    uint8_t  _b_MMXReg[64 / 8];
+    uint16_t _w_MMXReg[64 / 16];
+    uint32_t _l_MMXReg[64 / 32];
+    uint64_t _q_MMXReg[64 / 64];
+    float32  _s_MMXReg[64 / 32];
+    float64  _d_MMXReg[64 / 64];
+} MMXReg;
 
-typedef MMREG_UNION(ZMMReg, 512) ZMMReg;
-typedef MMREG_UNION(MMXReg, 64)  MMXReg;
+typedef union XMMReg {
+    uint64_t _q_XMMReg[128 / 64];
+} XMMReg;
+
+typedef union YMMReg {
+    uint64_t _q_YMMReg[256 / 64];
+    XMMReg   _x_YMMReg[256 / 128];
+} YMMReg;
+
+typedef union ZMMReg {
+    uint8_t  _b_ZMMReg[512 / 8];
+    uint16_t _w_ZMMReg[512 / 16];
+    uint32_t _l_ZMMReg[512 / 32];
+    uint64_t _q_ZMMReg[512 / 64];
+    float32  _s_ZMMReg[512 / 32];
+    float64  _d_ZMMReg[512 / 64];
+    XMMReg   _x_ZMMReg[512 / 128];
+    YMMReg   _y_ZMMReg[512 / 256];
+} ZMMReg;
 
 typedef struct BNDReg {
     uint64_t lb;
@@ -1267,6 +1283,13 @@ typedef struct BNDCSReg {
 #define ZMM_S(n) _s_ZMMReg[15 - (n)]
 #define ZMM_Q(n) _q_ZMMReg[7 - (n)]
 #define ZMM_D(n) _d_ZMMReg[7 - (n)]
+#define ZMM_X(n) _x_ZMMReg[3 - (n)]
+#define ZMM_Y(n) _y_ZMMReg[1 - (n)]
+
+#define XMM_Q(n) _q_XMMReg[1 - (n)]
+
+#define YMM_Q(n) _q_YMMReg[3 - (n)]
+#define YMM_X(n) _x_YMMReg[1 - (n)]
 
 #define MMX_B(n) _b_MMXReg[7 - (n)]
 #define MMX_W(n) _w_MMXReg[3 - (n)]
@@ -1279,6 +1302,13 @@ typedef struct BNDCSReg {
 #define ZMM_S(n) _s_ZMMReg[n]
 #define ZMM_Q(n) _q_ZMMReg[n]
 #define ZMM_D(n) _d_ZMMReg[n]
+#define ZMM_X(n) _x_ZMMReg[n]
+#define ZMM_Y(n) _y_ZMMReg[n]
+
+#define XMM_Q(n) _q_XMMReg[n]
+
+#define YMM_Q(n) _q_YMMReg[n]
+#define YMM_X(n) _x_YMMReg[n]
 
 #define MMX_B(n) _b_MMXReg[n]
 #define MMX_W(n) _w_MMXReg[n]
@@ -1556,8 +1586,8 @@ typedef struct CPUArchState {
     float_status mmx_status; /* for 3DNow! float ops */
     float_status sse_status;
     uint32_t mxcsr;
-    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32];
-    ZMMReg xmm_t0;
+    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32] QEMU_ALIGNED(16);
+    ZMMReg xmm_t0 QEMU_ALIGNED(16);
     MMXReg mmx_t0;
 
     uint64_t opmask_regs[NB_OPMASK_REGS];
-- 
2.37.2


