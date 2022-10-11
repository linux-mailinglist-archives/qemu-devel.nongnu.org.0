Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126365FB21B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:09:46 +0200 (CEST)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiE4u-0000sp-2T
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUw-0002pR-3q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUu-0004gI-M9
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+0BlhMhr7upwayvFPnSFtEzgUe1qz5fNNE2zB0W/f8=;
 b=NY1Ng/OEztMFYpt78Bvp8Oh+iaZ8L9kL1RzP8ZecOwJPLwfMWkQBafP0mSiqoBDCUN3xVG
 LVSoeG8X5JRq1rufx7RRxRQJEVRA56aWXZi3oecbf4aS+k02NfQW340IRQqf1lY4L3oY/8
 b4xnQs0BxM1Csr0pCzTjwBvYaxflnrM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-AN4jFmwyNlOnDjVkmHY9AQ-1; Tue, 11 Oct 2022 06:28:26 -0400
X-MC-Unique: AN4jFmwyNlOnDjVkmHY9AQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 gb42-20020a170907962a00b0078d194624a9so5722003ejc.11
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+0BlhMhr7upwayvFPnSFtEzgUe1qz5fNNE2zB0W/f8=;
 b=qdSsy8m00o72dvojS0YnyHLjGYH8GoptyUT3pRCiHQ9eTNlMHYFiirK6ELIRn/wVpQ
 BnovajzgCGbLY/aJn102L4rZcjfY6M3MlfQOdN5OkzR2eTFiWT1jOwB29T51p1ZynK+G
 LT7sG3MChE7vvyF0NLCDLMxoSGcRqt9etBzpvai9hNPS6gIRON6BkBXpsg62UiRRuGw/
 z2GMV2S7kCVGqqQQfkbW880+426/bzPNNqG0QkmP6iZEYFRrFhtViA9sLJn9a1RsfQ5t
 f/fvmmQV/nmvkVZZmPfLw2E7+lnyYC8f2OPkpagjfqM5F7eVI7ICLt4Dh5amS9olsimX
 shsA==
X-Gm-Message-State: ACrzQf3oIps7m5tyRtEiLgSOsLiIQbxrGDhGge55e/++y6AB/0PV7Jrf
 P+ofl6GbUnQGIU5tEfDP+gbVXB3i+OoB9LYdmnqG7mV1pUfudIrJhv27XKotiA+up6188Unk2ip
 yHn8EPquqL78I6WD3+AuqdAxvRu/VAEUenVraeGi6nh08qLAzoQNs+B0QPZNbl4r037U=
X-Received: by 2002:a17:907:78d:b0:740:33e1:998 with SMTP id
 xd13-20020a170907078d00b0074033e10998mr18564003ejb.162.1665484105327; 
 Tue, 11 Oct 2022 03:28:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM68eLHK+v9/EuSWhhRF1xPQUsx9oMWA9QVvAL36PBcjflohLN+TrQ5GI1+156d+gGS97wKeow==
X-Received: by 2002:a17:907:78d:b0:740:33e1:998 with SMTP id
 xd13-20020a170907078d00b0074033e10998mr18563981ejb.162.1665484105012; 
 Tue, 11 Oct 2022 03:28:25 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906199600b0078ae49ad169sm5090905ejd.91.2022.10.11.03.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 29/37] target/i386: Add cpu_eip
Date: Tue, 11 Oct 2022 12:26:52 +0200
Message-Id: <20221011102700.319178-30-pbonzini@redhat.com>
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

Create a tcg global temp for this, and use it instead of explicit stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221001140935.465607-25-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5b0dab8633..f08fa060c4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -64,6 +64,7 @@
 
 /* global register indexes */
 static TCGv cpu_cc_dst, cpu_cc_src, cpu_cc_src2;
+static TCGv cpu_eip;
 static TCGv_i32 cpu_cc_op;
 static TCGv cpu_regs[CPU_NB_REGS];
 static TCGv cpu_seg_base[6];
@@ -481,7 +482,7 @@ static void gen_add_A0_im(DisasContext *s, int val)
 
 static inline void gen_op_jmp_v(TCGv dest)
 {
-    tcg_gen_st_tl(dest, cpu_env, offsetof(CPUX86State, eip));
+    tcg_gen_mov_tl(cpu_eip, dest);
 }
 
 static inline
@@ -518,7 +519,7 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
 
 static void gen_jmp_im(DisasContext *s, target_ulong pc)
 {
-    gen_op_jmp_v(tcg_constant_tl(pc));
+    tcg_gen_movi_tl(cpu_eip, pc);
 }
 
 static void gen_update_eip_cur(DisasContext *s)
@@ -8614,6 +8615,13 @@ void tcg_x86_init(void)
         [R_EDI] = "edi",
         [R_EBP] = "ebp",
         [R_ESP] = "esp",
+#endif
+    };
+    static const char eip_name[] = {
+#ifdef TARGET_X86_64
+        "rip"
+#else
+        "eip"
 #endif
     };
     static const char seg_base_names[6][8] = {
@@ -8640,6 +8648,7 @@ void tcg_x86_init(void)
                                     "cc_src");
     cpu_cc_src2 = tcg_global_mem_new(cpu_env, offsetof(CPUX86State, cc_src2),
                                      "cc_src2");
+    cpu_eip = tcg_global_mem_new(cpu_env, offsetof(CPUX86State, eip), eip_name);
 
     for (i = 0; i < CPU_NB_REGS; ++i) {
         cpu_regs[i] = tcg_global_mem_new(cpu_env,
-- 
2.37.3


