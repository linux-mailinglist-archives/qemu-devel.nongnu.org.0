Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C1C3C2650
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:52:57 +0200 (CEST)
Received: from localhost ([::1]:46784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rs8-0006xH-E9
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rmr-000367-A3
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rmp-0004KY-7H
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id p8so12531795wrr.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cMVwh6QFPhcW20oytqkL/ZaRLLYb/mCB+qE4FLLNhgM=;
 b=WJdJdva1k8xIVAsHNsiF0PvTqdnZsywc+w9uU5EGuW+IncnaXv8GK80iaaGKLfWbrp
 3IvqBHkANnnYykf7kl51dahRth5VuzBhhtnRxjOQORh3gIHAYW7bsp5paVwsSHYNNnDe
 vtSkkfw0oWh633d82tH005dPPRbrQzjokWSkiasMQcf4mmuslos05xYdk0WqRgCnoNns
 Ua7ZBSAE+IOSbO3i38ExAaVunnCE/Dg9wk74xdUiQCmalNQVHDU5YiAg/x0rjK+udqrd
 zHpsAXm8iAhdYIa6fH37M8vc3ydlnnryWTseGTi0nuRUf159cnsqHrcBPr6xmHE2E7xv
 6uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cMVwh6QFPhcW20oytqkL/ZaRLLYb/mCB+qE4FLLNhgM=;
 b=r+rvlEznf/N0HsTBn9WpwcEinr2a9hwWGhg3cREIEe7mOJIpJK8UJ4jMFsq4XikYpl
 ii6HWRRak6ZAWiyuDcO+dZlX2CwwGh5FanfvhISj07JlQLpklrGVNyiBOixYmsTmxWdm
 wO/ueQX8vuBFEGYrQ1v5u+xUWlFBTQusrY1DWkao7sGbNRHD9OEPmQFBCoq4ETuQfX8n
 b4mMJgYmPmNd2Ef1JIyJVuxUKe4ruhEyIvjPaV2Us32c5fucj3iW2pp/bjy+autfJ4YJ
 6pBZqT8WHrGuhT3OvE4oCtHpxpFF8u01rGzGnQb4V+IX/VpFKAmL2yXNwUFMKFdMH59A
 uc2A==
X-Gm-Message-State: AOAM532nMilAW0FPrubeXlc1Dq2g6fK62ABbCvEeyEHQvj7sCSdNhEOJ
 fgQ4inTH00bHuIdzpPqa9DNROA==
X-Google-Smtp-Source: ABdhPJyV8/7oHt+7qBUOU1YOR4iERFHtyt9mDKgkHK6RzsRW9H6BC2iKi9JwMgG+qr11U75tK/7aDA==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr11072077wro.232.1625842045617; 
 Fri, 09 Jul 2021 07:47:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b20sm5232560wmj.7.2021.07.09.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:47:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B30891FFC0;
 Fri,  9 Jul 2021 15:30:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 39/40] docs/devel: Added cache plugin to the plugins docs
Date: Fri,  9 Jul 2021 15:30:04 +0100
Message-Id: <20210709143005.1554-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210628053808.17422-1-ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 179867e9c1..7e54f12837 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -344,3 +344,62 @@ which will output an execution trace following this structure::
   0, 0xd32, 0xf9893014, "adds r0, #0x14"
   0, 0xd34, 0xf9c8f000, "bl #0x10c8"
   0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
+
+- contrib/plugins/cache
+
+Cache modelling plugin that measures the performance of a given cache
+configuration when a given working set is run::
+
+    qemu-x86_64 -plugin ./contrib/plugins/libcache.so \
+      -d plugin -D cache.log ./tests/tcg/x86_64-linux-user/float_convs
+
+will report the following::
+
+    Data accesses: 996479, Misses: 507
+    Miss rate: 0.050879%
+
+    Instruction accesses: 2641737, Misses: 18617
+    Miss rate: 0.704726%
+
+    address, data misses, instruction
+    0x424f1e (_int_malloc), 109, movq %rax, 8(%rcx)
+    0x41f395 (_IO_default_xsputn), 49, movb %dl, (%rdi, %rax)
+    0x42584d (ptmalloc_init.part.0), 33, movaps %xmm0, (%rax)
+    0x454d48 (__tunables_init), 20, cmpb $0, (%r8)
+    ...
+
+    address, fetch misses, instruction
+    0x4160a0 (__vfprintf_internal), 744, movl $1, %ebx
+    0x41f0a0 (_IO_setb), 744, endbr64
+    0x415882 (__vfprintf_internal), 744, movq %r12, %rdi
+    0x4268a0 (__malloc), 696, andq $0xfffffffffffffff0, %rax
+    ...
+
+The plugin has a number of arguments, all of them are optional:
+
+  * arg="limit=N"
+
+  Print top N icache and dcache thrashing instructions along with their
+  address, number of misses, and its disassembly. (default: 32)
+
+  * arg="icachesize=N"
+  * arg="iblksize=B"
+  * arg="iassoc=A"
+
+  Instruction cache configuration arguments. They specify the cache size, block
+  size, and associativity of the instruction cache, respectively.
+  (default: N = 16384, B = 64, A = 8)
+
+  * arg="dcachesize=N"
+  * arg="dblksize=B"
+  * arg="dassoc=A"
+
+  Data cache configuration arguments. They specify the cache size, block size,
+  and associativity of the data cache, respectively.
+  (default: N = 16384, B = 64, A = 8)
+
+  * arg="evict=POLICY"
+
+  Sets the eviction policy to POLICY. Available policies are: :code:`lru`,
+  :code:`fifo`, and :code:`rand`. The plugin will use the specified policy for
+  both instruction and data caches. (default: POLICY = :code:`lru`)
-- 
2.20.1


