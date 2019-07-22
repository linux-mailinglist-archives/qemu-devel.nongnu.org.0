Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03897053B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 18:17:34 +0200 (CEST)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpb0H-0005uC-E3
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 12:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33520)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hpazm-0004dv-4W
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:17:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hpazk-0006RA-VV
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:17:02 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34649)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hpazk-0006PL-O6
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 12:17:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id w9so29130390wmd.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 09:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AdVUU+R8Ux7jmIt6GoFxhTDhy7zQnJVp6dVmD0rp2YU=;
 b=fKbsioali0XnQrJd9t8tVedx3xe8rCU7kp0nWaH3Qe9PD8WK+ntsc2jOkYyb8N9N1N
 mj6Wmh4zor5b6bdLxDHut5YhTyxpaMXzaCholy4OFxvfCL8ehUhaqX3jzCNO3u42GWiM
 fHOnW1rGAwyROL1MOyejV5QlYFL1Vc46KBb3Nnhtncdy82YaH5Wsv3zjJO+VK4Mq74Gk
 W8PtVmz1Kp0viX6x6s5BlxnC797spfzqJStXEwHrHjWPRGW6iL5oL57HRlCHyJma8WCE
 wx36ztIunIi2JintIkyq55Bcg4iomldYnBQ1rIfbaJo67SbULo9D097oFXLc4QMcsJeK
 cmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AdVUU+R8Ux7jmIt6GoFxhTDhy7zQnJVp6dVmD0rp2YU=;
 b=S0UbsE3WsubpYQ6NiT27scJ44rj6AI2Cx5yeRc4xkJFB3M5c/nVeFE11nctSXbERIa
 06MmiQBfqedRR1CYpSeDzp1sINLAxibca7fNG+ULYtebrP9bXjTGITGEIZn9dxEIAq8b
 IXispyNPColrPya9WpoipXXrK3T1pJkRMWLKfTZVLjcklZuuzT+VsO1f+a7FNA6HGNXf
 BVHxJ9OtFtYXA+ETTSHPHRTENQzAHPbfj35uh6frMzYwxbVBfkE38sZjA2fW+C003Of/
 eWTkzA2tSityRJdKgapGFl2ykTCqWavhEXjO/CeZiGkfqY+wXl9Ksf2d9t5kvHMf7+Lk
 HBXQ==
X-Gm-Message-State: APjAAAU9Erm8lwN+4cUnj0z7bZcctvDVCIImXDwE8iB3vWjGNrGyuSxV
 eU4ljmR6kxNMTF5/9kw+Ll3OzNPQBPs=
X-Google-Smtp-Source: APXvYqyTmqxZbsjocdoMcwCqim69VqmiT6iiRxoUS2pnEfsbBcdr6UEFX8kkbvRKLzR4Lx9CHd5+uA==
X-Received: by 2002:a7b:ce18:: with SMTP id m24mr62460427wmc.126.1563812219411; 
 Mon, 22 Jul 2019 09:16:59 -0700 (PDT)
Received: from donizetti.lan ([2001:b07:6468:f312:10f7:67c8:abb4:8512])
 by smtp.gmail.com with ESMTPSA id o6sm77717501wra.27.2019.07.22.09.16.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 09:16:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 18:16:57 +0200
Message-Id: <20190722161657.8188-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722161657.8188-1-pbonzini@redhat.com>
References: <20190722161657.8188-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
Subject: [Qemu-devel] [PULL 2/2] i386/kvm: Do not sync nested state during
 runtime
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jan Kiszka <jan.kiszka@siemens.com>

Writing the nested state e.g. after a vmport access can invalidate
important parts of the kernel-internal state, and it is not needed as
well. So leave this out from KVM_PUT_RUNTIME_STATE.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Message-Id: <bdd53f40-4e60-f3ae-7ec6-162198214953@siemens.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index ada89d27cc..dbbb13772a 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -3563,12 +3563,12 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
 
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
-    ret = kvm_put_nested_state(x86_cpu);
-    if (ret < 0) {
-        return ret;
-    }
-
     if (level >= KVM_PUT_RESET_STATE) {
+        ret = kvm_put_nested_state(x86_cpu);
+        if (ret < 0) {
+            return ret;
+        }
+
         ret = kvm_put_msr_feature_control(x86_cpu);
         if (ret < 0) {
             return ret;
-- 
2.21.0


