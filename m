Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FDB5BD44E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:00:35 +0200 (CEST)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaL4L-00006P-VJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKg9-0003K6-27
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfx-00039u-IS
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GHA4iB+vWgQgvrjq6bsYLAWGMi0ifafcuMJ1u5P5lbc=;
 b=d+eC8sBx9t0Eyo6bz+7HnJTk8M3o3GGtbMlquExvlAjhmGjWR2UHtzkYNIXdQNudHmovk/
 lTHNh/yI7lFrMeRg8Xe5B8SXmBB0y3Lh8tZPupdz2vmmEROKIq8ALP9fIqt4hhDjrij4z0
 ca6sM0HaGoajxFOml1Bx2s+0tiPFvng=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-5KCtpuAqPgu4plulixSV2g-1; Mon, 19 Sep 2022 13:35:19 -0400
X-MC-Unique: 5KCtpuAqPgu4plulixSV2g-1
Received: by mail-wr1-f71.google.com with SMTP id
 d30-20020adfa41e000000b00228c0e80c49so29185wra.21
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GHA4iB+vWgQgvrjq6bsYLAWGMi0ifafcuMJ1u5P5lbc=;
 b=ozciYD5Tm7nk1CnRSc+09mbYoUC4Yr87LatBIFnchoi0NxQ8SjuXlnPG35zCTOZEWs
 Jou6w5zo1V6MqV0NFYd+R9hgwTzrJ6QO6hciFhXv/pR9Lhdkf1IbADfJ1l3WpFcJHxGw
 P8vVQsmKy1g3xt18NbkJj9wjnQDm45sjGGBaeWi1fh1slsVPfzBTFSnfuVgakDJHUpXy
 BVLTfpSfcRmq9viKmt4l2n0CPPLXRzFm+q/b2jSQDk4ztxoEJXUbJ7U5mBsxOiNRAL05
 RYONl+tpYlYhGEkqnuZsWopzq89gRH1ZYEtz9ybmGY0YCEMnvkbFEID+eDu+da9IrhJb
 iYTg==
X-Gm-Message-State: ACgBeo3Cc46IvjwnJir2GNBILO5fB6ZBKsjTpwNBnC3/Td0U+6LkaqnT
 rlsi1+ODotMYX/QX95aheAK0O75HE2/2P1XCx1o2/CJtr5aanvFKnjrYyNa41z2OM3hSJdy55ol
 jmJBKzDLGbI7a7gofXPAPtQuJgRpkOKnbopq535OGDYcfEhGdisCoyL0zQN4DpKZO2uw=
X-Received: by 2002:a05:600c:2646:b0:3b4:7640:3c1a with SMTP id
 6-20020a05600c264600b003b476403c1amr20521817wmy.2.1663608917886; 
 Mon, 19 Sep 2022 10:35:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5oZLXy7SpmN7t6SDDdy+JKEJIRGLfMhdQH4gwz/+QQaan4bIU5ZKPXjn7BP5QNavIxwPtbzg==
X-Received: by 2002:a05:600c:2646:b0:3b4:7640:3c1a with SMTP id
 6-20020a05600c264600b003b476403c1amr20521799wmy.2.1663608917456; 
 Mon, 19 Sep 2022 10:35:17 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a05600c20c900b003a541d893desm13980863wmm.38.2022.09.19.10.35.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] target/i386: fix INSERTQ implementation
Date: Mon, 19 Sep 2022 19:34:45 +0200
Message-Id: <20220919173449.5864-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

INSERTQ is defined to not modify any bits in the lower 64 bits of the
destination, other than the ones being replaced with bits from the
source operand.  QEMU instead is using unshifted bits from the source
for those bits.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 10 +++++-----
 target/i386/ops_sse_header.h |  2 +-
 target/i386/tcg/translate.c  | 14 ++++++++++++--
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 3504bca36a..7bf8bb967d 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -934,7 +934,7 @@ void helper_extrq_i(CPUX86State *env, ZMMReg *d, int index, int length)
     d->ZMM_Q(0) = helper_extrq(d->ZMM_Q(0), index, length);
 }
 
-static inline uint64_t helper_insertq(uint64_t src, int shift, int len)
+static inline uint64_t helper_insertq(uint64_t dest, uint64_t src, int shift, int len)
 {
     uint64_t mask;
 
@@ -943,17 +943,17 @@ static inline uint64_t helper_insertq(uint64_t src, int shift, int len)
     } else {
         mask = (1ULL << len) - 1;
     }
-    return (src & ~(mask << shift)) | ((src & mask) << shift);
+    return (dest & ~(mask << shift)) | ((src & mask) << shift);
 }
 
 void helper_insertq_r(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_Q(0) = helper_insertq(s->ZMM_Q(0), s->ZMM_B(9) & 63, s->ZMM_B(8) & 63);
+    d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), s->ZMM_Q(0), s->ZMM_B(9) & 63, s->ZMM_B(8) & 63);
 }
 
-void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
+void helper_insertq_i(CPUX86State *env, ZMMReg *d, ZMMReg *s, int index, int length)
 {
-    d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), index, length);
+    d->ZMM_Q(0) = helper_insertq(d->ZMM_Q(0), s->ZMM_Q(0), index, length);
 }
 #endif
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index d99464afb0..400b24c091 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -193,7 +193,7 @@ DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(extrq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
-DEF_HELPER_4(insertq_i, void, env, ZMMReg, int, int)
+DEF_HELPER_5(insertq_i, void, env, ZMMReg, ZMMReg, int, int)
 DEF_HELPER_3(glue(haddps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(haddpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(hsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8ec91d17af..5f31a59fb8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3506,10 +3506,20 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_helper_extrq_i(cpu_env, s->ptr0,
                                        tcg_const_i32(bit_index),
                                        tcg_const_i32(field_length));
-                else
-                    gen_helper_insertq_i(cpu_env, s->ptr0,
+                else {
+                    if (mod != 3) {
+                        gen_lea_modrm(env, s, modrm);
+                        op2_offset = offsetof(CPUX86State, xmm_t0);
+                        gen_ldq_env_A0(s, offsetof(CPUX86State, xmm_t0.ZMM_D(0)));
+                    } else {
+                        rm = (modrm & 7) | REX_B(s);
+                        op2_offset = ZMM_OFFSET(rm);
+                    }
+                    tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+                    gen_helper_insertq_i(cpu_env, s->ptr0, s->ptr1,
                                          tcg_const_i32(bit_index),
                                          tcg_const_i32(field_length));
+                }
             }
             break;
         case 0x7e: /* movd ea, mm */
-- 
2.37.2


