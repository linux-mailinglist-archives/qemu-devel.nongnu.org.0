Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2703829C9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:27:52 +0200 (CEST)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaTW-0000pW-RE
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaIA-00086o-6B; Mon, 17 May 2021 06:16:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaI6-0007r6-U7; Mon, 17 May 2021 06:16:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id t206so3271607wmf.0;
 Mon, 17 May 2021 03:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OM0Xw/rV3yz+iBzh8iF1sG1Ag1cNd5+jV+6HvnOVkoc=;
 b=Xns4kAXusJgsWLVnVkea5mmIYjfZp1KE5gIIe2WznJKGr2ZcDlFze5jr8Yb1MDr7pi
 4CPqWpvOKhA67u5uuDy+weoRC4MLDm6vMFsjmwiuwX2BBIpdVFoQCpF6IH7Y+11nF4DU
 NBfCp14JgxBkkcnb6mt+Q8Y/sNa+GX5orJNMc7lLP7t1kHvGvl3HB5iiuxFKhxKLHuh7
 Bpjkct3zNSUq9si1ibd1kzB+8LQXe+imKauyX39eCmHfLHNTtTKZisYuN74Q2UcrAT9J
 iARLQYPqZ0OQNKOfzwd1BooX2HiWrRZI3uRfehGlEdd/5f7cUaDL+vuX/z6n4M9yf0AS
 E52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OM0Xw/rV3yz+iBzh8iF1sG1Ag1cNd5+jV+6HvnOVkoc=;
 b=cQSpM/PluDEO9NccEjK4EE1NN6YoOUi/f95OKRcl9wcWAuC3tRbY5Dx2dlZLjT4EiK
 gFW2CFYSSzE3cQ398iTdy4HHXwMa0k08f34/CTZI0L5n6KhQ63vaz7/DHzDcB2bSkV0/
 CMINM23JB6Fslrko3ggdqUdXRSaLKiw38Oyk/mEHGlcmOkHid+y4sRnTEUwdM2FeLKbp
 r7ToLUkhHnXKUsdaRzk9hVcumS4v7JJhxvcV1ZGJlXWbqpQM97RM35102qNTSO+BVrHh
 XbKHPxHlBCP9gMA6FudO9pBAxy2RAgpcF6Ispnae7P9V/TdROx89jxkMIdSAcpweddsQ
 h0mg==
X-Gm-Message-State: AOAM533mPAqy5sUjHbSI/0Hcb7hCg4QsDe1iEIjl1HeOcq98Bl7PNeRU
 GHdLw7/mWZZrsYq+plDpQ7K9/f4qnNC0WQ==
X-Google-Smtp-Source: ABdhPJxcY0LF0/ydnchdb/i+FyKysS3nMJ49mijOFoH+wQsvPshJ6zJX0ee8fqsIEo7fVan8xjz6Xg==
X-Received: by 2002:a1c:1f84:: with SMTP id f126mr5462185wmf.140.1621246560935; 
 Mon, 17 May 2021 03:16:00 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a129sm3482221wmh.20.2021.05.17.03.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:16:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/hppa: Remove unused 'memory.h' header
Date: Mon, 17 May 2021 12:15:58 +0200
Message-Id: <20210517101558.1040191-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 61178fa6a2a..748270bfa31 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -22,7 +22,6 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
-#include "exec/memory.h"
 
 /* PA-RISC 1.x processors have a strong memory model.  */
 /* ??? While we do not yet implement PA-RISC 2.0, those processors have
-- 
2.26.3


