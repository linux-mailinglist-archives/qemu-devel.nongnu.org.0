Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02EA3C873F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:20:49 +0200 (CEST)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ggq-0007rL-Tn
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUq-0006VM-Ia
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUm-0003wh-J4
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i94so3651557wri.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9S6TE13pwXS1W3k92CYjpEyHJNMbR3VdpMZy32eUSA=;
 b=c37CSM9ZcJMIqBi0ATVcUWw8/zT+i21AIFwc5/nVzozHdVhsaLdQrb7A8HVwjq/E7N
 hBL5wtPo0VCae58XuRu8AUmhuMGoxucvIZm0zIcWzK3zIbYKLjhAG1zuPkUWjf3A0BL3
 ft4FIr73jUhpMYog7JeHwn9MNmB5bWP0xaKrRiPlRCCGnSrmEKW1gJNV/hkCWCABaoFT
 hFfvs5AtNBXZfmPjMnVK95KjLdkwVcRlAn7spkaxgkkaoF520L+ZREik1zAXlkb+wDSe
 zTsVpj4POsuNE05LhWK3gpKvaQMLlIL59+ytA8TtkVKCiZk935M86tckgX7qRcG3Jrps
 ePzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A9S6TE13pwXS1W3k92CYjpEyHJNMbR3VdpMZy32eUSA=;
 b=SKYTTSYLRIHTAtpOnWDlidme512VxFS7YTWG8TUKIxEkg9jb+R1VCd8HLGyAAb/ANS
 oIh35kgbwietPruMVjW79Zu43uNccw7ZUiaC5OTmDIYPzz4fz8qLgDBWyFX5HqqcwWlI
 oKd6BioNT4mLGovN9sIoXpBI6MJ8pBbinAaXPbpriFG98QFW0AvrvBcdgsA2z4fAWgoa
 RToDFZn8SGaoj0cbJ3rkJqUM4zBhZ+M+1QnC8lGCz6xeVVgbAuW3BEEdbcdJk2UNxKZq
 vB4c6TdIcikIezZy/pDTvh9vB8/fwl9S3z8OZ0INcOYHurn9YKPLclfV9CMlkzT3iqNA
 OimA==
X-Gm-Message-State: AOAM5315MrEzJ+/4Ec3zxk8nMUQ80O8OebEj9Ym50zoDtiQhu3MwVnSE
 nfHXuVbAjUjrg9IFO0kA1BIIug==
X-Google-Smtp-Source: ABdhPJyHopYzuYxRIoJ/SAO6zuf+aFiIu9IasyI9KeM1kCR5e5AQ2SCdQ2qhRvDZOuzRzuBUQFIffw==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr13671706wrc.264.1626275299246; 
 Wed, 14 Jul 2021 08:08:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l24sm5546702wmi.30.2021.07.14.08.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 448951FFC4;
 Wed, 14 Jul 2021 16:00:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 43/44] docs/devel: Added cache plugin to the plugins docs
Date: Wed, 14 Jul 2021 16:00:35 +0100
Message-Id: <20210714150036.21060-44-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


