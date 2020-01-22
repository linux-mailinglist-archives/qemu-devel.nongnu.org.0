Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D17144A21
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 04:00:54 +0100 (CET)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu6GC-0002DB-Ub
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 22:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu65n-0005gb-97
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu65m-0002m8-4W
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:07 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:55135)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu65l-0002lf-V5
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:06 -0500
Received: by mail-pj1-x1043.google.com with SMTP id kx11so2383270pjb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 18:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dYsBbKvboqEn2Q05z2r8sR33xxD2SrXUDQPkfTlhf+A=;
 b=CZaaOtlpbwcvnRTL3mrCRh/kgeGRZ4f4XBdZVzJiHsSmXKB+Eg6LHUnHapQJcm/5ZJ
 Xxm15IncKPqpuZWKm5LUsWnpUrEF1VT6So9E43vWCU42x6BvCYdXkVwqGmEE+NPqNMcm
 XZrVN588pXxd56E7Ik77BjNrA7rw1OMecsoOPUWVOieXXFAy0F3OVgoLzqd2vl7tyAd0
 nNx3ALzHrKSr3PzoKZUHwcADjnRXkh0GDiS4vEhFa6EN6ZNXsswKjiePN3RNTEf3BAtj
 d7ozc5oqsmtHZXrLLnDVqNm+GjGveM4uOTzBAdUBUIpTZ6I5FWoTPY/NqxWs0ha+CAwt
 x6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYsBbKvboqEn2Q05z2r8sR33xxD2SrXUDQPkfTlhf+A=;
 b=kRdC8d7gYXbNUViNL03cr2zLwHNaf9w28wNWU90UTMrO98vd0ZqBch0xclwHEOqTQO
 WwYftpZER2ZhTn9fD8xoEyKgmW9ugyi0wqZ4wMt0SDdj4qGJ5zI1uiV6YDVt+IoU68WD
 37tyqOElLnY0j//8WHpbNjB5wiG+yy8Dl3WpepzVBkBxeEP+xzkIACHoI4KXgPxUmdbU
 2U/HTJrwOTYftKcN9Xs8wcXaaf+Teqj4Hlp0A3rQvtOEnW71ZUwGahU4bWSOnn7Nf+oE
 FecAsTdxFC8jPzCfvYJrJNRqLphrl9iQG7B/7uUBbQsIZu0gW4hZherehSxZNRMkkYdp
 X8xw==
X-Gm-Message-State: APjAAAWUlvs+IuRsBg0+Jb3qmTuYnFasIUlugh7rVleom/L06jgba+8U
 FitA+IBzZCJ4gx5CHbMKvZ9pNx/3mMQ=
X-Google-Smtp-Source: APXvYqwL5xd9ujZPM9iVMOn4pAiopKOPkHa5jgYmWgm50r0kvFRtyVZzrAhqqupLR1YARVbwL99y2A==
X-Received: by 2002:a17:902:8207:: with SMTP id
 x7mr8336772pln.185.1579661403897; 
 Tue, 21 Jan 2020 18:50:03 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id c22sm44149883pfo.50.2020.01.21.18.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:50:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] cputlb: Make tlb_n_entries private to cputlb.c
Date: Tue, 21 Jan 2020 16:49:38 -1000
Message-Id: <20200122024946.28484-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122024946.28484-1-richard.henderson@linaro.org>
References: <20200122024946.28484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are no users of this function outside cputlb.c,
and its interface will change in the next patch.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 5 -----
 accel/tcg/cputlb.c      | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a46116167c..53de19753a 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -234,11 +234,6 @@ static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
     return (addr >> TARGET_PAGE_BITS) & size_mask;
 }
 
-static inline size_t tlb_n_entries(CPUArchState *env, uintptr_t mmu_idx)
-{
-    return (env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS) + 1;
-}
-
 /* Find the TLB entry corresponding to the mmu_idx + address pair.  */
 static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
                                      target_ulong addr)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 3a4881cf69..500c56d74d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -80,6 +80,11 @@ QEMU_BUILD_BUG_ON(sizeof(target_ulong) > sizeof(run_on_cpu_data));
 QEMU_BUILD_BUG_ON(NB_MMU_MODES > 16);
 #define ALL_MMUIDX_BITS ((1 << NB_MMU_MODES) - 1)
 
+static inline size_t tlb_n_entries(CPUArchState *env, uintptr_t mmu_idx)
+{
+    return (env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS) + 1;
+}
+
 static inline size_t sizeof_tlb(CPUArchState *env, uintptr_t mmu_idx)
 {
     return env_tlb(env)->f[mmu_idx].mask + (1 << CPU_TLB_ENTRY_BITS);
-- 
2.20.1


