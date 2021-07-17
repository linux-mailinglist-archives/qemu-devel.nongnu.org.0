Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB853CC273
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:17:10 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hNd-0004mv-GD
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH6-0007rO-PS
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH1-0007X2-RJ
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso7332028wmj.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMLAuiSXBB39vnc7yIBeUjpUzjmirkB4ItWpH9noXsY=;
 b=HEfutHOLgmWI7Hb2tCg3vMQ0OnRDZ/JDGtm5UXbfbu+1E/qP2QCLeV+ZdZlVaufy8A
 m3Ern9Grz+WE33ODCx2qPVZ2m2dTtd6uMqm0rzNqm36F1SsBElx+7+PTSI1GtUoikq1D
 CoCYzLFzKplSeppdr+UuSR8SyiHBmrR/tCIXgX9vPs3UdlgDibZhGjqSddW3l2OYtP03
 eiGu/uFWl+Q7LTcreg7qt1eOkUNBKZFVVbt6+YpyMclVgoOxDZYPo9GCDg0NG1Wlqd7W
 E9SFf228kfnP9fJ1fdEDrl9KVlXzTmBSUEOGfdCcSLw+U+SBZzqIAGCJJ4bpO1YhiqJ3
 2QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMLAuiSXBB39vnc7yIBeUjpUzjmirkB4ItWpH9noXsY=;
 b=JizILjEthvqbnKQYyiB1ZEtVP8LA6IP9NChTFzXPR90KIPEJbe2SaCdovkQ6Bt8E7H
 u3J0Mm+75R+Oq9rCezxTAN9bCrdgI+UWifDQWGejth1Wm3ftG5/amIq2FaPLXJUBV/X6
 WVvpSOhx3FHKoQFCQfcgOR2vjDAMRpvsBCGVP9rc6vaN64Z81gOLM2zZZVxY50fOjVOq
 yGnsn9pD4MXTJLTAlmz6In7Cm0qzckkDEpceJ7br8LBc8z0am1GsmbtSGv0c/OhXGAu/
 K4NovznZZMShfCWqidbg20fLzq3KDjr0vKdg17uOvSkd0aJu8rC3sX3y5zcypNDoKtJ1
 JpkQ==
X-Gm-Message-State: AOAM532bW0SQxCAi3VsBh/aai/s89tJXis/Y1s7j7Ep7VZ1nhJkaJyhs
 UO+hh8DqV6CzXf03fDs472KSfaAYGEw=
X-Google-Smtp-Source: ABdhPJzT95V/z2VT9hlUYpWBqblIrtNTiZq1WSWJFFsHC1H5IJfMd2GsTiCSPcGOxuyNfiwizwu26g==
X-Received: by 2002:a05:600c:4f54:: with SMTP id
 m20mr21271646wmq.52.1626516618363; 
 Sat, 17 Jul 2021 03:10:18 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:18 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/13] docs/tcg-plugins: new passing parameters scheme for
 cache docs
Date: Sat, 17 Jul 2021 12:09:15 +0200
Message-Id: <20210717100920.240793-9-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32d.google.com
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


