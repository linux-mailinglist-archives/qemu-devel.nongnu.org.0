Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A1C5A9F65
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:48:41 +0200 (CEST)
Received: from localhost ([::1]:59238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpF2-0007nx-9o
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosO-0007y2-Na
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosI-0008WL-EB
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6LoTsX/FfhDWF6VliI3nAk3THnqAshBOIxAekyT2rg=;
 b=OPnsY4ISiTpHMvqsrLRbGI5ntnGfUA8q7cKqfnXSNJm49bXTSZSi+0oCKh65XGPzO3jiXM
 +sxzlKdR8iIQpmelew4OeTrA1CflPm/veR/TZC4yNxJVcgtNa+w0utfac9JSIUyLfEuYoV
 O6C7VrmbuMMLYdNrehXnD9w5wPDnHmY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-Sm0tw7RMOB-HXouQJii71w-1; Thu, 01 Sep 2022 14:25:07 -0400
X-MC-Unique: Sm0tw7RMOB-HXouQJii71w-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee47-20020a056402292f00b004486550972aso8875035edb.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=P6LoTsX/FfhDWF6VliI3nAk3THnqAshBOIxAekyT2rg=;
 b=DgYwVEnA38tbsdm8Wmd5We2An1d8mTZIH1kRCP3NuH+2xC0NpmuIlTZO/SPAB5/LeV
 XzVT8TaEl7J57aMfiuq0N96hhCDfgi0NHNuE8xfKMbZHwUKCd8RiKihjnHilMmjLBTyN
 HCUAgYOkth9kXu43ZrmCFt5Th4Q5OoB/0XnutY+b3/5RFD3ipzvegVCzd2Wix1TbvFif
 wZe7cIuZY+9N4gYpjpuB5cqvDOwthwk7YeY1GVD9OCjkaalu1ZAxMFRozoQ9F5fcxELG
 mMGeOO4Ltr8RUW4AR9O4Y2HCFOwPcYU6bCpNVMP2v2Pxzr2cXw63KiPlMM7MO2PiMzgR
 WbcA==
X-Gm-Message-State: ACgBeo3KV1uNGQIOfAwnqY2p83Hys33hXWFURoBfd1zI+ON40jCrRCZt
 KmYBHHT16nahMQD/0qC69xjLd2Ote0HZe5a6U+jn2IRmak5EluCyNvsvOXffgb/5h3+56JbQeQ5
 E/7GJDStbTY7Ja/gd/xcd2p198I0nNU8yhisjNxCFlwWnleo00RG194sEAozGg+SXcN8=
X-Received: by 2002:a17:907:87b0:b0:731:3dfd:bc8d with SMTP id
 qv48-20020a17090787b000b007313dfdbc8dmr23860156ejc.607.1662056705999; 
 Thu, 01 Sep 2022 11:25:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41nidF9dtGCZTQ1dJDWlapxLzGEukxfq1i2og1/RsczOHuz17VP1NUywuROtNA2Zb4sgA6Jw==
X-Received: by 2002:a17:907:87b0:b0:731:3dfd:bc8d with SMTP id
 qv48-20020a17090787b000b007313dfdbc8dmr23860143ejc.607.1662056705731; 
 Thu, 01 Sep 2022 11:25:05 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 rl26-20020a170907217a00b0073db043a6f7sm8818349ejb.210.2022.09.01.11.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/39] target/i386: formatting fixes
Date: Thu,  1 Sep 2022 20:24:07 +0200
Message-Id: <20220901182429.93533-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Extracted from a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 3237c1d8f9..25a2539d59 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3314,7 +3314,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movq(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_Q(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_Q(0)));
+                            offsetof(CPUX86State, xmm_regs[rm].ZMM_Q(0)));
             }
             break;
         case 0x012: /* movlps */
@@ -4463,7 +4463,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     /* 32 bit access */
                     gen_op_ld_v(s, MO_32, s->T0, s->A0);
                     tcg_gen_st32_tl(s->T0, cpu_env,
-                                    offsetof(CPUX86State,xmm_t0.ZMM_L(0)));
+                                    offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
                     break;
                 case 3:
                     /* 64 bit access */
@@ -4523,8 +4523,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0xf7:
             /* maskmov : we must prepare A0 */
-            if (mod != 3)
+            if (mod != 3) {
                 goto illegal_op;
+            }
             tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
             gen_extu(s->aflag, s->A0);
             gen_add_A0_ds_seg(s);
-- 
2.37.2



