Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950815A1C7C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:37:21 +0200 (CEST)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLTU-0007JG-EG
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7f-00007b-De
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7d-0002li-Ms
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/k06SoO5T+U0dlx/3ozz1TDbXRIIPT1aQsNiQ9nHzk=;
 b=facwuAIlhBpqi2TmbHJq1tagUiI28YGb0J7fzETIC+u0Scydi/tjRzIc8dbSXRudXvJ4QQ
 MKv7Fo6MoFmP953sfLOkCTKdbwPsseq9ZtaPTGi9aDoMdZNSCw9/obd5OHRBGpexsr65rv
 Na1CD3DCkbVDdliRrRIA3FQ4lycWVTk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-fsiWfS1xMVKVCH_P7Lwdag-1; Thu, 25 Aug 2022 18:14:44 -0400
X-MC-Unique: fsiWfS1xMVKVCH_P7Lwdag-1
Received: by mail-wm1-f71.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so11469696wmq.9
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=L/k06SoO5T+U0dlx/3ozz1TDbXRIIPT1aQsNiQ9nHzk=;
 b=Ij6XOJ8jmo+9p5J6NAqpLXWPubn+EllM8YTYolmuDa8zZN7m5aTr3wJlKWtA06Og/V
 Mcj6RjRBI9TbMkt5M52qQGLfxSYa4YY/67qv1rH4wjUozksjMfLOfFh1sFsVYx04NOCy
 edWPW9BEevDvPjobK4hi9IGrAYkNutE+mhykCt287TsDjNCTb3uc+GtE+gJAtt8Oihe/
 f4ejflcVHkpUpEPHDL71WrlAA+7HP/CJABszsmG3gM9o0A5+tiFBxtfbzDFtrdDVcntD
 9pk/dMIv/NpNs0+Qf14cqGtU+lNJJxPzW+OPzA/EoSNHjR0ZPDArRMrWLI8yVAQViAuD
 FWzQ==
X-Gm-Message-State: ACgBeo1s0jDNTckLsuyFkmfJcvxRS/qenLiU4DM6gOhUaYVXDQKcFUdp
 Wy9J2J0hHbjC+k/jg7bZrVLhOK116u3CrQ33/JVg2tgl2r8hNId/rg/Ef/dneWGrToFgdL+Pdj6
 byCmAjS8YpDMkGxtPr+kgMAQzB0kO23/YRT90bkni7hK6KMr45EFv2qvw/Q66kKFIY1I=
X-Received: by 2002:a05:600c:1c8d:b0:3a6:8ef:f6c0 with SMTP id
 k13-20020a05600c1c8d00b003a608eff6c0mr9223916wms.23.1661465682497; 
 Thu, 25 Aug 2022 15:14:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4IpTAhgXo52ggvYoxCwg5XzmyosKk4HetDZyDvykiDX6XuRNsrASynPveZnCg7P5zMlhVdMg==
X-Received: by 2002:a05:600c:1c8d:b0:3a6:8ef:f6c0 with SMTP id
 k13-20020a05600c1c8d00b003a608eff6c0mr9223905wms.23.1661465682204; 
 Thu, 25 Aug 2022 15:14:42 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a5d6087000000b0021eed2414c9sm318296wrt.40.2022.08.25.15.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 18/18] i386: AVX+AES helpers prep
Date: Fri, 26 Aug 2022 00:14:11 +0200
Message-Id: <20220825221411.35122-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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
 target/i386/ops_sse.h | 49 +++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 6b5d076685..1e8d8e5c15 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2318,64 +2318,66 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *d; // v
     Reg rk = *s;
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4*i+0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4*i+1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4*i+2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4*i+3])]);
+    for (i = 0 ; i < 2 << SHIFT ; i++) {
+	int j = i & 3;
+        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^
+                                    AES_Td1[st.B(AES_ishifts[4 * j + 1])] ^
+                                    AES_Td2[st.B(AES_ishifts[4 * j + 2])] ^
+                                    AES_Td3[st.B(AES_ishifts[4 * j + 3])]);
     }
 }
 
 void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *d; // v
     Reg rk = *s;
 
-    for (i = 0; i < 16; i++) {
-        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i])]);
+    for (i = 0; i < 8 << SHIFT; i++) {
+        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i & 15] + (i & ~15))]);
     }
 }
 
 void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *d; // v
     Reg rk = *s;
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4*i+0])] ^
-                                    AES_Te1[st.B(AES_shifts[4*i+1])] ^
-                                    AES_Te2[st.B(AES_shifts[4*i+2])] ^
-                                    AES_Te3[st.B(AES_shifts[4*i+3])]);
+    for (i = 0 ; i < 2 << SHIFT ; i++) {
+	int j = i & 3;
+        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4 * j + 0])] ^
+                                    AES_Te1[st.B(AES_shifts[4 * j + 1])] ^
+                                    AES_Te2[st.B(AES_shifts[4 * j + 2])] ^
+                                    AES_Te3[st.B(AES_shifts[4 * j + 3])]);
     }
 }
 
 void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *d; // v
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
 
@@ -2393,6 +2395,7 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     d->L(3) = (d->L(2) << 24 | d->L(2) >> 8) ^ ctrl;
 }
 #endif
+#endif
 
 #undef SSE_HELPER_S
 
-- 
2.37.1


