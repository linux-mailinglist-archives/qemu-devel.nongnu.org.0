Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319105FB0C4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:50:46 +0200 (CEST)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCqT-0003gA-0P
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTy-0001pT-1w
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTw-0004Nm-B9
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4v10Kc9t6YsWGRDXH0zBX3cO3GWE7Kg1t8plFc8Disk=;
 b=aEy6wr7OrCE2pnVu7g6beeXXnV1fZN/NyNDkq9If4CDmndJ7vDxs+XwHsMyxcpqkBj0oue
 U7v0n7I0bNRtJ+jfT0so49mG2yQvdAUew2A6n/e1lKDb2cCHRP2WKqFpHbZbw+4g8h5LL2
 EyHuvYYo4K/y8RJbvDM2PQ5JFJyHGHU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-IhwUbtE4MMeX9Cm1gO9Yew-1; Tue, 11 Oct 2022 06:27:26 -0400
X-MC-Unique: IhwUbtE4MMeX9Cm1gO9Yew-1
Received: by mail-ej1-f69.google.com with SMTP id
 gn33-20020a1709070d2100b00787e6fbcb72so5673566ejc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4v10Kc9t6YsWGRDXH0zBX3cO3GWE7Kg1t8plFc8Disk=;
 b=j3JFdCLxYMQSjuXECwmW9onlAiHnCoj/IpbDuAATF26nKYHen3KBJPV7+5QRXRAjth
 B4elBuYv05qbgOGN4Tjpv/mXNbzIz5rQcZO3HX7OnT6NTs9lxgOq3gtbRmOWORwJrueY
 SY63rTz0jZZ+ai/37tvqPjqBuoysuu5PFB/hw5kigToYw+O7j6XT3p0X1zwAkTg592dN
 BGoWn/gxC0RZGfwKtgTyIXMLO54gCgqgLoOBx9cxrQ3gtyIzoWjqaspSncXg9loj4A0Z
 iOqOWMWxGec3+IiGjJ0ZfFNpryWScdIqdElMh8qSAE5/Y5p42YC3XCXn/XqHhIzrokDh
 WvCQ==
X-Gm-Message-State: ACrzQf2wgkhGl3cKz46vJj/Nve6kL32A4HbhT10lACPg1J/ZR4Dg6wtx
 GEQHoPQE2j6pNW7ij8TkXqTxroBkMfgKRyam2MU6G3IJSMREPMGvJo7WrUjDaKAYdkkCYhbXUv3
 zBGdLs6L5fATiQqWy/XXbqF21VFwoaDrAw2czXScz9kegH2w6geauChcRfLjJHPBsGJU=
X-Received: by 2002:a05:6402:5202:b0:45c:9525:9bc4 with SMTP id
 s2-20020a056402520200b0045c95259bc4mr156034edd.380.1665484044800; 
 Tue, 11 Oct 2022 03:27:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Vzy71edPNv1VrJnq5wV69QOismcJzjekCtWOrlrjb1iiuyZS5fNuRG9L+/ulR4jN+1rjuMQ==
X-Received: by 2002:a05:6402:5202:b0:45c:9525:9bc4 with SMTP id
 s2-20020a056402520200b0045c95259bc4mr156013edd.380.1665484044538; 
 Tue, 11 Oct 2022 03:27:24 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a1709063da200b0073d83f80b05sm6755681ejh.94.2022.10.11.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 07/37] target/i386: Return bool from disas_insn
Date: Tue, 11 Oct 2022 12:26:30 +0200
Message-Id: <20221011102700.319178-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Instead of returning the new pc, which is present in
DisasContext, return true if an insn was translated.
This is false when we detect a page crossing and must
undo the insn under translation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-3-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 16bf56dbc7..3f3e79c096 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4707,7 +4707,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
-static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
+static bool disas_insn(DisasContext *s, CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     int b, prefixes;
@@ -4734,15 +4734,16 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 1:
         gen_exception_gpf(s);
-        return s->pc;
+        return true;
     case 2:
         /* Restore state that may affect the next instruction. */
+        s->pc = s->base.pc_next;
         s->cc_op_dirty = orig_cc_op_dirty;
         s->cc_op = orig_cc_op;
         s->base.num_insns--;
         tcg_remove_ops_after(s->prev_insn_end);
         s->base.is_jmp = DISAS_TOO_MANY;
-        return s->base.pc_next;
+        return false;
     default:
         g_assert_not_reached();
     }
@@ -8644,13 +8645,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     default:
         goto unknown_op;
     }
-    return s->pc;
+    return true;
  illegal_op:
     gen_illegal_opcode(s);
-    return s->pc;
+    return true;
  unknown_op:
     gen_unknown_opcode(env, s);
-    return s->pc;
+    return true;
 }
 
 void tcg_x86_init(void)
@@ -8815,7 +8816,6 @@ static void i386_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    target_ulong pc_next;
 
 #ifdef TARGET_VSYSCALL_PAGE
     /*
@@ -8828,21 +8828,23 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 #endif
 
-    pc_next = disas_insn(dc, cpu);
-    dc->base.pc_next = pc_next;
+    if (disas_insn(dc, cpu)) {
+        target_ulong pc_next = dc->pc;
+        dc->base.pc_next = pc_next;
 
-    if (dc->base.is_jmp == DISAS_NEXT) {
-        if (dc->flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)) {
-            /*
-             * If single step mode, we generate only one instruction and
-             * generate an exception.
-             * If irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
-             * the flag and abort the translation to give the irqs a
-             * chance to happen.
-             */
-            dc->base.is_jmp = DISAS_TOO_MANY;
-        } else if (!is_same_page(&dc->base, pc_next)) {
-            dc->base.is_jmp = DISAS_TOO_MANY;
+        if (dc->base.is_jmp == DISAS_NEXT) {
+            if (dc->flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)) {
+                /*
+                 * If single step mode, we generate only one instruction and
+                 * generate an exception.
+                 * If irq were inhibited with HF_INHIBIT_IRQ_MASK, we clear
+                 * the flag and abort the translation to give the irqs a
+                 * chance to happen.
+                 */
+                dc->base.is_jmp = DISAS_TOO_MANY;
+            } else if (!is_same_page(&dc->base, pc_next)) {
+                dc->base.is_jmp = DISAS_TOO_MANY;
+            }
         }
     }
 }
-- 
2.37.3


