Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FFB3B58A5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 07:40:19 +0200 (CEST)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxk0I-00017O-BP
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 01:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lxjyQ-0000RH-3w
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:38:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lxjyN-0006sW-Cg
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:38:20 -0400
Received: by mail-wm1-x330.google.com with SMTP id r3so5963215wmq.1
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 22:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxZIdLS55HsejJxbFM1hVlrSvIZofZOHWZM/v5dkC+Q=;
 b=Fz/U94zc6jeJjhMSs8sZ6xK2u83DdJNFj7qlCjvk60D7X7mSm1NLD1hlexWsRM11gI
 ZO4zhOV78E0GTFohjlAptB8Ecd2UspVee3R87RqM1ByJKIzEZOecZzRJ3c+6G7/OfLnH
 y0gQj4UWsqtWSxf2Zl0IJLbK88dgjZuisjrIOAS121Umkf1GPDkc9BanueJ6uBotFrNk
 cv0c7ZXfwC3k1KKKMR0FFosffIASWI9IoyWg7e/Mu/4tmzcermziDy4iBYZ5DowA+sJx
 sLbAZUcFQRHFg5c6h9BRGo0zsPEKTQm+fIha+i+fuWLw4COu5V5zlYbQaqAnasSPKA+c
 p2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxZIdLS55HsejJxbFM1hVlrSvIZofZOHWZM/v5dkC+Q=;
 b=LBg5qhU96GDAIQgMSUmjo6US5UEtjvwCL3xAK+yrCzNSd7n112nYXRpqSv0KstnQoE
 yOaPo4nj2SIOUjLrddpyJKwWE9p3OwoGVzb446W7qmzTAqkWuSxxDO7Ax8OGPPA1ys8M
 GnxmKAN79uSMPnQeTIevLK9Cc2yZjGnDh8hNIgb5uZa6m4y6/yktyZI3ksStS+b5dgd5
 PM7WWy6YmUrFDjmNcppBa9srUJH2nhkCDrAKVkA5mJM+OJkr02G/5SkCABbgP7NO3IKf
 Hivx6PA4nPw4AvANX0u+RUzieeBA1RP2babxN5vqJIf9L5+zv57MYFopimKabVa1JxFY
 P5vQ==
X-Gm-Message-State: AOAM5335Jb+3WHCexxkbpve/c0GCn6fESWzXl+PIZ0B0buLZNEjrcypq
 sdPj4nLnEN6gP91w7qN+3ugXODPvTdoPsQ==
X-Google-Smtp-Source: ABdhPJzLy6+u3VGoDveG8+q8vRhJcZGCs3hbKYSSpeMBKXikCfiKWXzuupvnlQO2srSkLagDVJ2MJg==
X-Received: by 2002:a1c:dd07:: with SMTP id u7mr3382186wmg.47.1624858696979;
 Sun, 27 Jun 2021 22:38:16 -0700 (PDT)
Received: from localhost.localdomain ([197.61.111.52])
 by smtp.gmail.com with ESMTPSA id 22sm12127084wmi.4.2021.06.27.22.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 22:38:16 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] docs/devel: Added cache plugin to the plugins docs
Date: Mon, 28 Jun 2021 07:38:08 +0200
Message-Id: <20210628053808.17422-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623125458.450462-5-ma.mandourr@gmail.com>
References: <20210623125458.450462-5-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x330.google.com
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
v4 -> v5:
    Fixed the illustrated command since it has path problems...

 docs/devel/tcg-plugins.rst | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 18c6581d85..595b8e0ea4 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -319,3 +319,62 @@ the user to see what hardware is accessed how often. It has a number of options:
       off:0000001c, 1, 2
       off:00000020, 1, 2
       ...
+
+- contrib/plugins/cache
+
+Cache modelling plugin that measures the performance of a given cache
+configuration when a given working set is run::
+
+    ./x86_64-linux-user/qemu-x86_64 -plugin ./contrib/plugins/libcache.so \
+    -d plugin -D cache.log ./tests/tcg/x86_64-linux-user/float_convs
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


