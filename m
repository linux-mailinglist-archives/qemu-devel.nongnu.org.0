Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39A5A9204
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:22:41 +0200 (CEST)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfTE-0007gh-Kj
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewc-0000tu-7K
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:48:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewa-00035Y-1p
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILS20iXHwK0SsJaaTQLLSnjpCkVgaq8CBH8Roq3vleY=;
 b=aRYU9RNX6YUmXaPmfLJpu9vBSvwnnEnEhRTwtIBza/YM+Go3PRneGbQFdVpbdSox+KCVDJ
 DNOiFOgPomI3LEBLg1xVtBqAzcqsZNEQjymutGupVZQVCNFtJxrUhRG8c3lJs3NtgOmCA1
 DcK7NX9U7798imOz6ECEFBdi8sdtYZ4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-397-yhb-o6pBN1O8FlKUWqdNVg-1; Thu, 01 Sep 2022 03:48:50 -0400
X-MC-Unique: yhb-o6pBN1O8FlKUWqdNVg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f9-20020a7bcd09000000b003a62725489bso519551wmj.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ILS20iXHwK0SsJaaTQLLSnjpCkVgaq8CBH8Roq3vleY=;
 b=pKffwqR8WepJxYEM/KlQZO4xFXy+wYX6VG7CB1BbIRZEQgbY4ibwlD7a4Eon0oM27c
 QEAtKeysKOzghQiBtG3Goh5kpc/51KqBqtroUo4m6DBL3e99UYBtgT2Km1KVVSckfbU+
 ikTRQhOl+371hXZ41+djL/fnAjMZl98BuTvqmAJD8xHNOslQJIJlogbNf0j7j+8ePoon
 y4yGsqe5TLvIC1SerPBgM0t31YBrrbvipNJ+awTEu5o0OoJcxbV9JM9tRY04yxjjR3wZ
 zfGqVTQMWRLJWn1s+XLJPoqZH0Fa3NXh+9wCP6S21y5345mXsd8HGSAObIPpwZmTNEwL
 jIag==
X-Gm-Message-State: ACgBeo2whM3nEkYWMCpEf9Z5Xb8H9Evynf9B8oXYqM6JdR5HlkLF0P3r
 CwtgItdrF8D3dowEr3rRptODTknMKhQmPqYMIZWqSyVFLMzEfBujj2wyto7Iez4nyfc+MOBbpvo
 xo6ui2S3Pkm7v6lj5JSOngf/HpHVataD5XHpKbCGNmFZDbf2LhtiShtedNf/DQ+HrAWA=
X-Received: by 2002:a5d:5272:0:b0:226:eedb:ee59 with SMTP id
 l18-20020a5d5272000000b00226eedbee59mr2957901wrc.668.1662018529633; 
 Thu, 01 Sep 2022 00:48:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7h4Km39rMemhSvVUH0Nzeu9qgrelG/IbeW4YNUpNWrab4+nG8L39Tss7oVPKNswN0MOMgEeQ==
X-Received: by 2002:a5d:5272:0:b0:226:eedb:ee59 with SMTP id
 l18-20020a5d5272000000b00226eedbee59mr2957885wrc.668.1662018529343; 
 Thu, 01 Sep 2022 00:48:49 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4688000000b00226f2ab6e2asm1586659wrq.68.2022.09.01.00.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:48:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 02/23] i386: formatting fixes
Date: Thu,  1 Sep 2022 09:48:21 +0200
Message-Id: <20220901074842.57424-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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
2.37.1



