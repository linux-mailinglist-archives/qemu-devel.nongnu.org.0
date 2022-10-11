Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3FA5FB172
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:29:07 +0200 (CEST)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDRa-0000fF-AO
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUU-0002Es-L7
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUT-0004Yq-5m
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISKWOoQ7K5a7RBXs1wPR0heFsShFz0InZehXmH2tzkw=;
 b=ZOYVh48z0BdHyIeNVwpVBJECgn8KLvSuAtDNn6WnN0KB/w5M6G+f9zoMwZqsrFIMA7zrGm
 DGK5W7hKe+2dtwI0ZSDL1VsUDiDEY4n53Z+wCEapygZ4szF22fGwED9Li3HXsQnJ/EKs9Z
 E7+vc36DypacLvRO1n9eQf43jzRV1SY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-JJnpyaa4PEmGX2TW2JeQ3g-1; Tue, 11 Oct 2022 06:27:59 -0400
X-MC-Unique: JJnpyaa4PEmGX2TW2JeQ3g-1
Received: by mail-ed1-f69.google.com with SMTP id
 t19-20020a056402525300b00459546fd250so11016242edd.23
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISKWOoQ7K5a7RBXs1wPR0heFsShFz0InZehXmH2tzkw=;
 b=s6qvJDguQuGM5ZZkwHk1velcypM6KwF3pyPhX0VhtHDqs+FtyE1KhdTKnn6I0s4UdH
 7lmMcoUTyrmXBsXjTt60KQySbcK+fQ7WCkmplApz32LeIkBFm58w2DOhk4IOv/OA3zE8
 igxpznKdrnaacMzGVfpR/5UjMQZEPHuG8d1bN4cOXo9C+qO4XW8vPX6uqU4pdrzpM5rZ
 f9OPiFZDcGpp0ruNPz9Lv+qKdKHUpJmkFPAduJEmMS/+BMnuGiYABXrtbxlHLBsF/ai8
 H8W02TjgmxqeGqVC2rza3pkdOdJ2yBS4Kyv5oIByg+xjr4PF++ay4oq3e1dJdC4a1Ltb
 1jKA==
X-Gm-Message-State: ACrzQf1GsncN5RtGZ85T+VdZGASTBQL53bTAxXH0bt873P+qA0r2e/f9
 DD8KteQp02fv3h5BLPsOcdGWosK7CpW5vb+xHUxCfIdbCqRlJFosVGv35Rt7wT/gmxPT2yWe+BA
 HdcCeOuq9JzUpxNu0aDMxEoC8WXOmqryHRyC4+dYPhPL9oBQOw6groULvpIIjLi59AXs=
X-Received: by 2002:a17:907:a065:b0:78d:c5dd:45cf with SMTP id
 ia5-20020a170907a06500b0078dc5dd45cfmr5719199ejc.117.1665484077415; 
 Tue, 11 Oct 2022 03:27:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6PovybUunWJXP+LQ+jKEKgCfbYJwpeM3+sqI+7hLH9VkTh+JGvYuIK9UYl0lLzYWUBANGcJw==
X-Received: by 2002:a17:907:a065:b0:78d:c5dd:45cf with SMTP id
 ia5-20020a170907a06500b0078dc5dd45cfmr5719189ejc.117.1665484077158; 
 Tue, 11 Oct 2022 03:27:57 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 b17-20020aa7c911000000b00458f82462a5sm8640695edt.25.2022.10.11.03.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 19/37] target/i386: Truncate values for lcall_real to i32
Date: Tue, 11 Oct 2022 12:26:42 +0200
Message-Id: <20221011102700.319178-20-pbonzini@redhat.com>
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

Use i32 not int or tl for eip and cs arguments.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-15-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/helper.h         | 2 +-
 target/i386/tcg/seg_helper.c | 6 ++----
 target/i386/tcg/translate.c  | 3 ++-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..39a3c24182 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -37,7 +37,7 @@ DEF_HELPER_2(lldt, void, env, int)
 DEF_HELPER_2(ltr, void, env, int)
 DEF_HELPER_3(load_seg, void, env, int, int)
 DEF_HELPER_4(ljmp_protected, void, env, int, tl, tl)
-DEF_HELPER_5(lcall_real, void, env, int, tl, int, int)
+DEF_HELPER_5(lcall_real, void, env, i32, i32, int, i32)
 DEF_HELPER_5(lcall_protected, void, env, int, tl, int, tl)
 DEF_HELPER_2(iret_real, void, env, int)
 DEF_HELPER_3(iret_protected, void, env, int, int)
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index bffd82923f..539189b4d1 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1504,14 +1504,12 @@ void helper_ljmp_protected(CPUX86State *env, int new_cs, target_ulong new_eip,
 }
 
 /* real mode call */
-void helper_lcall_real(CPUX86State *env, int new_cs, target_ulong new_eip1,
-                       int shift, int next_eip)
+void helper_lcall_real(CPUX86State *env, uint32_t new_cs, uint32_t new_eip,
+                       int shift, uint32_t next_eip)
 {
-    int new_eip;
     uint32_t esp, esp_mask;
     target_ulong ssp;
 
-    new_eip = new_eip1;
     esp = env->regs[R_ESP];
     esp_mask = get_sp_mask(env->segs[R_SS].flags);
     ssp = env->segs[R_SS].base;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7db6f617a1..1aa5b37ea6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5346,7 +5346,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                            tcg_const_tl(s->pc - s->cs_base));
             } else {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
+                tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->tmp3_i32,
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-- 
2.37.3


