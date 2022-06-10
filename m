Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BA546A3C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:19:48 +0200 (CEST)
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhMR-000344-Pk
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB1-0007i3-Pp
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAy-0007Gm-Fv
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id h5so37187335wrb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uihzOvElFxYE5Rw9/Fbrqmv/if8v5ot0XEU8msK1zdE=;
 b=reqnHUKoVB2Edinu7jZmGuW929q7uQRVDqQLTw9J/xtKBIS2CCN8aU0e+VcJZgeIKm
 Ck3HDwtSfX4NvU5ATNFUlF2DJlvXbP0b5DcDE15jv8cpgV2kota6aHki1ldaKYOhvvzn
 2129xf1FmvZW5+809a+vl0015/UpJ0qC2uf5F5yX1gtMINFk8KNNsA6WbNxuS8heM9g0
 8XNy8KS8BRuJ5DQp1xRMoomp4opDKR+prr+w7Plob0lYm1cWdd/0yWO5BpMKWgCRpT9d
 3VWgTYJlHomeVK4TYhWF2lAZKcvUYXRLETwQOJAOcJcwq+gULdtfoQ0oeCZYc6TpaCKB
 u/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uihzOvElFxYE5Rw9/Fbrqmv/if8v5ot0XEU8msK1zdE=;
 b=YtKiK9v+AD+5cV8Vnf/ZyYotD4zTejVOs1drJ76SaXfrTSnCBM0Iu6Mwv5nydyp7FR
 zvSV3mvu6/lg2JpMBRpGpoa+uDK89/c0mqCywiUF/3fnXGA1Ppq50FGyENG/QtFbq35B
 D3IWmf9bWpQdPSGO+Ey8GpkS03NDEV5uao4hsMphjiGVenTLYB+7K/c3sMMnMWk9g/mK
 F7d5PeUuK592UiVW72V3Yd5a5DkVTnxfLF+6JXsTIjGD1qSDpFSKz4BYeJ17ogz/aqjB
 YRBrukTCeouev5tf/Cv3UBJ6lKVVqFgFa5PWdQbNyhwT6OaV8+MKe5MFBPH9S7ncrsk4
 YGsw==
X-Gm-Message-State: AOAM532TPfUltmDTT0vLblL6YD8saCVbH3e9Y0hwd7O+B40FZfGrpbnB
 7feXyEQSf9SHfzjENq4bqXHtoqqTlBlsLg==
X-Google-Smtp-Source: ABdhPJyTN+EwF/axNYKUfeVC1N9IW87DPpD55xT/UfejS5tf4WIsyqNPIxM7COLdXvXAjiLvr5q+hQ==
X-Received: by 2002:a05:6000:1849:b0:219:be72:177e with SMTP id
 c9-20020a056000184900b00219be72177emr7743621wri.150.1654877275043; 
 Fri, 10 Jun 2022 09:07:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/28] target/arm: Rename gen_exception to gen_exception_el
Date: Fri, 10 Jun 2022 17:07:26 +0100
Message-Id: <20220610160738.2230762-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-17-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fc5eafaeeba..edb7d3f3944 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,7 +1086,7 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
+static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
 {
     gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
                                           tcg_constant_i32(syndrome),
@@ -9758,16 +9758,16 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                          default_exception_el(dc));
+            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
+                             default_exception_el(dc));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
-            gen_exception(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
+            gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
             break;
         case DISAS_SMC:
             gen_ss_advance(dc);
-            gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
+            gen_exception_el(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
@@ -9828,14 +9828,14 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                          default_exception_el(dc));
+            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
+                             default_exception_el(dc));
             break;
         case DISAS_HVC:
-            gen_exception(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
+            gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
             break;
         case DISAS_SMC:
-            gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
+            gen_exception_el(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         }
     }
-- 
2.25.1


