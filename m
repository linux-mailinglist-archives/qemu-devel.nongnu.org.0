Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8915C5FE518
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:13:42 +0200 (CEST)
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6ST-0000Z3-Cl
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63i-0002qO-TT
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63g-0005J8-TA
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+rs1/WmHEQ070rb0qOWPUYpr19R9HQxlkUYPKI4/gTE=;
 b=aTZkwjgtsiFBV4eKLK6KZ4yy57uI8kiIDUQkr+fiMRr/++rPgruBlcl6qM4bHg3MWoLfrn
 fO8QH4y6LiY5tyRV2vLb6Pk7FeviyluIHv2Ko76mVx+43t17/Tmla9TQCHlSnY2UoYceY1
 a63GU0g07VGLirBOFRXEqiWyPMAac8o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-Fja72taqPjG582Fz3TIibA-1; Thu, 13 Oct 2022 17:48:03 -0400
X-MC-Unique: Fja72taqPjG582Fz3TIibA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s8-20020a056402520800b0045cab560d5eso2345066edd.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rs1/WmHEQ070rb0qOWPUYpr19R9HQxlkUYPKI4/gTE=;
 b=du85atn8t6U/KJIlm2zyIFvQIY/ESi+HNHH0uzVTnlDf/v7xfeCJ+SBX0GXoUaUCiD
 IPktw7gYdAT68gKDiX++HD1ehTXJMvmi3cguhuaj9zegITz+LK8d71s+KfNlbGqwRO9O
 sgDFvtMfGJ3eq4AbfrPugxjDj7SFdWsIEQ5I0GhhxsUzNAurEQgF6mXebr78G+9G5k5X
 H3jwSmTfClAJQ7WbOVQC3RT/TK9hRppEqjBk54FUc3PG/9vSE2m7J/7Uj21I0AdmMfmV
 tIs4BeSQApQQqryN3a/CX3eWxsBxQ5O11wCWH/ItYgu3TIPQ+L5Wvd0UMJ4T36ighvtU
 5ksw==
X-Gm-Message-State: ACrzQf29tPLRLTmHWes4Bx/qeFF/lL6n+AiVpgzZJ/wPnezcd0Y3mRUc
 3RS4n0j0C9ZCyqFOLOxOHkATLTpcNQTl6T/ZoynhApOEVApa13j0kvmc3DU8dnFyhqfsHXhpoCH
 uzWU9ilxpP/ZLiSFyiYrRTiZrqgVFPZFo7Ez0uZ8kJl1Ou7/giuOfKJ52XnLyFhTGjgc=
X-Received: by 2002:a17:907:3f1e:b0:78d:f198:fd00 with SMTP id
 hq30-20020a1709073f1e00b0078df198fd00mr1304027ejc.730.1665697681648; 
 Thu, 13 Oct 2022 14:48:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7YTM3HppAs5YG6WEe1iRQvPTBZImVoC3o4FV3k0kmA8M0JcOlDo/tjPEv1zahma8X/4U0/Pg==
X-Received: by 2002:a17:907:3f1e:b0:78d:f198:fd00 with SMTP id
 hq30-20020a1709073f1e00b0078df198fd00mr1304015ejc.730.1665697681364; 
 Thu, 13 Oct 2022 14:48:01 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h28-20020a1709070b1c00b00780f6071b5dsm408596ejl.188.2022.10.13.14.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 23/35] target/i386: clarify (un)signedness of immediates from
 0F3Ah opcodes
Date: Thu, 13 Oct 2022 23:46:39 +0200
Message-Id: <20221013214651.672114-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Three-byte opcodes from the 0F3Ah area all have an immediate byte which
is usually unsigned.  Clarify in the helper code that it is unsigned;
the new decoder treats immediates as signed by default, and seeing
an intN_t in the prototype might give the wrong impression that one
can use decode->immediate directly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 8 ++++----
 target/i386/ops_sse_header.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 090ba013b3..e7830ff277 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1605,17 +1605,17 @@ SSE_HELPER_W(helper_psignw, FSIGNW)
 SSE_HELPER_L(helper_psignd, FSIGNL)
 
 void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
-                                  int32_t shift)
+                                  uint32_t imm)
 {
     int i;
 
     /* XXX could be checked during translation */
-    if (shift >= (SHIFT ? 32 : 16)) {
+    if (imm >= (SHIFT ? 32 : 16)) {
         for (i = 0; i < (1 << SHIFT); i++) {
             d->Q(i) = 0;
         }
     } else {
-        shift <<= 3;
+        int shift = imm * 8;
 #define SHR(v, i) (i < 64 && i > -64 ? i > 0 ? v >> (i) : (v << -(i)) : 0)
 #if SHIFT == 0
         d->Q(0) = SHR(s->Q(0), shift - 0) |
@@ -2093,7 +2093,7 @@ static inline int pcmp_val(Reg *r, uint8_t ctrl, int i)
 }
 
 static inline unsigned pcmpxstrx(CPUX86State *env, Reg *d, Reg *s,
-                                 int8_t ctrl, int valids, int validd)
+                                 uint8_t ctrl, int valids, int validd)
 {
     unsigned int res = 0;
     int v;
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 440f1c0e78..98178be148 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -335,7 +335,7 @@ DEF_HELPER_4(glue(pshufb, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignb, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignw, SUFFIX), void, env, Reg, Reg, Reg)
 DEF_HELPER_4(glue(psignd, SUFFIX), void, env, Reg, Reg, Reg)
-DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, s32)
+DEF_HELPER_5(glue(palignr, SUFFIX), void, env, Reg, Reg, Reg, i32)
 
 /* SSE4.1 op helpers */
 #if SHIFT >= 1
-- 
2.37.3


