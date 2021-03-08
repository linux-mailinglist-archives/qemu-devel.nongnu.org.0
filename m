Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAA3310C1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:27:42 +0100 (CET)
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGrF-0006c3-Ez
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI9-0006aD-72
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:26 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI4-0001Fl-V4
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a18so11485630wrc.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1U/ORcIBWROYJWFUfscqlCNl6s4lUhCxpTPOOlyuiKA=;
 b=JafBYsOhFqw0jQ4ufeJB6QUtsxUz0t2qQa/nHgna7AXyYGSnZvxWqds0Exwsf5E494
 NAJ7QP2+g0Gef/X6YjGcd9tTrCkEtfzpBDyxRVaSqs3gdQjS3ow0afwYUaQSh2N2hneS
 QTHBeaAeHzurZFEMUNNl0boKCidbJNLFtP5JXlQ6rblHuZclIEtNfaMw5mV3wXfd6edX
 iTtUrkaGWLepfkS3/Q7UfNBS7h5e01ot/YQpAHUpxU2SJDGVTjhGgqAkIESodDwCzLuY
 eWlC5mwwMwcwf61bnCswumkXlSzeGEa/CM2qlLJvaJevxuTgtcCoXAXXxMBJY1cHsY2O
 1uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1U/ORcIBWROYJWFUfscqlCNl6s4lUhCxpTPOOlyuiKA=;
 b=NrQPYrjdeOG7Y4p3YWCCJlo0ZmxQuke2iGPXJJ10m0X9wBJcV4+d9PA1LPbpy0oYsY
 MFIG6lgCop+sH2COavK63P/RbLDHtFQAdNM+N4i6qXrrrYwRpKNhtomL4Nf02yz93r2u
 WY6TgqH2lRL+xa1CvGpe3wjY3dGh6Tf4WyM4m8immy8W2vNb2FqVJX9ec7SFkm3G/gcZ
 5PlAa9vzTi2zdADyR7u0UVFV3mq2j6dj+vXpRU0RSAGbLL6l9AiU9Bos29/vXaYWoJwz
 RRB7wONz2iTNcs/KEF+4INXbNkBD5gqWcHMN+5VTD6NNQOrtt8dQ2UjyoHs06p5kVBAY
 es5A==
X-Gm-Message-State: AOAM530rcmuFrUYUBCGMJkilWnCtH7oa8kzy5dsYzsQnfgq2jE60fJRT
 g4W7N6rbTgAmvxgXAr8q+1qYr5W3xSKw1A==
X-Google-Smtp-Source: ABdhPJyCl+ZTjtHyvkIUQ6LJ62H43WNNJ91OYBMm/OBK7GHwBEgc2kdQhMsKXB5TicusVv7jjZnlBg==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr22881557wrt.133.1615211478976; 
 Mon, 08 Mar 2021 05:51:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z1sm19088078wru.95.2021.03.08.05.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D1101FF98;
 Mon,  8 Mar 2021 13:51:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/18] .editorconfig: update the automatic mode setting for
 Emacs
Date: Mon,  8 Mar 2021 13:50:55 +0000
Message-Id: <20210308135104.24903-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems the editor specific keywords have been deprecated in the main
editorconfig plugin:

  https://github.com/editorconfig/editorconfig-emacs#file-type-file_type_ext-file_type_emacs

Update the keywords to the suggested one and point users at the
extension.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210305144839.6558-1-alex.bennee@linaro.org>

diff --git a/.editorconfig b/.editorconfig
index 22681d91c6..7303759ed7 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -4,6 +4,11 @@
 # plugin.
 #
 # Check https://editorconfig.org for details.
+#
+# Emacs: you need https://github.com/10sr/editorconfig-custom-majormode-el
+# to automatically enable the appropriate major-mode for your files
+# that aren't already caught by your existing config.
+#
 
 root = true
 
@@ -15,17 +20,17 @@ charset = utf-8
 [*.mak]
 indent_style = tab
 indent_size = 8
-file_type_emacs = makefile
+emacs_mode = makefile
 
 [Makefile*]
 indent_style = tab
 indent_size = 8
-file_type_emacs = makefile
+emacs_mode = makefile
 
 [*.{c,h,c.inc,h.inc}]
 indent_style = space
 indent_size = 4
-file_type_emacs = c
+emacs_mode = c
 
 [*.sh]
 indent_style = space
@@ -34,11 +39,11 @@ indent_size = 4
 [*.{s,S}]
 indent_style = tab
 indent_size = 8
-file_type_emacs = asm
+emacs_mode = asm
 
 [*.{vert,frag}]
-file_type_emacs = glsl
+emacs_mode = glsl
 
 [*.json]
 indent_style = space
-file_type_emacs = python
+emacs_mode = python
-- 
2.20.1


