Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1886B3BDA33
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:29:28 +0200 (CEST)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n0p-0003GT-1u
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfU-0005kJ-Kg
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfO-0007GU-HS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id w13so13807617wmc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2VymeSF+HdKxVWyy9+ZA+5+qTRIVWKC1/sXMZ3ShAgc=;
 b=inVrLCvZ3um+Z2JhemhX7Y8shk+Q07CoD/IXnPguGjLTHHS1+UktHhmrfEZv0Ai1f/
 6twbYCFI3tes/EdKfUTfl1TKHfv+8i51tcZA/eUh7NG0jrg6EC5dpGILTdpNtapG2nRV
 p5/lvk8FghHdeP2HSAQ7EI9WhHAqsbkhqO5ItQp9dv4rSYtalxA+nB9SA18UzWQJHSKu
 PDizFgag5szAbPrdpooEpY9FfE5Hj1XSxVYn7gvZ8WN+coVdsWgPd+Qxj5vJzJb1hEVP
 RM+bJrcFkkpdIcmWE2SO/j87ZxenEyURwVCp/EblbtWA2koDJSoCPKltoZiG2qE5hmQ8
 czyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2VymeSF+HdKxVWyy9+ZA+5+qTRIVWKC1/sXMZ3ShAgc=;
 b=gO9ltncqLK6+nWueUDpuq9W9nGrxRiEjI5Kd1GCKaDCzuFowqLdY14Pp4e6UdP7U8U
 5EVFZG3f3qG9kZumYUuALRTSGgKo1Ei/CzL/EUjY3SSY3cb2wT9EIIZ+GqHOAD0mWV8o
 aD2qaQS+Zis1u6BwWWOb7OUzjdZtCVD54n5GWGw9alODoR0ISgWJ9CGPg66aBJ8O37Bj
 6eVTJr85kNGBwGm/+HqI5nHQXVG320il60bYUcie3uvaWjCU8FSPQy51i76S5kQOZLef
 nYsTLkhGaolPmFn73/fkWqXI3hFZE1h36UZQRj8RIULk7I+juxuNIQW7oAl1kCGsm3DK
 Kc6Q==
X-Gm-Message-State: AOAM532HHzp3oRR+fgHlLzmV2qHPC/tCwa6AGroJNiKWmK2+V+57X5Ug
 g4yeD0aj4ysiCwiDGgwGXMLDFQ==
X-Google-Smtp-Source: ABdhPJySLtRg7qlQbYIk2Wpq9BQ0b8QDS+KSKXS9nsvyUVx/Hjzn2PxA5b+ZoPE7zdP0YYy1BWEvEg==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr1276378wmq.181.1625584036751; 
 Tue, 06 Jul 2021 08:07:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l20sm16160991wmq.3.2021.07.06.08.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD5A01FFB1;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 27/39] plugins: fix-up handling of internal hostaddr for 32
 bit
Date: Tue,  6 Jul 2021 15:58:05 +0100
Message-Id: <20210706145817.24109-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler rightly complains when we build on 32 bit that casting
uint64_t into a void is a bad idea. We are really dealing with a host
pointer at this point so treat it as such. This does involve
a uintptr_t cast of the result of the TLB addend as we know that has
to point to the host memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin-memory.h | 2 +-
 accel/tcg/cputlb.c           | 2 +-
 plugins/api.c                | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/qemu/plugin-memory.h b/include/qemu/plugin-memory.h
index b36def27d7..0f59226727 100644
--- a/include/qemu/plugin-memory.h
+++ b/include/qemu/plugin-memory.h
@@ -18,7 +18,7 @@ struct qemu_plugin_hwaddr {
             hwaddr    offset;
         } io;
         struct {
-            uint64_t hostaddr;
+            void *hostaddr;
         } ram;
     } v;
 };
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b6d5fc6326..b4e15b6aad 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1728,7 +1728,7 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
             data->v.io.offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
         } else {
             data->is_io = false;
-            data->v.ram.hostaddr = addr + tlbe->addend;
+            data->v.ram.hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
         }
         return true;
     } else {
diff --git a/plugins/api.c b/plugins/api.c
index 332e2c60e2..78b563c5c5 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -308,11 +308,11 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
         if (!haddr->is_io) {
             RAMBlock *block;
             ram_addr_t offset;
-            void *hostaddr = (void *) haddr->v.ram.hostaddr;
+            void *hostaddr = haddr->v.ram.hostaddr;
 
             block = qemu_ram_block_from_host(hostaddr, false, &offset);
             if (!block) {
-                error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
+                error_report("Bad host ram pointer %p", haddr->v.ram.hostaddr);
                 abort();
             }
 
-- 
2.20.1


