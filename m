Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9E211531E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 15:28:26 +0100 (CET)
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idEan-0004ag-4F
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 09:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1idELP-0006ik-Cm
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:12:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1idELO-0005rh-7L
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:12:31 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1idELO-0005pZ-1F
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:12:30 -0500
Received: by mail-wr1-x443.google.com with SMTP id j42so7864677wrj.12
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEB0PYeg3rST9N64Dd3NGVhbxk+j4ecFYL8NdrsWizQ=;
 b=i9N40PxZ9zJY5umnbMRKBXEqEJHcinWs4l+kq6pnKYU8IljbK2S7ypNSo6xMaBAI1B
 PBvxY50Oi3//fN9r4uPRmqIUdrAZKBR13qSKai3TtCLaI+OT98RvO4++HaWOLLCrBH0F
 OqsfDsK4aWUY0NStw/RfeaxPHnmEvG9F3LkGHwPf+m+PFgCAJ5BHbQsOnn1tmU7ia/t2
 byTAiHmVuTB5Rf5zASxekBoWTNBJqjP91o37gvNRpn4PPsVVSxepdjdoUOASh+UUSJ1d
 acwZyebwj8yyux2mDFYQND/gUgXqcSUlv2lNhGDe7aMzpt0tHXKsafgdLzkfQw0wKMJn
 xY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rEB0PYeg3rST9N64Dd3NGVhbxk+j4ecFYL8NdrsWizQ=;
 b=k5iy9odqxZVwr/PeCsfpUi8NgfV2zy1zpPU8jJGfcqQU7s+mEnVy30VGNwRG0QUVwb
 8VLcG0OIa5x4xp4Gf8sd1glQgeq8ZSQMEumRFLaO0KQqjTZLO7TVBCsP+qw4VqjrBjO+
 xF3O0of6EuY2/NXNm3LDrSKYGIEtRsqJuerwB7GggquGlOKPZ17EgQCH+X5gw/9LURvo
 N0OLbXntS9LhnAkK8gn7sSF5yUgnDXNe6p3QvlPmFjlvTO6S+HVBoWdHXbngo3RPrVDb
 xnLhDmwrajsTbs8IrtvN11nI1APCtys4VAyXFG5y3/gKQzwiOnTmTYVTwoja3chk+DfK
 lY3Q==
X-Gm-Message-State: APjAAAUkcIA1TQibJh1UnJvSy7ezkMY7kMImlZ74QMZID23ICw7bg/3t
 MxWH9Gfp+iYQ2VRt0nGo2tlUVCE9
X-Google-Smtp-Source: APXvYqxkWkpXVEemPSjXlD/z5JmisUCVZpMeEHOhCOrANjdA3gseXRKwYea9HYBpBvRcIihsr46QGg==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr15402872wrs.113.1575632198195; 
 Fri, 06 Dec 2019 03:36:38 -0800 (PST)
Received: from donizetti.redhat.com (nat-pool-mxp-u.redhat.com.
 [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id s65sm3181026wmf.48.2019.12.06.03.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 03:36:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] target/i386: disable VMX features if nested=0
Date: Fri,  6 Dec 2019 12:36:35 +0100
Message-Id: <20191206113635.6570-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206113635.6570-1-pbonzini@redhat.com>
References: <20191206113635.6570-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Yang Zhong <yang.zhong@intel.com>, Catherine Ho <catherine.hecx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

If kvm does not support VMX feature by nested=0, the kvm_vmx_basic
can't get the right value from MSR_IA32_VMX_BASIC register, which
make qemu coredump when qemu do KVM_SET_MSRS.

The coredump info:
error: failed to set MSR 0x480 to 0x0
kvm_put_msrs: Assertion `ret == cpu->kvm_msr_buf->nmsrs' failed.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20191206071111.12128-1-yang.zhong@intel.com>
Reported-by: Catherine Ho <catherine.hecx@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index bf1655645b..1d10046a6c 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -2572,6 +2572,14 @@ static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
     uint64_t kvm_vmx_basic =
         kvm_arch_get_supported_msr_feature(kvm_state,
                                            MSR_IA32_VMX_BASIC);
+
+    if (!kvm_vmx_basic) {
+        /* If the kernel doesn't support VMX feature (kvm_intel.nested=0),
+         * then kvm_vmx_basic will be 0 and KVM_SET_MSR will fail.
+         */
+        return;
+    }
+
     uint64_t kvm_vmx_misc =
         kvm_arch_get_supported_msr_feature(kvm_state,
                                            MSR_IA32_VMX_MISC);
-- 
2.21.0


