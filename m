Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932446D52
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 02:54:39 +0200 (CEST)
Received: from localhost ([::1]:57876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbwxq-0008Nm-AA
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 20:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hbwmd-0000W2-Or
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 20:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hbwmb-0004BD-PU
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 20:43:03 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37700)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hbwmZ-000484-Td
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 20:43:00 -0400
Received: by mail-wm1-x343.google.com with SMTP id f17so1351550wme.2
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 17:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYkbASmVjMT2mdNG6FSEH7YudCdKd0aZFiI+nNUNNKM=;
 b=dxlhyuwG321edrbnaPCe4JWR3RKp1FCJsKWay4G7h9mQPo4SNQ8HauJ21PVW4F9pX/
 glWmdDW1fJwtYNQ8qMi6YD5ZSePrEhIu6Vya9uINKmbMERXj/J1mOmA0cDxLCwuMDfe1
 48Yhsg4ajAQvazqMn5oELHXV7IxlkU92J9o2lBGHAI6joxcK/HkO/W8z4bQM1ERVNcie
 vvCnepl5eHQ9UY0PCwZkl3bNROCX4IcLn8prtvzpt/Jwt+7nyT6k1zq6WEkIjJmEFUGl
 QeaI+OuElgeTRsmrWEqcrpQ8lbbg/C83wducJR2qm0P0d5IrhP+TEpWQSqCngEY1fGy2
 fXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bYkbASmVjMT2mdNG6FSEH7YudCdKd0aZFiI+nNUNNKM=;
 b=BvaPPfsRxa3a3Vqyg9yYOd3J2FuyDUmlHn1YDf2o1J3j/oWE1s6RXckn2HhaYGLyil
 EKpCTrGHz6CqCwP3pfT00SXQNard0jVR137PWQxe543Dq3zbKzTt/FXBFo+V7VfXycbX
 o0LdFdmK1gjLghS/azlL/Yz47WV3GtlOEQyTueGOb8oQLQIUyMetR4bnkz3OBG3oW0dF
 +rKmaiJFmhst1P0kF1fB+la87eglvERThmS8yfeXdyM7rKKTvfzDqipL7KEJ+/EPoRUO
 dBafUJvusKUsjdaHAsUvN9Ej1lyggvxyBcFnIVwGNnkHtRHqu+cy5ELCtcD6ninLUZWG
 SvUA==
X-Gm-Message-State: APjAAAV2Xa9U4uAQUEiiZPOfEujrv3orPEyaiOpCwnmKiVnYtFSghyF6
 NfhItgy+CKCTAtSoBO1vJIiolW+7
X-Google-Smtp-Source: APXvYqxE9rPfuKKQom4W6PusArHAn5zNjq+dn5gs5WwVTRXjo7LwYt0azlWgX7Usht+7OaToOpdAOg==
X-Received: by 2002:a7b:ca43:: with SMTP id m3mr9957915wml.45.1560559376784;
 Fri, 14 Jun 2019 17:42:56 -0700 (PDT)
Received: from donizetti.lan ([2001:b07:6468:f312:1da0:213e:1763:a1a8])
 by smtp.gmail.com with ESMTPSA id m21sm3774234wmc.1.2019.06.14.17.42.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 17:42:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 02:42:50 +0200
Message-Id: <20190615004256.16367-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190615004256.16367-1-pbonzini@redhat.com>
References: <20190615004256.16367-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 1/7] KVM: i386: Use symbolic constant for
 #DB/#BP exception constants
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
Cc: liran.alon@oracle.com, nikita.leshchenko@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 3b29ce5c0d..c8d8196e71 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -2994,9 +2994,9 @@ static int kvm_guest_debug_workarounds(X86CPU *cpu)
     unsigned long reinject_trap = 0;
 
     if (!kvm_has_vcpu_events()) {
-        if (env->exception_injected == 1) {
+        if (env->exception_injected == EXCP01_DB) {
             reinject_trap = KVM_GUESTDBG_INJECT_DB;
-        } else if (env->exception_injected == 3) {
+        } else if (env->exception_injected == EXCP03_INT3) {
             reinject_trap = KVM_GUESTDBG_INJECT_BP;
         }
         env->exception_injected = -1;
@@ -3508,7 +3508,7 @@ static int kvm_handle_debug(X86CPU *cpu,
     int ret = 0;
     int n;
 
-    if (arch_info->exception == 1) {
+    if (arch_info->exception == EXCP01_DB) {
         if (arch_info->dr6 & (1 << 14)) {
             if (cs->singlestep_enabled) {
                 ret = EXCP_DEBUG;
-- 
2.21.0



