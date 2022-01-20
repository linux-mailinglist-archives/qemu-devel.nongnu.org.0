Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D8A494402
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 01:09:55 +0100 (CET)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAL1V-0004BO-TT
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 19:09:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAL0M-0003VP-5l
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:08:43 -0500
Received: from [2a00:1450:4864:20::329] (port=50715
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAL0K-0003vZ-HL
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 19:08:41 -0500
Received: by mail-wm1-x329.google.com with SMTP id w26so8534640wmi.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 16:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Snm1ZC0YW/LY/7ZY4f+6rYRnrHRxPqgC98JxX5MbhrQ=;
 b=RZwani3fOJot9p0aMRE1MPB5f46sa03PiWaDMC57IC4/l8fl1nMz380CtyEGlsYv/L
 n2EAAqLP/eR7kJ0z6mRf5cOEdM+hM2fqZ4cs036025ZnUW1vnYE8GI6YPk6kzUPBFNvS
 jLK7czsjtPC4fep40RERUkOnkCn0N+xDDN9PekGPboEMvtblYH8+QBiWvY1eA/WrtTjw
 cwQ5YeSgxCZT2R3ohlESZ0m0ZWU1z5nF9dWWNtaL6bOg6hmtnhjAvAuTNnYfRnri30+X
 VBYKodhlv6u+DghmRAVMkPGTw9OVdzptgLaHRMY+95SPPCzoMeBVfjyMYa+ZxkwBB/Ix
 XQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Snm1ZC0YW/LY/7ZY4f+6rYRnrHRxPqgC98JxX5MbhrQ=;
 b=bslUesVhtYPPeAbnFQxv1h7PZYl6te8BtClw9N/bWRladnMzS24112iLhYeiMqvWrV
 jV2nK5a8dJGCN/seNPwH8agmgj7IxXuxjKFWEWkX2ZGOCDiGEQL2mT3jLwSXyREFM64s
 b3ZerWnZZVshTs+ZG4sfnGrNet0k6VvxHTbwDtdWCUGvcrrchuY74oQPMnChGIB77a8l
 7jRStQEYmvTvchfTTQmAQJYjYwWudQotn/8VflALM6s8poiP9G5d4MNqMYj/JSf2Nrkx
 bDH12bqKN4CreYy4GvwuB28EtlLVpoNSYzb0PjgW3CTpFMKE0EcZtWUPFum6TpklIiKM
 xs8g==
X-Gm-Message-State: AOAM532zeVNxLYG5tKWhjpvO6a8cpQUTEHFP6IwBEVQoiLmy0hegz+aw
 8efiHP01l55Jx4YgoBboS+lQdTLmAOE=
X-Google-Smtp-Source: ABdhPJwZwMvxBjYaqyShVoFL9xXI2FOl4lIuWxmTg/wt5ZOhPnh2qZ/8AwcE/2cH3m+OHm6jhI2g8Q==
X-Received: by 2002:a5d:6c64:: with SMTP id r4mr25153952wrz.251.1642637318754; 
 Wed, 19 Jan 2022 16:08:38 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 b15sm1201294wrs.93.2022.01.19.16.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 16:08:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] exec/cpu: Make host pages variables / macros 'target agnostic'
Date: Thu, 20 Jan 2022 01:08:36 +0100
Message-Id: <20220120000836.229419-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

"host" pages are related to the *host* not the *target*,
thus the qemu_host_page_size / qemu_host_page_mask variables
and the HOST_PAGE_ALIGN() / REAL_HOST_PAGE_ALIGN() macros
can be moved to "exec/cpu-common.h" which is target agnostic.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-all.h    | 9 ---------
 include/exec/cpu-common.h | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index bb37239efa3..84caf5c3d9f 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -234,15 +234,6 @@ extern const TargetPageBits target_page;
 
 #define TARGET_PAGE_ALIGN(addr) ROUND_UP((addr), TARGET_PAGE_SIZE)
 
-/* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
- * when intptr_t is 32-bit and we are aligning a long long.
- */
-extern uintptr_t qemu_host_page_size;
-extern intptr_t qemu_host_page_mask;
-
-#define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)
-#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_size)
-
 /* same as PROT_xxx */
 #define PAGE_READ      0x0001
 #define PAGE_WRITE     0x0002
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 039d422bf4c..de5f444b193 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -7,6 +7,15 @@
 #include "exec/hwaddr.h"
 #endif
 
+/* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
+ * when intptr_t is 32-bit and we are aligning a long long.
+ */
+extern uintptr_t qemu_host_page_size;
+extern intptr_t qemu_host_page_mask;
+
+#define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)
+#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_size)
+
 /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
 void qemu_init_cpu_list(void);
 void cpu_list_lock(void);
-- 
2.34.1


