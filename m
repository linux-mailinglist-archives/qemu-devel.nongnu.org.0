Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F133FFCCA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:12:36 +0200 (CEST)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5FT-0002yp-MG
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57A-0006B0-5D
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:00 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM577-0005dl-CQ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id g135so3013600wme.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oeQeR+eEGJXX3Wt57/hk38LlH5xv/1yOOnlDT6GieeU=;
 b=ZmfGX2u3UOC7TRoGp3IbzEOLhoSKfyMlLSzH9mr7LpCbaS2f50P19uac7tj9cK2sIw
 P+q3LZxBcR5NhngK0/AmGM6HndVK7H8fucqfCQhA608foew3tCtlMFeHieS4BVKsF8in
 7WgAIYeQbp5m2Uc4ScBRcYsGEuJCGmrs5gmHesPEIS6VW3D/feXyLF4N2y59JthOpU2T
 Iauk9DC+CiyjR+xjZln8cfVYuogt3BuDbqIT5uXZQMdWPwLFri+AEwLjKJbC9nFiXZBL
 bLX9/BHXYrsyXSuoM4e85fUWp5+/uA4iKG8mJ7BBf8wKvPL56fy7jtGu1rIEhiYzasab
 Zubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oeQeR+eEGJXX3Wt57/hk38LlH5xv/1yOOnlDT6GieeU=;
 b=at25htJV7xd2vBvaqY799A2gq0Xcl/jKKD9mXFDoB4e0TVjvcoTgb1ndXKDcK+psgr
 Eb5CgpW5rz7QYmGwWgAsidG/Ba18gW2u0JECS+5FPwWOXouIRTwct8aw5ByriWYYlXty
 RpjjYr71NEEuxZjPqnEq9zTUCUbHuMghxBIlROICq16qXie0XR6tTVZuiVVLysk+IhO5
 j6gy1hNwtXzgxt37tSB3kAEJGtU2uem38fUWe1vmjilOvW1Njcf0IFebVdACOdT5xp2r
 Ur0j24bGpBNVcqPzEHWZiYnkawLW3fVYhlDq4c3qt/1i61VVdx3545oeYiGkhgLX3p0M
 VklQ==
X-Gm-Message-State: AOAM5302EIbOCNn24VN9bjxhi9LT/OsneJQkZNDELv0DqHQWHI/iNRPC
 jcGQ7eMc9MGUuLwRkAmfNUPoqA==
X-Google-Smtp-Source: ABdhPJy+AOnUkVFeB45QhAg5bgEN13wCWIinNcHIPa34jkhdBiUXa254nRv3I4qUwHcrWLHhbk/Vpw==
X-Received: by 2002:a05:600c:2250:: with SMTP id
 a16mr2254455wmm.72.1630659833286; 
 Fri, 03 Sep 2021 02:03:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j20sm4084619wrb.5.2021.09.03.02.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A7CE1FF9F;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/22] docs/devel/tcg-plugins: added cores arg to cache plugin
Date: Fri,  3 Sep 2021 10:03:25 +0100
Message-Id: <20210903090339.1074887-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Message-Id: <20210803151301.123581-3-ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 047bf4ada7..2d29a8972b 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -355,11 +355,8 @@ configuration when a given working set is run::
 
 will report the following::
 
-    Data accesses: 996479, Misses: 507
-    Miss rate: 0.050879%
-
-    Instruction accesses: 2641737, Misses: 18617
-    Miss rate: 0.704726%
+    core #, data accesses, data misses, dmiss rate, insn accesses, insn misses, imiss rate
+    0       996695         508             0.0510%  2642799        18617           0.7044%
 
     address, data misses, instruction
     0x424f1e (_int_malloc), 109, movq %rax, 8(%rcx)
@@ -403,3 +400,9 @@ The plugin has a number of arguments, all of them are optional:
   Sets the eviction policy to POLICY. Available policies are: :code:`lru`,
   :code:`fifo`, and :code:`rand`. The plugin will use the specified policy for
   both instruction and data caches. (default: POLICY = :code:`lru`)
+
+  * arg="cores=N"
+
+  Sets the number of cores for which we maintain separate icache and dcache.
+  (default: for linux-user, N = 1, for full system emulation: N = cores
+  available to guest)
-- 
2.30.2


