Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920662B1528
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 05:43:46 +0100 (CET)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdQw5-00053k-Ma
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 23:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdQtL-0003MO-HD
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 23:40:55 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdQtI-00019d-Cj
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 23:40:54 -0500
Received: by mail-pf1-x42e.google.com with SMTP id w6so6606189pfu.1
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 20:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q03WPu/F9eSFOC+QlWJlkwXPv50orEGTHlzMH4ifvew=;
 b=bNgcArXl9vRgL1P5lIjM4s3UDDY79dn9QEedU0+hgAlDqxxcWDH9mB0N39td7/9gDl
 Y6vY0BNuMmZwTiRz2Flw7qDLrgxQhhwopqAFycyVnHqOJPVhGTYCXT0YMf45uJOfuAr0
 OX3H5Xi9yfXmYPmKUekXvn7x6no8EE2/CdgbDUmC4+MUTsU7RKNujy4xBk8tbT3WSTVX
 C1LVTsXIOXgECqErfLG8wVpu/Grn+LC9qmeKxfxn8TM7jqWcvog8aSWSaSOMhIk0ccpo
 FrK6lG62VdCScUI/pVMupKXacUK9nVrJQgenOzG9oPximjhzFMaildsICRRQTpJspbgd
 ukng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q03WPu/F9eSFOC+QlWJlkwXPv50orEGTHlzMH4ifvew=;
 b=kZ/SkZlPGSsiIEzqW6OF47oiFbFjtkN5WEVxqKIC64fLPH+1MDmxFSD2qYF0NuGCbn
 Su7u0+AIJ7qPpmexcZv3hjlJ0EfZso75KAmcBrGEar8yGN1d68rhY5ipjTX5qTwO44NW
 DEd90FEcEY/6Ag7MLYBeS2SZR5QM+th+Mz3fiBCABzc6+bnBL7JBZ+Mt9N4X53vFrLqT
 xeuztdFBEaTqHbWGm42MsmEqjL00jgz7F/o2iVHCksCzXgge6OyJFz70e4R1xOBEUf0C
 xdhb6g0aUofTe1hLA8jN6XPtUJPVaVliKuhRiBj8s++MZU5zYss3QHeSyRf+dYrIH1fT
 Svqg==
X-Gm-Message-State: AOAM531ncBw75nglVz/AlGTIumk0D2b9UC2FQm4SV381yOUUSgBbh2f0
 B2+dfQOaMVlzlev1XAQ2AquyTzUfTngF1Q==
X-Google-Smtp-Source: ABdhPJxqzGW78o9s/HJXOfvK9kfnMo10Fhs/wOmClQ2KYDEJS0q4PmFO31uyDWaFdlL9mHIjDmm5PA==
X-Received: by 2002:a63:c154:: with SMTP id p20mr651814pgi.252.1605242447630; 
 Thu, 12 Nov 2020 20:40:47 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b129sm1101627pga.3.2020.11.12.20.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 20:40:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.2 1/1] MAINTAINERS: Replace my twiddle.net address
Date: Thu, 12 Nov 2020 20:40:43 -0800
Message-Id: <20201113044044.782249-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113044044.782249-1-richard.henderson@linaro.org>
References: <20201113044044.782249-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Consolidate all of my MAINTAINERS entries on my work address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c2df0bef3..2e018a0c1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -112,7 +112,7 @@ L: qemu-s390x@nongnu.org
 Guest CPU cores (TCG)
 ---------------------
 Overall TCG CPUs
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: softmmu/cpus.c
@@ -138,7 +138,7 @@ F: include/fpu/
 F: tests/fp/
 
 Alpha TCG CPUs
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: target/alpha/
 F: tests/tcg/alpha/
@@ -185,7 +185,7 @@ F: tests/tcg/cris/
 F: disas/cris.c
 
 HPPA (PA-RISC) TCG CPUs
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: target/hppa/
 F: hw/hppa/
@@ -297,7 +297,7 @@ S: Odd Fixes
 F: target/rx/
 
 S390 TCG CPUs
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
 F: target/s390x/
@@ -333,7 +333,7 @@ F: include/hw/unicore32/
 
 X86 TCG CPUs
 M: Paolo Bonzini <pbonzini@redhat.com>
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 M: Eduardo Habkost <ehabkost@redhat.com>
 S: Maintained
 F: target/i386/
@@ -430,7 +430,7 @@ F: scripts/kvm/vmxcap
 Guest CPU Cores (other accelerators)
 ------------------------------------
 Overall
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: include/sysemu/accel.h
@@ -534,7 +534,7 @@ F: qemu.nsi
 
 Alpha Machines
 --------------
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: hw/alpha/
 F: hw/isa/smc37c669-superio.c
@@ -1044,7 +1044,7 @@ F: hw/*/etraxfs_*.c
 HP-PARISC Machines
 ------------------
 HP B160L
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
 F: default-configs/hppa-softmmu.mak
@@ -2807,7 +2807,7 @@ F: scripts/gensyscalls.sh
 Tiny Code Generator (TCG)
 -------------------------
 Common TCG code
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: tcg/
 F: include/tcg/
@@ -2836,7 +2836,7 @@ F: tcg/arm/
 F: disas/arm.c
 
 i386 TCG target
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: tcg/i386/
 F: disas/i386.c
@@ -2851,7 +2851,7 @@ S: Odd Fixes
 F: tcg/mips/
 
 PPC TCG target
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Odd Fixes
 F: tcg/ppc/
 F: disas/ppc.c
@@ -2865,7 +2865,7 @@ F: tcg/riscv/
 F: disas/riscv.c
 
 S390 TCG target
-M: Richard Henderson <rth@twiddle.net>
+M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: tcg/s390/
 F: disas/s390.c
-- 
2.25.1


