Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C45A91BD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:11:52 +0200 (CEST)
Received: from localhost ([::1]:55090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTfIl-0005KU-Ix
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewe-0000z9-As
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTewc-00035u-GU
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TliPTaXw5V3NL8dMo5X5J1P25je0Qgx/8MGj43xjA48=;
 b=RZg4mR4k2NqFwblDQklIB3JlnQ88RxDDEp4hPmJaMbo/EEoOXTQLLa62up8eW5K+LyrrB1
 quDQ51EwN1vPuBw2S7dVKMDkIKkibVpXdc/EtjeN0WMmHR2DosV8ZWfJWWmRagXmNUcE5F
 a8KnTg6usLr8MzgKR5hbjtQDXGWTSqw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-tTdgYcc3NYaBiLc4QsrwHw-1; Thu, 01 Sep 2022 03:48:49 -0400
X-MC-Unique: tTdgYcc3NYaBiLc4QsrwHw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c25-20020a05600c0ad900b003a5ebad295aso517193wmr.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TliPTaXw5V3NL8dMo5X5J1P25je0Qgx/8MGj43xjA48=;
 b=vz2XJetP69lA5WbBAl25x1cDbGmZ//BgdK8YEJMDOPXZvhSRvCcAIYPVTvnM6VLbDk
 JHIulNFHS19kYsL+YQ4pPD/o5I0nxs8x5Ch3GhshsT2LXDHaul5qymEyyO3qr5wii61A
 ZGH9xI6N0eZlTsQ7V5KGfK6BXehFJozD/V4ZuBxEUHmYwvKRZPFurdQ4Gm84u/JGAVub
 B8MTpq2EbVLAzsekRPO8azDQUOcqovM+++flVB+laD8rK3yDCJ4HwWzY6U7k860KBUV/
 QuD/Lbq63RGjP1iclK1+g1FsDT+nFdU9nHpF5lx9WFpCtIUxeuZQcPF1hvswpD1mlklk
 jVrg==
X-Gm-Message-State: ACgBeo11VdKReiCwc877QorUs130zYZMdyncCtA3hkfDylkvW51TGRp3
 4MsLRD+Lwfzo7J9RN58QzfPbCr8ehnYGbVSMY5fS2/cmH3gXEP1WjhZPV2/hzFUv+xBir8KyO8i
 3165cIbiHU1WkAIOURdOwOUFNrwBlSyfTe6KYTrdG0+0TCJImFtP/vI7fcghWUI0bTfY=
X-Received: by 2002:adf:d203:0:b0:226:d4e7:511e with SMTP id
 j3-20020adfd203000000b00226d4e7511emr12152067wrh.13.1662018527971; 
 Thu, 01 Sep 2022 00:48:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xlKEK7P/S3xgOSIvBNobN8yd817h6MW32qiYBxZxSsG/2XJGmHgB4giDtqRnGx6bVIXH9Lg==
X-Received: by 2002:adf:d203:0:b0:226:d4e7:511e with SMTP id
 j3-20020adfd203000000b00226d4e7511emr12152051wrh.13.1662018527627; 
 Thu, 01 Sep 2022 00:48:47 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adfef44000000b00220592005edsm14270029wrp.85.2022.09.01.00.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:48:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 01/23] i386: do not use MOVL to move data between SSE
 registers
Date: Thu,  1 Sep 2022 09:48:20 +0200
Message-Id: <20220901074842.57424-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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

Write down explicitly the load/store sequence.

Extracted from a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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



