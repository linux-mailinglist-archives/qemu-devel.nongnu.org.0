Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2145A174B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 18:57:06 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRGAD-0002xs-GJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 12:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRG2z-0006kz-LQ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRG2x-0002WJ-Da
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661446174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4F7JyGUN6Ik/gJc/PLLg+kIf9SE5uPDEWBtsr9MyWFY=;
 b=QFK19i8ImrU2rurIXbXqyXo1JCdj/LOSzVmXTLSvp6w+aw9pgADzStswrnWxb56Ur4levI
 Dxbt3fTXmfDiSQNo2ziSUCbW0uEMpb3//SJCXhviK1AvH0DQA8bVf8vdHwK/iGn4Wlzg0u
 dvlb/NizCDWQXLnU1C/tJ8vHdUbSkdQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-jJFDroX1Ph2B57GUuc1vYA-1; Thu, 25 Aug 2022 12:49:33 -0400
X-MC-Unique: jJFDroX1Ph2B57GUuc1vYA-1
Received: by mail-wr1-f71.google.com with SMTP id
 l25-20020adfa399000000b002252058bad2so3629822wrb.11
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 09:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4F7JyGUN6Ik/gJc/PLLg+kIf9SE5uPDEWBtsr9MyWFY=;
 b=N6XwJR38GlCCeWOGh8UqyWGzp7NJaaZkGKkvulbpTx1BAWevsx1lq0ZMdflFNb35sV
 E1zvJlsCOh6xuf1ihFj40NUrRzb+kTDnV2bqeJ6lJ62eHGud9KV8NGLhNZyZrzMvjbdg
 Mz1EZ4NEjl491BobRDasXTRgWM72IN4gNQujM9gVlZivhA265LdbwQsVd538U6E7rUuh
 Tfm+5xD4MZVnRTcDaVZLcCM5CBqT/xUNg2hnoSLtxvFk1sszWqk7dSxqDFd0SBAMgVMK
 DAaMo7+Hitgz6hqk1GqqQlJSyzmnNN8YOc633mm5DR8C3KHwWXItnGoPxWQeRjAMLF9+
 6sQQ==
X-Gm-Message-State: ACgBeo0Xo6HkBzWq6i93Hkuq40rBI9WQPFHQ6Ks+cdneftCnD2EwBQDG
 EWFtsvuGpqxRx0t2dFhUAKau54zFwMu60cWqSN0b0h5z55RrbwJtlIWbMxlN3N589TamEI58Kl6
 4h0rAMkwd3vPx90+7XA0CKLGeW46bn5f32dm/iLcbAJf9ckjyVgSrrIQYL1b5oj8wchA=
X-Received: by 2002:a5d:59a8:0:b0:225:6292:dfc9 with SMTP id
 p8-20020a5d59a8000000b002256292dfc9mr2900614wrr.354.1661446172248; 
 Thu, 25 Aug 2022 09:49:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6qNIbJJqUamZSoycZ35sURKLz5U/mMoQM6zahUyQ2kY7PpaXvrCLo7oMCL6g+zP1LLwKJ2EQ==
X-Received: by 2002:a5d:59a8:0:b0:225:6292:dfc9 with SMTP id
 p8-20020a5d59a8000000b002256292dfc9mr2900599wrr.354.1661446171917; 
 Thu, 25 Aug 2022 09:49:31 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002252c582481sm19929935wrz.84.2022.08.25.09.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 09:49:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] i386: DPPS rounding fix
Date: Thu, 25 Aug 2022 18:49:27 +0200
Message-Id: <20220825164927.393060-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825164927.393060-1-pbonzini@redhat.com>
References: <20220825164927.393060-1-pbonzini@redhat.com>
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

The DPPS (Dot Product) instruction is defined to first sum pairs of
intermediate results, then sum those values to get the final result.
i.e. (A+B)+(C+D)

We incrementally sum the results, i.e. ((A+B)+C)+D, which can result
in incorrect rouding.

For consistency, also change the variable names to the ones used
in the Intel SDM and implement DPPD following the manual.

Based on a patch by Paul Brook <paul@nowt.org>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 67 ++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 2524db4c25..b12b271fcd 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1943,56 +1943,59 @@ SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
 void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 {
-    float32 iresult = float32_zero;
+    float32 prod1, prod2, temp2, temp3, temp4;
 
+    /*
+     * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
+     * to correctly round the intermediate results
+     */
     if (mask & (1 << 4)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(0), s->ZMM_S(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
+    } else {
+        prod1 = float32_zero;
     }
     if (mask & (1 << 5)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(1), s->ZMM_S(1),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
+    } else {
+        prod2 = float32_zero;
     }
+    temp2 = float32_add(prod1, prod2, &env->sse_status);
     if (mask & (1 << 6)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(2), s->ZMM_S(2),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
+    } else {
+        prod1 = float32_zero;
     }
     if (mask & (1 << 7)) {
-        iresult = float32_add(iresult,
-                              float32_mul(d->ZMM_S(3), s->ZMM_S(3),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
+    } else {
+        prod2 = float32_zero;
     }
-    d->ZMM_S(0) = (mask & (1 << 0)) ? iresult : float32_zero;
-    d->ZMM_S(1) = (mask & (1 << 1)) ? iresult : float32_zero;
-    d->ZMM_S(2) = (mask & (1 << 2)) ? iresult : float32_zero;
-    d->ZMM_S(3) = (mask & (1 << 3)) ? iresult : float32_zero;
+    temp3 = float32_add(prod1, prod2, &env->sse_status);
+    temp4 = float32_add(temp2, temp3, &env->sse_status);
+
+    d->ZMM_S(0) = (mask & (1 << 0)) ? temp4 : float32_zero;
+    d->ZMM_S(1) = (mask & (1 << 1)) ? temp4 : float32_zero;
+    d->ZMM_S(2) = (mask & (1 << 2)) ? temp4 : float32_zero;
+    d->ZMM_S(3) = (mask & (1 << 3)) ? temp4 : float32_zero;
 }
 
 void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
 {
-    float64 iresult = float64_zero;
+    float64 prod1, prod2, temp2;
 
     if (mask & (1 << 4)) {
-        iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(0), s->ZMM_D(0),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod1 = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+    } else {
+        prod1 = float64_zero;
     }
     if (mask & (1 << 5)) {
-        iresult = float64_add(iresult,
-                              float64_mul(d->ZMM_D(1), s->ZMM_D(1),
-                                          &env->sse_status),
-                              &env->sse_status);
+        prod2 = float64_mul(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+    } else {
+        prod2 = float64_zero;
     }
-    d->ZMM_D(0) = (mask & (1 << 0)) ? iresult : float64_zero;
-    d->ZMM_D(1) = (mask & (1 << 1)) ? iresult : float64_zero;
+    temp2 = float64_add(prod1, prod2, &env->sse_status);
+    d->ZMM_D(0) = (mask & (1 << 0)) ? temp2 : float64_zero;
+    d->ZMM_D(1) = (mask & (1 << 1)) ? temp2 : float64_zero;
 }
 
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-- 
2.37.1


