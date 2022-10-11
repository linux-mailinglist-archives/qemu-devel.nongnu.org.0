Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC85FB0E4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:04:06 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiD3M-0006ea-Qc
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUJ-00029z-QL
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUH-0004Vj-PO
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYjmEtsyz0HFuuReqcxOc4A+Fs5cqe4buhNy2Ov+D/o=;
 b=NauN/smjys/oCUnGYTWRg/uLh4o/c5yjEydMCsisX6Xx/288iIt7Vt6KUt5SZittwdCUff
 y8oMHgA532NINmakBapZEy00w5itKq87caDN/vWbq1mye4Pv3b1x1P9mwJzS0hWK2YBKku
 3iS0HGmHJLoSot/kLYhvdIHg0O2IdfE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-l84CIzK-PmKZMj1KI4VSrw-1; Tue, 11 Oct 2022 06:27:47 -0400
X-MC-Unique: l84CIzK-PmKZMj1KI4VSrw-1
Received: by mail-ej1-f71.google.com with SMTP id
 ho8-20020a1709070e8800b0078db5e53032so1960359ejc.9
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QYjmEtsyz0HFuuReqcxOc4A+Fs5cqe4buhNy2Ov+D/o=;
 b=ZkWB1ZMSPCH3xz9bd0Dr48h17NkDj4PqIFgejymWUxJ62u5jS0RPTbY19n48dF20T8
 MN6qsBYslELBJUoXGixrmgwTXO/6RTQR7cQZlQGna1VWcJ4DPNGOCUOzViq6wso/Evlo
 FEf+aTHh7D5GaL/bjeIyKv3MtI49JCeF/zBYbxXicG22MGmdddwy/kPegW1ICDpaDjL/
 N3tDa0YbB4WvjL3i893QIRmjKQ8NcfSmyxX/szcJIscqSme+VT21QWfFXnwVeCjnyinv
 zJMA3Gpfdn4hhsUammbp59qeLXZ0ataSFTU4QgSrc7eRw0hSzGiSksWuFxrL6L28y07d
 Rdag==
X-Gm-Message-State: ACrzQf08GaW3StvspQaAtTTV3URqiL63bJOC/Pofjj38NFT4KBYuT3gz
 9/QCxAOrPBK8Rum7fY2YHk36xaMgrTHywhOfcv0OtHkkjwkvsJYD6vzRCgtS7bosjrB1iKJYjY7
 n802wrP0a+RCdxJg85zw7kJQmgs+210VqSVK1YP80cQOu4853x38p/I1zdORCZdeJjb4=
X-Received: by 2002:aa7:d28c:0:b0:459:3cc5:3cb8 with SMTP id
 w12-20020aa7d28c000000b004593cc53cb8mr22885305edq.261.1665484066372; 
 Tue, 11 Oct 2022 03:27:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lKAIannluTRECE1orODrkZQ9L+iqM8UzqVEAdXqmsnR2wLGntErTGLaayZ4ZZ9xUu07OCZA==
X-Received: by 2002:aa7:d28c:0:b0:459:3cc5:3cb8 with SMTP id
 w12-20020aa7d28c000000b004593cc53cb8mr22885290edq.261.1665484066105; 
 Tue, 11 Oct 2022 03:27:46 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a170906258600b0078d261f9f44sm6657415ejb.224.2022.10.11.03.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/37] target/i386: USe DISAS_EOB_ONLY
Date: Tue, 11 Oct 2022 12:26:38 +0200
Message-Id: <20221011102700.319178-16-pbonzini@redhat.com>
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

Replace lone calls to gen_eob() with the new enumerator.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-11-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 717c978381..6b16c0b62c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6835,7 +6835,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             /* add stack offset */
             gen_stack_update(s, val + (2 << dflag));
         }
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xcb: /* lret */
         val = 0;
@@ -6853,7 +6853,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                       tcg_const_i32(s->pc - s->cs_base));
         }
         set_cc_op(s, CC_OP_EFLAGS);
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xe8: /* call im */
         {
@@ -7439,7 +7439,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_set_label(l1);
             gen_jmp_im(s, tval);
             gen_set_label(l2);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x130: /* wrmsr */
@@ -7480,7 +7480,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception_gpf(s);
         } else {
             gen_helper_sysenter(cpu_env);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x135: /* sysexit */
@@ -7491,7 +7491,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception_gpf(s);
         } else {
             gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
 #ifdef TARGET_X86_64
@@ -8574,7 +8574,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_eip_next(s);
         gen_helper_rsm(cpu_env);
 #endif /* CONFIG_USER_ONLY */
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0x1b8: /* SSE4.2 popcnt */
         if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
-- 
2.37.3


