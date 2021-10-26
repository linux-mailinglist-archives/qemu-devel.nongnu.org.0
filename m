Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A940A43B076
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:47:09 +0200 (CEST)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJz2-0008O9-Nf
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhs-0001bH-HM
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:24 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhq-0004ed-HX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso841650wmc.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZF9xj7LRpua4qvObxupnGeTarhtcAbiVRP+gp+HlrD4=;
 b=eydXQZrz4h0OloANw1N5zRAeJrW2xpS/n0ZKQJxy5KiKQQrJON+QkTZx6oGMHzxvHM
 ctXHDmzwdb8AgplQAbN4qu4vrvUm0GBmHdTWe6DOyyhtjO2nYCAk5DT1LFykpD4OCOpL
 WozTDKhR/rpsn8kxQMAxiF9vS61UGDqQUSXva39iMFbTXMSB5PanGpMVanEU7+WZ8Bbv
 Gpqr70hy5Z2+BDeDsm8YRP6/xr6ZF3GydfxOBLRYu2+pF/fX+x/lQYmL9Ul7cRMon6Lc
 lWO67VQes74bO13bB649GomV7fAg6KCYZkeB537Dd+8AoZz1we2lWLpiahDoQABlnmS9
 nKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZF9xj7LRpua4qvObxupnGeTarhtcAbiVRP+gp+HlrD4=;
 b=QMZ+D+gOVuD1RJs7QkEUae64nQulqqx8YBU6G/FnDAo612dhqLRHYCnIZKG+H+cmYu
 Q9V2mzt9ovfqRr6vz8CIMv1jKfQ99aYQSMABKACIzkFtoleG9pgyneFApe3yqm8LPk3X
 FDh4sPGR7hG2dJeFfSum8Osm8eFp5bu8dfySvPBrFP7Mrf6jlGWUSob7sN8i+FHmSYMu
 IZ9IPea0231zhFOYLujSeb9hWSMtQN2klu2c7FaACv3sWH20c2ZMJa+Xy3hNdBuA+63q
 M3m+tjRYQGGe+E84Lm6Z7TPCyv0M1HuGTMfG3/mAUHi4zT1ZLJdN+eat63DvjIcEgI1p
 Hnlg==
X-Gm-Message-State: AOAM530Kn3wfAJCUmzi2HF9Yu+AvhCNu0D+EYFRyCEO+pf7bs2GsmNfy
 kvPEYw5NBmyURWCqLCiFDCg0qQ==
X-Google-Smtp-Source: ABdhPJy8N2MMluSqQR8vTkQEt1MMFqDTRA0fRYqNIQiFDdrsfgPP03mRvzPcKQq6Nza52ol/jdgVpw==
X-Received: by 2002:a05:600c:ad8:: with SMTP id
 c24mr147615wmr.82.1635244160004; 
 Tue, 26 Oct 2021 03:29:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t3sm642268wrq.66.2021.10.26.03.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BB5B1FFB1;
 Tue, 26 Oct 2021 11:22:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 17/28] docs/tcg-plugins: add L2 arguments to cache docs
Date: Tue, 26 Oct 2021 11:22:23 +0100
Message-Id: <20211026102234.3961636-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

cache plugin now allows optional L2 per-core cache emulation that can be
configured through plugin arguments, this commit adds this functionality
to the docs.

While I'm at it, I editted the bullet point for cache plugin to say:
    contrib/plugins/cache.c
instead of
    contrib/plugins/cache
to match other plugins.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-6-ma.mandourr@gmail.com>
---
 docs/devel/tcg-plugins.rst | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 842ae01a4c..59a7d838be 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -361,8 +361,9 @@ which will output an execution trace following this structure::
 
 - contrib/plugins/cache.c
 
-Cache modelling plugin that measures the performance of a given cache
-configuration when a given working set is run::
+Cache modelling plugin that measures the performance of a given L1 cache
+configuration, and optionally a unified L2 per-core cache when a given working
+set is run::
 
     qemu-x86_64 -plugin ./contrib/plugins/libcache.so \
       -d plugin -D cache.log ./tests/tcg/x86_64-linux-user/float_convs
@@ -420,3 +421,18 @@ The plugin has a number of arguments, all of them are optional:
   Sets the number of cores for which we maintain separate icache and dcache.
   (default: for linux-user, N = 1, for full system emulation: N = cores
   available to guest)
+
+  * l2=on
+
+  Simulates a unified L2 cache (stores blocks for both instructions and data)
+  using the default L2 configuration (cache size = 2MB, associativity = 16-way,
+  block size = 64B).
+
+  * l2cachesize=N
+  * l2blksize=B
+  * l2assoc=A
+
+  L2 cache configuration arguments. They specify the cache size, block size, and
+  associativity of the L2 cache, respectively. Setting any of the L2
+  configuration arguments implies ``l2=on``.
+  (default: N = 2097152 (2MB), B = 64, A = 16)
-- 
2.30.2


