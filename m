Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDA13DBA09
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:06:48 +0200 (CEST)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T9z-0001Sd-4A
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2e-0004dM-Uh
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2d-0006eu-AD
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:12 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso2843672wms.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XqcqpJ3EX39A/hojXpAe5Ae+aFtZNNkN4lpjG68BV+g=;
 b=nw2yrIA8tOH++53awL2lniQZ2ZCfyjFSN6WRcmKHmmzbGLeAFgL0rQI3yl0hUuAo+E
 H+QQfsqgvHD9IGKbuILjftPqjYZoqDRrMgKiD/Wg4okYvsfcMzr5TE0BFph51jo4VEvw
 bLGDommnfh8QwzKB6F/wK6TR0wlE0cdgZr96LA+dLWhab5Wi0rzH9KEsSIH54cHgoP/G
 YTniBVnClGLJu305lYelIOEcq4/i+EIgojgkerfcHssEkEyq7gBMtH0hErW3CJ2cqZXh
 fWI5kHdGJ5cMKmer2rx5SkWNRLdQwfpB/Dq/u/E0rIJjFhpGiofb9/3+jxku3mQ0JoQY
 La3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XqcqpJ3EX39A/hojXpAe5Ae+aFtZNNkN4lpjG68BV+g=;
 b=MTBmqUY0ivdKQVc59Zfh9/intnVsV9D+YWv0qUxwg2F1ZK9vKaWoeGCVrBj+l5sYND
 m+C7jkcMt76Jjk/yqo8MPdotfT27p/ESmVolaJO8hkYyODT4vNmvA6TV4oSngHZwikaH
 Au3duTX9VH3I6IUULGLjyqg22U4fFw/iqPSm8mDSDLrl/o4c86S0Hl/RG+Qbl3ngdFhq
 itvyuSax5kR8guSgTSv+LetPOyXxkaNrJuvuqocJxrRz3cqA1+aBPpv/1OH3bH/UWTv5
 CEwumJxfNo8+4ZfMjGQ7eYIgCWgVNiewn8SIRvn50CHEnnZpKVji/5XLSfEmX6sR4Ka3
 6Rww==
X-Gm-Message-State: AOAM531lYX+9NxEy15u/gRbC9H2JAFcNNKgvnC5wsZhPUIRJHDgHTbN5
 MLBD/pchWyqxo+hIMUsc+4C92yZsTsg=
X-Google-Smtp-Source: ABdhPJyJy1/tYEH7kMRL5igeouQb7S8GnOCm7hqLzSJFCImqxeUHDZkDrFy+PWsxDsoCo1cetO2Lmg==
X-Received: by 2002:a7b:c92f:: with SMTP id h15mr1763738wml.20.1627653549724; 
 Fri, 30 Jul 2021 06:59:09 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:09 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/13] docs/tcg-plugins: new passing parameters scheme for
 cache docs
Date: Fri, 30 Jul 2021 15:58:12 +0200
Message-Id: <20210730135817.17816-9-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32e.google.com
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
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 9377bc51d8..7b1a3921b6 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -364,34 +364,34 @@ will report the following::
 
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


