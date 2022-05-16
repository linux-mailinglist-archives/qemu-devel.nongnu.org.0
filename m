Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F304E528BD6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:22:18 +0200 (CEST)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeQE-0005cH-4m
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd59-0002Cu-1C
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd57-0003NP-4o
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLpwnLJNtQaOov7pDM/v4molXBG6rR9qv9eI4vnHOwk=;
 b=Nd1/2QLvbYhI/mVAHaVh5w/A3aCsJavUsoUykDE33HzvNfusUgqddgcX14Rf0FBB3JeZpa
 WiWQjRpQkIAqsXBzK1Rz5+wJlKM7zaO/A/sUFGG1XrQRSre0WwoT+0yDOclfzfJda3XGzv
 Z760/6UhEiRW6jYgTJMTFsQvtwS3xuw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-aIUovsKsMNS5CDNcL7RGEg-1; Mon, 16 May 2022 11:56:23 -0400
X-MC-Unique: aIUovsKsMNS5CDNcL7RGEg-1
Received: by mail-ed1-f72.google.com with SMTP id
 bc17-20020a056402205100b0042aa0e072d3so3682597edb.17
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JLpwnLJNtQaOov7pDM/v4molXBG6rR9qv9eI4vnHOwk=;
 b=lNTe6kREM9Bs2YzWur8zQSRoBVwnvt21qVInSzEV8jJRO4nhIcXSrUEHAh8s02ly7/
 pRJBWtPip4P4Jpb5MQu5ZpWqFP5aJ/y/agxbkzhBoOCI8ZPgJUBMmLccSCYtB83WP6XD
 CiFytYE2GrrzCmyxoJ967CbExryAGC4/auvVjaWfHeR7ADPoYSbxCUENlzYdCBdmsmkw
 PUI1Mn/S/t5z0fbGNmuQgzPZqc7RpT+6X4PXPWJyjMp8bymbtL+bphV5Sy5aqr3oi9QO
 lMJF6UdxLYeJRVQg99Lg5038xoB9tUtEIIg7dM5UvIpikSDbD74K9zi+UZWPKTKSP/nw
 URkg==
X-Gm-Message-State: AOAM5303T0VVKnzyiOhHflWT6D7mwpAQ0nn6HU/HYKYmwwf6bYhMSrdP
 0g8N26wA1c9qSJ3Cq0Uk4AtxyGPPcdVQT1FxcXyvuJUf4Jfu4i6Xdd3CZVSZAv2ZCNx8H9incWZ
 16Jk7heCEqh+R4vd/9cCLIxUFyDvhfkfLozrFuPYf8h17AwlUHxj9/+nT7cm5rVgesQA=
X-Received: by 2002:a17:907:7da7:b0:6f4:f92b:3986 with SMTP id
 oz39-20020a1709077da700b006f4f92b3986mr15797014ejc.50.1652716581601; 
 Mon, 16 May 2022 08:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1VXkhPtQ2MT/IPxu87cD087KosZugaCVTcacmc0v+pu5hYvvcYsSk5WqBnnjdw9EWF3BBrQ==
X-Received: by 2002:a17:907:7da7:b0:6f4:f92b:3986 with SMTP id
 oz39-20020a1709077da700b006f4f92b3986mr15796994ejc.50.1652716581310; 
 Mon, 16 May 2022 08:56:21 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 16-20020a17090600d000b006f3ef214e4dsm28415eji.179.2022.05.16.08.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>
Subject: [PULL 10/23] target/i386: Add MSR access interface for Arch LBR
Date: Mon, 16 May 2022 17:55:50 +0200
Message-Id: <20220516155603.1234712-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

From: Yang Weijiang <weijiang.yang@intel.com>

In the first generation of Arch LBR, the max support
Arch LBR depth is 32, both host and guest use the value
to set depth MSR. This can simplify the implementation
of patch given the side-effect of mismatch of host/guest
depth MSR: XRSTORS will reset all recording MSRs to 0s
if the saved depth mismatches MSR_ARCH_LBR_DEPTH.

In most of the cases Arch LBR is not in active status,
so check the control bit before save/restore the big
chunck of Arch LBR MSRs.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220215195258.29149-7-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h     | 10 +++++++
 target/i386/kvm/kvm.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index dba92936a2..0d528ac58f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -391,6 +391,11 @@ typedef enum X86Seg {
 #define MSR_IA32_TSX_CTRL		0x122
 #define MSR_IA32_TSCDEADLINE            0x6e0
 #define MSR_IA32_PKRS                   0x6e1
+#define MSR_ARCH_LBR_CTL                0x000014ce
+#define MSR_ARCH_LBR_DEPTH              0x000014cf
+#define MSR_ARCH_LBR_FROM_0             0x00001500
+#define MSR_ARCH_LBR_TO_0               0x00001600
+#define MSR_ARCH_LBR_INFO_0             0x00001200
 
 #define FEATURE_CONTROL_LOCKED                    (1<<0)
 #define FEATURE_CONTROL_VMXON_ENABLED_INSIDE_SMX  (1ULL << 1)
@@ -1650,6 +1655,11 @@ typedef struct CPUArchState {
     uint64_t msr_xfd;
     uint64_t msr_xfd_err;
 
+    /* Per-VCPU Arch LBR MSRs */
+    uint64_t msr_lbr_ctl;
+    uint64_t msr_lbr_depth;
+    LBREntry lbr_records[ARCH_LBR_NR_ENTRIES];
+
     /* exception/interrupt handling */
     int error_code;
     int exception_is_int;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 536cbe5fad..a9ee8eebd7 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3367,6 +3367,38 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
                               env->msr_xfd_err);
         }
 
+        if (kvm_enabled() && cpu->enable_pmu &&
+            (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
+            uint64_t depth;
+            int i, ret;
+
+            /*
+             * Only migrate Arch LBR states when: 1) Arch LBR is enabled
+             * for migrated vcpu. 2) the host Arch LBR depth equals that
+             * of source guest's, this is to avoid mismatch of guest/host
+             * config for the msr hence avoid unexpected misbehavior.
+             */
+            ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
+
+            if (ret == 1 && (env->msr_lbr_ctl & 0x1) && !!depth &&
+                depth == env->msr_lbr_depth) {
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, env->msr_lbr_ctl);
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, env->msr_lbr_depth);
+
+                for (i = 0; i < ARCH_LBR_NR_ENTRIES; i++) {
+                    if (!env->lbr_records[i].from) {
+                        continue;
+                    }
+                    kvm_msr_entry_add(cpu, MSR_ARCH_LBR_FROM_0 + i,
+                                      env->lbr_records[i].from);
+                    kvm_msr_entry_add(cpu, MSR_ARCH_LBR_TO_0 + i,
+                                      env->lbr_records[i].to);
+                    kvm_msr_entry_add(cpu, MSR_ARCH_LBR_INFO_0 + i,
+                                      env->lbr_records[i].info);
+                }
+            }
+        }
+
         /* Note: MSR_IA32_FEATURE_CONTROL is written separately, see
          *       kvm_put_msr_feature_control. */
     }
@@ -3767,6 +3799,26 @@ static int kvm_get_msrs(X86CPU *cpu)
         kvm_msr_entry_add(cpu, MSR_IA32_XFD_ERR, 0);
     }
 
+    if (kvm_enabled() && cpu->enable_pmu &&
+        (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
+        uint64_t ctl, depth;
+        int i, ret2;
+
+        ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_CTL, &ctl);
+        ret2 = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
+        if (ret == 1 && ret2 == 1 && (ctl & 0x1) &&
+            depth == ARCH_LBR_NR_ENTRIES) {
+            kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, 0);
+            kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, 0);
+
+            for (i = 0; i < ARCH_LBR_NR_ENTRIES; i++) {
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_FROM_0 + i, 0);
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_TO_0 + i, 0);
+                kvm_msr_entry_add(cpu, MSR_ARCH_LBR_INFO_0 + i, 0);
+            }
+        }
+    }
+
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, cpu->kvm_msr_buf);
     if (ret < 0) {
         return ret;
@@ -4072,6 +4124,21 @@ static int kvm_get_msrs(X86CPU *cpu)
         case MSR_IA32_XFD_ERR:
             env->msr_xfd_err = msrs[i].data;
             break;
+        case MSR_ARCH_LBR_CTL:
+            env->msr_lbr_ctl = msrs[i].data;
+            break;
+        case MSR_ARCH_LBR_DEPTH:
+            env->msr_lbr_depth = msrs[i].data;
+            break;
+        case MSR_ARCH_LBR_FROM_0 ... MSR_ARCH_LBR_FROM_0 + 31:
+            env->lbr_records[index - MSR_ARCH_LBR_FROM_0].from = msrs[i].data;
+            break;
+        case MSR_ARCH_LBR_TO_0 ... MSR_ARCH_LBR_TO_0 + 31:
+            env->lbr_records[index - MSR_ARCH_LBR_TO_0].to = msrs[i].data;
+            break;
+        case MSR_ARCH_LBR_INFO_0 ... MSR_ARCH_LBR_INFO_0 + 31:
+            env->lbr_records[index - MSR_ARCH_LBR_INFO_0].info = msrs[i].data;
+            break;
         }
     }
 
-- 
2.36.0


