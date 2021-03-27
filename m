Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F95634B7C1
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 15:37:58 +0100 (CET)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQA4b-0003iG-G5
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 10:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1x-0001tV-3X
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:13 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQA1t-0003pn-Ox
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 10:35:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso6323175wmi.3
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8Qe6iFUAzFrr7FUr4KBajWcwtH7OzQT1dC3OwtApNs=;
 b=kWMiD7NzM2dELBD4//sn1cs77sxIagYIxC53EcXYnw4eaRjjqjeinc6xcVil7i4m/V
 3SvmAIMxHyT+guL51gCjg8LzN1NZdqlcX8MCsHp0XbwpFb6NXaKaOJHCeDSu85mqwGLo
 qP6Vd9y578drU0Q6nIJMQGpfPNGM/O8mcG6944IhAsug9IS71PIBur4msDgpjEGkTRBE
 z8aWziYa2zT2SXbRgHPMhkPsBU3c9vMJFFs2mCENANBijsjmwlvhk7qkwiBf5hYtepla
 rIKe2XKWnM0PqAfudrHinyd3ELQ0VhZsF1273ddvtrcvexhX2Z1RnMcpIw1KjuPkYuQm
 uKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N8Qe6iFUAzFrr7FUr4KBajWcwtH7OzQT1dC3OwtApNs=;
 b=VYjixhekc4kLNjxHmxRMvPsfoRhBi9czyUiI1oKzLuOVBFkMMMq3Ok8w1LxNCD15yV
 qrO+dB51GzsqZNqsz6DPx4ul2MEXbZ7jno+7G5MqKVxF7XFnayWOh8LHeXZ7wJv7uJdx
 Q2o7ufwmuM5Ehl0EjOxDU+7I5L2cyYjoZaF5IpgPjP2XIgCxfBA47CpUoyM76UrT+rpd
 BobRmc68Qpq+enc02KJyVpvLGNFTipY85LTcfxQNqDQU7yLuJyA4hpUSEPDWrznbMkKb
 5Xn5U3LPFFnHKqD0woTcSlrdPXj/bQp0+aMLJRmLZ+0rYuM7vj6hioAmTlTRqe7chv75
 udrA==
X-Gm-Message-State: AOAM533pfsf14NAsuYn/S/aR9DkwGITtgHvlgmMxNntaRfPm7ZTeOXYT
 fWZY6/3KTo1zQZ4ThnAcMNveoB2WZjtrgQ==
X-Google-Smtp-Source: ABdhPJybGjgYBYwLYRdTSVa6+jGgcPlIn1T9XaUHGjDj8USzGM5udM102yWlhQQdyHnkcVFiP1xeKg==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr17627023wma.80.1616855704413; 
 Sat, 27 Mar 2021 07:35:04 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s20sm16412602wmj.36.2021.03.27.07.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 07:35:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 2/5] memory: Add memory_region_set_priority()
Date: Sat, 27 Mar 2021 15:34:49 +0100
Message-Id: <20210327143452.1514392-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210327143452.1514392-1-f4bug@amsat.org>
References: <20210327143452.1514392-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an helper to change the priority of a memory region at runtime.

Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/memory.h | 10 ++++++++++
 softmmu/memory.c      | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b27..6ad9ff83457 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1983,6 +1983,16 @@ void memory_region_set_size(MemoryRegion *mr, uint64_t size);
 void memory_region_set_alias_offset(MemoryRegion *mr,
                                     hwaddr offset);
 
+/**
+ * memory_region_set_priority: dynamically update the priority of a region.
+ *
+ * Dynamically updates the priority of a region.
+ *
+ * @mr: the #MemoryRegion to be updated.
+ * @priority: priority of the region.
+ */
+void memory_region_set_priority(MemoryRegion *mr, int priority);
+
 /**
  * memory_region_present: checks if an address relative to a @container
  * translates into #MemoryRegion within @container
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 4fbeee02dc7..fdba938f299 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2504,6 +2504,17 @@ void memory_region_set_size(MemoryRegion *mr, uint64_t size)
     memory_region_transaction_commit();
 }
 
+void memory_region_set_priority(MemoryRegion *mr, int priority)
+{
+    if (priority == mr->priority) {
+        return;
+    }
+    memory_region_transaction_begin();
+    mr->priority = priority;
+    memory_region_update_pending = true;
+    memory_region_transaction_commit();
+}
+
 static void memory_region_readd_subregion(MemoryRegion *mr)
 {
     MemoryRegion *container = mr->container;
-- 
2.26.2


