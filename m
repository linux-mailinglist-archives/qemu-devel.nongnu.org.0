Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471275A3293
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:24:46 +0200 (CEST)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRigv-0006mw-CF
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVj-0007Fc-Ox
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiVW-0007su-8l
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQkmLXOo3oapP2Ppxp4sKP0WmFrqbzXLa3eq0R8XHlA=;
 b=SvPE5+VzdznqacggXgTpYyB0OjuBpmv7THVRB7N9S5zlnILMMSaWq7NWs1FNncrGuuK6E/
 e2LekbiVj8OcYHVThlldjEQw84oA15I+AZgl26s7xFadAJHUmFuEjB8rCAkafz5vNKZ0G7
 lCulSpmYZoCJ9f1773MtqRsLSHqj0Io=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-EXpMrZ8NOy-0sciEhwBjRw-1; Fri, 26 Aug 2022 19:12:55 -0400
X-MC-Unique: EXpMrZ8NOy-0sciEhwBjRw-1
Received: by mail-ed1-f69.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so1837538eda.19
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VQkmLXOo3oapP2Ppxp4sKP0WmFrqbzXLa3eq0R8XHlA=;
 b=iPThjoGywGAt+pKpuvaPYdOvKW0aTCtML0MdU8/RZaHJHMpaCdLD0ckYlFm2OA8mf3
 7aoRdFjP9lkGhtwUWN1VIe2efZoAo6XgGlfkYB3QvhQUrP2oUuFjrceLtUFuSStfts6N
 CvOyha/XRl18YFZWmYSG8zI+ud5Bi5ZxN9ArOWL7RMYeZnJ8vcKoq01N0V6w6Vz5gK1C
 pM2YHwOAfuFL0zIi6zLzYF5jpQanF3RzfYSBbjqBeR2AnyLax3ehD8mVaq0GQ8CDfEZp
 eIBopK01FOD0UPOCb02ncmNH4xuil+CY7hzWBnU099XW/Vp+kmd/rMOUhBAXo4dhExIz
 MkCw==
X-Gm-Message-State: ACgBeo19FksL37gQs0+lQg4t2b61mjjO16SaEWo499/TIb1UMkFOv3cj
 Z4Q3NbBc7EmyvaLo4Ciw0n5+6apQmbTYbbX7h34GKfgNnQnQ1u+jfwpKDYX5ya8Ds5YPgKYSUTq
 L45tKL/FxY9UP83IRO5X3dmAB4y9oWQUHAF8le7xbFv1qq/gZ+ECvikJ9oA6u0TTkRUc=
X-Received: by 2002:a17:907:1dd2:b0:740:97ab:1f9b with SMTP id
 og18-20020a1709071dd200b0074097ab1f9bmr2702385ejc.319.1661555574235; 
 Fri, 26 Aug 2022 16:12:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6HdyeWRdCDVbcTGrQIdsmV4dptuJ3GE6RESzpzsi+MtBuG77xEGjhiUwaDWUdSspnp3BSMtA==
X-Received: by 2002:a17:907:1dd2:b0:740:97ab:1f9b with SMTP id
 og18-20020a1709071dd200b0074097ab1f9bmr2702375ejc.319.1661555573945; 
 Fri, 26 Aug 2022 16:12:53 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 p13-20020a17090653cd00b0074149364e76sm124254ejo.27.2022.08.26.16.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 23/23] i386: AVX+AES helpers prep
Date: Sat, 27 Aug 2022 01:12:04 +0200
Message-Id: <20220826231204.201395-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
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
index 2b35b6e533..a42d7b26ba 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2289,64 +2289,66 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
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
+        int j = i & 3;
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
+        int j = i & 3;
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
 
@@ -2364,6 +2366,7 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     d->L(3) = (d->L(2) << 24 | d->L(2) >> 8) ^ ctrl;
 }
 #endif
+#endif
 
 #undef SSE_HELPER_S
 
-- 
2.37.1


