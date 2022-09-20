Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3D5BF099
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:53:23 +0200 (CEST)
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oam7H-0007rD-3f
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0Y-0006iG-EK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0W-0002Gn-5R
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e2P74FqVILbG/QWT2XViS/weRofyvDcC4h9ItmjBGdA=;
 b=X4Gb/n0vF5cuLWd9Cwe5A478s80tMtI+VELQ4Sdr/WSze0T66WZoFHSwIPTghAjw49VtvR
 3USFkG3N3MBC/HhoxD5ar8YjEmU18uByPLmJ6ZzzXIOIEQV9qs00Y0Yqtzv+tlXE5VyADL
 a8iGhR2WRUVw8enedSAnA3eNz5SEBcE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-M4rC6ToWOna-cePxLBFlag-1; Tue, 20 Sep 2022 13:26:02 -0400
X-MC-Unique: M4rC6ToWOna-cePxLBFlag-1
Received: by mail-ed1-f69.google.com with SMTP id
 s17-20020a056402521100b004511c8d59e3so2392327edd.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=e2P74FqVILbG/QWT2XViS/weRofyvDcC4h9ItmjBGdA=;
 b=AoGy+8DUVRRk+M8jwPIsK7fOz/AD8sXyn53u40NrCSw7Rkw7wF6rFF6KZYtSTAny88
 QscW6pYqqn4t8vyTDqvbdERh10N494CHPIDx1yfJ2pUgnMAG56yVSppAPKbEn+y+uz3x
 /YFIENaFJZq/1cBU0PeBHabzAokZMxtQenAlf5IuOaNrazhSDbgwnYCGNqL3ILrK/IDx
 DvvswLUZWlw8CC1yWJTQOk6jnaC7Hz+B8VN9T/wHNtKmSrt4BxRrzQ/YhbBb3U+uyLMH
 7ax2HQDEZDeFIu7eXhB5ICu4CpOHOF9X2bZILBrIUdQTjBemtlt7YMmw00ukMpe8ljxn
 NqZw==
X-Gm-Message-State: ACrzQf1qtuohRSo/O1T6+AzVViaoVYSMo4hVJ6BT8I6xTTnaNHZZJOPx
 5QUd/k0X4RTWVtaFo5LCyU8wh+OinSGqb49HFt4tN1r+ocwpFM3ILU9IQdKdc1/ocf+YpWkuRIP
 9ZtrgAmG5Qb5cgYoXnIFtXrflDPX3VzgnKOkb7C+SR8Ya9vhGcshUtjKZmSFbWgPNx24=
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id
 y17-20020a056402441100b00437b7230072mr21212696eda.38.1663694760922; 
 Tue, 20 Sep 2022 10:26:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Xx4JfL7Ur92YfeYaY4smyQeVSE2TlV8aGzV7AlHpde+H4hGqlpk80JITIkCyYNDmzadVy3Q==
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id
 y17-20020a056402441100b00437b7230072mr21212673eda.38.1663694760585; 
 Tue, 20 Sep 2022 10:26:00 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a170906a20200b0078020ae040csm118493ejy.219.2022.09.20.10.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:26:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 34/37] target/i386: Enable AVX cpuid bits when using TCG
Date: Tue, 20 Sep 2022 19:25:04 +0200
Message-Id: <20220920172507.95568-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
index 1db1278a59..ec0817a61d 100644
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
2.37.2


