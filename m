Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED055A9182
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:03:41 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfAq-0006sZ-9p
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTeMD-0002fv-Ub
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:11:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTeMA-0006IK-F7
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662016276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xt1WclYw4Ucp6iZOsqhxpmF7ibCoEVLE6kpyI7fs900=;
 b=HbgYkbJ0KOqHvneJnWQW0f3SjyvwSnRXjo7j4XiQj7CkzFwv54MFAeE80M05ImyKrWNEYC
 WenBRyNpAjv+x+w5NuSgAEN+Q22mVKhKeqPjqJ13xjZBwD2KUL0MO2xQjQuiThL6dwQR/T
 vGoeQgQCuW2DzmA6UeuzuiH5w6lqVhM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-MBdZfhEBMoC1a_8L_uiiRg-1; Thu, 01 Sep 2022 03:11:14 -0400
X-MC-Unique: MBdZfhEBMoC1a_8L_uiiRg-1
Received: by mail-ej1-f69.google.com with SMTP id
 sd6-20020a1709076e0600b0073315809fb5so6338049ejc.10
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=xt1WclYw4Ucp6iZOsqhxpmF7ibCoEVLE6kpyI7fs900=;
 b=k3svSrOeuBUSjCDFyIvAOADvo52Hyl9bNeFlwVrLIb1OGo5ODkiQ6ll3zXHsF+tRNc
 zONRru74Hw8isgWWVprBJp4GgPPfNNqu5kFT9muZ/yi5H78ySI702E9UQwyUhg4oIqe2
 bcmVnI00n7TEJtMTSvHn4QsftCBkW+OYaQJPW3CqEdSya1PWZL6XB+CmEEdgqnY5AWAJ
 +lEdh/+3qcXjZke/JwM2Sgi6vcAjKrSjTENFHhiArNPSm9Ze53MpaTMxMqURWRobMmMY
 kMx7TzYVhDmOo/pf9zdzTtXMiwch6G3tFTwxi32EjUv3csUJfjpCeK0O/d97XuQvj4uf
 Dl9w==
X-Gm-Message-State: ACgBeo0whm7R8HyTTe+86JiLcpt4gEYGB1+Lmch2ZLSXCAvEveLrTGC+
 sp910/cXFTKQE0wADZWC88FJKOyKtnPbNRKl9/HzYKMv5+roQB5PNinTZWmvTHJdb/vlYZzIQ5n
 aVvdDdaf1+2FWwKNG0aA5jJx37zLLMRq9rNyMhesgTNQfp9TsAg04IBJpAih/THnSxK8=
X-Received: by 2002:a05:6402:354d:b0:448:1f80:e737 with SMTP id
 f13-20020a056402354d00b004481f80e737mr20244592edd.69.1662016273585; 
 Thu, 01 Sep 2022 00:11:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6K+oNmUcCwAGPqPZirh9oIPcU04ImrQDb6vnC6lKNBEL/hhrPbFr41TYw908bNmDnALPGI8g==
X-Received: by 2002:a05:6402:354d:b0:448:1f80:e737 with SMTP id
 f13-20020a056402354d00b004481f80e737mr20244574edd.69.1662016273266; 
 Thu, 01 Sep 2022 00:11:13 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 q18-20020a17090609b200b0073ddff7e432sm8173396eje.14.2022.09.01.00.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:11:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] target/i386: rewrite destructive 3DNow operations
Date: Thu,  1 Sep 2022 09:11:11 +0200
Message-Id: <20220901071111.43589-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
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

Remove use of the MOVE macro, since it will be purged from
MMX/SSE as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index f603981ab8..2c0090a647 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1327,11 +1327,11 @@ void helper_pf2iw(CPUX86State *env, MMXReg *d, MMXReg *s)
 
 void helper_pfacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 {
-    MMXReg r;
+    float32 r;
 
-    r.MMX_S(0) = float32_add(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
-    r.MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    MOVE(*d, r);
+    r = float32_add(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
+    d->MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
+    d->MMX_S(0) = r;
 }
 
 void helper_pfadd(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1392,20 +1392,20 @@ void helper_pfmul(CPUX86State *env, MMXReg *d, MMXReg *s)
 
 void helper_pfnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 {
-    MMXReg r;
+    float32 r;
 
-    r.MMX_S(0) = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
-    r.MMX_S(1) = float32_sub(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    MOVE(*d, r);
+    r = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
+    d->MMX_S(1) = float32_sub(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
+    d->MMX_S(0) = r;
 }
 
 void helper_pfpnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 {
-    MMXReg r;
+    float32 r;
 
-    r.MMX_S(0) = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
-    r.MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    MOVE(*d, r);
+    r = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
+    d->MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
+    d->MMX_S(0) = r;
 }
 
 void helper_pfrcp(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1438,11 +1438,11 @@ void helper_pfsubr(CPUX86State *env, MMXReg *d, MMXReg *s)
 
 void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 {
-    MMXReg r;
+    uint32_t r;
 
-    r.MMX_L(0) = s->MMX_L(1);
-    r.MMX_L(1) = s->MMX_L(0);
-    MOVE(*d, r);
+    r = s->MMX_L(0);
+    d->MMX_L(0) = s->MMX_L(1);
+    d->MMX_L(1) = r;
 }
 #endif
 
-- 
2.37.1


