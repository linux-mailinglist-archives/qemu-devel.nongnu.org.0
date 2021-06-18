Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FE93AC7AE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:34:16 +0200 (CEST)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAtC-00031S-GU
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luAs6-0002AO-6q
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:33:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luAs1-0001LY-1a
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:33:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so5354104wmq.5
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 02:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yJGw1onS3sAu67B89YKyP5ewRvy+OGKHnz6psVnBeI=;
 b=oLgY+XYSwjRt58BXxc07fQXqpdZszBhfsno05BS+rmJ4cMsGZlkzx2rcz0dnp4XFzw
 BCX1y6ipLedIE4NU/5bEv5CI+rdVZFYyDaq4DvcmZT24spqOJ+DqMoYWtJ3DJVHTXs3J
 QH+QaY5/8xUgf2iAOnkln2J59378pJU6AQypHWyhsmzrJyvxewo2IICTgdATvPy/2QRA
 eRxGDUrQoZaNXzCKreUEMvXisuvupvCsML/JJLmu4vX0MtpCpjAaF2KelQEJp8fj3NmX
 uHP+SZvBesI+8iMX2DQSA/a25Wyt9jVDMyH/PPQ71/MnU8D7GravwCerlVR1MKronFMn
 XTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yJGw1onS3sAu67B89YKyP5ewRvy+OGKHnz6psVnBeI=;
 b=bJCfkAhXr+ty85axCwBRT9AsR+SLNy8zxYVYNhB6F4adUZGv5jk9F1pf3jEE4oVA69
 Q7iw1fguY9FhvJ0nY/n7QDZ1nLUqWB7JP3luCxNZwpXt0h3MX2yHnF70KGxLkMz+Zecf
 JhMJPUXGZ3J9b8rrqfIDjeHIAUCABZ/vgnjgTngAww2pRi1t7FX86TJeJBFbTwI5qXTE
 MJSgxjOW7uauPfUdDUCJy+jS86Es59aTR69aZ4Q1kWYsFmYy+pH3+yGHK2VHzr4pmwwI
 TfKef4kS60C1OF7GwTxkfu2CKn69KGHaco9MvCGdZKbBkRzYPUqM0N2Vqs498iDMLDIY
 ch2w==
X-Gm-Message-State: AOAM53308Ta1faXNVHUvecqx+5w+DHbnE/xn8K3Su9wOI/zvAYOu0C04
 lEPJ/wtAfisfWFoTpmqWKgLD9A==
X-Google-Smtp-Source: ABdhPJwbQYTU5aHvfLYisTsBaOJfcPY1A9Ud2zMmJu8TJ2WIybueMnYwkgGlNbTcWpzbM5YnTf9O2w==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr10324807wmi.58.1624008779245; 
 Fri, 18 Jun 2021 02:32:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm9948565wmc.44.2021.06.18.02.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 02:32:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BCD3B1FF7E;
 Fri, 18 Jun 2021 10:32:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/tcg: skip the signals test for hppa for now
Date: Fri, 18 Jun 2021 10:32:53 +0100
Message-Id: <20210618093253.25074-1-alex.bennee@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While Richard has some patches that fix the instability on other
architectures the hppa signal support still needs vdso support before
we can make this reliable. So for now skip the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/hppa/Makefile.target | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/tcg/hppa/Makefile.target b/tests/tcg/hppa/Makefile.target
index 8bf01966bd..71791235f6 100644
--- a/tests/tcg/hppa/Makefile.target
+++ b/tests/tcg/hppa/Makefile.target
@@ -4,3 +4,7 @@
 
 # On parisc Linux supports 4K/16K/64K (but currently only 4k works)
 EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-16384 run-test-mmap-65536
+
+# There is a race that causes this to fail about 1% of the time
+run-signals: signals
+	$(call skip-test, $<, "BROKEN awaiting vdso support")
-- 
2.20.1


