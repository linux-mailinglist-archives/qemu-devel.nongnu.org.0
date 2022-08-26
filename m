Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D35A3274
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:16:27 +0200 (CEST)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRiYs-0003AX-LZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUq-0006K1-7O
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUn-0007oI-KY
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQlUJmQNEFf+CgRVH4yJkN/ZdorWqvX2krBPeVdgIRk=;
 b=VsqM+xDO02SF0UCyGv1Me/4EWJG5XYfoygwiFi9k7PTCFgHfyU1/NO8FV5a52BrRSyanGu
 e+8FUKkcYsAuSDm/d0aEISbt0OG5GqdT6V5nNAf6nIQVhpibKtdKvKDYPcdkW2JPtHUUGg
 DWp6h0rL7HkvOf4QuKZuzxS9hV0W2mg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-Y1BVK46QM4yhwfelQWDpfQ-1; Fri, 26 Aug 2022 19:12:12 -0400
X-MC-Unique: Y1BVK46QM4yhwfelQWDpfQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 q18-20020a056402519200b0043dd2ff50feso1845218edd.9
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KQlUJmQNEFf+CgRVH4yJkN/ZdorWqvX2krBPeVdgIRk=;
 b=HtT0zp0peEshRWcwRfizRNrh1TuxYkMogkyTpiDF/iZWlTdVMtHAvHOQdLwVM0Kic/
 V4ppsiaRnA+6emfdwf4N5u1wzSuNrWofKr3Vw3/laQ2HG5g4cTYbE2wYRE5avOW4Bnb+
 ykX/aYofiuUiIxScN3/nqJ9NzcNkCtqgkObPj3KJonPL4/QJ5BCYEO41jRBgg+QkRNb2
 V8vSoE0unPvv3082TeuJ2S93v3jDgMQ7EpgExc7sis2JkXWd8hxZkDgmkidlNOjj94D6
 jiSuhdGmZDhWrhb+op73r2qPWg6LwReDUS3SroBO4vFrN+S4XMfaVMgJ0GhMPx8yX+Hs
 eopA==
X-Gm-Message-State: ACgBeo1ac9Rdgrc0MZ3q1jtKFCQf53gwkaVyW71CRCbVU/Mn1NQRd1MZ
 JTpVySXIlDvgUt6wS7+P90pSPEqqAf86P5MIusgRpXalrUWiFQrnpRUT6ayEe6lYmLnYdeHrFcC
 8lsVHgJCAGEl8KmnLkfno0mT6ESATzyqpQ8a2HIz9HwLGR56aRfJEUrL+eOLA4huh1IU=
X-Received: by 2002:aa7:dc17:0:b0:441:e5fc:7f91 with SMTP id
 b23-20020aa7dc17000000b00441e5fc7f91mr8259371edu.301.1661555530634; 
 Fri, 26 Aug 2022 16:12:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4QKCiZCBKPQAD69LtSj1gygw1Cg0dFRVD1uuFExjfpiLUIbvNesdxjaoXDtCazvhl/xN572Q==
X-Received: by 2002:aa7:dc17:0:b0:441:e5fc:7f91 with SMTP id
 b23-20020aa7dc17000000b00441e5fc7f91mr8259354edu.301.1661555530293; 
 Fri, 26 Aug 2022 16:12:10 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 bt21-20020a170906b15500b0073dbc35a0desm1404111ejb.100.2022.08.26.16.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 02/23] i386: formatting fixes
Date: Sat, 27 Aug 2022 01:11:43 +0200
Message-Id: <20220826231204.201395-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
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
2.37.1



