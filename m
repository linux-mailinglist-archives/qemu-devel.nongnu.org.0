Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F185A9FC1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:18:08 +0200 (CEST)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTphV-0007jp-TV
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosy-0000GE-PV
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTost-0000D4-9c
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JN2SfNqFBlwDXIYqv5935fDvywWJbibRuRraNQGfaOE=;
 b=f/lH1R9SSzxR/DI5+VzsNYEmQfDQOT/ya9EZOoEwnMjagGF3WMgRQv15c69savSrNzBJR5
 aK20dwE6d3GpL8ipS4v+zALv2aoDsscuUAoY5F9Cjll5VYShwkbmJS5Nehj+Q2iI4fM/8Q
 x4gfDGax4vB6DwXpq8VTbM4KkS/aOzY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-giOmZPvBP1GFbk69vHfBHQ-1; Thu, 01 Sep 2022 14:25:44 -0400
X-MC-Unique: giOmZPvBP1GFbk69vHfBHQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 sb14-20020a1709076d8e00b0073d48a10e10so7329245ejc.16
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JN2SfNqFBlwDXIYqv5935fDvywWJbibRuRraNQGfaOE=;
 b=3hfzksj8O0nsCPBkEqymSzwu5AUr+C5Js2kUfgkb81q+ospEI/9/cA6M04+1KVX00r
 +ILe6CWtCszVS0uR3IgwGwbL34C8QUmlVhQ2gLdQQjJsL+esjUfOSZsj9FGZZuU+vhdx
 L9522axHG/fu9+6/hzWIy0BoMS323wmzkobwHNtkFT9rK/60DnES/+jln0UjIiOwI0zq
 zbu6wz483P4KbcAeSTM5BSOIVR7r1iozVfA3VkRYEeQg/FZYmg3NEZ4I9C0kDDmhED5a
 3kZ0UeBxkHQpQr+k5wTA1ZhSBrN9L//XVQgz9iq+0YWdfuUILPrDi6HACz0B2W67pqw7
 LYWA==
X-Gm-Message-State: ACgBeo34zqMjy4kP6aA377CccqbCaUbiIqQNHl8scrNyAgwONbrCSI/A
 c1E3J3Eo8NL7fSb5rgc78gv+puKovHZNoK16ENP/GpL4edmweEeuGO+slDsgpcW9AbY2dP7fYh8
 ftsVghqKcIZhyrryFtOLfdfYgsRZvtpaEeqUCPf6Z7KiuWKNRODzkyYhtYtBm+TZC7HI=
X-Received: by 2002:a17:907:1606:b0:73d:b512:d91d with SMTP id
 hb6-20020a170907160600b0073db512d91dmr24533133ejc.276.1662056742102; 
 Thu, 01 Sep 2022 11:25:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5FpbH1UEy18OxWTs+ZKqUuUmhJ2Dda4x6lrvrZ46oF/GwNXm2laVBSITHI8rPf4/3ZHM8Y2w==
X-Received: by 2002:a17:907:1606:b0:73d:b512:d91d with SMTP id
 hb6-20020a170907160600b0073db512d91dmr24533065ejc.276.1662056740567; 
 Thu, 01 Sep 2022 11:25:40 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 lo5-20020a170906fa0500b0073cf8e0355fsm8697428ejb.208.2022.09.01.11.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 38/39] target/i386: AVX pclmulqdq prep
Date: Thu,  1 Sep 2022 20:24:28 +0200
Message-Id: <20220901182429.93533-39-pbonzini@redhat.com>
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

Make the pclmulqdq helper AVX ready

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-21-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 5241663227..c791e86af7 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2211,14 +2211,14 @@ target_ulong helper_crc32(uint32_t crc1, target_ulong msg, uint32_t len)
 
 #endif
 
-void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-                                    uint32_t ctrl)
+#if SHIFT == 1
+static void clmulq(uint64_t *dest_l, uint64_t *dest_h,
+                          uint64_t a, uint64_t b)
 {
-    uint64_t ah, al, b, resh, resl;
+    uint64_t al, ah, resh, resl;
 
     ah = 0;
-    al = d->Q((ctrl & 1) != 0);
-    b = s->Q((ctrl & 16) != 0);
+    al = a;
     resh = resl = 0;
 
     while (b) {
@@ -2231,8 +2231,23 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         b >>= 1;
     }
 
-    d->Q(0) = resl;
-    d->Q(1) = resh;
+    *dest_l = resl;
+    *dest_h = resh;
+}
+#endif
+
+void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                                    uint32_t ctrl)
+{
+    Reg *v = d;
+    uint64_t a, b;
+    int i;
+
+    for (i = 0; i < 1 << SHIFT; i += 2) {
+        a = v->Q(((ctrl & 1) != 0) + i);
+        b = s->Q(((ctrl & 16) != 0) + i);
+        clmulq(&d->Q(i), &d->Q(i + 1), a, b);
+    }
 }
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
-- 
2.37.2



