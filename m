Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635C4602D8D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:38 +0200 (CEST)
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn68-0002zG-N7
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgj-0002Kc-K1
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgg-00050u-U3
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ehRf64SO+N5WhlRXQwHKpykS1f6TV6fwdbGGcfH37w=;
 b=LK5FPmF4wv5UhjDzJHja8QArWYRDQSUfemBUp7ZyZFXBMhrrPsYDrI7jLKhyYiY9EvJadr
 vtV3Vr178WNjwBbYXc/P2K3dUTiVYS4Y10Es//xyNH7UgRxIedwZObcqSYlJnIrtljIIHB
 ryiKZ4ia/xX/ZyhYH+a8gDP8XA9G5vY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-gd-9Wz3UO8unyYfBnndCVQ-1; Tue, 18 Oct 2022 09:31:16 -0400
X-MC-Unique: gd-9Wz3UO8unyYfBnndCVQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z7-20020a05640235c700b0045d3841ccf2so8252494edc.9
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ehRf64SO+N5WhlRXQwHKpykS1f6TV6fwdbGGcfH37w=;
 b=6ORtQm5962O1dNrtWGpU4DAj61H4vC9FTZTItLKAXbUsogassgcVi+w2GyhLYNZKlq
 70jkY2CG6EfmJ05XLaey8NEDtyOn/Jzb4dzG3qrB94kECy5o7dmYsDpCirjzs36jcpMF
 wT1WQPCd9EvPiJheqdL3AG/L7E/1S7DhNWRDHuaJEESI7em9zvnJoKFqMmpYRi6rLW1t
 PW9yYoWVOILzJxEYG4B4Eeoll8xpQfrdTQijS0kY4DlrIqSfJxJMOd1fwe7wKx+Mq1mu
 S6RoXmoeu4ltgH9OSNERsha0p5UgtnJVzc3l1KlMbFiTXpfatbfw93Op4NbOMuSGI/cE
 Xlhg==
X-Gm-Message-State: ACrzQf2UwW2vdvP4N6DHSIK3PNuxU0hMfJL4W1ij8g5JZQ99L9JMx8za
 1y/rL8xF3BdYzuGO2fT9eGXLB1Xrk336reXdGhR8uwJPD4Uv9/jViUal+yax1OHVG6MJz7Elaw/
 42HVNpPtm5FoGLGBFbOjctrG7rGe3xmq5MOvp5c1MOa1FzNgIC56osFSLyxwAMsBpFvw=
X-Received: by 2002:a17:907:320c:b0:77b:6f08:9870 with SMTP id
 xg12-20020a170907320c00b0077b6f089870mr2428417ejb.249.1666099874719; 
 Tue, 18 Oct 2022 06:31:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hcXBPXlLMgKPFCgQS9PXXjkgupyrR+bDpWILGrVGML5tsFGHLb3lOl4ZcpxGWEWdytQT0sQ==
X-Received: by 2002:a17:907:320c:b0:77b:6f08:9870 with SMTP id
 xg12-20020a170907320c00b0077b6f089870mr2428388ejb.249.1666099874409; 
 Tue, 18 Oct 2022 06:31:14 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05640243c600b0045b4b67156fsm8920112edc.45.2022.10.18.06.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/53] target/i386: Save and restore pc_save before
 tcg_remove_ops_after
Date: Tue, 18 Oct 2022 15:29:57 +0200
Message-Id: <20221018133042.856368-9-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Restore pc_save while undoing any state change that may have
happened while decoding the instruction.  Leave a TODO about
removing all of that when the table-based decoder is complete.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221016222303.288551-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 279a3ae999..75ca99084e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4817,6 +4817,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     int modrm, reg, rm, mod, op, opreg, val;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
+    target_ulong orig_pc_save = s->pc_save;
 
     s->pc = s->base.pc_next;
     s->override = -1;
@@ -4838,8 +4839,15 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 2:
         /* Restore state that may affect the next instruction. */
         s->pc = s->base.pc_next;
+        /*
+         * TODO: These save/restore can be removed after the table-based
+         * decoder is complete; we will be decoding the insn completely
+         * before any code generation that might affect these variables.
+         */
         s->cc_op_dirty = orig_cc_op_dirty;
         s->cc_op = orig_cc_op;
+        s->pc_save = orig_pc_save;
+        /* END TODO */
         s->base.num_insns--;
         tcg_remove_ops_after(s->prev_insn_end);
         s->base.is_jmp = DISAS_TOO_MANY;
-- 
2.37.3


