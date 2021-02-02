Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47330C006
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:49:00 +0100 (CET)
Received: from localhost ([::1]:54364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w39-0003g5-Sx
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vup-0003lA-10
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:23 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vum-0007Kq-5g
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:22 -0500
Received: by mail-wm1-x331.google.com with SMTP id y187so2337537wmd.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlWeBHf67ZPSXLHh3ZHd/dyct4POq9RDrDJY+meho6M=;
 b=cfxkUmySa6ma09z9U2Yy/vrDl9DwW8EmwO4yecLRJxP1lCi0+owL2F0Jz+N1LelOT9
 61mSMJ5OAhjGogT7Y0KN0qHM2B0ekkTNpWALpZmkkGzCbXFQyZN5/jfAf226Ao2Z+Aga
 RvRA6erG8tKeiNN2oRjnDb6lN0W41BNIGvtoIo4Anwczwu5wMg9TYhumCnrm46l2nU2F
 shYp5sFx1+R8sdXhnr6y3suooXV5mgVqcubzNQH5rN0rzX4fAYWIB7HAqGwoRdQ4Jbpd
 JciSDAPjxNT7398K+lJyp0QRiwttZKS0QY/SwETbz0Knz0pkY66Z/zXhCPp18JwyKpyO
 t7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlWeBHf67ZPSXLHh3ZHd/dyct4POq9RDrDJY+meho6M=;
 b=D/FCv6PNSrXyHL3ggbBMKrMom+FFknpM5jFVUb6ZvewA+Ffm2VPmAO0tkSR4rQuAV+
 klS0l/ExcoHZVqRSfYhZcTkrQ479tHYaEz4WbhXe4cFggJ3Zmg8FGqpfix46C1OFVPrO
 RcN13hmEJtFMCh7rbb371wZFuN8fDXZEKL8rF/pB+nC6U2fR9wXEzbYiUbv4jYX0T5Ak
 ZqxgubII4QBV/rrc4EwA09fXUemfpc5zUNyqk9+AyqZEv4CMxnNMfmhei5T+cjm80TX1
 uOCefvp5X8l7EjaMeDvaYNFQ3by53XeSnLJKY0TEOloclMGwB+FBjG/XsVGlibg6bcCh
 agkw==
X-Gm-Message-State: AOAM532HbQFtbAUkIZIc6WInG9w5BVDIAQXNtiA8C/MCIyS13kgvGN9x
 2T7QDNrLbN5mA/RvdTA/rvnHdQ==
X-Google-Smtp-Source: ABdhPJwgRwfN5mdrLq/TcRrK7k9lyOWOyXmDxBMjzsUJvHf5E2ut4/oePrfCiu7FOuYaIBpKcxfsGQ==
X-Received: by 2002:a7b:c1d7:: with SMTP id a23mr3718222wmj.149.1612273218872; 
 Tue, 02 Feb 2021 05:40:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m12sm3352997wmc.10.2021.02.02.05.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 110A01FF9A;
 Tue,  2 Feb 2021 13:40:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/15] tests/tcg: Replace /bin/true by true (required on
 macOS)
Date: Tue,  2 Feb 2021 13:39:56 +0000
Message-Id: <20210202134001.25738-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

/bin/true is missing on macOS, but simply "true" is available as a shell builtin.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210128135627.2067003-1-sw@weilnetz.de>
---
 tests/tcg/Makefile.qemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index c096c611a2..a56564660c 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -90,11 +90,11 @@ run-guest-tests: guest-tests
 
 else
 guest-tests:
-	$(call quiet-command, /bin/true, "BUILD", \
+	$(call quiet-command, true, "BUILD", \
 		"$(TARGET) guest-tests SKIPPED")
 
 run-guest-tests:
-	$(call quiet-command, /bin/true, "RUN", \
+	$(call quiet-command, true, "RUN", \
 		"tests for $(TARGET) SKIPPED")
 endif
 
-- 
2.20.1


