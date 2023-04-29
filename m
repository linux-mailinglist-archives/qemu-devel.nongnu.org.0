Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ADC6F2499
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVx-0006lQ-FZ; Sat, 29 Apr 2023 08:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVg-0006Hv-Fa
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVb-0004w0-U8
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJ2LfEsLk4GkG6XIynmM/r0tYdCk8YN8LvnxMKnc3OI=;
 b=Jp6HA+BzJ+WHfQM07G+b+OR80ydLgoXMgLG37FB/YUrZ2tPMr1MlsdT3n+ovST/0PL/grE
 xc5JDOUY8Bbbx7RFeKnupFRGOblMAJsH+5QqrV6hJMF8YpYkAUwhVm29JvIRBoy2OLSNzb
 lKjtdjLxKOfbF+MPRkkBqLSF3WuQumM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-y211b61gPeyFIPXeX5Q8RQ-1; Sat, 29 Apr 2023 08:16:57 -0400
X-MC-Unique: y211b61gPeyFIPXeX5Q8RQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50692ecb286so653268a12.0
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770615; x=1685362615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJ2LfEsLk4GkG6XIynmM/r0tYdCk8YN8LvnxMKnc3OI=;
 b=RepmpfbdZfaALi6ro3O18HSyyyBhO5duzs0Gc27v55QELUu9EdFkNg+nEQYiFuHycn
 vSGuLBqVIzNGM/7iJOjxT7YHqnKIQ0pMWS/OKLRQRGCfbFSLlhHfIzEIG9qZH9FOCgsf
 tP83ama+9go0+EnR6NgbueqMaGeu8SM7ga03JNYGPkJq3Gpk4VLI8Kp9FUaVQLCBLzR7
 u74YjJyegARpHgVrpxbSq06TRX9gWnfx2pkFYScOVbCgOX6gkrxV8t6NdOn5PzJuT5cn
 gATTKjb8lyzEpaOID+UPBCUVrVXuoV0wVnxmOQF8Kwv5H6mRvC0615M69K1BRYJ48OaD
 2G1Q==
X-Gm-Message-State: AC+VfDzH6rIG9gk+Xj+QfzfbTPgP4mwfuOfT/NdhSDhL/aUEenPo3Z66
 PKiXD/oRaaO1oqBXErFnQ5zqf56rDOGUeEW78iZmedZmG3dXkcX9/OVuqMHro+bHl88p6h3hgLF
 3PVVBAsGZkPFTPDOnEqxABLr9ieHqbZKQcw2AvYQuZWCBBytWYsGmyo8zVKGcIbDDy7UTzxqeOY
 k=
X-Received: by 2002:a05:6402:1143:b0:50b:5211:446f with SMTP id
 g3-20020a056402114300b0050b5211446fmr325408edw.6.1682770615456; 
 Sat, 29 Apr 2023 05:16:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aK1XsD7fpe+Ys8qfeDVa4RzfrmVnX2o27ilBXsAjdnihmO8yck8/XR5I5T0JCr9o8jm+MTg==
X-Received: by 2002:a05:6402:1143:b0:50b:5211:446f with SMTP id
 g3-20020a056402114300b0050b5211446fmr325395edw.6.1682770615184; 
 Sat, 29 Apr 2023 05:16:55 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a056402032300b004af6c5f1805sm10088677edw.52.2023.04.29.05.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxi Chen <jiaxi.chen@linux.intel.com>, Tao Su <tao1.su@linux.intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 09/17] target/i386: Add support for AVX-NE-CONVERT in CPUID
 enumeration
Date: Sat, 29 Apr 2023 14:16:28 +0200
Message-Id: <20230429121636.230934-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Jiaxi Chen <jiaxi.chen@linux.intel.com>

AVX-NE-CONVERT is a new set of instructions which can convert low
precision floating point like BF16/FP16 to high precision floating point
FP32, as well as convert FP32 elements to BF16. This instruction allows
the platform to have improved AI capabilities and better compatibility.

The bit definition:
CPUID.(EAX=7,ECX=1):EDX[bit 5]

Add CPUID definition for AVX-NE-CONVERT.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Message-Id: <20230303065913.1246327-6-tao1.su@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index abceab2b6992..0204a3ac801a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -895,7 +895,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
             NULL, NULL, NULL, NULL,
-            "avx-vnni-int8", NULL, NULL, NULL,
+            "avx-vnni-int8", "avx-ne-convert", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0b25d180753b..b46d52f3fa44 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -923,6 +923,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 
 /* Support for VPDPB[SU,UU,SS]D[,S] */
 #define CPUID_7_1_EDX_AVX_VNNI_INT8     (1U << 4)
+/* AVX NE CONVERT Instructions */
+#define CPUID_7_1_EDX_AVX_NE_CONVERT    (1U << 5)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.40.0


