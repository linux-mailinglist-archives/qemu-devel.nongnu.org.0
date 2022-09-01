Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C915A925A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:48:46 +0200 (CEST)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfsT-0001fs-Fe
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexI-0001Y1-NP
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexH-0003CX-0g
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJQUU+VddMwgot1TSEksOqwCThrJaNjx4Q2C2mhLmXc=;
 b=gz93rKm8G2h2qMP0t7Pyq9Eh0P25AtUh9GNDeOHcffGcXh+UBVtiXJw2AoKAGwqHKld6SA
 0tU+ddp03v/3I+haZx9/b0oRZIirbemLJLNPJ7rBibii3upAYXy2aQVkkp46bNjJvA8747
 e7/8O515JjRnBAj4A3cPJ6ruEbDzmgo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-CRjnFhUWNBG7-ton_GVSnA-1; Thu, 01 Sep 2022 03:49:35 -0400
X-MC-Unique: CRjnFhUWNBG7-ton_GVSnA-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay27-20020a05600c1e1b00b003a5bff0df8dso2534121wmb.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KJQUU+VddMwgot1TSEksOqwCThrJaNjx4Q2C2mhLmXc=;
 b=qZ6PKjQZTnq70mQ8qDeFdV7K3noQb+/aXLY/7VD2SrthCv+TQ/w2foCFoIjLBBa9w/
 40oNpQ7uzRX1liSljWZrmJziLg0kdS6E5kdFJHErmHHdYb6SwH6xdMeERXyM3TGwPqQk
 rLlVuzcGW3U1WxAulvpWkj6MdBEH/kkD6Q74lSoRa5UxheL78Z6J2yEtdz4ylDoGn9l/
 6fsSCyi+PzYBBD/GZ4YmWHW+mFs46Xxeq8Ym49usxFrm+ircBOAsv/QRPDmOUamlrJtG
 mqsWhPwyoN7/d4TZPPIzzhXDpuQtWeH9yrfzXt/uUwlzu3SJ+lu9TtgIw3Ob2yrhWWUz
 SJfg==
X-Gm-Message-State: ACgBeo1KNf175NaSKRExyWWHvzbUh/8FA75n9pSDI4/prI4n6CsmIvby
 f0LN749mBqeXlrffzhqzOkYhiRv39CaCpWX8ZF3RbmK/yF6eHs4pxa5UKqz0x8U7JEzLVbe7Qbb
 1ru93vZDrqLZ5EwJfWdVzi6cwfWyf4LmrsdJH6Q0orxyeGG1XtobF6hwVOJwQ4KIf8RY=
X-Received: by 2002:a7b:c045:0:b0:3a5:ff4e:5528 with SMTP id
 u5-20020a7bc045000000b003a5ff4e5528mr4374386wmc.150.1662018573867; 
 Thu, 01 Sep 2022 00:49:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6DFIWJFH1PRyeno0fv60MtolRZkw8SeI+hGdzN4RMGcCfyLWB4J6erfXulOxGrC5PAVh6p1w==
X-Received: by 2002:a7b:c045:0:b0:3a5:ff4e:5528 with SMTP id
 u5-20020a7bc045000000b003a5ff4e5528mr4374365wmc.150.1662018573509; 
 Thu, 01 Sep 2022 00:49:33 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c3b0300b003a83ca67f73sm4568546wms.3.2022.09.01.00.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 23/23] i386: AVX+AES helpers prep
Date: Thu,  1 Sep 2022 09:48:42 +0200
Message-Id: <20220901074842.57424-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Paul Brook <paul@nowt.org>

Make the AES vector helpers AVX ready

No functional changes to existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-22-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 4135623ad8..f208253161 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2256,11 +2256,12 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     Reg st = *d;
     Reg rk = *s;
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4*i+0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4*i+1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4*i+2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4*i+3])]);
+    for (i = 0 ; i < 2 << SHIFT ; i++) {
+        int j = i & 3;
+        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^
+                                    AES_Td1[st.B(AES_ishifts[4 * j + 1])] ^
+                                    AES_Td2[st.B(AES_ishifts[4 * j + 2])] ^
+                                    AES_Td3[st.B(AES_ishifts[4 * j + 3])]);
     }
 }
 
@@ -2270,8 +2271,8 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     Reg st = *d;
     Reg rk = *s;
 
-    for (i = 0; i < 16; i++) {
-        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i])]);
+    for (i = 0; i < 8 << SHIFT; i++) {
+        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i & 15] + (i & ~15))]);
     }
 }
 
@@ -2281,11 +2282,12 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     Reg st = *d;
     Reg rk = *s;
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4*i+0])] ^
-                                    AES_Te1[st.B(AES_shifts[4*i+1])] ^
-                                    AES_Te2[st.B(AES_shifts[4*i+2])] ^
-                                    AES_Te3[st.B(AES_shifts[4*i+3])]);
+    for (i = 0 ; i < 2 << SHIFT ; i++) {
+        int j = i & 3;
+        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4 * j + 0])] ^
+                                    AES_Te1[st.B(AES_shifts[4 * j + 1])] ^
+                                    AES_Te2[st.B(AES_shifts[4 * j + 2])] ^
+                                    AES_Te3[st.B(AES_shifts[4 * j + 3])]);
     }
 }
 
@@ -2295,22 +2297,22 @@ void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     Reg st = *d;
     Reg rk = *s;
 
-    for (i = 0; i < 16; i++) {
-        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i])]);
+    for (i = 0; i < 8 << SHIFT; i++) {
+        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
     }
-
 }
 
+#if SHIFT == 1
 void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
     Reg tmp = *s;
 
     for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = bswap32(AES_imc[tmp.B(4*i+0)][0] ^
-                          AES_imc[tmp.B(4*i+1)][1] ^
-                          AES_imc[tmp.B(4*i+2)][2] ^
-                          AES_imc[tmp.B(4*i+3)][3]);
+        d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
+                          AES_imc[tmp.B(4 * i + 1)][1] ^
+                          AES_imc[tmp.B(4 * i + 2)][2] ^
+                          AES_imc[tmp.B(4 * i + 3)][3]);
     }
 }
 
@@ -2328,6 +2330,7 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     d->L(3) = (d->L(2) << 24 | d->L(2) >> 8) ^ ctrl;
 }
 #endif
+#endif
 
 #undef SSE_HELPER_S
 
-- 
2.37.1


