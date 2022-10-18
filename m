Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6CF602E41
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:21:22 +0200 (CEST)
Received: from localhost ([::1]:58980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknT7-0006p0-Ie
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiu-0005DT-Qc
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmij-0005Ro-72
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666100004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/RkhR7opaZ4IzoG7vXtx6p3CuSbT28royjK2MZw64A=;
 b=dh4+GCirpNQT6u6D9tKhJtCZU5n/by+6wVm+2i7PGy4C1BN4o3kLN5mUAeTqPDw5FMOw8m
 ie4WcrmVtw8szf1cMVjFllAvTP10yqh4sddc9TvZrpgRzHIghwbGZeiVbQFuDBOZUTGmEZ
 qHzJI2qkhPt0uQjk64JLVsMYbRCI41U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-YPm12SjoOIKTyzx2n-J-ag-1; Tue, 18 Oct 2022 09:33:23 -0400
X-MC-Unique: YPm12SjoOIKTyzx2n-J-ag-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz9-20020a0564021d4900b0045d9a3aded4so4289230edb.22
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/RkhR7opaZ4IzoG7vXtx6p3CuSbT28royjK2MZw64A=;
 b=b8kyTBkFkMjK7cDsUg1elD5TK2AxljnXqmw0L1VXsdI3Orvg6+CpdSyXwSKOMm6ax7
 NVQQs8yEd/985TzpynP93vGM+6tLWAhTwTZWhrycKrOu0Keec2SW0oiLkI430j7b4Yg3
 aEn319In2D9JPzbvQD5BxFK+sPED3CO3erajEYyx0HTyCnQAzeq+fTU4XYyYbTndHaCY
 jk5bx4M58Z/PSUAouDAWTLfI7SFa7OjXYOYxy0np621RCKpUcKCHqALDrHUdhXYBddMu
 6AFTN+aYpBBgofBVwGtsiDkt3gxNP7MAp8zU7i14XseQTY23ykLVHDBrDHQIx1td2TwE
 hdMw==
X-Gm-Message-State: ACrzQf37N4/2tYEufA0y9ZBdQZQz88rfy542wadP128l6/6VHf8by/eR
 ueGNwRz9J6WHW4b/titU9wy2eupSia+lNY3Ixnwtmj3RnlhB2W7Iw9cHHvHz8wb1zuD5kvH2LhK
 hmNe3uxxRo+GQGE2rW0qlcx+de6ZaZG+Eze+ki5EmNKvg2/esX+Y69FLMQBssQFAqLZ0=
X-Received: by 2002:a05:6402:1604:b0:458:b2b7:bd5a with SMTP id
 f4-20020a056402160400b00458b2b7bd5amr2514612edv.73.1666100000638; 
 Tue, 18 Oct 2022 06:33:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7VBpcAOeu2OCw67g3LyQv8tG4Na1JRtckpbdkE8JAyY5LIatc2lBty59qlEEJkRvbufRCt/Q==
X-Received: by 2002:a05:6402:1604:b0:458:b2b7:bd5a with SMTP id
 f4-20020a056402160400b00458b2b7bd5amr2514587edv.73.1666100000327; 
 Tue, 18 Oct 2022 06:33:20 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a170906d11600b0078d2d5b90f4sm7568318ejz.32.2022.10.18.06.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:33:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 48/53] target/i386: implement XSAVE and XRSTOR of AVX registers
Date: Tue, 18 Oct 2022 15:30:37 +0200
Message-Id: <20221018133042.856368-49-pbonzini@redhat.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/fpu_helper.c | 78 ++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 5f3f7a1085..7670739abe 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2559,6 +2559,22 @@ static void do_xsave_sse(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     }
 }
 
+static void do_xsave_ymmh(CPUX86State *env, target_ulong ptr, uintptr_t ra)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++, ptr += 16) {
+        cpu_stq_data_ra(env, ptr, env->xmm_regs[i].ZMM_Q(2), ra);
+        cpu_stq_data_ra(env, ptr + 8, env->xmm_regs[i].ZMM_Q(3), ra);
+    }
+}
+
 static void do_xsave_bndregs(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
     target_ulong addr = ptr + offsetof(XSaveBNDREG, bnd_regs);
@@ -2651,6 +2667,9 @@ static void do_xsave(CPUX86State *env, target_ulong ptr, uint64_t rfbm,
     if (opt & XSTATE_SSE_MASK) {
         do_xsave_sse(env, ptr, ra);
     }
+    if (opt & XSTATE_YMM_MASK) {
+        do_xsave_ymmh(env, ptr + XO(avx_state), ra);
+    }
     if (opt & XSTATE_BNDREGS_MASK) {
         do_xsave_bndregs(env, ptr + XO(bndreg_state), ra);
     }
@@ -2725,6 +2744,54 @@ static void do_xrstor_sse(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     }
 }
 
+static void do_clear_sse(CPUX86State *env)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+    }
+}
+
+static void do_xrstor_ymmh(CPUX86State *env, target_ulong ptr, uintptr_t ra)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++, ptr += 16) {
+        env->xmm_regs[i].ZMM_Q(2) = cpu_ldq_data_ra(env, ptr, ra);
+        env->xmm_regs[i].ZMM_Q(3) = cpu_ldq_data_ra(env, ptr + 8, ra);
+    }
+}
+
+static void do_clear_ymmh(CPUX86State *env)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
 static void do_xrstor_bndregs(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
     target_ulong addr = ptr + offsetof(XSaveBNDREG, bnd_regs);
@@ -2831,9 +2898,14 @@ static void do_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm, uintptr
         if (xstate_bv & XSTATE_SSE_MASK) {
             do_xrstor_sse(env, ptr, ra);
         } else {
-            /* ??? When AVX is implemented, we may have to be more
-               selective in the clearing.  */
-            memset(env->xmm_regs, 0, sizeof(env->xmm_regs));
+            do_clear_sse(env);
+        }
+    }
+    if (rfbm & XSTATE_YMM_MASK) {
+        if (xstate_bv & XSTATE_YMM_MASK) {
+            do_xrstor_ymmh(env, ptr + XO(avx_state), ra);
+        } else {
+            do_clear_ymmh(env);
         }
     }
     if (rfbm & XSTATE_BNDREGS_MASK) {
-- 
2.37.3


