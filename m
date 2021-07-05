Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A70D3BBAA3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:58:27 +0200 (CEST)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LMw-0006O4-4Y
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKW-0003cm-P2
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKU-0003tj-Rv
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a8so9657749wrp.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=woBgOKjt+pNEYjt+vuvIuV8ptDZMaQQv1AgF8gQ3tNg=;
 b=mC/Sw3g34f23SP9ixUNUk7uVxEovT/IVJllIT4+HYw8RiyM32UjNbjcnPFVssBEFVf
 zWdn/+wFgBfAlaiQl/kznm43gniTvl3Q9mCsTwbZz2b/2zw/n/lVbsY96EUFYE3NgIK0
 EiYWRv+xvpOJxu1bbh7PPW6Tji8G45m0H7nTMFBKlqolq9aZ5ctTBE8nvEX+WeMHrwex
 EUnskqIdMKQDvABkT1yKIsD8wYzn3Cb5VZHcWaFPwluqjzAcZ807N/cUVEy+pDtLs4SB
 hwE5DsR9k4elc6w7db55rNC4I0IiGofCRzPGMegRRZZiZSKzmrB0yRfdnFYR/NtpH9KI
 Y7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=woBgOKjt+pNEYjt+vuvIuV8ptDZMaQQv1AgF8gQ3tNg=;
 b=DQKBekpFVezT3UR12ukGMTXoBRekmDVLS5Ra+YB4kvTAjXD0btUE7imxxGGlEXOYIA
 uX6n1LLmD83a90FKWZFmw1x49kKtBaoP66pmdFjj/bhqMPWSTqjG2vR4yKBznKgvXNH0
 KgdDApTNJ+yYrcm1iwNh5vQ7lw35Sk7soaG9oDX7ZTt8z4vQHWfxTr+7Iz/57doD94a/
 xwEvOqg1aiarQGjY7MYdgS8pFu9Fb48GZ9ivRCoRq+sbBgdAdMLb1r8yLzk4MapepTt9
 W8b0MBElEBBTVuc95mUXKaS2K2P2AjwN5ys5XGfgKzjGSWmer037sFnCr8G6R3EslPnd
 ruNA==
X-Gm-Message-State: AOAM533oa2rDRR+thnnC0TA4qzpcNOBWywh+uqtkW36+sfKTPvdgyQpS
 VeQ4oOMarY/Qd7/dT4Cd8Rxtk2/F3NO4Fow/
X-Google-Smtp-Source: ABdhPJzYQ69d/xtd1INoe9qDtMAXFTUgG0B3f6N2T9ByzsfhEEFZp6LCpuCnTcM5KbHliiw33X8fMA==
X-Received: by 2002:a05:6000:1a8e:: with SMTP id
 f14mr14782498wry.61.1625478953158; 
 Mon, 05 Jul 2021 02:55:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm12528727wrr.4.2021.07.05.02.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:55:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] docs: Move deprecation,
 build and license info out of system/
Date: Mon,  5 Jul 2021 10:55:44 +0100
Message-Id: <20210705095547.15790-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have a single Sphinx manual rather than multiple manuals,
we can provide a better place for "common to all of QEMU" information
like the deprecation notices, build platforms, license information,
which we currently have in the system/ manual even though it applies
to all of QEMU.

Create a new directory about/ on the same level as system/, user/,
etc, and move these documents there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/{system => about}/build-platforms.rst  |  0
 docs/{system => about}/deprecated.rst       |  0
 docs/about/index.rst                        | 10 ++++++++++
 docs/{system => about}/license.rst          |  0
 docs/{system => about}/removed-features.rst |  0
 docs/index.rst                              |  1 +
 docs/system/index.rst                       |  4 ----
 7 files changed, 11 insertions(+), 4 deletions(-)
 rename docs/{system => about}/build-platforms.rst (100%)
 rename docs/{system => about}/deprecated.rst (100%)
 create mode 100644 docs/about/index.rst
 rename docs/{system => about}/license.rst (100%)
 rename docs/{system => about}/removed-features.rst (100%)

diff --git a/docs/system/build-platforms.rst b/docs/about/build-platforms.rst
similarity index 100%
rename from docs/system/build-platforms.rst
rename to docs/about/build-platforms.rst
diff --git a/docs/system/deprecated.rst b/docs/about/deprecated.rst
similarity index 100%
rename from docs/system/deprecated.rst
rename to docs/about/deprecated.rst
diff --git a/docs/about/index.rst b/docs/about/index.rst
new file mode 100644
index 00000000000..cd44456a6bf
--- /dev/null
+++ b/docs/about/index.rst
@@ -0,0 +1,10 @@
+About QEMU
+==========
+
+.. toctree::
+   :maxdepth: 2
+
+   build-platforms
+   deprecated
+   removed-features
+   license
diff --git a/docs/system/license.rst b/docs/about/license.rst
similarity index 100%
rename from docs/system/license.rst
rename to docs/about/license.rst
diff --git a/docs/system/removed-features.rst b/docs/about/removed-features.rst
similarity index 100%
rename from docs/system/removed-features.rst
rename to docs/about/removed-features.rst
diff --git a/docs/index.rst b/docs/index.rst
index 763e3d0426e..5f7eaaa632c 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -10,6 +10,7 @@ Welcome to QEMU's documentation!
    :maxdepth: 2
    :caption: Contents:
 
+   about/index
    system/index
    user/index
    tools/index
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 058cabd36cc..fda4b1b7054 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -35,7 +35,3 @@ or Hypervisor.Framework.
    targets
    security
    multi-process
-   deprecated
-   removed-features
-   build-platforms
-   license
-- 
2.20.1


