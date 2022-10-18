Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7614602EA3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:36:49 +0200 (CEST)
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okni4-0000Jp-O7
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiv-0005DW-OL
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiu-0005Sn-5L
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666100013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHCgtN0uSyy5PmaDYvnnmfJvqZURg/C6c66f+sm+l6s=;
 b=GeYS7IrW+dtCzqqNI6SbrPq5z8luh2C1XZAWuvnXbp3Bv0YJuj6dOaWfKRAO8Kz8i2dP+z
 Wz+KA+/n5IJBp6Sehd8rghAGtuQ/7ojVYTk6Sbvm3eeAVWf6icl3lXQs/ox3QD1WbGsoys
 fKwB10wT1mVXctKmPhsD4Cwmcu6YGIY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-w88RCa63PMWOQGtM-XvKhA-1; Tue, 18 Oct 2022 09:33:30 -0400
X-MC-Unique: w88RCa63PMWOQGtM-XvKhA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z7-20020a05640235c700b0045d3841ccf2so8257362edc.9
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mHCgtN0uSyy5PmaDYvnnmfJvqZURg/C6c66f+sm+l6s=;
 b=thhP7Pgv360IyvkiEw6adhqpKyG09UKDphuWqN2yVs2n7NFI2IQINgCtcwqjBFWU9G
 3LlZ+ZqyIl2K3/l53Yj08xewmqS04xuULSV7QT/5eGMr9T5OcBEL6J1Cel6FoHz7rRfq
 lx6MgWIYVnwlrQ+9OmojQ1wucbEQYDY3pGFxpTYF28L0tMs8E+ThnixJYTnzRHbcVA1d
 kUbkqmK77y9DcUl8aVVR58YSMc5HblBOiWM0xEF7/RzeEpWEoFUvyW9ra5fHj6pH2iUQ
 Bt2MiPstkQvoB/v71nYeVKQ6m/zu1BIrInVhxmMUj1LxcAju9EAO5opSC1uGQI/BGHtt
 eNfw==
X-Gm-Message-State: ACrzQf3Irn9Qk0SdabQZpYYMo4ALogu1/sKRJt4+iVBEgHfiUCiUFsTx
 R8fYhCgWVbYhCAKrbqJEn443xN70XzqM1jsn9JfLfY57Ly4KQPUMz16Sn1FECLOTarsNp12Jmh2
 Im1YGJCqsq3hMLlpXNwX+6sBKGUCn23SHAK54ZrnqlqKq9rnfD9DI/rEKBxJH/jJT0uE=
X-Received: by 2002:a17:906:9745:b0:78d:480f:cee7 with SMTP id
 o5-20020a170906974500b0078d480fcee7mr2456002ejy.192.1666100008393; 
 Tue, 18 Oct 2022 06:33:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xLlLpoA8cxvwJvxHkBVmlDpVb685+5ElXAniwsYSo7mZP+MkRaYL07LFNFIBhBBpBK568zg==
X-Received: by 2002:a17:906:9745:b0:78d:480f:cee7 with SMTP id
 o5-20020a170906974500b0078d480fcee7mr2455851ejy.192.1666100006332; 
 Tue, 18 Oct 2022 06:33:26 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 vj21-20020a170907131500b0078d4ee47c82sm7409199ejb.129.2022.10.18.06.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:33:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 50/53] target/i386: Enable AVX cpuid bits when using TCG
Date: Tue, 18 Oct 2022 15:30:39 +0200
Message-Id: <20221018133042.856368-51-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

From: Paul Brook <paul@nowt.org>

Include AVX, AVX2 and VAES in the guest cpuid features supported by TCG.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-40-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6279745f79..0ebd610faa 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -625,12 +625,12 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
-          CPUID_EXT_RDRAND)
+          CPUID_EXT_RDRAND | CPUID_EXT_AVX)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
           CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
-          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER, CPUID_EXT_AVX,
+          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER,
           CPUID_EXT_F16C */
 
 #ifdef TARGET_X86_64
@@ -653,14 +653,14 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ADX | \
           CPUID_7_0_EBX_PCOMMIT | CPUID_7_0_EBX_CLFLUSHOPT |            \
           CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_MPX | CPUID_7_0_EBX_FSGSBASE | \
-          CPUID_7_0_EBX_ERMS)
+          CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_AVX2)
           /* missing:
-          CPUID_7_0_EBX_HLE, CPUID_7_0_EBX_AVX2,
+          CPUID_7_0_EBX_HLE
           CPUID_7_0_EBX_INVPCID, CPUID_7_0_EBX_RTM,
           CPUID_7_0_EBX_RDSEED */
 #define TCG_7_0_ECX_FEATURES (CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU | \
           /* CPUID_7_0_ECX_OSPKE is dynamic */ \
-          CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS)
+          CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS | CPUID_7_0_ECX_VAES)
 #define TCG_7_0_EDX_FEATURES 0
 #define TCG_7_1_EAX_FEATURES 0
 #define TCG_APM_FEATURES 0
-- 
2.37.3


