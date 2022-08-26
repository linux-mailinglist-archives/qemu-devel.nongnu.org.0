Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFCD5A3292
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 01:24:36 +0200 (CEST)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRigl-0006JH-V7
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 19:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUr-0006LT-BE
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRiUm-0007oC-Ad
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 19:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661555531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/fwrBqwwUlpPhd+8wo68HHqIUYopdT2IYzo8vQkQ5M=;
 b=CqHFxuhgmI1Ju0VsS0g1p3UrZJP69Z6OM35+Rhibud1sIUONiYbRhrxTPMY6w1f5qy0J7r
 5xdh2C6Pej+q6KT4Cgz8Z/py3/v0N79FUzf/NfRU08tu7s762/MGlk3OzmI+KG2nTzq7AP
 +YxMjAbjwFn6/h6jocy+b944XdyIzCM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-di8361FSO0eQtYQCgjOGYg-1; Fri, 26 Aug 2022 19:12:10 -0400
X-MC-Unique: di8361FSO0eQtYQCgjOGYg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640235d400b0043e1e74a495so1869019edc.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 16:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=u/fwrBqwwUlpPhd+8wo68HHqIUYopdT2IYzo8vQkQ5M=;
 b=0itBvxeLvB6dohAun94CrNhlv/9Lfa5KEyDrbHOsT8cbf5Bb2AWTfbuN/OmRCyLuYT
 g68S0NCPGRW9XOFnv9ARnLzsbMVtSNyfwN9Q09euuEY4cD6bkPy+g3f1NkP06X5crL8Z
 /YZQvr6jOtrjb09wYE8esiP10sxaV/7WW1rehcCx9hQMb9xRsr0bL/6tE8Gz2NNYGlJW
 c2CD8RI9tENIo0KmfsMj+koBUrY129dXx1KIVAa0Xa49Q6DOmPMq8yN+r7k2NdVovznw
 ie3lqiOZX/J5nytlZY+Ut04/A3pywt5K68oMVJbfNadNAcj/WvgxiRqjRxamjJGv/Fw4
 RX6g==
X-Gm-Message-State: ACgBeo1AHKduGoftBXiXHs2qlPwdi8YWGicqwjEqZZ08E5JpEN7zrrWv
 TUaG5kuCCDyrX2ckNqlk/ypsfkrZJ7d6hGLgXECbenwCgXMM1fnEIChVZS5yNbqxT9G2mp5rMcq
 e9gn1X78vjlm9p/9sVqeLXMJazbEkEZ1k7z4Yg1+kZLOsZxyD+EAd5pmCcOIvlrVjS+s=
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr7085376ejm.182.1661555528812; 
 Fri, 26 Aug 2022 16:12:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6JyYDJrprd1FCqLoJzasVpAqcTpTtb+dicSqSVJD2qBPeC7dvh30a328528OJPhtMLRGqxEQ==
X-Received: by 2002:a17:906:770d:b0:73c:a08f:593c with SMTP id
 q13-20020a170906770d00b0073ca08f593cmr7085362ejm.182.1661555528493; 
 Fri, 26 Aug 2022 16:12:08 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 21-20020a170906319500b007402796f065sm1172177ejy.132.2022.08.26.16.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 16:12:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH 01/23] i386: do not use MOVL to move data between SSE registers
Date: Sat, 27 Aug 2022 01:11:42 +0200
Message-Id: <20220826231204.201395-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826231204.201395-1-pbonzini@redhat.com>
References: <20220826231204.201395-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Write down explicitly the load/store sequence.

Extracted from a patch by Paul Brook <paul@nowt.org>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..3237c1d8f9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3295,8 +3295,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                                 offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
             } else {
                 rm = (modrm & 7) | REX_B(s);
-                gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
-                            offsetof(CPUX86State,xmm_regs[rm].ZMM_L(0)));
+                tcg_gen_ld_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, xmm_regs[rm].ZMM_L(0)));
+                tcg_gen_st_i32(s->tmp2_i32, cpu_env,
+                               offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)));
             }
             break;
         case 0x310: /* movsd xmm, ea */
-- 
2.37.1



