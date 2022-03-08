Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D19F4D16B2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:54:40 +0100 (CET)
Received: from localhost ([::1]:43502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYQJ-0003AX-7e
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7g-0007pm-Nj
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:26 -0500
Received: from [2a00:1450:4864:20::529] (port=36615
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7c-00060T-Iw
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:23 -0500
Received: by mail-ed1-x529.google.com with SMTP id o1so22987132edc.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ha14pz7x/m5u7qcmHOLfQZi29aAKiPe3b4fjSvg00PY=;
 b=LndUvJqSVMCZ3kUtNHleyITWlnXejCI9f+jMN+6WtTMGAaJQ/Qh87hY2zfsX3xqZuH
 RfZLQKaNNaERJTcrVTgU8bOW+fzrH5nJZlApBq0YNkl/VTq1DOup/2izWdXAanY9x+sh
 E8Y+IjwTdGj9tns2HHT6Yu19IMgD+seIZiOA0CX1mb+hErIcGJwxjTedx5bufY3W/c6f
 C1odjyf22Y90Jc/O+62p+74AAAEomXrVoD3DoCTSS8wsR+vNPxgjwnYJeOPjLhDduNc4
 VQeuKXLKEqxRlEctWH1p+DYwIT1A3Po8z5C7yCl64GHRwtndAS5jCb2KhZBXTNDAmsHg
 xH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ha14pz7x/m5u7qcmHOLfQZi29aAKiPe3b4fjSvg00PY=;
 b=W/V084qiLN9nNhv8sGOH5egs15Wf1T0DSvXEToApvxe8GcK7vvfjwtgZw4RWiBbYTv
 OxlaM9k+3xoSSSdSXzrLt72GkjNvaeI5ARn+hhRqM/nEguOQas/UKqfHIYNuxFAB6avK
 m2Hza+JkQfzLGMP1oud3S33MxWVb2zjkHz8qFZnIx2Z+iyvnfw/SMemvxIIS0SyA9TPE
 2zL0buxLn5vLMZEE6mG/Xd0WYiaE69hEcnnkzXh0MGvqXjdThSeTFyoc+lyCO1dZsaaO
 bWgz7GbbztJs17kRmr+Vr42Lzo+UyTHMNd0x9m0zhSEm8X7Q5x3m+UuQd/OTwiPzwAi0
 JufQ==
X-Gm-Message-State: AOAM531jJVbMZNOlRNl1lVHcyeKuzdusEeYijn2VZi3WIqIbjv5vd4q1
 owC/wMYdw0fuOzzbSLvcMbj2L6Vn+/Q=
X-Google-Smtp-Source: ABdhPJzdoJ4aPC16eebZp3keyp467JZNZE9F48eXlzNPYcG2DhAXipnmAn6hzJlM04HXSreyPXNGYw==
X-Received: by 2002:a50:e60f:0:b0:415:9509:32a2 with SMTP id
 y15-20020a50e60f000000b00415950932a2mr15547913edm.235.1646739315448; 
 Tue, 08 Mar 2022 03:35:15 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/22] x86: Add XFD faulting bit for state components
Date: Tue,  8 Mar 2022 12:34:39 +0100
Message-Id: <20220308113445.859669-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

Intel introduces XFD faulting mechanism for extended
XSAVE features to dynamically enable the features in
runtime. If CPUID (EAX=0Dh, ECX=n, n>1).ECX[2] is set
as 1, it indicates support for XFD faulting of this
state component.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220217060434.52460-5-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 3 ++-
 target/i386/cpu.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 505ee289bc..79e24bb23f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5496,7 +5496,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
-                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
+                *ecx = esa->ecx &
+                       (ESA_FEATURE_ALIGN64_MASK | ESA_FEATURE_XFD_MASK);
             }
         }
         break;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9630f4712a..925d0129e2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -557,8 +557,10 @@ typedef enum X86Seg {
 #define XSTATE_DYNAMIC_MASK             (XSTATE_XTILE_DATA_MASK)
 
 #define ESA_FEATURE_ALIGN64_BIT         1
+#define ESA_FEATURE_XFD_BIT             2
 
 #define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
+#define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
 
 
 /* CPUID feature words */
-- 
2.35.1



