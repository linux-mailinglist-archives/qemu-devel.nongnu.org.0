Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C74602E18
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:14:25 +0200 (CEST)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknMO-0001os-TK
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiR-0004RN-W2
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhe-0005F7-Ez
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vw5LlIDyswk8yQIY84axnlS2VUcrouMFoVhlsE9apE=;
 b=c7WTdsEPXhG6f57ELXT8KYJuHSxBvz3UT+BPgEsoaGBmRtawF0BEHTDQbeo4QrXjI5GMz0
 hLasmQYCGB6JvD71AZtOCtDlFD5nLQvrOMj/WTvgi2ovfRTRaxgb+yvKasTCHEXw/0/zjE
 RV9ClJTaASEyOThZf5V/pwNbwRG3+I0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-WRpiFhYHORCcMn9DpZuEzw-1; Tue, 18 Oct 2022 09:32:13 -0400
X-MC-Unique: WRpiFhYHORCcMn9DpZuEzw-1
Received: by mail-ej1-f71.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso6401390ejb.14
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vw5LlIDyswk8yQIY84axnlS2VUcrouMFoVhlsE9apE=;
 b=c5Bq+Bl9nRfJEr4jsCqWfT+poN3n0F3kSO1gF3DgBquPM9rpxRXxlJGAQE8ASGEhYl
 na+YSf/MeX1WXMO2noVUDEyXoXUVArtxgeAlJHyQ7kG4SYcsWWo+JDVkyNR/1eBuynU+
 hFLm5nBRcT1wyTDNYy88MUQ8FEzGYzLe63nfYZdhMxtPvY5UW7AibO930gZe9kZhUONE
 zdJbZSk+mhE7VmCKUj5AkXti806xVZruSHDn+7zYiCYJ4T+qS5CAednFrfkRD2/tBdIS
 mH1GcWlsj8voQDnZ8hjo7TtxfgJiGYB7uZ1KJvtU92tE74G6hVanTfDSceNmQCPuSn4s
 WFmA==
X-Gm-Message-State: ACrzQf2QoG9S4315k/5ARm7dYKpQilnY8rWaF3DTXE7bfkwJcOeWWDT0
 G3yOmXq8Ym5wvSZDgyOz4AzCv0V0gyV8kjI3M/gwjhaaoXWN+jDuBDaf7vsnE0lx6cQ1wobnR22
 Is+FxXzO1RLJ4GfcVkX2lOvNUsU/YzthdgDvYt1B4mrz2RarGPUtiFPhcZ7aM9MvwOhQ=
X-Received: by 2002:a17:907:9710:b0:791:8aa6:18bb with SMTP id
 jg16-20020a170907971000b007918aa618bbmr2343631ejc.279.1666099929314; 
 Tue, 18 Oct 2022 06:32:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ESH2laV+X9pdDOF3dFLrG4c+6JjZIKhsTK4/40jQ/I6TuLmwN8zQ0ldEVOMM1YEA4X7NlCQ==
X-Received: by 2002:a17:907:9710:b0:791:8aa6:18bb with SMTP id
 jg16-20020a170907971000b007918aa618bbmr2343252ejc.279.1666099923091; 
 Tue, 18 Oct 2022 06:32:03 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709063a0300b007836d075152sm7472447eje.187.2022.10.18.06.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 23/53] target/i386: add CPUID[EAX=7,ECX=0].ECX to DisasContext
Date: Tue, 18 Oct 2022 15:30:12 +0200
Message-Id: <20221018133042.856368-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

TCG will shortly implement VAES instructions, so add the relevant feature
word to the DisasContext.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index eb174dbb8c..abccaadfbf 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -116,6 +116,7 @@ typedef struct DisasContext {
     int cpuid_ext2_features;
     int cpuid_ext3_features;
     int cpuid_7_0_ebx_features;
+    int cpuid_7_0_ecx_features;
     int cpuid_xsave_features;
 
     /* TCG local temps */
@@ -8859,6 +8860,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext2_features = env->features[FEAT_8000_0001_EDX];
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
+    dc->cpuid_7_0_ecx_features = env->features[FEAT_7_0_ECX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
     dc->jmp_opt = !((cflags & CF_NO_GOTO_TB) ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
-- 
2.37.3


