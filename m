Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672C3CB3CD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:09:51 +0200 (CEST)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Ius-0000we-J6
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpX-0007XW-8O
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpV-0005OR-MF
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id g16so11034010wrw.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMLAuiSXBB39vnc7yIBeUjpUzjmirkB4ItWpH9noXsY=;
 b=cCOY0mC9ra/7SsDfebj/D08+Dy+nRckKIgX15ZlUSbpFiKB/d1Z6yWsMoCIIzuqlyZ
 k8pXv+voPpi1DKUhyKq9tCDg6t0miyGvLd6TVLhNkpmWOqF9Y3ikDogbr5C8mi/PliVF
 BiAttu61Mm0NHISJG+WjEjGnmaa7GKw9IGEkma946YwgdIDmWzbHR1FN1kXOQfPLxezp
 yHzdzvYe8/yOHLi/URx29MCRNkiRupR40/xATOns4KJAc8ei5J/FlAwqMAByGEOcISTJ
 Kp+kI+jdShwPzVvFkXxLjr0U+4rk/PvaND8UZm/fVOZQYrIiJX1deQNuYePc6fBwgwoQ
 ChEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMLAuiSXBB39vnc7yIBeUjpUzjmirkB4ItWpH9noXsY=;
 b=ecZzm4YUzfJpliEGj8uOs3FnYh0YCLR7eNl1NjbvJkadJfaKviv8ReBBRYW7hImVPk
 4nC4/vsLIvT4bGq2WR6y+XQyI33hD1Li7O+F2omPd2ASyYWAB4PZ8dOxDWfZW3mivRvm
 Tf28w5GCTQLkLOUORq333yo/+448UBe3nUcDNb0Bk/3RjPvYxIyHojEevwZGSvg8suV5
 QDbMDKiqVG4DxZ5SgqDywkJERwxiFp78faOX9QEYyNu7gCy8aaX6uCfYefrZDZ5krYZy
 OeKFouX3plrg+c5PRx2QM85B4YuUojZjYQqef9wBdBxMsLeDy7ZeQu0w2nWDiut1F9dJ
 3j8Q==
X-Gm-Message-State: AOAM533m0URwSyZeF0TkWBqlptVRBn5oAnz22+qdzRNiNUM/0rgjh6A5
 zJngT/c8KvUYPpjvZhBXeN5WOdMDxS2g6A==
X-Google-Smtp-Source: ABdhPJwxDcg8RW/1y8vMiobR8g1IMK2baLwzBxludvNyY48aR1tEE3ISYpTi7DJ0H4gqknastCGUTw==
X-Received: by 2002:adf:ee0a:: with SMTP id y10mr10716594wrn.209.1626422656059; 
 Fri, 16 Jul 2021 01:04:16 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:15 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] docs/tcg-plugins: new passing parameters scheme for cache
 docs
Date: Fri, 16 Jul 2021 10:03:44 +0200
Message-Id: <20210716080345.136784-9-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/devel/tcg-plugins.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 4ab9dc4bb1..be1256d50c 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -349,34 +349,34 @@ will report the following::
 
 The plugin has a number of arguments, all of them are optional:
 
-  * arg="limit=N"
+  * limit=N
 
   Print top N icache and dcache thrashing instructions along with their
   address, number of misses, and its disassembly. (default: 32)
 
-  * arg="icachesize=N"
-  * arg="iblksize=B"
-  * arg="iassoc=A"
+  * icachesize=N
+  * iblksize=B
+  * iassoc=A
 
   Instruction cache configuration arguments. They specify the cache size, block
   size, and associativity of the instruction cache, respectively.
   (default: N = 16384, B = 64, A = 8)
 
-  * arg="dcachesize=N"
-  * arg="dblksize=B"
-  * arg="dassoc=A"
+  * dcachesize=N
+  * dblksize=B
+  * dassoc=A
 
   Data cache configuration arguments. They specify the cache size, block size,
   and associativity of the data cache, respectively.
   (default: N = 16384, B = 64, A = 8)
 
-  * arg="evict=POLICY"
+  * evict=POLICY
 
   Sets the eviction policy to POLICY. Available policies are: :code:`lru`,
   :code:`fifo`, and :code:`rand`. The plugin will use the specified policy for
   both instruction and data caches. (default: POLICY = :code:`lru`)
 
-  * arg="cores=N"
+  * cores=N
 
   Sets the number of cores for which we maintain separate icache and dcache.
   (default: for linux-user, N = 1, for full system emulation: N = cores
-- 
2.25.1


