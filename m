Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179723895EC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:57:03 +0200 (CEST)
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRNO-0007qj-4w
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyj-0004C7-GL
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:33 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:45624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyZ-0005lT-AU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:33 -0400
Received: by mail-oi1-x22e.google.com with SMTP id w127so10159708oig.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ml4zJu8F2mL1vM6aa47NTwYNU0UFpq7nQwZNWCia1A4=;
 b=Ab1gIVwrXJnRY4PbLD8umcTkk7p573EO+5uSd5XQW4JbkGWTC1J/9IP+DYlXvmv4QH
 jHqzvCiEh+9Aes/2FrepBkrFMG4T1coptd1V/okpiP3PxxAGxNecERsf8ab0XlVZittW
 valXFVeZpoWS+7EO842SeYoUeBd+fEsJ6GSJbO7zlIn3tBnahHeaWwAemdaVW6YfwYeW
 DXocG2XOmiXIeRm1LvpydHIkwfuxoPyDB3chQqO169CNRIaRA9GPIVCPq47ef4JmX0YA
 eUn9KFmYqwgm8L6aGGHvu8Mw06JTRzQ/kpcVTNI3dT9qFZ2UibZt71TGmo/cYQuYQ3A1
 u5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ml4zJu8F2mL1vM6aa47NTwYNU0UFpq7nQwZNWCia1A4=;
 b=FpDQj7TcujE3if1tvsfnHNcUbTPsirMl4rubMHTuMAIEoZFbEyJWl2EFcfajqzBa95
 80WsWeOl0PNQXgYuH/gFcPIOvLq25qugJHArUklrY8ovpGa0ka9RDuYfD/gs2/1N+MGI
 XIUIE0SXfFm4HZc78RaZi5zEgRmGkQiZtolQ5NCf+nkco5Xe4MKngJA9HX53JDe7LqOm
 4C/9FsICrLG68rAyKZW3exkbH7IVuZUk5hGcFyOnT+QlvaGwNEh/jzmT/RSwoAUfr09e
 4zSEIaCuGTOQ27nmeKGIMWcTsoZn03TQoNlXs9OjS7Qh0oDMzPl4TShkiUKPrP6TChLD
 WxNQ==
X-Gm-Message-State: AOAM533A+XyGkEnn5qCS0G1O3cQHJg6ZRt1nhws4zu2W2B8nhLerPNsW
 Ye+4N2ry+b37xp37+iFfQIEpZR1n0eor3gSY
X-Google-Smtp-Source: ABdhPJybAA3h6M65Mxdu0xOIIuaU9Eo7NFRZ5jw+08+nGAWuceXmcNUY/mRuEBiVET7D+l9bOdIRig==
X-Received: by 2002:a05:6808:1154:: with SMTP id
 u20mr389559oiu.35.1621449080911; 
 Wed, 19 May 2021 11:31:20 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/50] target/i386: Add stub generator for helper_set_dr
Date: Wed, 19 May 2021 13:30:29 -0500
Message-Id: <20210519183050.875453-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes an ifdef from the middle of disas_insn,
and ensures that the branch is not reachable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-30-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5c321b338e..28eb0e8adf 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -179,6 +179,19 @@ typedef struct DisasContext {
 #define REX_B(S)       0
 #endif
 
+/*
+ * Many sysemu-only helpers are not reachable for user-only.
+ * Define stub generators here, so that we need not either sprinkle
+ * ifdefs through the translator, nor provide the helper function.
+ */
+#define STUB_HELPER(NAME, ...) \
+    static inline void gen_helper_##NAME(__VA_ARGS__) \
+    { qemu_build_not_reached(); }
+
+#ifdef CONFIG_USER_ONLY
+STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
+#endif
+
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
@@ -8075,7 +8088,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x121: /* mov reg, drN */
     case 0x123: /* mov drN, reg */
         if (check_cpl0(s)) {
-#ifndef CONFIG_USER_ONLY
             modrm = x86_ldub_code(env, s);
             /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
              * AMD documentation (24594.pdf) and testing of
@@ -8104,7 +8116,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
                 gen_op_mov_reg_v(s, ot, rm, s->T0);
             }
-#endif /* !CONFIG_USER_ONLY */
         }
         break;
     case 0x106: /* clts */
-- 
2.25.1


