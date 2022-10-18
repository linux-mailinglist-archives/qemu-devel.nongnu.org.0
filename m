Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C093A602E13
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:13:56 +0200 (CEST)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknLs-0000PT-UD
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhH-0003LI-1O
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhE-00055Z-2v
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pFvE2IPwyAj8J17/+xngYCMPf0scv6DEdgFJ5PKv0jo=;
 b=Kyc+fhR5H9EChB+jt8F/Qr8bTOGHZO7VeIVCXFePliJ2L1xIFRYNIMHLfKM5s5j49Yo0RX
 Bm5iqk+GXO4l/xWcl7KI4g1xAdp8ZpMQwYDLnOx+rmirZ0VkefEqiTdACPMHj/XfL4KSPj
 WHDin0cywzf1JZsIH82X0vlz7n1SJPk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-oFuhPaBvNz-bs7BfxXcseQ-1; Tue, 18 Oct 2022 09:31:48 -0400
X-MC-Unique: oFuhPaBvNz-bs7BfxXcseQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa6-20020a1709076d0600b0078d84ed54b9so6375010ejc.18
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFvE2IPwyAj8J17/+xngYCMPf0scv6DEdgFJ5PKv0jo=;
 b=1MirQoY7OMxc/8DRRCS4my8V0G7vjOwnHOg2zzHJRuT1ZkIzuRZ/wSH5uB31x60v1P
 OFBcUJ7Vyk6AG27gKeMnDpXcPkZpCeJWJu5HNX5YUlA/NNd9O9+9yOBeh7GW1sBM6whT
 z2kwRlW7Ywe5XUYFXZ4TglwZdpqmZiYyldhwQNz8cpLGwbhB4xPyIalJRyzFHKEJYchj
 S2dOi3xio2edeSpHOCKtCLKofOoiPgEk5huX/vkoQu3sd7ocvGUKsZd0cTMqg/oI/3Os
 Dp8FianYcjFoyhAvzmy8M531UXGa/ZiTwn33UTyiSkOxfZkgQk8PFNlneC8suVIwA9B2
 PFdA==
X-Gm-Message-State: ACrzQf2ENuaqN3FHJziW7uJlcDrP/C7bj6RV8lEPEKIHIeSiD1ls6L4I
 Ku/CP97RoFRg4jBEcFejoSU1Bh67sEdVUlzZjLh3zC1FjfsGQUBciudJlrYtdL2QPQC0ZxHcQup
 l66DSmHF+1Nm20mmn9ATIuG/XgfELaNc9/vsg22xgjkUEHhW8Sd8NTbWgPV/yo6MMHmA=
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr2559448ejb.294.1666099906758; 
 Tue, 18 Oct 2022 06:31:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uTbK9KCy0mJFYE+5ZFWlMbgfK+R+AM6f7pd73/MzlaHrCjfaSNCTyczbz6NlVxlmPHihrwA==
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr2559422ejb.294.1666099906432; 
 Tue, 18 Oct 2022 06:31:46 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 nb36-20020a1709071ca400b00780f24b797dsm7594559ejc.108.2022.10.18.06.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 18/53] target/i386: Define XMMReg and access macros,
 align ZMM registers
Date: Tue, 18 Oct 2022 15:30:07 +0200
Message-Id: <20221018133042.856368-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 6bb6653e76..5be90e72a9 100644
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
2.37.3


