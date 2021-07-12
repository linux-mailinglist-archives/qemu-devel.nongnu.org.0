Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14FB3C5CF3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:08:05 +0200 (CEST)
Received: from localhost ([::1]:57454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vfI-0004ea-VN
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7W-00056h-R2
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7V-0002Nn-71
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id i94so25362315wri.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9S6TE13pwXS1W3k92CYjpEyHJNMbR3VdpMZy32eUSA=;
 b=UnL9Zb9DvJIxWWdgYGf1XuSawL6V1P1fd6VILrBYxHLzDjwhhiQ0zUCiga6eHR93r+
 RJl4o3sopk84qTJN5wIv6UqzRKhqqHkwV3oiVzjW2XRseU7ewcCCEXEnmUzh4DXn/4QP
 ht9vPUm+Y0Dp6Zkbvsl4uc0W/Q9lBmAPG/FAgSJypn0BiMSh3j5EOlokMAAZQ1nD/ILW
 d2q0S8cdHcA7CZbV5eQH9MspNJWNyJbaY9dJ3dNIAXqIIEluGJCj/ZzZil3KUuht6HT5
 p920U8FqsRMyl28YTYWst9ELgxNofKrH6yGSJj2knDQhNTNV1O6qE8JPnH/bvc3iVz8I
 5L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A9S6TE13pwXS1W3k92CYjpEyHJNMbR3VdpMZy32eUSA=;
 b=rdPXJntqOoI0PgiQ7tqSDswIEHr5jep4VUiu2wPg4cd76WUWGGF4O//AQb+eZxTazA
 phS5LYVk/E8q8UAD7lYNWhT+pkuxoO2JZg9bx0+it0VcelnMK8OViMCvb2FIsyzwnNNX
 dutaG+wOEhTc7BUr9zCV9pSA1enn2QE7o8c+a7zeBJ3FOnddInH1T+fgFqKoDfU9uAZ/
 v3NBFhUMQC2kypZATsdLPqBTvGLxV1KAk1kNt18XyoB3LkVL51c4+3yrmhw7F3Gwni2d
 UM8Ju7a1vsm9g9R6/E/15PO5yY0Y1XLewhx0O7bZ2tLE8aHY9UhV2Uva0C5T++Ai3sf5
 eB5g==
X-Gm-Message-State: AOAM531KGzARkhYQ4+ZB1Oxd0yWBnjkLSSYuQrxdtvwHaUNb5tDDxK3u
 b/ryw2ZJl56Ck6Q2EITkuAMxCQ==
X-Google-Smtp-Source: ABdhPJyLCkWEFnn1u2LroUWUcFkrvII6S0aPisn3rQqQB0Tj2UQfpTyFEGI3J5aPBHSHjabssCoMLQ==
X-Received: by 2002:a05:6000:1375:: with SMTP id
 q21mr26491382wrz.147.1626093187903; 
 Mon, 12 Jul 2021 05:33:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h15sm14132998wrq.88.2021.07.12.05.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:33:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E26A71FFC1;
 Mon, 12 Jul 2021 13:26:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 39/40] docs/devel: Added cache plugin to the plugins docs
Date: Mon, 12 Jul 2021 13:26:52 +0100
Message-Id: <20210712122653.11354-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210628053808.17422-1-ma.mandourr@gmail.com>
Message-Id: <20210709143005.1554-40-alex.bennee@linaro.org>

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


