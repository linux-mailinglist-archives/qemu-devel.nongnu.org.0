Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6233B1A92
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:57:48 +0200 (CEST)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw2Rv-0005rw-V3
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw2Pt-0003Cj-Cb
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:55:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw2Pr-0007uL-Lx
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:55:41 -0400
Received: by mail-wm1-x335.google.com with SMTP id j10so1586095wms.1
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CvdjyDMJHDnFeKuGpO+kkPD/B1XOymOp3bRHedslHcM=;
 b=aNpVeYEdfUOlLb1bjb1rzTIo/gXaOqguLpScPoz/W9/jBP5h87Ym63DK2bhrgaFJzs
 sGm6tyWmmEx53XFGPJK9ryT0jxO2wis2jBmQHimhy5oXZtllfoH91p0BLIy5yUTTlbET
 vrKP/+yexvO3z9ujmNkPk5eV+vuYOH0jP+sGnQhuQi67g0W6VDLKQHfOxPA5jAO7oy/d
 sLjQq54poi3MM5VBzPDHG94ecnvT5WBNxrh8lNmQVUghdlyEcVNzXIIVzOlcTzCyxQXp
 2ryrBJCGU4U+ao76SkCIduIHJB7f4dL7t+R3qoM1Y+zUkzGD8OgXD7dYyaaVbD04ZEAa
 43Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CvdjyDMJHDnFeKuGpO+kkPD/B1XOymOp3bRHedslHcM=;
 b=T4jQMMrZpDyw40KYZVfZ5IRDHl5mRrc5AaUnnoJRbrHoQTY9BVQ9gH44Ak19DsDk+H
 7k4RrnlL52rgTAuz+t5TRUKg/vhay3QV3hvgT6DyQp5IB8hlPBHw8BLtOIhOQz4Js9gv
 jVQ9cvBp8uaTknZTItJNrtL2knJZNXYsYSXmTc6N4mPTmcHAYjCWOOBrZ7Ms30sczsRz
 jMmysfPpsm/gIxOg/OSDCsl/zzpZcD0i9jTAu4cuZ9FuFmpDrbGHfjOCY1/H9/6830e4
 86uL5Czsn6Z2/2nSfkcTPdWvkjhDr23rDP5q2QCnZxoL7tZAWMbaRBBy8ymsP0olcbcV
 LVsA==
X-Gm-Message-State: AOAM531DNQZaM2xZwZg7WyQulj1jMlgqq++Kr6CT67QUtqYKTlkN5dGN
 IrgqAnHAbIgx6M8ZS7vKKDANv/TNks4HVw==
X-Google-Smtp-Source: ABdhPJzJ9jEwzMDlJitzRJS3obOoI1llwKdXShJloeLPqQ+s519MamcXMRHESZJ6StjT7JUi4H4XAw==
X-Received: by 2002:a05:600c:2313:: with SMTP id
 19mr10472932wmo.108.1624452938269; 
 Wed, 23 Jun 2021 05:55:38 -0700 (PDT)
Received: from localhost.localdomain ([102.41.161.240])
 by smtp.gmail.com with ESMTPSA id c12sm3108461wrr.90.2021.06.23.05.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:55:37 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] docs/devel: Added cache plugin to the plugins docs
Date: Wed, 23 Jun 2021 14:54:56 +0200
Message-Id: <20210623125458.450462-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623125458.450462-1-ma.mandourr@gmail.com>
References: <20210623125458.450462-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/devel/tcg-plugins.rst | 60 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 18c6581d85..9d90110cbf 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -319,3 +319,63 @@ the user to see what hardware is accessed how often. It has a number of options:
       off:0000001c, 1, 2
       off:00000020, 1, 2
       ...
+
+- contrib/plugins/cache
+
+Cache modelling plugin that measures the performance of a given cache
+configuration when a given working set is run::
+
+    ./qemu-x86_64 -plugin ./libcache.so -d plugin -D cache.log \
+    ./build/tests/tcg/x86_64-linux-user/float_convs
+
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
2.25.1


