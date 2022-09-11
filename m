Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E65B51D1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:13:28 +0200 (CEST)
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW8l-0004ce-5a
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0Q-0000H1-7a
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0O-000709-Nm
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYueNIAawSAD0f0741B5PZIJ6OMzo/zyc2Cv3LG491A=;
 b=OKdsTJyL7yeLniJcdLpvYH/IBIFftuyHwpwfY9f72Rg7UmDvpvlcRoegetKcJuVL8dYaam
 sjQ/dIBKbFixbLMFKM1XVUx1bqmqdGm/zKL76GAj74nYlcZkkiMrMaSih5b/Hy06YDJb/V
 CL2k0DkVDSBWG6tNue44gK8/mlF+ACo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-UBBemGmlPL2hU1aXL088Ng-1; Sun, 11 Sep 2022 19:04:45 -0400
X-MC-Unique: UBBemGmlPL2hU1aXL088Ng-1
Received: by mail-ej1-f71.google.com with SMTP id
 sh44-20020a1709076eac00b00741a01e2aafso2338187ejc.22
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UYueNIAawSAD0f0741B5PZIJ6OMzo/zyc2Cv3LG491A=;
 b=NmYyLWp+aztJa3+fIaHqLFnyKkZ0CW/18ec9q00YrrQckE0bbfrgHde3CbGN3L6wNb
 JVu8LYDfJEvRNudnsaiQTSYLSaoi6lmnK38h/ycS0Ni9WL3XTWbGXU23Yb7w3M8syPM2
 /8wP4uaLCMcG9E6DsGYOJpDnrHj2MEzu72glY1zx6cHnaM3bgKaBo+o7+uGCZQohr9F+
 sNc8cLm0jugqVhkdGpukucW2XBUD8iaudZ8aY4IX2p50oI39hmqMzcKexCnxf5jI9MkB
 RBX8cql1Y9N0HS01zE19CHSaW7oX1blz3chGPbLHT1a1/Tz8ntfXM216WWJ1GEVC4wvH
 2NVQ==
X-Gm-Message-State: ACgBeo1yrOJo6w3B5rcT9nmoiOyFfuVZYNruclJT9lV3jY3qtWBYJUGW
 TZQWDj2kXU7iPjTotkMSIZROXpEgnFcOpiE5i98yaB+RFXoFdnbYNvzDTbQqhnAOIW81wIHRHwX
 qhsgFYdCCWmdhQQTrRIGEPEapXlXqb7c6Ufrg5S28IWG3YfTHWeVjEGInPZq3FAYr8UI=
X-Received: by 2002:a05:6402:42c5:b0:44e:b640:16fb with SMTP id
 i5-20020a05640242c500b0044eb64016fbmr20345431edc.29.1662937484026; 
 Sun, 11 Sep 2022 16:04:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR71UEKfloLKFTvQsXmFyqHYB3PNpl9neb1Fk4qPydV/Y4Ex65+2TrIh4hIZF/unwqBPCaQuqw==
X-Received: by 2002:a05:6402:42c5:b0:44e:b640:16fb with SMTP id
 i5-20020a05640242c500b0044eb64016fbmr20345419edc.29.1662937483817; 
 Sun, 11 Sep 2022 16:04:43 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a17090611d700b007341663d7ddsm3489887eja.96.2022.09.11.16.04.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/37] target/i386: add CPUID[EAX=7, ECX=0].ECX to DisasContext
Date: Mon, 12 Sep 2022 01:03:47 +0200
Message-Id: <20220911230418.340941-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=pbonzini@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7e9920e29c..a92ef61527 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -115,6 +115,7 @@ typedef struct DisasContext {
     int cpuid_ext2_features;
     int cpuid_ext3_features;
     int cpuid_7_0_ebx_features;
+    int cpuid_7_0_ecx_features;
     int cpuid_xsave_features;
 
     /* TCG local temps */
@@ -8860,6 +8861,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext2_features = env->features[FEAT_8000_0001_EDX];
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
+    dc->cpuid_7_0_ecx_features = env->features[FEAT_7_0_ECX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
     dc->jmp_opt = !((cflags & CF_NO_GOTO_TB) ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
-- 
2.37.2



