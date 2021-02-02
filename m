Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F730BFBE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:42:20 +0100 (CET)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vwh-000593-BO
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vue-0003NT-1s
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:12 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuc-0007E5-Fa
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:11 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so20519597wrz.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l9hs2c1uUiGj7MHevQ781qlr6u6iQ0XBGuGPt72flqQ=;
 b=BNTpJZirH3yvWYbcRx9zHha8EcmN96BF9Pq79cFrS4kb88guOWaXlgAE9UWu/GRrbX
 1RCCJVd0h4c+Dw1o7iXVsxh+YrqHpm5uiDXfoVCOYuBwoI1D55ba7vkM/jOKtTyaC0nl
 ekt1ci1R2EJGKrHwjHw39QrA7QxHvOhCzahnbyZ+KGqFmOztrj01mGXWNWTzq633PHPy
 NZvKiLZG4smmloEyvoynwZ1pSDEUPK4cUPVJEmGx3nelctqSAAmpif4b+uLwD05JifM7
 POoCdTn6W5okknKDU9fVD0PN7iIAX62+nri9hNXFMyFnIt2/3TjMizURlb8YYlSmHnCR
 g/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9hs2c1uUiGj7MHevQ781qlr6u6iQ0XBGuGPt72flqQ=;
 b=eI9n3fWs8adZCtaX3EQ99QHNwEY4xKj4hFAnP2Yj4wzurDI2yoUzQ+2EVs6vOi8nkg
 yUIxK7oaEcQVrQnZzu+Pj3WIuoXhx4klNIlnBC+fhhi+U+lN2HebKa5ip3ceELS5jPp+
 stJIUEVO8p6tLLn3N44AF1ReLNlRTWGJMMma0tyINt7+n+oADT8IkZypLRqlI4F0I/3G
 XcXBV8FXaZfzgRzZYO5AVGKvM12C3muBV60mk/cFy31vE3uk/Fw078b9u9r5hu9Qsytl
 KQiqcO7xEWfKEn5byoG3uFMuHcXCf3ncLi1rp21Ah74GuvYC4xg8Z3XRoAvBThraXdUK
 9NOw==
X-Gm-Message-State: AOAM533/DgObxy89lz6NFh6rhfTlsdjsgf9oa8dutIrFPkZGaSXcgT/3
 U5gnVtzOqVjZxmad2xFm9FbHLHUTuk8aIPso
X-Google-Smtp-Source: ABdhPJwiXmuHZEs1Z7VhgCzAmhU2NqXqoOvIzy5L3c9TmqZRziBgOUW45O8n6hXYYR9rnYDWXY/11A==
X-Received: by 2002:a5d:68c1:: with SMTP id p1mr23631107wrw.325.1612273209302; 
 Tue, 02 Feb 2021 05:40:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z18sm30974726wro.91.2021.02.02.05.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C0371FF90;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/15] tests/docker: preserve original name when copying
 libs
Date: Tue,  2 Feb 2021 13:39:49 +0000
Message-Id: <20210202134001.25738-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While it is important we chase down the symlinks to copy the correct
data we can confuse the kernel by renaming the interpreter to what is
in the binary. Extend _copy_with_mkdir to preserve the original name
of the file when asked.

Fixes: 5e33f7fead ("tests/docker: better handle symlinked libs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index fb3de41c0b..39da3fefcf 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -93,7 +93,7 @@ def _guess_engine_command():
                     commands_txt)
 
 
-def _copy_with_mkdir(src, root_dir, sub_path='.'):
+def _copy_with_mkdir(src, root_dir, sub_path='.', name=None):
     """Copy src into root_dir, creating sub_path as needed."""
     dest_dir = os.path.normpath("%s/%s" % (root_dir, sub_path))
     try:
@@ -102,7 +102,7 @@ def _copy_with_mkdir(src, root_dir, sub_path='.'):
         # we can safely ignore already created directories
         pass
 
-    dest_file = "%s/%s" % (dest_dir, os.path.basename(src))
+    dest_file = "%s/%s" % (dest_dir, name if name else os.path.basename(src))
 
     try:
         copy(src, dest_file)
@@ -155,8 +155,9 @@ def _copy_binary_with_libs(src, bin_dest, dest_dir):
     if libs:
         for l in libs:
             so_path = os.path.dirname(l)
+            name = os.path.basename(l)
             real_l = os.path.realpath(l)
-            _copy_with_mkdir(real_l, dest_dir, so_path)
+            _copy_with_mkdir(real_l, dest_dir, so_path, name)
 
 
 def _check_binfmt_misc(executable):
-- 
2.20.1


