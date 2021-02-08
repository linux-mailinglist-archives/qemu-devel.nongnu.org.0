Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21516313B1C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:40:15 +0100 (CET)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AWE-0003ba-2T
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pA-0003fr-RN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95oh-0007ih-Da
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id z6so16845832wrq.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l+elDiMrFXDDD+nT/WQU5kV+TB/XEnR+Ql7bQKLVzgA=;
 b=MQ8fCs51nGcAi+iPDyRLztZgtd/xph2Vn6AvSxWz2N5wy7Svpnk5sQBW7yUh489NqJ
 XItKlQl6PVXVFjYmf9khSvzdnV3bULZsrqKFpIdJRP+0D4mIC7EnS4iIxVi4DuWzZkhZ
 sBZQQR9QjDo6p9fbRoOflZMYLbJHWmx7AvquVSPBFkuD/Xx3OXCIwPEGq7atBjuVHNgV
 8Cs6LeA+ek0pe7xruz1dxTM0ROXpWT8tPzsaHtwSEfA11ox1ZSOIrCWR+YCvAN1g1NPF
 NmiNt95QQFOgj698ddH/qxcklMlS0W6fu7AuwOMDlPpm2e7Z9aC5kuQX4GlDzHpyU/YV
 T1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l+elDiMrFXDDD+nT/WQU5kV+TB/XEnR+Ql7bQKLVzgA=;
 b=C6bZR21lEctRij+iCxPqq38uDxepCDiK16E9nyBf6gqEAU09O2OJx0L5+4j40FABKx
 gXki/Pe7QWyLHOQkFn1yJoIbJKSXD2boSabgxWLVtW/mSIu/zNluJ/Rc0PV5z1bD3ydF
 MKOP/F3oqaQcNooHVBUT7qIQRGeMAmJ6eyxOy7gaHtdUuGWf2qGw/71ysSSUOVF9v1Wb
 CL0qRHWDJo8/EHOqtQZ7OslXmfwh6WuTHMjKhdiWiST2SO89oi8awNSNvseW92siJjDx
 ZFKrEQx3dUgcPbaGWtP3XufmpP3YWo5tdClNoS7YU7YoGZaJ/z5ggassVrgdzpIK0Kxd
 eHbA==
X-Gm-Message-State: AOAM5314yhoJkFBthzhzaC9cLIkHY9zNu95QwYxVaIzB0Rr8HlRyKpBI
 qkk8X4pjUpOhtHMKL/kFAbmYsg==
X-Google-Smtp-Source: ABdhPJxrce1GQwWEqdfpStKcnDaxfYwZX0E2SgqYf5xw8tuc1v2jsgrvuan6olx8zy1sbqRTy7I6dw==
X-Received: by 2002:adf:ea02:: with SMTP id q2mr20058475wrm.25.1612787912106; 
 Mon, 08 Feb 2021 04:38:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r13sm22532595wmh.9.2021.02.08.04.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 300A21FF91;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/16] tests/docker: preserve original name when copying libs
Date: Mon,  8 Feb 2021 12:38:10 +0000
Message-Id: <20210208123821.19818-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While it is important we chase down the symlinks to copy the correct
data we can confuse the kernel by renaming the interpreter to what is
in the binary. Extend _copy_with_mkdir to preserve the original name
of the file when asked.

Fixes: 5e33f7fead ("tests/docker: better handle symlinked libs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210202134001.25738-5-alex.bennee@linaro.org>

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


