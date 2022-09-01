Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89165A9F91
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:07:51 +0200 (CEST)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpXa-0004ua-TQ
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTot1-0000Ok-NT
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosv-0000DG-Pe
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQzYZpSWI3AgudZpwT4V9Fuo06SSS0Xy2mQtsGltzKU=;
 b=TXxO+3Y2MzbmdIbbIbFWDjDT6palK05fXqLspqxLfZcQ219E26j1dg2N5CjYh/GmLx3GLO
 nerYW90toYSqDtkeClDQm4/eOIykRDf0+ZhZxPBkWi0rsw5I3seQkf42bvDLQBa2QtaMnn
 tyHwahq5Ypb+Rqzes42sngBko2IBuw0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-MuX1s4CHNXaIfcZXPaYNrw-1; Thu, 01 Sep 2022 14:25:45 -0400
X-MC-Unique: MuX1s4CHNXaIfcZXPaYNrw-1
Received: by mail-ej1-f70.google.com with SMTP id
 ho13-20020a1709070e8d00b00730a655e173so7269169ejc.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nQzYZpSWI3AgudZpwT4V9Fuo06SSS0Xy2mQtsGltzKU=;
 b=nBjyfyI6F+BzW/zn5DJ35HVRqT7qzwDvhWZEa1hzlVtnhRJ9ZlIV564Dtpv/nzKm1d
 ZQlPgTl3rxQ5HORHEHGAGzS+hfscMsoKWLScErxlBcUO8JVhYIyj8O5AEq2Fq7b8c2Pn
 SzQl0vcjJDHdpe/hzj61bobJabbC+FJ+0RF7yvV80yuhmMPdvKs/XzFDKZ82nTzZU7zB
 nXdVqTZ8RoyOZAlm6DaMDFBG1D6nIs8mNZ5J7SD5MIX+faQHCZ7fH81BRy6DAfk+uyKO
 b20s02T7BvDljNl+DQN2Y6W6q6YOgMHd8Ac2nQ/By3QEtIDi+Z3cDAZ8ObsciebJKagu
 GOQA==
X-Gm-Message-State: ACgBeo3I2SZtGXj/PIjrlwB8+4E65AWwmhGA2L+5jhrlNksUCF/ElF2c
 N3Z39gNNl3ovykaX5pQjpvP8rtxqfkArDQPQEsEBHBDpPZUFsfHPAlVZagvlBjDfdet5YkB4II7
 0bgF7oyzse81tzmCI8nYKVFwH6H56e+UqTOTOkZQUSsV8PzohbHPdfGt+HQYKlp/ixtw=
X-Received: by 2002:a05:6402:428e:b0:443:8279:13ea with SMTP id
 g14-20020a056402428e00b00443827913eamr30108947edc.294.1662056742536; 
 Thu, 01 Sep 2022 11:25:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4K2iIbs1SXvxUGzbXhC72wE4uSWevTWKUMqAaMN1H7MT6Mkhbq0sg5IS9n0LXal7ttH6cRpw==
X-Received: by 2002:a05:6402:428e:b0:443:8279:13ea with SMTP id
 g14-20020a056402428e00b00443827913eamr30108933edc.294.1662056742260; 
 Thu, 01 Sep 2022 11:25:42 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 q23-20020aa7cc17000000b004404e290e7esm1696000edt.77.2022.09.01.11.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>
Subject: [PULL 39/39] target/i386: AVX+AES helpers prep
Date: Thu,  1 Sep 2022 20:24:29 +0200
Message-Id: <20220901182429.93533-40-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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
index c791e86af7..c0766de18d 100644
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
2.37.2


