Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941CC5FB146
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:14:05 +0200 (CEST)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDD2-0005Xr-CW
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUL-0002AZ-OG
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUK-0004W7-00
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cr4HwV5vgUKgE+3UKuM8EcKp4MKuhG+a+4lxA7aTRqI=;
 b=DH6/6bnv7f3YaafvosBdeIdPpMi7vh1+MXfN07aqOgPNM03P+Rw377GTJ4pwtljUuJquHF
 egRCytEMgTBK57hdr8sE57/gnmqCgy6eMaLjejYwzfddNcQ4qTLbbnWfz7xggbls8yQemH
 NcBgo7hxeodJIrye3yR+YMAkN3gKfyU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127--M4Q5CpAN5CEE9N9cA4Gpg-1; Tue, 11 Oct 2022 06:27:50 -0400
X-MC-Unique: -M4Q5CpAN5CEE9N9cA4Gpg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w13-20020a05640234cd00b0045bd246f73bso5713435edc.8
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cr4HwV5vgUKgE+3UKuM8EcKp4MKuhG+a+4lxA7aTRqI=;
 b=qU0e1qYHokt0V2tRtNsnlaE8SvSgLAhXtnDtQGqlZJ0bkmQWt35NJWHreGBs83sU1d
 dqslOrLyXZXN+0uM9wgXow2lJvsL6C7fqJHvh/JPMSF0PzC0dYTI3/4yY062W2guOS16
 fv4+yOJhetr4T8clHiBrCa+wgiwMDidZPp4XYROfeJMRVvEK+H6N5QIrlkGtsWBoUHdI
 x0BR6RiE8WmUnoeONJR4Pg/0zml5qNN5j5J1IruaEMREuLr+c7ixbOC7Kv2W6esna46A
 d6EvZOEzzGx3g2EraL1UFEHbH5ajat8BWrm5tkFbIK0bG0weOEHrDQfLN6N3/zWN0HNY
 Ovuw==
X-Gm-Message-State: ACrzQf2uPTQ4An09Yc/oKFzFXi2ckpEJuaTXaHDdekdqE4tWgGkGRn3F
 F7dU6nntbw5jkgp7cf//qGtyr891RqzwcI+7cxh72k2tLK+epvEVFpeQgwPi7aAqjJ4kh78xG7x
 RRJVGMxcJy/RhpPNdUGKsCLYZANGpU+ld6lob5dmpyV8HZ1FA3Cj7BURnwI/b9Gmsyto=
X-Received: by 2002:a17:907:25cc:b0:77b:a6c7:6d2b with SMTP id
 ae12-20020a17090725cc00b0077ba6c76d2bmr18648983ejc.148.1665484058597; 
 Tue, 11 Oct 2022 03:27:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KHB86atCJOMpZLGJGikaQ686k0rXFEuq2IBWpK/MpZWx3GLeMEH9fNk4ozL3IpLG+Hc+l2w==
X-Received: by 2002:a17:907:25cc:b0:77b:a6c7:6d2b with SMTP id
 ae12-20020a17090725cc00b0077ba6c76d2bmr18648964ejc.148.1665484058255; 
 Tue, 11 Oct 2022 03:27:38 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 mh19-20020a170906eb9300b00781be3e7badsm6746554ejb.53.2022.10.11.03.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/37] target/i386: Introduce DISAS_EOB*
Date: Tue, 11 Oct 2022 12:26:35 +0200
Message-Id: <20221011102700.319178-13-pbonzini@redhat.com>
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

Add a few DISAS_TARGET_* aliases to reduce the number of
calls to gen_eob() and gen_eob_inhibit_irq().  So far,
only update i386_tr_translate_insn for exiting the block
because of single-step or previous inhibit irq.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-8-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4c1548da8e..caa22af5a7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -132,6 +132,10 @@ typedef struct DisasContext {
     TCGOp *prev_insn_end;
 } DisasContext;
 
+#define DISAS_EOB_ONLY         DISAS_TARGET_0
+#define DISAS_EOB_NEXT         DISAS_TARGET_1
+#define DISAS_EOB_INHIBIT_IRQ  DISAS_TARGET_2
+
 /* The environment in which user-only runs is constrained. */
 #ifdef CONFIG_USER_ONLY
 #define PE(S)     true
@@ -8849,7 +8853,7 @@ static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
                  * the flag and abort the translation to give the irqs a
                  * chance to happen.
                  */
-                dc->base.is_jmp = DISAS_TOO_MANY;
+                dc->base.is_jmp = DISAS_EOB_NEXT;
             } else if (!is_same_page(&dc->base, pc_next)) {
                 dc->base.is_jmp = DISAS_TOO_MANY;
             }
@@ -8861,9 +8865,24 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (dc->base.is_jmp == DISAS_TOO_MANY) {
+    switch (dc->base.is_jmp) {
+    case DISAS_NORETURN:
+        break;
+    case DISAS_TOO_MANY:
+    case DISAS_EOB_NEXT:
+        gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
+        /* fall through */
+    case DISAS_EOB_ONLY:
         gen_eob(dc);
+        break;
+    case DISAS_EOB_INHIBIT_IRQ:
+        gen_update_cc_op(dc);
+        gen_update_eip_cur(dc);
+        gen_eob_inhibit_irq(dc, true);
+        break;
+    default:
+        g_assert_not_reached();
     }
 }
 
-- 
2.37.3


