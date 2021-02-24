Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B46323B86
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:53:30 +0100 (CET)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsjR-0001cF-1v
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfj-0005yt-Ne
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:39 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfh-0002WA-Sd
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:39 -0500
Received: by mail-wm1-x332.google.com with SMTP id v21so1535416wml.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y3+FxSWPTBVmvCmaxvS+5zSnQOKO5uWtcRTHkxOmIUk=;
 b=L+45VmDnMDz80wfoAUg5qOiyhHP0ELQA8awrLLft66s9TE87zY278qxvxQDgo3qc+r
 g2WdI18VKAdgZ9t6DvKtMqjkvLIBybXyZvnZ5xJY5j7eH+Lfr98TTst4znsF2t10nvkh
 s9zny0+qV54cUDz6/6Thu2LEdSskEvrx52ffn4tQOik5RpryTri1zRy//PXi9iRB1YEE
 Tp1xusCSiossnJ13vtnK6inXBfjkPCfXExzEdyakhYCmMs0f3yBO/fVs1h5Go7abuLjY
 ARr7Zc8KkBnLdFYHZLp+ay4qv1f/j311cm6nUD5zaGFOdJvvnoLaY7aPLCw3BRsaPkda
 gSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3+FxSWPTBVmvCmaxvS+5zSnQOKO5uWtcRTHkxOmIUk=;
 b=Wbhvkju74GhphfrCIub2r0OdYL03762JlogpB7Jfa7CLqtA+ybbOOunFfezeQ5W+5J
 139uE63eITyyKOf4XsjmybUqgika4a7etf9wpfgiKLh30CYY4BYkDPmxukj2ByNi9Cwi
 obN/JtGrRPynQcFf+qUDmQDPXuceYt7HNB9yUXW5/AYt040VD8Q8TZDSHdoEdNWC2RRw
 +a+r2rKF3WL9iRCyBuNIm4P3cRUPv8MW7KRiBiV8AE73LDccnm8/J/eikhnQysIz5KIG
 4taly7yfblbRMOlL9vKbgrJcDVKDtmXrnvsJw1KCsACMgwpyN6SYEwtT5SrDUL8XYcXX
 jWeQ==
X-Gm-Message-State: AOAM533BT1DPJi6gr4DK2GxqtFyi4vb3aGaUTFwoowN7L1z4ZHtBiQ0L
 7eqQzdUWAbhjOkAQiNFYpE5BA+rqqGAwEA==
X-Google-Smtp-Source: ABdhPJzBIPTHGSS4M5qoTxiW+c98cN4aYDXDUyjzF8kvenMLCNkdr86zuTxf+HEd69e/sA2S3sTUTg==
X-Received: by 2002:a05:600c:2149:: with SMTP id
 v9mr1669798wml.102.1614167376721; 
 Wed, 24 Feb 2021 03:49:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z18sm3056063wrs.19.2021.02.24.03.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:49:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F68B1FF93;
 Wed, 24 Feb 2021 11:49:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 7/7] docs: move CODING_STYLE into the developer documentation
Date: Wed, 24 Feb 2021 11:49:26 +0000
Message-Id: <20210224114926.6303-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224114926.6303-1-alex.bennee@linaro.org>
References: <20210224114926.6303-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no particular reason to keep this on it's own in the root of
the tree. Move it into the rest of the fine developer manual and fixup
any links to it. The only tweak I've made is to fix the code-block
annotations to mention the language C.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210223095931.16908-1-alex.bennee@linaro.org>

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
index ce39d89077..91aa1e314c 100644
--- a/README.rst
+++ b/README.rst
@@ -66,7 +66,9 @@ When submitting patches, one common approach is to use 'git
 format-patch' and/or 'git send-email' to format & send the mail to the
 qemu-devel@nongnu.org mailing list. All patches submitted must contain
 a 'Signed-off-by' line from the author. Patches should follow the
-guidelines set out in the CODING_STYLE.rst file.
+guidelines set out in the `style section
+<https://www.qemu.org/docs/master/devel/style.html>` of
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


