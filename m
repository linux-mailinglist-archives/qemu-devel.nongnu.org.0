Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F374A60CE9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 23:04:07 +0200 (CEST)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjVNH-0006N9-4B
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 17:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34270)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUkS-0004Yk-M9
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:24:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUkR-00034V-Eu
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:24:00 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:47082)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hjUkQ-0002gi-NQ
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 16:23:59 -0400
Received: by mail-wr1-x443.google.com with SMTP id z1so6392901wru.13
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 13:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wzOpofdcurA5wsLNGyb10WqGKKid4Jy5IfhsoibOXrE=;
 b=DKyJRbEy18ZuxnVwrFYwij/hUBPHQFs+eLH81D2+OLJm6Lc4O1N7Ka7gP5hp9Kp0Dn
 blHm3xxR9lB89/uQZZHkhWoyKeeJZigr/0d1ESjD+NDw+gXrgyFsNWg19v/QJC7qiJnT
 x+sKOkYqkRJDcG/kFUrOz0efF2ZNTKGdSuHoa6GLbDZeMwGuVrFab3hk6k0FXMJ1Gw7k
 t9zUck5qkEKbpXyKDKTOwLTKiek/TUZ7cIghtugOYxASa88iESXLb4FHKPV3aQ6rwobS
 /m/oEzJlgwqaUCo6xzPdHSn5hvsukjjRaFevxRs9qtv4cWaMluPqOMUvvWIaDJLugGoo
 /khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=wzOpofdcurA5wsLNGyb10WqGKKid4Jy5IfhsoibOXrE=;
 b=LbO1p3sWNbc3bdHXWOedVd9DirdVRj2BzuoOl9BFeOIwLKoxbiGFBZuqB3kUsP/c/8
 nILEiYkzrYS2RPuZJxa7qQ9dZI+WzRoVa9LVRGkcKGTyHfT/T9Wvipc5DIfilMLCvkgD
 O/lGoWS8B5PzzAkjmafDwRje/gPuwJ9QMFPaosnELdCUb6/UjKPxVwrFKZDrzj5e42Ys
 keO/QTtGnSkwyN17zYOnc7GfISTgoqA72hyrA/x7jKozqnFpSLTdktKGNVt5lm+tNdDp
 oC6NiThnYuhSUYoRLoiIJciuFzmpMMVG9PhzlImElhkKDSDG0nK87M5ufvCyx5ghRqo8
 APTg==
X-Gm-Message-State: APjAAAV/w1rsZZtjReKxWA5fZU/Ie0Q/3vwRMpxeUJBRYJTXjEE7BJK1
 iX8gYKCDsPq2l9P5LXEdntEqX4hVgMs=
X-Google-Smtp-Source: APXvYqwbScvg06K9GOeh0UAuMC5Jp6uHLlTBh7UDryM1cWfw1LeQStZUjOPuXmMI2Gvwgjk0b9S7Eg==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr4880872wro.86.1562358206572;
 Fri, 05 Jul 2019 13:23:26 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id v23sm3035875wmj.32.2019.07.05.13.23.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 13:23:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 22:23:13 +0200
Message-Id: <1562358202-28008-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562358202-28008-1-git-send-email-pbonzini@redhat.com>
References: <1562358202-28008-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PULL 03/12] i386/kvm: Fix build with -m32
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
Cc: Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

find_next_bit() takes a pointer of type "const unsigned long *", but the
first argument passed here is a "uint64_t *".  These types are
incompatible when compiling qemu with -m32.

Just use ctz64() instead.

Fixes: c686193072a47032d83cb4e131dc49ae30f9e5d
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190624193913.28343-1-mreitz@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index e4b4f57..31490bf 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1043,14 +1043,15 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
     CPUX86State *env = &cpu->env;
     uint32_t r, fw, bits;
     uint64_t deps;
-    int i, dep_feat = 0;
+    int i, dep_feat;
 
     if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) {
         return 0;
     }
 
     deps = kvm_hyperv_properties[feature].dependencies;
-    while ((dep_feat = find_next_bit(&deps, 64, dep_feat)) < 64) {
+    while (deps) {
+        dep_feat = ctz64(deps);
         if (!(hyperv_feat_enabled(cpu, dep_feat))) {
                 fprintf(stderr,
                         "Hyper-V %s requires Hyper-V %s\n",
@@ -1058,7 +1059,7 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
                         kvm_hyperv_properties[dep_feat].desc);
                 return 1;
         }
-        dep_feat++;
+        deps &= ~(1ull << dep_feat);
     }
 
     for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
-- 
1.8.3.1



