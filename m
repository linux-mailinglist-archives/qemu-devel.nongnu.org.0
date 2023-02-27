Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD46A3F49
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:14:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaVy-0005CK-K3; Mon, 27 Feb 2023 05:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWaVw-0005C5-5r
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:13:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWaVu-0000yA-HK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677492825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3r9Dq59I5kwA6Lced4oMx+6meUldHg5YzO2K9IkYxo=;
 b=ac9m+sdB5IpRiXPzRU1wtxArKw4LDRqpS8M+55Br3re/qN9h4TW0Rp7unO1volR2le52na
 JhrNpHdW6AA/23ez9XWmgDTAMMWoIlszbMIwCf7799XgaEKjxLclo0Q6GpqMgAGETroHfL
 IdbG/L/CRnch3auneuR+W8Jdb8tde4E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-kGMpYQ0wOLCvShdHKtx_FA-1; Mon, 27 Feb 2023 05:13:44 -0500
X-MC-Unique: kGMpYQ0wOLCvShdHKtx_FA-1
Received: by mail-ed1-f71.google.com with SMTP id
 da15-20020a056402176f00b004ace822b750so7834198edb.20
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3r9Dq59I5kwA6Lced4oMx+6meUldHg5YzO2K9IkYxo=;
 b=7U9cWFP70NG/tNlwezJgwCTOZeBM4big+NZLo2NxsCLq5+cf+71buwLuWiRKHSd7rc
 JmhRYT0loZhvlAoEZskh9dbQxhIKhSXsMI72WBcrHnLoCYZhjqGGCiIFPvgXvkWfGyw+
 e+JJzVw0TyFO9qzDEVJnNMqcURpcQRu5Fh+HlPiFJs+NmCF0e7ktfCgjDPI0olyxKJmv
 5yW7kduLipI/XcggwxHRXnQM6pLokpkBDMoMLTZYjXZCYY6kn19JRPHY6WLVSYF7F997
 erecVdai+8F+ILTgdnQ08xzDAkGGaBJTo5csYgdRpLoWVqhaSHWMBgECfFrihGNRHk4e
 alMw==
X-Gm-Message-State: AO0yUKW9ruyBC2tD4LPDm8aXLbm5g+WE9IV1s2oPhKZ66j2Vr5gnalSW
 JTogvKlNo2mVO5ykz3N4B5bjir+S7fCkWyzsF+fYEUZpDmTfWkbHY58ke8H5CDT0lD6KqRrs5tr
 F+5TZOvWKcZ7BXMwlzI/9zbl4NLGQmR9L3rjtVS6Q5xHcgNo62inRpO3rWNlhNiUIp4qXgT3A
X-Received: by 2002:a17:906:e08c:b0:8b1:293a:ef21 with SMTP id
 gh12-20020a170906e08c00b008b1293aef21mr31407190ejb.64.1677492822641; 
 Mon, 27 Feb 2023 02:13:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/wyIjj0sY2HtKjVGPM6Mb54WqkuHD++dkhLQ07aQPimNgr6tpPNrjbv99jpzjusHG3UrgNUQ==
X-Received: by 2002:a17:906:e08c:b0:8b1:293a:ef21 with SMTP id
 gh12-20020a170906e08c00b008b1293aef21mr31407175ejb.64.1677492822386; 
 Mon, 27 Feb 2023 02:13:42 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a170906530b00b008e93991c034sm3008216ejo.46.2023.02.27.02.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:13:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, xiaoyao.li@intel.com,
 chenyi.qiang@intel.com
Subject: [PATCH v4 2/4] target/i386: add FZRM, FSRS, FSRC
Date: Mon, 27 Feb 2023 11:13:29 +0100
Message-Id: <20230227101332.636203-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227101332.636203-1-pbonzini@redhat.com>
References: <20230227101332.636203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These are three more markers for string operation optimizations.
They can all be added to TCG, whose string operations are more or
less as fast as they can be for short lengths.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 7 ++++---
 target/i386/cpu.h | 7 +++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 34e2cead870e..26ec6e9da754 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -662,7 +662,8 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           /* CPUID_7_0_ECX_OSPKE is dynamic */ \
           CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS | CPUID_7_0_ECX_VAES)
 #define TCG_7_0_EDX_FEATURES CPUID_7_0_EDX_FSRM
-#define TCG_7_1_EAX_FEATURES 0
+#define TCG_7_1_EAX_FEATURES (CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | \
+          CPUID_7_1_EAX_FSRC)
 #define TCG_APM_FEATURES 0
 #define TCG_6_EAX_FEATURES CPUID_6_EAX_ARAT
 #define TCG_XSAVE_FEATURES (CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1)
@@ -872,8 +873,8 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .feat_names = {
             NULL, NULL, NULL, NULL,
             "avx-vnni", "avx512-bf16", NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "fzrm", "fsrs",
+            "fsrc", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4bc19577a21..e0703feb5ed0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -900,6 +900,13 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
 /* AVX512 BFloat16 Instruction */
 #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
+/* Fast Zero REP MOVS */
+#define CPUID_7_1_EAX_FZRM              (1U << 10)
+/* Fast Short REP STOS */
+#define CPUID_7_1_EAX_FSRS              (1U << 11)
+/* Fast Short REP CMPS/SCAS */
+#define CPUID_7_1_EAX_FSRC              (1U << 12)
+
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
 
-- 
2.39.1


