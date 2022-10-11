Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55AD5FB0A2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:43:53 +0200 (CEST)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCjj-0005or-F3
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCU3-0001qP-5t
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCU1-0004RI-OH
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C10XqGvscv2Z5J53N3vmn7co32YR0PJyvc5leSysMHY=;
 b=O5uzdNdH28HCoAA11oozuxi6zUlQa0m57voJQq6oVGeUQ2yaNv9eb7o9x6ntR4HJ83rpv+
 Q0LTOyb2prdEf88drM417W5IbH6HA/B/v26Qqu4EEN/Z3IizxPcF5i8KZT1nc3wJwUrEcv
 w9gPEAhck981UIo0iUaR7yO8+rISzsA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-4HII_IJ-O3idLUxjYsZ7zg-1; Tue, 11 Oct 2022 06:27:31 -0400
X-MC-Unique: 4HII_IJ-O3idLUxjYsZ7zg-1
Received: by mail-ed1-f72.google.com with SMTP id
 b19-20020a056402351300b0045c129ed62cso4013963edd.6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C10XqGvscv2Z5J53N3vmn7co32YR0PJyvc5leSysMHY=;
 b=MVyzmj6qXqmdG+2v/B7F6T0wTNPgy09Tvkwofat4D5MQ5ixICC5VcK4yCk+nVtOzVo
 BcpPOnT8/NVv2Wo9dHTH7bTSbMJfK6bgS+JbZ8OAx2NVhJTjNP05sCAUuOyYwstYHDTF
 tScaAewNqZ54/mBPZ5TUhf9TlOyVPUgGsCa/8Oaefw6PhKct5g3jiQHk0EhvdBj17rel
 xu9/UVVE5ffixgAR8wBWWC6lqUQXW2LurLMd+3M1OSz03YFt9sP47vtZ0RMykNoaK+JN
 mJ4TUmwrWwzZ1v0i4pfEeGMtuzuUTdirtrS6K65YLtejwiefYTRDioihSEDGYpMl4K7t
 HNLQ==
X-Gm-Message-State: ACrzQf073lsn4caQ+Koh1kmqYU/XUI6UHtj/ikkBjw8cOR3SQnv5t9Io
 FuYepRhiql9FPN5uYnyIcPu/xRAKH8izHURspXS2t801rlOfKAvxd9HlEEl9bwEunl6bzkSjk+U
 aUXULsGuOswTJqIlUGxVDR4dYfVsNtiiRIN8l+o2VBP2OM1LTpkPlpj2RXJ3JiJC/w2g=
X-Received: by 2002:a05:6402:27c6:b0:45c:1f1a:6b85 with SMTP id
 c6-20020a05640227c600b0045c1f1a6b85mr8806757ede.316.1665484050371; 
 Tue, 11 Oct 2022 03:27:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GGRDTEly/vlHuMR0O+UOek59JVJEkELVG99ZPprJOPjvT6w/fGV3gZ/ya8iCSpFmIDKt9zg==
X-Received: by 2002:a05:6402:27c6:b0:45c:1f1a:6b85 with SMTP id
 c6-20020a05640227c600b0045c1f1a6b85mr8806741ede.316.1665484050085; 
 Tue, 11 Oct 2022 03:27:30 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7c157000000b0044e937ddcabsm8900445edp.77.2022.10.11.03.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 09/37] target/i386: Remove cur_eip,
 next_eip arguments to gen_interrupt
Date: Tue, 11 Oct 2022 12:26:32 +0200
Message-Id: <20221011102700.319178-10-pbonzini@redhat.com>
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

All callers pass s->base.pc_next and s->pc, which we can just as
well compute within the function.  Adjust to use tcg_constant_i32
while we're at it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-5-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 617832fcb0..5a9c3b1e71 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2627,13 +2627,12 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
 
 /* an interrupt is different from an exception because of the
    privilege checks */
-static void gen_interrupt(DisasContext *s, int intno,
-                          target_ulong cur_eip, target_ulong next_eip)
+static void gen_interrupt(DisasContext *s, int intno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, cur_eip);
-    gen_helper_raise_interrupt(cpu_env, tcg_const_i32(intno),
-                               tcg_const_i32(next_eip - cur_eip));
+    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
+                               tcg_constant_i32(s->pc - s->base.pc_next));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -7342,12 +7341,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0xcc: /* int3 */
-        gen_interrupt(s, EXCP03_INT3, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
+        gen_interrupt(s, EXCP03_INT3);
         break;
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
         if (check_vm86_iopl(s)) {
-            gen_interrupt(s, val, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
+            gen_interrupt(s, val);
         }
         break;
     case 0xce: /* into */
-- 
2.37.3


