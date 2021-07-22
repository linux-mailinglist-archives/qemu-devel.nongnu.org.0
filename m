Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910E3D1EDA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:21:23 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6T1G-0007yL-AW
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St9-0006KG-1f
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St7-0005Tf-DO
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 p15-20020a05600c358fb0290245467f26a4so2349591wmq.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wz+9PQgNBB9NOSlbXOCgDYqNMDqyiiLq1Squ3vsDqRY=;
 b=FFfYFXZMCEky7zEF74Tteo3omJPaJu+WKTJ2ITIU+Ii74M5DlPQN/mgm9sLVIspBmN
 IgD6hTxSxwc0V/YsGX7FHWDL3HM3Knr98os9JvrznEIp1MHX9yra8bFvwajsfveysCSs
 /8Oofyt5DNlG6lhCVSKJW1rGoJ/BQOhxRx+9PKBxVZeQTdsqLDgX9J5PG9t3bqb4KJ7s
 kPHAzEy42AjmZbP7xxlLhZvsQn2Sye5oQrH/FveOJc+tN49MW6YREd9yPx3191LBhXkq
 P9+BYzJnPVj64pwY9dr8LitbyXVH2GaM7aymtfJAOpsFPHysuQTl29Ajktmy5CZ3tuHg
 hysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wz+9PQgNBB9NOSlbXOCgDYqNMDqyiiLq1Squ3vsDqRY=;
 b=J7ZH9gDj4ohioXUvGyME/Z7F3OmsMMrlx6tJq2GAnnGomWWvz6KoqJy/XQG/bkbEir
 HBACmmtnpP5KqLkBQM4tTo7mdZTOb+BH7bsSlaPKsMN9Tqjf34ZudIQuOpc5YvH9PK6C
 5smVMucrrgOjrTiHtjS3BmQvoDL9ISBLWsGjb3bp6pDgbNICuENB6h7ZNo5EyXYKc2my
 TRsKrPYk/XVVi4IgfW/jUHu6vKK5sXddyH+g02HJHKTOrnpcW8bdnSqmW8PfUYpSc64I
 QEB7II/wWjKTQiMPJqKGQbq8XABAyQXvw/yAbqJ3reUJWuUrVSj7WaDhYalIGM9u+XBT
 C9/A==
X-Gm-Message-State: AOAM533LAc5eOW+POSO+ugiLum8wBKbUTurVdAOEPXEK5ETWr/bMfxrR
 WDQmZqmzisy0YgrdNpXsoQdcWMIldP8=
X-Google-Smtp-Source: ABdhPJySLhvRVm0b3MO+nXeg3iMTs4SfDYYJ8JVzUfSeMS6zfMzrM419lYNWv9g7oqaIBStBi9/bag==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr7792519wma.94.1626937975693; 
 Thu, 22 Jul 2021 00:12:55 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:55 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/13] docs/tcg-plugins: new passing parameters scheme for
 cache docs
Date: Thu, 22 Jul 2021 09:12:31 +0200
Message-Id: <20210722071236.139520-9-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
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


