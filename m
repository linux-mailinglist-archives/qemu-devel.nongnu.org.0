Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47465B51CC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:10:34 +0200 (CEST)
Received: from localhost ([::1]:41398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW5x-0007UN-KK
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW08-0000Ea-CQ
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW04-0006yE-25
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qNlguD+njmm2618TYLP1T4Fj6fykhZdMOk4HXO6te4=;
 b=Ynjr12MtEi9A1jrhHgJ7lRJyrSZZDKjdlk+Cu019iFv15/700dedVVyFwqUTtDoHQYQ/Rv
 6hw2/NU33GLQWXUciiewJkGAGNgYULRwh2rNW1disZdTyjrU6b3LWz61f6/IgExb1+uoFR
 DHJ8yTsUeDbWdm64w5/cHwxJ86Dv78E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-_bW_QJPfPteNP0XN-V6b1A-1; Sun, 11 Sep 2022 19:04:26 -0400
X-MC-Unique: _bW_QJPfPteNP0XN-V6b1A-1
Received: by mail-ej1-f69.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso503218ejb.5
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8qNlguD+njmm2618TYLP1T4Fj6fykhZdMOk4HXO6te4=;
 b=2HITrOi470e/mbRRuJRJcE3qgbPrkiTiBb8xbdYkr0tWtSSDbZ9GblC0QEhvihwUbi
 isgpoFWWTQ+dZ32kUdsalkgXKALz8qZDqeYG4Z+XWxLYpaHhZJMRl2gdz99P6LPUbSS+
 XFnPsOTt4rz8EgIAksjNFwq7Z/5mNeZ4w1ljuxnAjGjyKsTv10444dMH3Jx2QFRfVpXF
 wr9YABFt6y3firq8V+FQeeR52E+WgVefgzrHObTR2ORMhgmwCp8E+xElOHXT1gqxW/+z
 /7T6oW05EKY7K7T2M/TRY0Y/bQ5zCuWshPjn5EJ8ItJ7WV5DACvGbXZpwxW4UEfOD/71
 x4lg==
X-Gm-Message-State: ACgBeo3TcjukIGUw62oDk6L1zawvYMOMNp73URSoP4V6zte40qBCvXfw
 17wBasOADxIsd0+Jb8jryczcnBuBa68VQHF3bwlpqVjUfUS3pWtsN3F+t1kI1Qcg5suWBqy9fX/
 ctVttU1URHrQHRHsleaO3nGFBcMtiiEQRMVYEPRNmU0MJs9EjgcdJ/uIMjaoaTbNWGOI=
X-Received: by 2002:a17:907:7610:b0:77c:b7a:9fb2 with SMTP id
 jx16-20020a170907761000b0077c0b7a9fb2mr4001709ejc.468.1662937464790; 
 Sun, 11 Sep 2022 16:04:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR602vst2u/i/LH3R8hm3j3FqnvrQSP61FYyhs8GOVy6yKOL/vpXsB5IlRmhhApbEZgJOatkjA==
X-Received: by 2002:a17:907:7610:b0:77c:b7a:9fb2 with SMTP id
 jx16-20020a170907761000b0077c0b7a9fb2mr4001695ejc.468.1662937464510; 
 Sun, 11 Sep 2022 16:04:24 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906218a00b007420aaba67esm3546828eju.36.2022.09.11.16.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 01/37] target/i386: Define XMMReg and access macros,
 align ZMM registers
Date: Mon, 12 Sep 2022 01:03:41 +0200
Message-Id: <20220911230418.340941-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



