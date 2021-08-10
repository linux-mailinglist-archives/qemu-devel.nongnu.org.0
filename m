Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D855A3E5C2E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:50:45 +0200 (CEST)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDS9U-0001O5-OK
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7s-0007dI-L6
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7q-0008MA-RZ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:04 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m12so26365805wru.12
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBrwQGAgNFVSSq9iGQFjfmiOCMZon3rRa4RYHTifO5I=;
 b=KuNdF23gsJz4ADfHqUAU7V1uhi+pXVy3ZUT4S55wzjUNXaNMn3QiDbUO9Bhnu6rGkz
 wueYzU/H+zhDixnsb8URwagefBEL7yFchiER+4SNRxeuyiEaKlx4SO2NY6AhAxL4L6MG
 ESG3nRTHEQHY+F3H+DBWhSiQM48KkwuyyvtSc6kGf1aMMg6iFjyfOuNcZXo8zcBM3I7t
 DQ4cbuUwGZ1SIDQBdoC3hi7m1cHBzxo2kSF5kEZPIE87X03aPfA570Cm5Zw4ZNdJjoYo
 REYAutkI2DFchY5u/XOsDa7gBS4l7gpNvyqhyngmd6pWDQGoWbCy4LAfmH4mIE1DCpOK
 KUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBrwQGAgNFVSSq9iGQFjfmiOCMZon3rRa4RYHTifO5I=;
 b=g43JhbmSwLbKbd5CyhRvOHCLQy9yTsZxiaK1+QgFL+8Qv6s6/42NsuMnoAE1IO7Av4
 1eH8owgJxbcqvpzM4Qfgf3B+y12MLor882XNs1Xczbss0ZooARvPLsGSaU8+ZwxSahrJ
 ss6GLJsh8p6WvA1znEoF3Lu3ZAlb1yxKs61iFOWI892d2o7Xvfu1pHOzA+V0nvDgEpEM
 ro51icNhPTlRFPWndKJTPMoKasDSY+nYM+UQNCHb83XVKcaHQONNXQE4F9OS+AhGgd5M
 xD4XEh2zmtoojtLoPtwWBMGdoIWOqfIh1HOGKewc/0EHw+vfnraJS25g9V9RAb+52KAl
 SYlw==
X-Gm-Message-State: AOAM531/mc6Ms2kbPNjx6oo0rBFO6+LBqDoU2q1JGB3Dh6W51cu1p2XT
 1Pljj0Bhw5GyGoehcFE3eIWyYlv+mwc=
X-Google-Smtp-Source: ABdhPJwEc+vM7D6aqRn2rnWorYqZhNwRtAYGE6UPMV+RrPgyZGsChbMrQTDOAU2JXBhycuT9pVe8Dw==
X-Received: by 2002:a05:6000:18cc:: with SMTP id
 w12mr30813653wrq.96.1628603340996; 
 Tue, 10 Aug 2021 06:49:00 -0700 (PDT)
Received: from localhost.localdomain ([41.36.105.33])
 by smtp.gmail.com with ESMTPSA id u6sm8683413wrp.83.2021.08.10.06.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:49:00 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] docs/tcg-plugins: add L2 arguments to cache docs
Date: Tue, 10 Aug 2021 15:48:44 +0200
Message-Id: <20210810134844.166490-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810134844.166490-1-ma.mandourr@gmail.com>
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cache plugin now allows optional L2 per-core cache emulation that can be
configured through plugin arguments, this commit adds this functionality
to the docs.

While I'm at it, I editted the bullet point for cache plugin to say:
    contrib/plugins/cache.c
instead of
    contrib/plugins/cache
to match other plugins.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/devel/tcg-plugins.rst | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index fcc460bf7b..ee3fab75bd 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -360,10 +360,11 @@ which will output an execution trace following this structure::
   0, 0xd34, 0xf9c8f000, "bl #0x10c8"
   0, 0x10c8, 0xfff96c43, "ldr r3, [r0, #0x44]", load, 0x200000e4, RAM
 
-- contrib/plugins/cache
+- contrib/plugins/cache.c
 
-Cache modelling plugin that measures the performance of a given cache
-configuration when a given working set is run::
+Cache modelling plugin that measures the performance of a given L1 cache
+configuration, and optionally a unified L2 per-core cache when a given working
+set is run::
 
     qemu-x86_64 -plugin ./contrib/plugins/libcache.so \
       -d plugin -D cache.log ./tests/tcg/x86_64-linux-user/float_convs
@@ -421,3 +422,18 @@ The plugin has a number of arguments, all of them are optional:
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
2.25.1


