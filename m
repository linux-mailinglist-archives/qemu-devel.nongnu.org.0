Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB32327D3B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:29:54 +0100 (CET)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgkL-0001uh-KV
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lGgiT-0000wR-Gd
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:27:57 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lGgiQ-0008Kl-W0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:27:57 -0500
Received: by mail-wm1-x336.google.com with SMTP id w7so13189935wmb.5
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+PYPcuFyHeuikEhq4+AHJnu4qFa01zkID3CWnAeksw=;
 b=U4jRvFoESoLRm1qBzvkKMTBolf/s0v3JFrPg+C5NSa49B5BsBjq9LE9RxRlMKhUHY5
 Qjwb3WpTXNdESi/dW9Rra6BvOrS8M3or4/njeoiLO+546vAx18tAE5Lp9BHjqZKJPVJ6
 ldA00PS+bihi2Z+TEGF+5Lhchi/i8FPD201ucuYGvQvHYCzlRv9YOkjBY/IwJD7kGgcv
 If/Qln5Iwogrb8z8lv0VnCTcdGKth1ExBa3FUrDQBKRjz/s4shdkL+gWMJLtr3JWtiZX
 vSOuIKNN+NztQYlvwj2PqAmO+RIUSZEfWapW6Kk/nEwU7m3obXYR1JDvPgvSTuexriI8
 +3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m+PYPcuFyHeuikEhq4+AHJnu4qFa01zkID3CWnAeksw=;
 b=Z+PpU3LP42CM5R8Rzzt/thHDzS6o4zV6NnddZV9l2PlZaqxQnylRjIJ2kISEhJfLaK
 q5/ixjgmTzQuxjDV0nPRSBIZFtD5UyPJBP4nUIphDCr8Kq7UX73/Q7eKiUP+8NRjJreR
 3NyBMjZnrC/ni8jAogz10FmVkNzGGk+PD9wl9FPXMNxOEM59YLSxJTfIEpLPUXyYstH1
 mMpMgRfMD6amKc+ASPZkkLSEO7h2nY4wNjDF0y21xJ+jnz7/yP6nZe6GYf2rTb67kvcN
 Mc7vl62PUJqVOsabZi/a2ycaBeWvLUIs5zUKxillLttDHzDvPhLqbbz75WmhlRC1ZhQs
 o8hQ==
X-Gm-Message-State: AOAM533gLX1ZALSNId8nSYYP45UAg45jiNOm8wcbn1AnPGISMWVx41X4
 phOqI3Jlr89N3kwG4ywjYpLW0g==
X-Google-Smtp-Source: ABdhPJz+JgNyEvhxbeIz5eNj3zHV6PgtFhy0FpyQNMJQ+oqnYIyxrPslQFphpbx1ug7Abe7xJfQ4+g==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr15642321wmb.14.1614598072255; 
 Mon, 01 Mar 2021 03:27:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm22357497wmf.28.2021.03.01.03.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:27:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9AFA81FF7E;
 Mon,  1 Mar 2021 11:27:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/system: add a gentle prompt for the complexity to
 come
Date: Mon,  1 Mar 2021 11:27:41 +0000
Message-Id: <20210301112741.31047-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 armbru@redhat.com, f4bug@amsat.org, marcandre.lureau@gmail.com,
 stefanha@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We all know the QEMU command line can become a fiendishly complex
beast. Lets gently prepare our user for the horrors to come by
referencing where other example command lines can be found in the
manual.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/quickstart.rst | 8 ++++++++
 docs/system/targets.rst    | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/docs/system/quickstart.rst b/docs/system/quickstart.rst
index 3a3acab5e7..3498c5a29f 100644
--- a/docs/system/quickstart.rst
+++ b/docs/system/quickstart.rst
@@ -11,3 +11,11 @@ Download and uncompress a PC hard disk image with Linux installed (e.g.
    |qemu_system| linux.img
 
 Linux should boot and give you a prompt.
+
+Users should be aware the above example elides a lot of the complexity
+of setting up a VM with x86_64 specific defaults and an assumption the
+first non switch argument is a PC compatible disk image with a boot
+sector. For non-x86 system where we emulate a broad range of machine
+types the command lines are generally more explicit in defining the
+machine and boot behaviour. You will find more example command lines
+in the :ref:`system-targets-ref` section of the manual.
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 560783644d..145cc64551 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -1,3 +1,5 @@
+.. _system-targets-ref:
+
 QEMU System Emulator Targets
 ============================
 
-- 
2.20.1


