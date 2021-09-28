Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35B41A52F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:15:53 +0200 (CEST)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2eu-0007CS-3y
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QX-0004dx-Nc
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:01 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:36360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QT-0005or-31
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:01 -0400
Received: by mail-qk1-x72a.google.com with SMTP id p4so39281914qki.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Axf/AlajWgYqNQeZh+H3y8dgIcJPGnXr8g5Xd1PG7h4=;
 b=zLwMOOmwfaByqnPGiFd98CpmvVqazxbNVR4bnNw1AYTdy2bslcHsLWM75va2RRGCt4
 XdAgJSXa4ar3ILRYHWSyJysserAqwYeyRJea0qN/6Nb1pXKub8TVWxFSdB54VIphTC7s
 +klYq9WpbpzewramYCjz+NxzpulwSirzMJ/aYti9mmH9AYuZzR5l0J3kev64zBdrhh61
 aleDzCGXo5aOGbDV9ACbxiNLDLfxybG2CdcCJdDCZtavr6x6vAdzP559l56wOeLbOL63
 Cb6+UCT+W8Us7QiYqi8qdGyWOKz8Ev4WQqW80Q0kiY57tFrfMCoRIZplusoAG5+aqrCk
 QxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Axf/AlajWgYqNQeZh+H3y8dgIcJPGnXr8g5Xd1PG7h4=;
 b=CeeqW4ZoKxnyjaUtbJQCxHqjWWxiKGuW9iniAHObUpWjJFg9vaZN0sqbyb8RKwJQN4
 Jp5iY9fyyUz9m6P27s+zQC3s11GmJR1YzDfJDSv2nhIRhfmm8vN2Xi2bZIzJpUyRaj2d
 1wSm+z7Vc3Kh0rAme8TjhzniWw7nDBk8IIn1H6xEGSufvCfeKgiDqW9kzOtp7WkjYnrV
 FPZkrFDbtcOM7CNTEY875a+fYIhvjoFu59uUhTXcyx0qnW4WtOHrik3eMws+l7twH61p
 EANr2/qdwn5s371ULrlBrXuKVGnYROSsYy9thZROQHNhRjN8yLxqX6YAlTx02DPzGdeA
 OtoA==
X-Gm-Message-State: AOAM532BrgB2pxtSNPfzUlqWBFsGeLgUXvACXiIVievpOaoms549O6j8
 m6s+UQ97+vcAYaKKYq9b+Y+6uuj4haICMg==
X-Google-Smtp-Source: ABdhPJwDtFF94YO+t3HfLOd9d1KIHia01U4V3M7GM7QhS/GVIch8fLHW8umavdAhgpofnrjF07odVQ==
X-Received: by 2002:a37:44c8:: with SMTP id r191mr64612qka.507.1632794455434; 
 Mon, 27 Sep 2021 19:00:55 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/25] linux-user/nios2: Document non-use of setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:30 -0400
Message-Id: <20210928020039.184412-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index aebf749f12..fe266c4c51 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* Nios2 uses a fixed address on the kuser page for sigreturn. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* NIOS2_TARGET_SIGNAL_H */
-- 
2.25.1


