Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE02D9905
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 14:38:59 +0100 (CET)
Received: from localhost ([::1]:46548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koo42-0007Gd-HR
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 08:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koo2H-0006Fp-Kf
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:37:09 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koo2E-0000Xh-AN
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:37:09 -0500
Received: by mail-wm1-x332.google.com with SMTP id c133so1695941wme.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 05:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwwPaSG7vBom8OLmojJATtpKt1/XvmTNXDby6zmlb3w=;
 b=a0EQh2mUmQOlFeiTegnrZyshTwiie1JG0zDrcLZql6uSA72EhFHgW0mFXssPBEs5gT
 gXZ2VbKK9feW01Jx4LwISr5GoZQHDt8RBsha9Y7/4jBuFu6wqT6JmB83NC14TqqTZuoL
 FtKy+lmAOv27GHaJIpw4cGXWOlOk65Dkb9K8yCNpQSbUmpfqeES9TeWwnrt5tsJLqc4I
 hwj11QCLpRo70Q2jJIAildKKAxW7q0lIJ53bce55zsm5iollq5UgOy+LZtuE++eO4Y40
 uKwGi4IKYWDOcOM75gQK5R8C9bJk8LP8ln3PfPO9Vl8frR9EbEJtPA0vhgw8kofX/Nac
 mszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwwPaSG7vBom8OLmojJATtpKt1/XvmTNXDby6zmlb3w=;
 b=INddkY0keiuRisIUrokodkWhSXf7vE4fXoW6Aq15+5zipj+w7CCQ/nTV0kfQ7jEss6
 gXP3YH/ZxWp0wIqcRDBqEnSYjxeucC48GBNrXsaEr+q4T6ezPnfLPx3hBtjvFS9OpNZS
 uu+1/MX2izAnb8DvNhC4G0m5hFJtbwOrE+2GdY2jFmnecWw7CMlfadvgep0THb6UwqxP
 W5ZlElk0TbUSm+sj6OaVsMjS0WqSwmDP0QbLzc7+EwE2x4t0W3ndG8nvie1hyxBZYcUB
 7NnSZxS6mxwE00+Q4Q4ZzjGuaLlFHA0FJpS3sN+UfDAzy4CVNbsDDr1ZfJ0ECHcymgSJ
 W9jw==
X-Gm-Message-State: AOAM531d2TdYwCpN8BZ/JEx1KzqlxpePkOp9OnJVyqh2qRAQo/VLLMcD
 Q+0Fw/jdbAX3PZy2f/kPDlUhHUrIV4PHOw==
X-Google-Smtp-Source: ABdhPJwfUdFZ73GsMcu7/m4pMUF79sZ1rcWrv9hJBVWHEqhY0SZ/1qP82yAi7w1tCpkSBBSFV1Uaew==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr26838248wma.17.1607953024674; 
 Mon, 14 Dec 2020 05:37:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n14sm31096011wrx.79.2020.12.14.05.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 05:37:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg/multiarch/Makefile.target: Disable run-gdbstub-sha1
 test
Date: Mon, 14 Dec 2020 13:37:02 +0000
Message-Id: <20201214133702.24088-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Disable the run-gdbstub-sha1 test: it provokes an internal error
assertion failure in Ubuntu gdb 8.1.1-0ubuntu1 (Ubuntu gdb
8.1-0ubuntu3.2 was fine) :

timeout 60  /home/petmay01/linaro/qemu-for-merges/tests/guest-debug/run-test.py --gdb /usr/bin/gdb-multiar
/build/gdb-veKdC1/gdb-8.1.1/gdb/regcache.c:122: internal-error: void* init_regcache_descr(gdbarch*): Asser
A problem internal to GDB has been detected,
further debugging may prove unreliable.

This is a bug, please report it.  For instructions, see:
<http://www.gnu.org/software/gdb/bugs/>.

Aborted (core dumped)
/home/petmay01/linaro/qemu-for-merges/tests/tcg/multiarch/Makefile.target:51: recipe for target 'run-gdbst

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a temporary thing because this failure (newly visible
due to a new Ubuntu gdb package) otherwise blocks pullreq processing.
---
 tests/tcg/multiarch/Makefile.target | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index cb49cc9ccb2..230eb9a95e7 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -54,7 +54,9 @@ run-gdbstub-sha1: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
 	"basic gdbstub support")
 
-EXTRA_RUNS += run-gdbstub-sha1
+# Disable this for now -- it provokes a gdb internal-error on
+# Ubuntu gdb 8.1.1-0ubuntu1.
+# EXTRA_RUNS += run-gdbstub-sha1
 endif
 
 
-- 
2.20.1


