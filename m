Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A3322878
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:02:24 +0100 (CET)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUWN-00054s-2O
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEUTl-0004YQ-ID
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:59:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEUTj-0007pF-4n
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:59:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id m1so1839167wml.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 01:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uYEncLACFsbZri1Jv9GZWLum9XLY8QucCf543fHh7pE=;
 b=p+00SZAKxBqYh6bB9g+BaNih806mSBIVdJ+Cd1IJYXJAVt5kjuGnvDyYSxVRuBaMzo
 QmjDC9u3WptPtd5QRvRinGta/gEDlIvXdm8Z3PMoAxCjq1CTzmpRRLQABeU0cpAoUetZ
 x8G0L3je7a0HQdV5RtzTP7IPqy2LmKef9rfXpqD++yae10fuk4reH6RJx9Ks44J8qzyz
 9e5G7jnp99RlJ86GgPI2n2J4ly21u2U9OMoZLnw7BIOJbUBjWpRN/ZTWqS2J+fw/jLBf
 T9a5YuF3AlbAvldyav/rr0lqDfxWxUX7fevRYQ80pBMdwShHyKVJw8mjztDZr6/4xNNB
 3nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uYEncLACFsbZri1Jv9GZWLum9XLY8QucCf543fHh7pE=;
 b=KOcMhUlrYNYDxaFB3ecaW2gLCnWUR8nXM0ONgC8AuBsR+d+mC/xT00mtOQ1sHBl5P4
 l96zOLyfA9DKZyHjuE1xVuIlBZjZRHRoARTHQbL3e10AZwwMMTLXZ/dwM9lKRUFiZsdX
 KB6wCNZnuVfSnW+418DDSfc6FJueukyJ9EQRv0MW9Np2lbAcfpHyfC2uMD7/dMk/HXQI
 eBB8vF6YiTFDvuVnK69PoXlj8b2lwSUlqUm9RTlOmTAKRN+feFa/R+UMUzxvpWhed8GR
 quYdt2UkgmZvoybVEGOAYA0G5A7ZfYUEOP8zvuardLi9Xf6ATmVIGSVusIrYVUps/YdP
 7/cA==
X-Gm-Message-State: AOAM532mYV5ChX2GD4YSSK+qIWkYJkvMn0PEbmTufx0vndKcwR2DT5qJ
 uOIJlnX7YWN26LnNNmelZCWgFw==
X-Google-Smtp-Source: ABdhPJyLTxGCRyhUkiZs8kp37lH5I3AkaBNg+A5N2bbAGPZmR/dQ0Be2fUVatFZy017d6qAt9mpKbA==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr23531505wmq.77.1614074377031; 
 Tue, 23 Feb 2021 01:59:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm10141941wrp.39.2021.02.23.01.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 01:59:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20A2C1FF7E;
 Tue, 23 Feb 2021 09:59:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: move CODING_STYLE into the developer documentation
Date: Tue, 23 Feb 2021 09:59:31 +0000
Message-Id: <20210223095931.16908-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no particular reason to keep this on it's own in the root of
the tree. Move it into the rest of the fine developer manual and fixup
any links to it. The only tweak I've made is to fix the code-block
annotations to mention the language C.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/index.rst                     | 1 +
 CODING_STYLE.rst => docs/devel/style.rst | 6 +++---
 README.rst                               | 4 +++-
 scripts/fix-multiline-comments.sh        | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)
 rename CODING_STYLE.rst => docs/devel/style.rst (99%)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 22854e334d..ae664da00c 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -14,6 +14,7 @@ Contents:
    :maxdepth: 2
 
    build-system
+   style
    kconfig
    testing
    fuzzing
diff --git a/CODING_STYLE.rst b/docs/devel/style.rst
similarity index 99%
rename from CODING_STYLE.rst
rename to docs/devel/style.rst
index 7bf4e39d48..8b0bdb3570 100644
--- a/CODING_STYLE.rst
+++ b/docs/devel/style.rst
@@ -641,7 +641,7 @@ trace-events style
 
 In trace-events files, use a '0x' prefix to specify hex numbers, as in:
 
-.. code-block::
+.. code-block:: c
 
     some_trace(unsigned x, uint64_t y) "x 0x%x y 0x" PRIx64
 
@@ -649,14 +649,14 @@ An exception is made for groups of numbers that are hexadecimal by
 convention and separated by the symbols '.', '/', ':', or ' ' (such as
 PCI bus id):
 
-.. code-block::
+.. code-block:: c
 
     another_trace(int cssid, int ssid, int dev_num) "bus id: %x.%x.%04x"
 
 However, you can use '0x' for such groups if you want. Anyway, be sure that
 it is obvious that numbers are in hex, ex.:
 
-.. code-block::
+.. code-block:: c
 
     data_dump(uint8_t c1, uint8_t c2, uint8_t c3) "bytes (in hex): %02x %02x %02x"
 
diff --git a/README.rst b/README.rst
index ce39d89077..f5d41e59b1 100644
--- a/README.rst
+++ b/README.rst
@@ -66,7 +66,9 @@ When submitting patches, one common approach is to use 'git
 format-patch' and/or 'git send-email' to format & send the mail to the
 qemu-devel@nongnu.org mailing list. All patches submitted must contain
 a 'Signed-off-by' line from the author. Patches should follow the
-guidelines set out in the CODING_STYLE.rst file.
+guidelines set out in the `style section
+<https://qemu.readthedocs.io/en/latest/devel/style.html>` of
+the Developers Guide.
 
 Additional information on submitting patches can be found online via
 the QEMU website
diff --git a/scripts/fix-multiline-comments.sh b/scripts/fix-multiline-comments.sh
index 93f9b10669..c15a041272 100755
--- a/scripts/fix-multiline-comments.sh
+++ b/scripts/fix-multiline-comments.sh
@@ -1,6 +1,6 @@
 #! /bin/sh
 #
-# Fix multiline comments to match CODING_STYLE
+# Fix multiline comments to match docs/devel/style.rst
 #
 # Copyright (C) 2018 Red Hat, Inc.
 #
-- 
2.20.1


