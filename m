Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8825FB1A2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:40:23 +0200 (CEST)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDcV-0006qJ-09
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUo-0002hi-2s
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUh-0004cG-Af
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BS2g2X/V4dwTQ7sn/aL9gdQqszEHgXW7A6VLXMpwY9k=;
 b=cb/1J58XuMc62/47NIH9TES9p1yqp+X2QU5I3gy1OGPScnNm22jxaE1ZESUdw0PysOd9Kh
 SupBykHfE9q0svHEqwcphfEB8RkC2M4UKSDfAqndi4BsApX8n0IWEzaSnYWNO9L5K1KT88
 fbnUq45++yvDtWrMioekOyVQ2pu3kE0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-5O-ZKwDtPgm5Al_OkchSyg-1; Tue, 11 Oct 2022 06:28:13 -0400
X-MC-Unique: 5O-ZKwDtPgm5Al_OkchSyg-1
Received: by mail-ej1-f69.google.com with SMTP id
 qa14-20020a170907868e00b0078db5ba61bdso1972285ejc.12
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BS2g2X/V4dwTQ7sn/aL9gdQqszEHgXW7A6VLXMpwY9k=;
 b=1AHt+nI//r0e8pixs4+Omoot0c2dS61KWhzgjIBwrRyDunFnZY5900ofrIHorfCWnP
 biR9I0Jrj9oWaFSHJJ7O/mk+xWOSRhd82ExawMXJ8dh6q66Np4myU9DdFyT9aLS5xcBH
 eIliPu/vk2as/BOTr3Ctx9hOyNw6ieHO/0eYJ1E0atXasuccL06sqda7P7tmlBA1mqAC
 HmdFAFfrxkkY0g3dRFtQaSJ1xVT45s5w5Px9CGs9QvBho2aqk8+ZoN+tU9Tk2os26yt9
 Otn62ge7D9xXBKj1DfAQ6tCrNLQ+MT3tCrwa1LhdtZntF6b3FTwo2LNbXz3yepKFuhPt
 WqLQ==
X-Gm-Message-State: ACrzQf0lgqSAT0YXU1KighPBS5SDB/gHvFK68ufAagi0tXTKu5UEis17
 cUs4Q2zEy9PmMdStgCb7FWVZKMJjsoiGlKIr/Y+24uVYS+9HHd/hmETgmI6S1uY8tty164CXfBF
 AMfbp2qVCd2ZshNPAVNtX/v6EkNBxEPSdE0z/tIoffTqywK9jEQHOPI301k8B2Sbi8y4=
X-Received: by 2002:a17:907:2c75:b0:78d:c201:e9aa with SMTP id
 ib21-20020a1709072c7500b0078dc201e9aamr5974321ejc.235.1665484091976; 
 Tue, 11 Oct 2022 03:28:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uXQ5GQcRrYXJI6v+6yZBVduvLHYutyo1E2ZjTl4yGc2o6iKAqOmKD7h51biX2iGPaqZnwNQ==
X-Received: by 2002:a17:907:2c75:b0:78d:c201:e9aa with SMTP id
 ib21-20020a1709072c7500b0078dc201e9aamr5974308ejc.235.1665484091689; 
 Tue, 11 Oct 2022 03:28:11 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a1709063b5300b0078d4c72e2cesm6693572ejf.44.2022.10.11.03.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 24/37] target/i386: Use gen_jmp_rel for gen_jcc
Date: Tue, 11 Oct 2022 12:26:47 +0200
Message-Id: <20221011102700.319178-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-20-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 57 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 434a6ad6cd..5b84be4975 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2409,32 +2409,14 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
     }
 }
 
-static inline void gen_jcc(DisasContext *s, int b,
-                           target_ulong val, target_ulong next_eip)
+static void gen_jcc(DisasContext *s, int b, int diff)
 {
-    TCGLabel *l1, *l2;
+    TCGLabel *l1 = gen_new_label();
 
-    if (s->jmp_opt) {
-        l1 = gen_new_label();
-        gen_jcc1(s, b, l1);
-
-        gen_goto_tb(s, 0, next_eip);
-
-        gen_set_label(l1);
-        gen_goto_tb(s, 1, val);
-    } else {
-        l1 = gen_new_label();
-        l2 = gen_new_label();
-        gen_jcc1(s, b, l1);
-
-        gen_jmp_im(s, next_eip);
-        tcg_gen_br(l2);
-
-        gen_set_label(l1);
-        gen_jmp_im(s, val);
-        gen_set_label(l2);
-        gen_eob(s);
-    }
+    gen_jcc1(s, b, l1);
+    gen_jmp_rel_csize(s, 0, 1);
+    gen_set_label(l1);
+    gen_jmp_rel(s, s->dflag, diff, 0);
 }
 
 static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
@@ -4780,7 +4762,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     int shift;
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
-    target_ulong next_eip, tval;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
 
@@ -6933,22 +6914,20 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
-        tval = (int8_t)insn_get(env, s, MO_8);
-        goto do_jcc;
+        {
+            int diff = (int8_t)insn_get(env, s, MO_8);
+            gen_bnd_jmp(s);
+            gen_jcc(s, b, diff);
+        }
+        break;
     case 0x180 ... 0x18f: /* jcc Jv */
-        if (dflag != MO_16) {
-            tval = (int32_t)insn_get(env, s, MO_32);
-        } else {
-            tval = (int16_t)insn_get(env, s, MO_16);
+        {
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
+            gen_bnd_jmp(s);
+            gen_jcc(s, b, diff);
         }
-    do_jcc:
-        next_eip = s->pc - s->cs_base;
-        tval += next_eip;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jcc(s, b, tval, next_eip);
         break;
 
     case 0x190 ... 0x19f: /* setcc Gv */
-- 
2.37.3


