Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442A4AB76C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:16:16 +0100 (CET)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH082-0006Mf-2V
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:16:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysv-00062H-BT
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:31 -0500
Received: from [2a00:1450:4864:20::32e] (port=41594
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysb-0002Gh-FO
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so8006331wmb.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lf4FxZOloAXzX6NJpHqcFNBqRrxhogU7JEnj2p1b6Xw=;
 b=L+fEPNH8MaAXQvSbVPcc/JpWHjsS0J0FOgHCEmf2800ivUlo/T5t/MB91zSjjPKZPo
 XYfpdz700/PBhPFzvVJVtC9+Xh7V5brYGGBeJvlxc5LGNbgiSJaM7jZYW9erwO9CbG3r
 dhqWsHq0230+jbdKoDNbXGtfZ9f9yng7ciZz1nmw0oAImK0xsCqHADzxsTAAVyfNDRPW
 r4Noo5VajO3jeQYK6hT1gG9zuXyWbXnEM4a1qiqXRuYBZDYFjCf84hglGVvb9hQqtche
 Y7N1PW4ndgJngImbqYxYXYaPHM/LN6SuHdn1EKVksval8GkWoPL0F8nFEN6sRHOqLTaU
 ByJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lf4FxZOloAXzX6NJpHqcFNBqRrxhogU7JEnj2p1b6Xw=;
 b=vAvdJKVF/Ey8TmeyRbmwq9kjOhdERzkiouYYDEQh4DOtzh77B2TGfbh+qJR3aQ6JLk
 zNzEoAi6tSBJ8S8+k8cp8Xn6hiONSTGoF1+N5j62ds+g2fYEB+xM5TrZB/ddNJ0RBF/C
 V5v/trAPqWxgrq23XDDpQBrT55F4WXuqGiYXZY616ClcW4hwzdkbe/1Zbv1IJzK41ywn
 +x5efgePauq29VATXbpxy1XYsTclYmH0Zi5r8iQHJTk+1PtJIT9wfC5wseW5yDvkt+XN
 mhhs171rINQEsp+/3xJ1bgcn6/9nxQCken6zrwF0faCOZQAiqZ90T0V33P89t/5HJrNd
 FnJw==
X-Gm-Message-State: AOAM532E/KxDMwbkzntiJhjKvCEgz7rcf/svQURPnbakkYr+FFqiIiVR
 hHBIyst2VVR2yX9mk5V7H/IokQPxN44=
X-Google-Smtp-Source: ABdhPJyMau+kRJF7aovuPlZBrftdjtdqeYbqzJAwQV8qfnBh/XX5MSiXSGB7AuByXNfDc0dcNVmZtQ==
X-Received: by 2002:a05:600c:646:: with SMTP id p6mr9994031wmm.3.1644220556156; 
 Sun, 06 Feb 2022 23:55:56 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id j15sm9402438wmq.19.2022.02.06.23.55.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:55 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 19/21] exec/cpu: Make
 address_space_init/reloading_memory_map target agnostic
Date: Mon,  7 Feb 2022 08:54:24 +0100
Message-Id: <20220207075426.81934-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

cpu_address_space_init() and cpu_reloading_memory_map() are
target-agnostic, but are declared in "exec/exec-all.h" which
contains target-specific declarations. Any target-agnostic
source including "exec/exec-all.h" becomes target-specific and
we have to compile it N times for the N targets built.  In order
to avoid that, move the declarations to "exec/cpu-common.h" which
only contains target-agnostic declarations.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-common.h | 23 +++++++++++++++++++++++
 include/exec/exec-all.h   | 25 -------------------------
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 8031ebc680..7f7b5943c7 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -90,6 +90,28 @@ void qemu_ram_unset_migratable(RAMBlock *rb);
 size_t qemu_ram_pagesize(RAMBlock *block);
 size_t qemu_ram_pagesize_largest(void);
 
+/**
+ * cpu_address_space_init:
+ * @cpu: CPU to add this address space to
+ * @asidx: integer index of this address space
+ * @prefix: prefix to be used as name of address space
+ * @mr: the root memory region of address space
+ *
+ * Add the specified address space to the CPU's cpu_ases list.
+ * The address space added with @asidx 0 is the one used for the
+ * convenience pointer cpu->as.
+ * The target-specific code which registers ASes is responsible
+ * for defining what semantics address space 0, 1, 2, etc have.
+ *
+ * Before the first call to this function, the caller must set
+ * cpu->num_ases to the total number of address spaces it needs
+ * to support.
+ *
+ * Note that with KVM only one address space is supported.
+ */
+void cpu_address_space_init(CPUState *cpu, int asidx,
+                            const char *prefix, MemoryRegion *mr);
+
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
 static inline void cpu_physical_memory_read(hwaddr addr,
@@ -102,6 +124,7 @@ static inline void cpu_physical_memory_write(hwaddr addr,
 {
     cpu_physical_memory_rw(addr, (void *)buf, len, true);
 }
+void cpu_reloading_memory_map(void);
 void *cpu_physical_memory_map(hwaddr addr,
                               hwaddr *plen,
                               bool is_write);
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 87df70fa8f..199fd49e5d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -82,31 +82,6 @@ static inline bool cpu_loop_exit_requested(CPUState *cpu)
     return (int32_t)qatomic_read(&cpu_neg(cpu)->icount_decr.u32) < 0;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-void cpu_reloading_memory_map(void);
-/**
- * cpu_address_space_init:
- * @cpu: CPU to add this address space to
- * @asidx: integer index of this address space
- * @prefix: prefix to be used as name of address space
- * @mr: the root memory region of address space
- *
- * Add the specified address space to the CPU's cpu_ases list.
- * The address space added with @asidx 0 is the one used for the
- * convenience pointer cpu->as.
- * The target-specific code which registers ASes is responsible
- * for defining what semantics address space 0, 1, 2, etc have.
- *
- * Before the first call to this function, the caller must set
- * cpu->num_ases to the total number of address spaces it needs
- * to support.
- *
- * Note that with KVM only one address space is supported.
- */
-void cpu_address_space_init(CPUState *cpu, int asidx,
-                            const char *prefix, MemoryRegion *mr);
-#endif
-
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /* cputlb.c */
 /**
-- 
2.34.1


