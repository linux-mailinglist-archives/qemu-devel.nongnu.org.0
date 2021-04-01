Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190B3513B1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:34:39 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRues-0003Se-BI
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWi-0002lL-5Q
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWF-0001l9-2n
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so2613279wmc.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDM7zLw72jwQGNOFBTGTvh0L6SEF/PDzTwXwQAd4aYo=;
 b=E7/NwBFqfI6c2ItQJy9XITnE5VDD3Lg/fw/RyeIzDfXdn1vs/DlcW8YbVJrckERjPZ
 O+eFLUTJE4W8YggfdinYIp0QX7juxnSJBhMdDPFrhxeCFBfLil+7cZaxXC5vyWI8zFD0
 ZZfo7p6YT1f18C+Ar7affdnfQFwIfhnKXUzfSdgT8N4w8ppBO3GGh/7/68XkUZutjeqb
 r2YXub09i0EdpOYb1W6t42A6BhRToU8NbkBZ2WrH10jw9qcwzjQeNKtA0EH6IeyblYjV
 GsYdTvlaNkYE3p+XtX8FmzjbfFSuQxPIACIyB7/2k9qkBrGYdIPkfBZY2JxBx4+Qkc5f
 YVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDM7zLw72jwQGNOFBTGTvh0L6SEF/PDzTwXwQAd4aYo=;
 b=dILwtRUhXn/xV3NJz/Uvo6af5Xkvdf5Z3HCFUxU8O8Z1jxOC3fAA0PUbsTOiZt9LQC
 drK+BrPkSHqf4803odqpqK8xSrIz/lXos7rzPh4//cd7MbrHSqHtl5DzQ59wvdJ2BZaA
 hkFveJQKDa/LvzfL0hMWIcLU0ZyynhvuvA1Bf9xChFcOnB856tRQ7eQFkWhyr5GOjchF
 OrNbqkjy+mqeW8Qzf8Z1pHdS1zrI24PkjrU5QhHCbAg4exTkybTyjZ96wcStxmvFDpU+
 MBGavm2D+z0kAhQt3+JO0VNMUSruc7K7EWLVfn6DSyD9zrb7c38mkecyYf8l5bRb8d0J
 f6Hg==
X-Gm-Message-State: AOAM530GJs1WUQ+5AwQdMgDXT/cyrPgc0bV5ar12RjfLBTomkZsV32ba
 jQaL7gm938F3tGA/lZFuZjKudALKwTEEeA==
X-Google-Smtp-Source: ABdhPJxomChLZvFObKV9qg3HWlotQEYRvrPHjVbj08AOhxSky9urjblPIgmzOTdqFoBiT7/fgwl+sQ==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr7260502wmg.176.1617272740962; 
 Thu, 01 Apr 2021 03:25:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l4sm6106717wmh.8.2021.04.01.03.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 275361FF96;
 Thu,  1 Apr 2021 11:25:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/11] docs/system/gdb.rst: Add some more heading structure
Date: Thu,  1 Apr 2021 11:25:27 +0100
Message-Id: <20210401102530.12030-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We're about to add a new section to gdb.rst. In
preparation, add some more headings so it isn't just
one huge run-on section.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210325175023.13838-2-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/gdb.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 72b1e68f4e..0bb1bedf1b 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -45,7 +45,11 @@ Here are some useful tips in order to use gdb on system code:
 3. Use ``set architecture i8086`` to dump 16 bit code. Then use
    ``x/10i $cs*16+$eip`` to dump the code at the PC position.
 
-Advanced debugging options:
+Advanced debugging options
+==========================
+
+Changing single-stepping behaviour
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The default single stepping behavior is step with the IRQs and timer
 service routines off. It is set this way because when gdb executes a
@@ -88,6 +92,8 @@ three commands you can query and set the single step behavior:
       sending: "qemu.sstep=0x5"
       received: "OK"
 
+Examining physical memory
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Another feature that QEMU gdbstub provides is to toggle the memory GDB
 works with, by default GDB will show the current process memory respecting
-- 
2.20.1


