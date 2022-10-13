Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C189F5FE543
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:31:02 +0200 (CEST)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6jF-0007oo-Rc
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj647-0002uE-UG
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj646-0005NC-CF
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qp97G7ViPp9QEykDICkKhhGxX1E1AgyNcp7WMN3ofbg=;
 b=ESV+MTc6b5WDtdwtQoy6m86Hjv2ZjWCzchtQGjfwEIQRV5I7uOqbjy0trgorEGSrywgq+B
 AaUbAT7K9kum+6dHaLYQNFQ7pQ8Hy4vVxHKJn+xCmTw/vTvFEMzNeR5g+8wXDhLwXo28b1
 nbg0/WI84jvG6BRov5soa8wkFf1j+0Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-zm5v0yzUPZGKVrYBw_8llA-1; Thu, 13 Oct 2022 17:48:27 -0400
X-MC-Unique: zm5v0yzUPZGKVrYBw_8llA-1
Received: by mail-ej1-f70.google.com with SMTP id
 dm10-20020a170907948a00b00781fa5e140fso1496793ejc.21
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qp97G7ViPp9QEykDICkKhhGxX1E1AgyNcp7WMN3ofbg=;
 b=bm4QvZTOiuMQL+OcImx4xn3+HkXxAWZ5d59xAfF7Xte/lGNEU/gLKW198ge+C9B2gK
 T4TFwDMiLWtg3SwWOh0rVo/Ig/H8MGhIOHSJoeSRF+7pUnlSTGmdRzqW1ZQZSwl1+TQ+
 i/kcXsN+VgUQIgF96B6JcuLOECVNAeooHZc0MnD11dL8rLTiH6MGZO40VztjFcwjoQlm
 E+o/eWcSb8i2TIav3up1cDev8HligbBeTyahtjRf0gwDCPRcCWfLVBey84ThgY5OgAfa
 56NnoJw7hQgSIAnTfpDoNnl5AgBo7URzNWft7P8QxEg3vMEHoRuxQGxDlYdBQaPiJA+O
 XApQ==
X-Gm-Message-State: ACrzQf1OM3pVtFRU/OPAHobl4lpAqDOSZqPwlRT/6E7nBe4PmcxSL0+1
 FVn3c5UpKfTxj27MMfvzdrgXOe2nx15M30iPShUgm/JbEykqgUjiNPgY/JFNbwELqIwtpOaxnmj
 pfdxeQZn4BVnMIatxI/gt+B9WlZXs83TGPFueRkHl6mhDLF60xEezjyg9Bd8Y9uPe9Ss=
X-Received: by 2002:a17:907:3e85:b0:73d:60cc:5d06 with SMTP id
 hs5-20020a1709073e8500b0073d60cc5d06mr1340012ejc.722.1665697706128; 
 Thu, 13 Oct 2022 14:48:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AINDYZ6js52T5Tq4o3OvWMQzqE21KLSETycOJ8P3uTo76ejhjlD9+/n1SsEGiD/pb2gZDwg==
X-Received: by 2002:a17:907:3e85:b0:73d:60cc:5d06 with SMTP id
 hs5-20020a1709073e8500b0073d60cc5d06mr1339999ejc.722.1665697705871; 
 Thu, 13 Oct 2022 14:48:25 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 kv20-20020a17090778d400b0078d261f9f44sm400280ejc.224.2022.10.13.14.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 32/35] target/i386: Enable AVX cpuid bits when using TCG
Date: Thu, 13 Oct 2022 23:46:48 +0200
Message-Id: <20221013214651.672114-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
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
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
index 8a11470507..15c28c632b 100644
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


