Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA95FB22A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:16:12 +0200 (CEST)
Received: from localhost ([::1]:52318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEB9-0006yM-6P
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUz-0002wn-Mx
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUx-0004iO-Az
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4ucLDA6j0Bbg/VI+XXeZRk9uHhKo2fz6ppRd8eMxBo=;
 b=TD6rrMP5QbKisTBl1OSIAecdHjG6SrDgl++GA9EFmVqOelLgKAGh6UO/UFu2Pk5Qc59bvz
 yiAuv4q9Le/l1BcudWqSj+MCV2/DzEqQQ87M4wve8YqqgCc1vGNEl2vQB4RGve3Ywq6NhT
 OmPs+ermd3ruNPFX7AELg+jzVA1cNUQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-AfNAiWYZPVuJvLH39pK4ug-1; Tue, 11 Oct 2022 06:28:29 -0400
X-MC-Unique: AfNAiWYZPVuJvLH39pK4ug-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa14-20020a170907868e00b0078db5ba61bdso1972614ejc.12
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t4ucLDA6j0Bbg/VI+XXeZRk9uHhKo2fz6ppRd8eMxBo=;
 b=XpDx1/5vCxNGLDemkRdbYTA4IcWrppEbNKaRHe8NcvaqwzQnWsMS1eBD8jjrxiO+nB
 uTlQMAKYg1bYrv7QTroNJ072HDaH/YJEP17JkXlTd7W3J9VIFLmvm2MGlZZ8ZvHZdHxb
 RamKwGQBlp8xegnR9o+B+0uiglSP6TzoNDcYxugKFJzb9UWBTGKCnUB2YHO7ksMNDNy0
 tg/7pUySRLicdO0OLeQDRVcxo6z8ZFSmFoIl2KQ3Zeviq3oGmBZHZud5r3g9h1cxl4AS
 xmp/QgWAGZvRw/ftYfxAkv6Ue5Oo7erOYxjXJ8LZoa0LZWLKlzx+k1yodgh34z128D2x
 xxTA==
X-Gm-Message-State: ACrzQf1Gv5Yd0XRcBnVqa0C+sMhSD69WQ9FgiVWu1DEuY5xUl/dNBqP5
 2aOcfWXPW1KdyY0t3Qiwwte/aHAyH6Vfpeldrm4tTW0XtUTyTtcllvbZurRBgNIB3LtPDjGWLPf
 /+6DfXO+2YzCawwbhufCxt4Sr0uH71L3AZAfe8S63j63j9WXcHC4TZDALV3Mrwo3kbLw=
X-Received: by 2002:a17:906:eec9:b0:783:e662:2513 with SMTP id
 wu9-20020a170906eec900b00783e6622513mr18095900ejb.656.1665484108074; 
 Tue, 11 Oct 2022 03:28:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/3j0AALCWDjiE7xBniRkM2V/zH/Oe7gk1s8f4Vj+S2fmfrwhgeVvAfPsX70kPhgNlUavdTA==
X-Received: by 2002:a17:906:eec9:b0:783:e662:2513 with SMTP id
 wu9-20020a170906eec900b00783e6622513mr18095883ejb.656.1665484107842; 
 Tue, 11 Oct 2022 03:28:27 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 16-20020a170906311000b0073ce4abf093sm6656229ejx.214.2022.10.11.03.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 30/37] target/i386: Inline gen_jmp_im
Date: Tue, 11 Oct 2022 12:26:53 +0200
Message-Id: <20221011102700.319178-31-pbonzini@redhat.com>
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

Expand this function at each of its callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-26-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f08fa060c4..689a45256c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -517,19 +517,14 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
     }
 }
 
-static void gen_jmp_im(DisasContext *s, target_ulong pc)
-{
-    tcg_gen_movi_tl(cpu_eip, pc);
-}
-
 static void gen_update_eip_cur(DisasContext *s)
 {
-    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    tcg_gen_movi_tl(cpu_eip, s->base.pc_next - s->cs_base);
 }
 
 static void gen_update_eip_next(DisasContext *s)
 {
-    gen_jmp_im(s, s->pc - s->cs_base);
+    tcg_gen_movi_tl(cpu_eip, s->pc - s->cs_base);
 }
 
 static int cur_insn_len(DisasContext *s)
@@ -2767,17 +2762,17 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     gen_update_cc_op(s);
     set_cc_op(s, CC_OP_DYNAMIC);
     if (!s->jmp_opt) {
-        gen_jmp_im(s, dest);
+        tcg_gen_movi_tl(cpu_eip, dest);
         gen_eob(s);
     } else if (translator_use_goto_tb(&s->base, dest))  {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
-        gen_jmp_im(s, dest);
+        tcg_gen_movi_tl(cpu_eip, dest);
         tcg_gen_exit_tb(s->base.tb, tb_num);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
         /* jump to another page */
-        gen_jmp_im(s, dest);
+        tcg_gen_movi_tl(cpu_eip, dest);
         gen_jr(s);
     }
 }
-- 
2.37.3


