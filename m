Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313610474C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 01:11:51 +0100 (CET)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXa4b-0001vU-Re
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 19:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iXa2G-0008Kq-D3
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:09:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iXa2E-0005iV-DO
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:09:24 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42285)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iXa2C-0005hn-FX
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 19:09:22 -0500
Received: by mail-oi1-x244.google.com with SMTP id o12so1517373oic.9
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 16:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzXz801WN8Wx2siaVGOD6DywcY9lAErvVsKc+KJI/kM=;
 b=vnfxoDELTvt6Rj+4jtN22TJcn899OQga2bZHWcpp8GwkPO0dWivtlxz2UIogyVyEhW
 6J33yNUhPj2foQbzst0gAmfepIObCDuTHtC6pM7xkOgSscB//EohEuPJgGKaL3BjuKLp
 C35g8Cx8QIOg90YO4gzskSGGprNRDJEuH2X8vpKKehWvRxYX84Xu7uMUmthcXvV2Qtmv
 60FgnvkJC7OInqDzlRqefSRMUIhKLjMlegGqGaLV/aXrfuMXXJiLRYY+bp2STDA/Pd8p
 ANtCmFJ0bFnA54sdA6cyVTP8mVVbTvpnGFZ//7IXKOIErwkoSZHgeqKQV7nJiBcbpd7Z
 A3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RzXz801WN8Wx2siaVGOD6DywcY9lAErvVsKc+KJI/kM=;
 b=rJTKid1ELLyPrJVxSwBMAke0mEKbjYpXqWYE0PuQtQwhY2TsJ33LicH+yv/ezCFcyq
 k2qk4iL9FByHONUpQbhvdO/JcTNvtsX1QmDVhF6VkGGuCe7pgmlmIZ0E/Kbbpb1B6R49
 YaXYv0AdopBPooe7etuvsbI5wIKYi4ulNsFqq8Y4oNAZ66HBu1vaqdgYzJUzeMiCR6VT
 dmANRmfxnDR8EIFpxbZaWNYowuJ0hN6ct6h3yCzKa27mLyXSHB4tJ74oIvRDVIRlZz5R
 r1idBbohaiM3MsZ6DF1Rh6oJI78LQ4m11lIcrNtlGAI6WQORlnUibP8qPcLA5NZNbIYV
 31cw==
X-Gm-Message-State: APjAAAUIKvwYYEtD8DWO50r5xfPkMFSoPLGVHpGXfmFRFNPohIsg7mq8
 8nisY8jyA+gGfZFgivH+AGxISNngNQk+LQ==
X-Google-Smtp-Source: APXvYqxxgq/skakxNDYVibmtjreM/9kF6IQUV7YmidOKqK2cN/CTVo39otn6Fbj9BkFpWEMCW9rw0w==
X-Received: by 2002:aca:4fce:: with SMTP id d197mr5319084oib.142.1574294958980; 
 Wed, 20 Nov 2019 16:09:18 -0800 (PST)
Received: from moi-limbo-9350.arm.com
 (host86-181-127-240.range86-181.btcentralplus.com. [86.181.127.240])
 by smtp.gmail.com with ESMTPSA id z17sm351439otk.40.2019.11.20.16.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 16:09:18 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] tcg: cputlb: Add probe_read
Date: Thu, 21 Nov 2019 00:08:40 +0000
Message-Id: <20191121000843.24844-2-beata.michalska@linaro.org>
In-Reply-To: <20191121000843.24844-1-beata.michalska@linaro.org>
References: <20191121000843.24844-1-beata.michalska@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, richard.henderson@linaro.org,
 dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add probe_read alongside the write probing equivalent.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d85e610..350c4b4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -339,6 +339,12 @@ static inline void *probe_write(CPUArchState *env, target_ulong addr, int size,
     return probe_access(env, addr, size, MMU_DATA_STORE, mmu_idx, retaddr);
 }
 
+static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
+                               int mmu_idx, uintptr_t retaddr)
+{
+    return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
+}
+
 #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
 
 /* Estimated block size for TB allocation.  */
-- 
2.7.4


