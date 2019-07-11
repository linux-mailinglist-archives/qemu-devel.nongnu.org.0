Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40465EFC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:47:24 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hldAC-0002iH-25
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39089)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hld5Z-0002Bf-DM
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hld5X-0006EW-Ck
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:36 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hld5W-00068q-9Y
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:35 -0400
Received: by mail-wm1-x341.google.com with SMTP id l2so6511263wmg.0
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 10:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=yQgSakyqjdDxRxBN+0Cyq3M9CNhoalhZX4RfOxEc3rY=;
 b=R7BSc+z96xQ+/dA1ciYSJn5qqvejY2NQWUt1dGzjsyuJ/5JfA25R1N3wRufOAExH+J
 rxZvf6Zr47OQKIzMpGeFEDu7wbk4z5QV2SJvOvR72rTkVW60X0JAcWzFWfXTrekf+OWv
 f0VJHM9eQ5eYPHW7xl5BXDopMsnNxks9aPhEZxAlo7wPsJNEyXHfAA6XJdsJFUHPgBeX
 AXqc4eHLjgrjNCFI4u5JNw5e6HnA++y8HwqJMzz+wtYZ6eCyogfBpqstE0CJBpKnEcQg
 EfV5sPS6VN8buYHfMvXCzOpgWLUzncnreuz49CXKcL0b1Yi6dvJ5rPYPp6hTtHm+8wOf
 AlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=yQgSakyqjdDxRxBN+0Cyq3M9CNhoalhZX4RfOxEc3rY=;
 b=Zn4kg3Vcare2o4EThiFzEc5qVaUBUSDFW9ftuJwovrZKSscnGnH8t7SXmYhZtRdAII
 RuhQZumuDo+ktJkv+3shraFo8JJjLIdkLayqY/bRorisDGgqBE+PoZvD4jENmrwpPnQ1
 lcjzALuIVL81/khLzt3YfGZrbJRoZwqV1WaWOwzNJq7/r3qsyXhaOVxkewELdtWdu77f
 jmUb29QmwmYgM38rigpS0LK8on1OTu7YjoK5W86m3w1i3mKHlmwI0E4m6Xs+f9dtlh95
 0IxpbflQ+n6ERdFE7agU/S9eREdVtFZel7uoIjDVXfI5pYluyAmhzfLATQB+pq1VQUvj
 yfXA==
X-Gm-Message-State: APjAAAXfGpQGxVd/Es1mS/HPcWQ6qwU0u8iwP6EuiAyXItyWpFA5RaH2
 ogWweVQSX/lKAvtOjMZEhUfKMJU8jvw=
X-Google-Smtp-Source: APXvYqyqeKHyvIh4LOnnAl3WIKWVyDYGuzY1z01Bqbr3sHuU0Sh9z8Br6P1RB9Xa/bnh27fB4tKmFA==
X-Received: by 2002:a05:600c:2199:: with SMTP id
 e25mr5033949wme.72.1562866947375; 
 Thu, 11 Jul 2019 10:42:27 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b15sm8383715wrt.77.2019.07.11.10.42.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 10:42:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 19:42:24 +0200
Message-Id: <1562866944-9871-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH] target-i386: add CPUID bit for
 MSR_KVM_POLL_CONTROL
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Marcelo Tosatti <mtosatti@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f2d868f..bc8853d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -902,7 +902,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "kvmclock", "kvm-nopiodelay", "kvm-mmu", "kvmclock",
             "kvm-asyncpf", "kvm-steal-time", "kvm-pv-eoi", "kvm-pv-unhalt",
             NULL, "kvm-pv-tlb-flush", NULL, "kvm-pv-ipi",
-            NULL, "kvm-pv-sched-yield", NULL, NULL,
+            "kvm-poll-control", "kvm-pv-sched-yield", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             "kvmclock-stable-bit", NULL, NULL, NULL,
-- 
1.8.3.1


