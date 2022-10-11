Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DA35FB1E5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:59:08 +0200 (CEST)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDuc-0002yY-Fb
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUt-0002kt-A0
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUr-0004ep-BA
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFnej+uDib6DJO6FPJHynwF9HcD37KVfoaE0mz0H0dU=;
 b=Llzjke9DjWoHWoytAd3pmPGyNeFkGIVG0nBQ8f/iXXgLtSmzHTeT2vNGitNCBhi4Pfu2Cn
 Nk1fg3p3jKNx2Fc8wrdLHOmKzqhMYImErlYNX3rJ0r5SFy2jC2NxBmCKI7TdbalLSJfGvN
 J4ExnJ39uhoaz2bc3wIT+TbzFsp3Pd8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-Zctqsl16NqSqjqoftk1O6Q-1; Tue, 11 Oct 2022 06:28:21 -0400
X-MC-Unique: Zctqsl16NqSqjqoftk1O6Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 m13-20020a056402510d00b0045c1a055ee7so3955524edd.22
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EFnej+uDib6DJO6FPJHynwF9HcD37KVfoaE0mz0H0dU=;
 b=QT/cGIyU3wsKu+YAaz7aUViq9/ZZQya2CeeygZPlzHI8yqKCTORblKSl6/ISFYOD5U
 k5WBHp5hGPofas+15ClBA4tWN2gC+VXszXSTm8L65pWwhyYcgtZwNsdxnvqQqVUlGuPL
 eq5mihcpkJzGAzs385XsS8zOrPMvcU5hwv0S2sTo2UU0Uhi4Ust/nM98JXQaGksg3Y4f
 cIMgOd5PEExy3XwWP4biuL93YadE4juyQLEiSWpNIS6cBTIe0G5AWv45fMd159pPafLS
 hax4OaG2/YZH1wvArDZxvcG6+upmWVm3WG4TCtsGHhtnirhRR+FndYgLqz8BV4FAfkDr
 lOjg==
X-Gm-Message-State: ACrzQf1dEAvieltJOCg0tahdo8/faPpaDcuniSMAzQfOzhrunBH20525
 0bsFevLE0H3N5N1LRSnj6h9vZEcVPeEtRc/dCTtJL7bRSQ7TiM3GiLX2ZhPrEdzkK20i3LbJera
 eWjmoy3nkD2/H63tdNwfR9nVtXv0d/kKYBuAbZxZQkbZYc/+Z5tCq8YOmTnz/GHO/XIA=
X-Received: by 2002:a05:6402:3552:b0:45c:1e45:6f92 with SMTP id
 f18-20020a056402355200b0045c1e456f92mr8780767edd.4.1665484100227; 
 Tue, 11 Oct 2022 03:28:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM590uL+wPoIfpZqUJA7cpbm8zkWyxpu6eoRcGPp9sNlLHdSNg3rieLetRusI4/3Di4mSrXZeg==
X-Received: by 2002:a05:6402:3552:b0:45c:1e45:6f92 with SMTP id
 f18-20020a056402355200b0045c1e456f92mr8780740edd.4.1665484099851; 
 Tue, 11 Oct 2022 03:28:19 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a1709063ca100b0078175601630sm6578620ejh.79.2022.10.11.03.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 27/37] target/i386: Merge gen_jmp_tb and gen_goto_tb into
 gen_jmp_rel
Date: Tue, 11 Oct 2022 12:26:50 +0200
Message-Id: <20221011102700.319178-28-pbonzini@redhat.com>
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

These functions have only one caller, and the logic is more
obvious this way.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-23-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 50 +++++++++++++------------------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9294f12f66..2e7b94700b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -224,7 +224,6 @@ STUB_HELPER(wrmsr, TCGv_env env)
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
-static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
 static void gen_jmp_rel_csize(DisasContext *s, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
@@ -2393,23 +2392,6 @@ static inline int insn_const_size(MemOp ot)
     }
 }
 
-static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
-{
-    target_ulong pc = s->cs_base + eip;
-
-    if (translator_use_goto_tb(&s->base, pc))  {
-        /* jump to same page: we can use a direct jump */
-        tcg_gen_goto_tb(tb_num);
-        gen_jmp_im(s, eip);
-        tcg_gen_exit_tb(s->base.tb, tb_num);
-        s->base.is_jmp = DISAS_NORETURN;
-    } else {
-        /* jump to another page */
-        gen_jmp_im(s, eip);
-        gen_jr(s);
-    }
-}
-
 static void gen_jcc(DisasContext *s, int b, int diff)
 {
     TCGLabel *l1 = gen_new_label();
@@ -2762,20 +2744,6 @@ static void gen_jr(DisasContext *s)
     do_gen_eob_worker(s, false, false, true);
 }
 
-/* generate a jump to eip. No segment change must happen before as a
-   direct call to the next block may occur */
-static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
-{
-    gen_update_cc_op(s);
-    set_cc_op(s, CC_OP_DYNAMIC);
-    if (s->jmp_opt) {
-        gen_goto_tb(s, tb_num, eip);
-    } else {
-        gen_jmp_im(s, eip);
-        gen_eob(s);
-    }
-}
-
 /* Jump to eip+diff, truncating the result to OT. */
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
 {
@@ -2789,7 +2757,23 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
             dest &= 0xffffffff;
         }
     }
-    gen_jmp_tb(s, dest, tb_num);
+
+    gen_update_cc_op(s);
+    set_cc_op(s, CC_OP_DYNAMIC);
+    if (!s->jmp_opt) {
+        gen_jmp_im(s, dest);
+        gen_eob(s);
+    } else if (translator_use_goto_tb(&s->base, dest))  {
+        /* jump to same page: we can use a direct jump */
+        tcg_gen_goto_tb(tb_num);
+        gen_jmp_im(s, dest);
+        tcg_gen_exit_tb(s->base.tb, tb_num);
+        s->base.is_jmp = DISAS_NORETURN;
+    } else {
+        /* jump to another page */
+        gen_jmp_im(s, dest);
+        gen_jr(s);
+    }
 }
 
 /* Jump to eip+diff, truncating to the current code size. */
-- 
2.37.3


