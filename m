Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1D24DF05
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 04:10:57 +0200 (CEST)
Received: from localhost ([::1]:54152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he90y-0008Uu-NT
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 22:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41291)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a6-0006fA-IM
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a3-0006ge-RA
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55301)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1he8a3-0006Ox-2g
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id a15so4783864wmj.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oxFkmD9CWtsOJOq7EBRxZJcEMw3GfGZUqh7/P684mSo=;
 b=IJQSDpvjJvprpVHFaJoLNL7fG7gAsqNuFiSziASuJkt5pmvO7EAKeTAgspohRKJS4u
 A4IZ2Cdxy0I8+9MPLr4yVs2HdcN6tXYcFXkgZSX+eNWLYHYZnkToonC+BWzlqMV+eRtM
 pchmUeu85RtRdXY0SMesnQRIbW80YNh9WwudfZW6FEtsSqtjYKCUl5tAgxm1t5WKZLfB
 akqHx3SSFPE7MV8ZRVsGm2GbVp529xg2s3i+tRGSgm2YZXMOqt+zOXKqEXeZpr/s7VpL
 UztAoxeB17ZY3n7MfQP5h7DFN257wUTzZ8CLC6GzuZVB7V9vUl2KB2UnVRzCJQYMfFeW
 vhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=oxFkmD9CWtsOJOq7EBRxZJcEMw3GfGZUqh7/P684mSo=;
 b=GU48Yvlw+jCR8ILQqHVqTRW8vny/RopY9ANWCO2VMz88SWmAVx46COMQ44djcUghX2
 4wIgrq4pvQvA26+h/FZeDgxIYpyV6iilWxml6z7KStb9QFvMkSi/V8oJUvzPncA638IL
 8TtUD0LhdP44W5WI1zKnJx2V5LkpNPf7qfcbcEnlQ5Ipx5Q0jwvqFDsbzWGFLqLJKvWA
 NP36z6wrOdHDVsRtf9Y32eqY4JZptuLgRz/b/owOc9tT2Cxy3EC5fRee+h01O46pLMto
 9nieJES3pud1up4MRka5rxupTvDVDrm6lldL0EnUlBIBnnbyEhoZUBO257AffuWqsRdD
 WY3g==
X-Gm-Message-State: APjAAAULeEuB65xjlJtGsXS+PWg2dbA60QsbwFgDwdjMM5fbCfvuwGWT
 RybWoDWEcedwNsweZnCVbPucftWL
X-Google-Smtp-Source: APXvYqzAh80/HgAR3Q+R237U9JPqvE2bsN2GtO/LwhxVYH14KePhcsF+uGwPxN1GMy2OrWX3S6MgmA==
X-Received: by 2002:a05:600c:204c:: with SMTP id
 p12mr1524271wmg.121.1561081374736; 
 Thu, 20 Jun 2019 18:42:54 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d1sm1123125wru.41.2019.06.20.18.42.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 18:42:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 03:42:27 +0200
Message-Id: <1561081350-3723-23-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
References: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
Subject: [Qemu-devel] [PULL 22/25] target/i386: kvm: Add nested migration
 blocker only when kernel lacks required capabilities
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Liran Alon <liran.alon@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

Previous commits have added support for migration of nested virtualization
workloads. This was done by utilising two new KVM capabilities:
KVM_CAP_NESTED_STATE and KVM_CAP_EXCEPTION_PAYLOAD. Both which are
required in order to correctly migrate such workloads.

Therefore, change code to add a migration blocker for vCPUs exposed with
Intel VMX or AMD SVM in case one of these kernel capabilities is
missing.

Signed-off-by: Liran Alon <liran.alon@oracle.com>
Reviewed-by: Maran Wilson <maran.wilson@oracle.com>
Message-Id: <20190619162140.133674-11-liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c     | 9 +++++++--
 target/i386/machine.c | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index ab812b5..f08eab4 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1640,9 +1640,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
                                   !!(c->ecx & CPUID_EXT_SMX);
     }
 
-    if (cpu_has_nested_virt(env) && !nested_virt_mig_blocker) {
+    if (cpu_has_vmx(env) && !nested_virt_mig_blocker &&
+        ((kvm_max_nested_state_length() <= 0) || !has_exception_payload)) {
         error_setg(&nested_virt_mig_blocker,
-                   "Nested virtualization does not support live migration yet");
+                   "Kernel do not provide required capabilities for "
+                   "nested virtualization migration. "
+                   "(CAP_NESTED_STATE=%d, CAP_EXCEPTION_PAYLOAD=%d)",
+                   kvm_max_nested_state_length() > 0,
+                   has_exception_payload);
         r = migrate_add_blocker(nested_virt_mig_blocker, &local_err);
         if (local_err) {
             error_report_err(local_err);
diff --git a/target/i386/machine.c b/target/i386/machine.c
index f66f342..e077989 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -233,7 +233,7 @@ static int cpu_pre_save(void *opaque)
 
 #ifdef CONFIG_KVM
     /* Verify we have nested virtualization state from kernel if required */
-    if (cpu_has_nested_virt(env) && !env->nested_state) {
+    if (kvm_enabled() && cpu_has_vmx(env) && !env->nested_state) {
         error_report("Guest enabled nested virtualization but kernel "
                 "does not support saving of nested state");
         return -EINVAL;
-- 
1.8.3.1



