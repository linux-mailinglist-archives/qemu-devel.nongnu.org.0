Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F25FB157
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:18:25 +0200 (CEST)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDHE-0001qV-N9
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUI-00029O-1o
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUF-0004UN-DD
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/K5lDjsNFkB2O7N5fFE1PmGPOVDI/Bu0WvplKA586RI=;
 b=NDHsgt9zsc+Ne4jcaFstal34PxarChLiY+QG9Bre6YqCaU0czV+3LUORfdGSiyz4Fbg46o
 IPi82JFA8Ha4w+qEIUlb9J8YeUDexo47UJLPC7ed3xfy98TnG2iCh5TJOI8OmhQNwPkzDK
 buNLTJ8PUj/C0IVpjJvcvn24VMSp6Ds=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-xv1_APz2O2G9AKkRMKymQg-1; Tue, 11 Oct 2022 06:27:42 -0400
X-MC-Unique: xv1_APz2O2G9AKkRMKymQg-1
Received: by mail-ej1-f72.google.com with SMTP id
 ho8-20020a1709070e8800b0078db5e53032so1960215ejc.9
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/K5lDjsNFkB2O7N5fFE1PmGPOVDI/Bu0WvplKA586RI=;
 b=dy/VgoLzkMB4/meEKbtvmLo0v4zBUbFOzHuTvzy/JgVfsyf8YPTs68bMxgVKTO4B+Q
 dQ9LcfGY1+hsrja7jUcQpwi2IJitrfGnPo4M24Y7pg7C/fkINWum23IU7fncK+1h2ZL+
 HwOGa8R5Trcv6WkR/Ey8gsaiDwCTAMtnZL2Te1XyaCyh4BZnRtzFbzWzEzl2KopFsPUB
 2ZC/maVl0bR7kxGh+7nAm/Ugzq5yvCEJ3PBm7h13m20hsZn8/EMmgDPXCu0+9n8HD4EF
 NsRoP+cu7Yjqg8H2YIVjn6+JV3/v2p5b5gmTZwLNKFczlc/1jQKukyB9p2mfewhT5fsI
 mgHg==
X-Gm-Message-State: ACrzQf0Ax3kJm6MDHnM9tcuDQ4SWNiknND0cA8Ht+KvIjOJuN5dGiFL9
 IzV5/3KC8urTStz/Ln4Jm2YjuEAdMRmeUZkkJyDkq35CE85rafOoUF3W9LBs4tB3nI4oalQj3S9
 /nHoZH2IPQzOiM/jubPcvA05HN8Bq354TnTDgCrFdUKbhnp+WIkiYi1P1C9rg2mDKsDk=
X-Received: by 2002:a17:907:9625:b0:78d:bb06:9072 with SMTP id
 gb37-20020a170907962500b0078dbb069072mr6346315ejc.472.1665484061187; 
 Tue, 11 Oct 2022 03:27:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qQQbmAKX712rNmBnhjFisIU8bc7woZs6HA0wgpRlxjCDnmhtFh2S/ySqOPpBzFJFXuAuIJw==
X-Received: by 2002:a17:907:9625:b0:78d:bb06:9072 with SMTP id
 gb37-20020a170907962500b0078dbb069072mr6346298ejc.472.1665484060764; 
 Tue, 11 Oct 2022 03:27:40 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 dy4-20020a05640231e400b00457618d3409sm8719710edb.68.2022.10.11.03.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/37] target/i386: Use DISAS_EOB* in gen_movl_seg_T0
Date: Tue, 11 Oct 2022 12:26:36 +0200
Message-Id: <20221011102700.319178-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
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

From: Richard Henderson <richard.henderson@linaro.org>

Set is_jmp properly in gen_movl_seg_T0, so that the callers
need to nothing special.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-9-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index caa22af5a7..8c0ef0f212 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2457,13 +2457,15 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
            because ss32 may change. For R_SS, translation must always
            stop as a special handling must be done to disable hardware
            interrupts for the next instruction */
-        if (seg_reg == R_SS || (CODE32(s) && seg_reg < R_FS)) {
-            s->base.is_jmp = DISAS_TOO_MANY;
+        if (seg_reg == R_SS) {
+            s->base.is_jmp = DISAS_EOB_INHIBIT_IRQ;
+        } else if (CODE32(s) && seg_reg < R_FS) {
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
     } else {
         gen_op_movl_seg_T0_vm(s, seg_reg);
         if (seg_reg == R_SS) {
-            s->base.is_jmp = DISAS_TOO_MANY;
+            s->base.is_jmp = DISAS_EOB_INHIBIT_IRQ;
         }
     }
 }
@@ -5726,26 +5728,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         ot = gen_pop_T0(s);
         gen_movl_seg_T0(s, reg);
         gen_pop_update(s, ot);
-        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
-        if (s->base.is_jmp) {
-            gen_update_eip_next(s);
-            if (reg == R_SS) {
-                s->flags &= ~HF_TF_MASK;
-                gen_eob_inhibit_irq(s, true);
-            } else {
-                gen_eob(s);
-            }
-        }
         break;
     case 0x1a1: /* pop fs */
     case 0x1a9: /* pop gs */
         ot = gen_pop_T0(s);
         gen_movl_seg_T0(s, (b >> 3) & 7);
         gen_pop_update(s, ot);
-        if (s->base.is_jmp) {
-            gen_update_eip_next(s);
-            gen_eob(s);
-        }
         break;
 
         /**************************/
@@ -5792,16 +5780,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
         gen_movl_seg_T0(s, reg);
-        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
-        if (s->base.is_jmp) {
-            gen_update_eip_next(s);
-            if (reg == R_SS) {
-                s->flags &= ~HF_TF_MASK;
-                gen_eob_inhibit_irq(s, true);
-            } else {
-                gen_eob(s);
-            }
-        }
         break;
     case 0x8c: /* mov Gv, seg */
         modrm = x86_ldub_code(env, s);
@@ -5991,10 +5969,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, op);
         /* then put the data */
         gen_op_mov_reg_v(s, ot, reg, s->T1);
-        if (s->base.is_jmp) {
-            gen_update_eip_next(s);
-            gen_eob(s);
-        }
         break;
 
         /************************/
-- 
2.37.3


