Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF824FF685
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 14:13:30 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nebsH-0006jD-38
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 08:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nebqJ-00063I-Ue
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 08:11:27 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nebqI-0000rx-9r
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 08:11:27 -0400
Received: by mail-ej1-x632.google.com with SMTP id u15so3468363ejf.11
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sBtq6aJsF5JQPiNLvSzhAK+KB6fcDDkK9xa86DslMw4=;
 b=ZRj5BoAnztDBOXmja4R3GPmLMKCTt3ADAC1YAsQ0P04J1kGq1X0C8q0An4eJTUgHdv
 H1wm89rcrn4epaTGbjSB7/t03fQX7KATgliLU1nWB2qT4r5OrNVq2dxIE15SwRXEXf3i
 c26TdrDtc2UdFtBijsrU0ZDWzyRPW/1ppb5EcS3+WqIqIZ4jxm3su+cdQQQ1wLv/Wlhf
 sYycBVYBHcd/V0zyt2tAjtZJ6N0+pEmHU1uDWDdgDc2cYHMFAdhyIW2umHiWuPn1mXpc
 w3ZDLGtDJFBy7lATf0JSDVvfPPYAv+tF/YR/9fzrD6XQqqcz2mCjIpceSf0DNcKFnNJu
 RipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sBtq6aJsF5JQPiNLvSzhAK+KB6fcDDkK9xa86DslMw4=;
 b=eVo9mJxDeXP5XpoxT6vaRms/t0R7ZmqISKzkVETkBtX0Wbv1MAavP/PdqEKQ6cxXVJ
 saEK4q71IYqcZPimYHYuWNGSW7aXsG04CSRUdcO8jyF8oDDj1xW5T7uOrsuPOfI3/0Td
 xLstVUdLbF/rJLYoBFBvi9lyM7oBqgoGbxMZqtHd4TpjxiQDfLblHbhe8F+vuudNV6eO
 K4nWe3CtbL6Zaxzz3xsHeEADHjVGqoHOFlswN0qaTnuigXRU0E89zIbFC7621SYuhX4s
 1WYz0tsKXOjkrPXXjnHAiWBO3SfiGeYaXoq92p2htjOJGBunSJokndjnzYgH9tk3SI51
 yWjA==
X-Gm-Message-State: AOAM533Ngt/w1wCQ/SxhA2CV6JbZKwrpk4/jdrjvFg/aKuWj/LiIJvDl
 kz2mlORQLwwVsxm/FentawwE3w==
X-Google-Smtp-Source: ABdhPJxFoi4O9NxRUrrVKpfUcBRLSIYe+dVsnqllr4zPDEHJwpKwp+KfW95vsKW+g1z02dQbjuvPQA==
X-Received: by 2002:a17:906:eb42:b0:6e8:9197:f0e0 with SMTP id
 mc2-20020a170906eb4200b006e89197f0e0mr13511485ejb.550.1649851883929; 
 Wed, 13 Apr 2022 05:11:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05640251d200b0041d1600ab09sm1162921edd.54.2022.04.13.05.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 05:11:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C22021FFB7;
 Wed, 13 Apr 2022 13:11:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/guest-debug: better handle gdb crashes
Date: Wed, 13 Apr 2022 13:11:15 +0100
Message-Id: <20220413121115.639610-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Gautam Agrawal <gautamnagrawal@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a number of GDB's on various distros which fail fairly hard
when attempting to talk to a cross-arch guest. The previous attempt to
catch this was incorrect as the shell will deliver signals as 128+n.
Fix the detection and while we are it improve the logging we dump into
the test output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Gautam Agrawal <gautamnagrawal@gmail.com>
---
 tests/guest-debug/run-test.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 2e58795a10..d865e46ecd 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -92,17 +92,18 @@ def log(output, msg):
 
     result = subprocess.call(gdb_cmd, shell=True, stdout=output)
 
-    # A negative result is the result of an internal gdb failure like
-    # a crash. We force a return of 0 so we don't fail the test on
+    # A result of greater than 128 indicates a fatal signal (likely a
+    # crash due to gdb internal failure). That's a problem for GDB and
+    # not the test so we force a return of 0 so we don't fail the test on
     # account of broken external tools.
-    if result < 0:
-        print("GDB crashed? SKIPPING")
+    if result > 128:
+        log(output, "GDB crashed? (%d, %d) SKIPPING" % (result, result - 128))
         exit(0)
 
     try:
         inferior.wait(2)
     except subprocess.TimeoutExpired:
-        print("GDB never connected? Killed guest")
+        log(output, "GDB never connected? Killed guest")
         inferior.kill()
 
     exit(result)
-- 
2.30.2


