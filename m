Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C214B300B2F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:26:52 +0100 (CET)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3191-0001cl-QG
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311W-0007YW-2o
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311T-0006rL-5W
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id u14so5156585wmq.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hf7ynIumjxT8747QQLhELSkjFJ2pAeJjBigreGwj8dE=;
 b=uwF760ms32l6bWLtm3doQiSQPHauyeiUQC+vKshg5CQFbLmVfuKKbyoIMHIKx353fs
 3ldMM7/YBMfRp5MVB1nKfAxwLFsbIaENh4kSC3qxKxepPgl+6S2hbSbO9EvO5gClV/Ku
 i84A9X+vaRkRZQA8KXDGdZmydwAI6p1xGH7TawWQCiR5onP3i/aEIhV98QF+65P049KS
 ujUj120+0MkXukJ0F4O/O53eUO79FDf0LocT7P+oYq28oIzZSOSMPLtX9o8ymt8frrhy
 e6J2nBviB2swy8URf4SvjJlBLbOB744j9obtApoPd5+T8Q9EpDwcmA4YdMX7grdXkBcq
 Tacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hf7ynIumjxT8747QQLhELSkjFJ2pAeJjBigreGwj8dE=;
 b=l4RhevhM/zAf24/Q7Sp1BzZKazis9wDVrSanrqjYE7Vfg9sYORqlkXP/SPZSBxXqdw
 sYwFoLuB50XZsfQ+7Jc8km887Yi+8/8Y+aovaHqlO6gHV8NcfReoYxnbVRiGEGKKyk0U
 5a4tXsvlgSKQw/439okCqUjkj3xyeGG7V3u6dynWWrogxu1AUu259CwFGHd0Jgy+VgO4
 Mb9IdcF/Z2NLBRkZ6ZQzmCk5qfjseiCp9Mjw3yDTmez/k16mNi873C7FPPJxAWW8doh/
 UVRy1/gZn9N9bcn6epas2VrL1TFm5D0bmLgSaY0h+2tJPgi2JLPb1yZBuXxEXy1Gahk6
 yNrQ==
X-Gm-Message-State: AOAM5335WO/d/LqdGWtXfgmcU8xxhAmFNN7A3GdJQgsR4iW5hgGD6OZA
 tcKTHDEjsQFqD8e23jrQGb0RIA==
X-Google-Smtp-Source: ABdhPJyxri0cD8DJCmbR8H/eyVKIfHR42eW38CtJDDUTG1FjXtYPX/D+6083NfwfRbXvHrlS0otQbg==
X-Received: by 2002:a1c:2287:: with SMTP id i129mr5068157wmi.109.1611339540807; 
 Fri, 22 Jan 2021 10:19:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k1sm13206339wrn.46.2021.01.22.10.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 10:18:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3E461FF8F;
 Fri, 22 Jan 2021 18:18:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] tests/docker: make _copy_with_mkdir accept missing
 files
Date: Fri, 22 Jan 2021 18:18:49 +0000
Message-Id: <20210122181854.23105-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122181854.23105-1-alex.bennee@linaro.org>
References: <20210122181854.23105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the linker/ldd setup we might get a file with no path.
Typically this is the psuedo library linux-vdso.so which doesn't
actually exist on the disk. Rather than try and catch these distro
specific edge cases just shout about it and try and continue.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/docker.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 0b4f6167b3..fb3de41c0b 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -103,7 +103,12 @@ def _copy_with_mkdir(src, root_dir, sub_path='.'):
         pass
 
     dest_file = "%s/%s" % (dest_dir, os.path.basename(src))
-    copy(src, dest_file)
+
+    try:
+        copy(src, dest_file)
+    except FileNotFoundError:
+        print("Couldn't copy %s to %s" % (src, dest_file))
+        pass
 
 
 def _get_so_libs(executable):
-- 
2.20.1


