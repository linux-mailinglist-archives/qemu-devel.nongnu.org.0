Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B45D307A75
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:17:11 +0100 (CET)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59yo-0000H6-6r
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l59wD-0007Nw-TM
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:14:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l59wA-00018Q-Fl
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611850465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vohs2+KlSVFNeHtYycpizObEwEjoJ1/fOO/41o5aITY=;
 b=fYf+Z8xIYLiJhOgpdKdqaxXz5riY2HMu4PnOuYyCCK8gT8KzNBi+CjwHY4sSEgA8p6jjD5
 imUBgL07sHCK1p536O5Y7M1L4eTjIUuKg07/us1dFa2CDjwYxwZWiL2COnlfDtmzbS+zb0
 OYW+wFbS7FDih+iCnsFhu8xM1f8Q1z8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-QH-Y-PGwOciMYDZrI69K4A-1; Thu, 28 Jan 2021 11:14:24 -0500
X-MC-Unique: QH-Y-PGwOciMYDZrI69K4A-1
Received: by mail-ed1-f70.google.com with SMTP id m16so3376719edd.21
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vohs2+KlSVFNeHtYycpizObEwEjoJ1/fOO/41o5aITY=;
 b=dTLgiig1q4f9oQVMNJY8PS4gg+nxdU44pzz9eGM/aHG4l1VnoDfVGMxDRRYTSYz2cB
 R8OacqI8O2p+s2X03J3HuuDJVo8ihzXmOHe/cGC+gpEXctsK0hcux3SuOd5NVVuds7D+
 GPpwgmZ4ILyxqUKFy8KzKeM46cpH7jRb8LouVWBkmj1Acdrk0Nil+XTYlMC6Yd0E2pPb
 uCv1CUR957pZvikHAQC+EJ7geRhc7XT7ozJNOa8LH8U34tLq9yovXrhDK9Io9jfxvSL6
 OgzteAQEZtcb/86rHHmL3dwQyLsSNszQWyNIjME6KYCRpZALUVuV32T7e96r7vVKXDaz
 qnQg==
X-Gm-Message-State: AOAM531GHDvTRlY6ZTNjG3klKkhKJJSNXp7CO/WZV7zDwuB5fFNUmlz3
 7CM9btooMtDsvUiddSACfFq9i845LTDQs0X6KxnvHXoQu5/PXU+r6Hwj/F0upMBl6mSiDS59Ewd
 9UPhJSkkILXZtBfrWmXknO/nmalg4hDrZvRXXUPFHo/fRi3vGW4uEB7P/SjI3djyA
X-Received: by 2002:a17:907:9801:: with SMTP id
 ji1mr105113ejc.420.1611850460998; 
 Thu, 28 Jan 2021 08:14:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwETFK6s9x6Et2enzglxqyxoYvDTpxdk3h5aBGxXxI3joXyTiC9FW6ySz2kRhkvp13xaXtuqg==
X-Received: by 2002:a17:907:9801:: with SMTP id
 ji1mr105069ejc.420.1611850460550; 
 Thu, 28 Jan 2021 08:14:20 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id lz27sm2464220ejb.50.2021.01.28.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:14:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/arm_gic: Allow to use QTest without crashing
Date: Thu, 28 Jan 2021 17:14:17 +0100
Message-Id: <20210128161417.3726358-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexander reported an issue in gic_get_current_cpu() using the
fuzzer. Yet another "deref current_cpu with QTest" bug, reproducible
doing:

  $ echo readb 0xf03ff000 | qemu-system-arm -M npcm750-evb,accel=qtest -qtest stdio
  [I 1611849440.651452] OPENED
  [R +0.242498] readb 0xf03ff000
  hw/intc/arm_gic.c:63:29: runtime error: member access within null pointer of type 'CPUState' (aka 'struct CPUState')
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/intc/arm_gic.c:63:29 in
  AddressSanitizer:DEADLYSIGNAL
  =================================================================
  ==3719691==ERROR: AddressSanitizer: SEGV on unknown address 0x0000000082a0 (pc 0x5618790ac882 bp 0x7ffca946f4f0 sp 0x7ffca946f4a0 T0)
  ==3719691==The signal is caused by a READ memory access.
      #0 0x5618790ac882 in gic_get_current_cpu hw/intc/arm_gic.c:63:29
      #1 0x5618790a8901 in gic_dist_readb hw/intc/arm_gic.c:955:11
      #2 0x5618790a7489 in gic_dist_read hw/intc/arm_gic.c:1158:17
      #3 0x56187adc573b in memory_region_read_with_attrs_accessor softmmu/memory.c:464:9
      #4 0x56187ad7903a in access_with_adjusted_size softmmu/memory.c:552:18
      #5 0x56187ad766d6 in memory_region_dispatch_read1 softmmu/memory.c:1426:16
      #6 0x56187ad758a8 in memory_region_dispatch_read softmmu/memory.c:1449:9
      #7 0x56187b09e84c in flatview_read_continue softmmu/physmem.c:2822:23
      #8 0x56187b0a0115 in flatview_read softmmu/physmem.c:2862:12
      #9 0x56187b09fc9e in address_space_read_full softmmu/physmem.c:2875:18
      #10 0x56187aa88633 in address_space_read include/exec/memory.h:2489:18
      #11 0x56187aa88633 in qtest_process_command softmmu/qtest.c:558:13
      #12 0x56187aa81881 in qtest_process_inbuf softmmu/qtest.c:797:9
      #13 0x56187aa80e02 in qtest_read softmmu/qtest.c:809:5

current_cpu is NULL because QTest accelerator does not use CPU.

Fix by skipping the check and returning the first CPU index when
QTest accelerator is used, similarly to commit c781a2cc423
("hw/i386/vmport: Allow QTest use without crashing").

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index af41e2fb448..c33b1c8c4bc 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "trace.h"
 #include "sysemu/kvm.h"
+#include "sysemu/qtest.h"
 
 /* #define DEBUG_GIC */
 
@@ -57,7 +58,7 @@ static const uint8_t gic_id_gicv2[] = {
 
 static inline int gic_get_current_cpu(GICState *s)
 {
-    if (s->num_cpu > 1) {
+    if (!qtest_enabled() && s->num_cpu > 1) {
         return current_cpu->cpu_index;
     }
     return 0;
-- 
2.26.2


