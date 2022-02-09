Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB234AF43B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:39:53 +0100 (CET)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHo8O-0005rm-3v
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:39:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlP-0002cS-Bv
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:07 -0500
Received: from [2a00:1450:4864:20::52f] (port=34358
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlJ-0007q2-15
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:06 -0500
Received: by mail-ed1-x52f.google.com with SMTP id co28so5440681edb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kD1cWlFlp5tq13wTXKHmTXaLhYBWNXYav+yptAqplQE=;
 b=SPjzRfSSywEzMCLvIaMi5dBIfU2c5C/phOmj033INDeor91+DROnErwva99/cjKFyC
 q1RaYfZcmiNj9nUTIvjKjRseCK5bvWQ/ZYNuNcMz+OJZQPyTyYHgkKNJpDcH215AwZhJ
 Z2PVRgpFWNtFSTCNmBprVEmz34zj3BXM6o+7VuRDV+nyoDTeGRUup6fSaOzC6pqOK6xh
 vhEf/tGm5nymioTUojy/3ZM7mrX6U2hXRx/OvwXmQ9PDLhGA0gJ76w1yRhNQ4UXHzh2h
 of/2Pg/swqqRwLbB5rnQxC0zxiFLIYYQQYYLeRiXI02ma6dGTCh0yr1B30ZGzy2vN5Vw
 T6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kD1cWlFlp5tq13wTXKHmTXaLhYBWNXYav+yptAqplQE=;
 b=tvXYFNtrua0+K9QaC58sQWmLXhfMROQilILC3tJ31Xu6vC4hfsiRSeYRkZLW1BROf+
 QNk4f4GbVu5s6fMha4udXuaMPRD+iasfJ2Iawnpt05Xg9bn5VPSuzldfK9ql9v0wYytf
 J30OW9H9l72OZA2aeGVl4CLRAk1Re5U2bM1sFpX8C/D/j5vuninieps1vgx+EvZf+xt4
 zZJGB9zACjqwaE8394XtDQZf5sMW4gNfzn/JD/Vc1GTyy/pkm4o53Em3HgaUcvlzudPB
 aB/TEoiMp1qBD5jnf9DBo5nMI29frEoQFUchd/rxA+N2/8GsGynbfiZFtFpXGoYQIDJx
 lmxQ==
X-Gm-Message-State: AOAM533PT5XRLbXjiQw9WqeQ49KyrvfRUkxOwJASkmLiYm40iXlCespL
 hZhgtC3G/JFooFXXge+zlNdsSQ==
X-Google-Smtp-Source: ABdhPJx5jW/95entivXTii/IZUKE+xyurqcQJJrJmUvW17K//m/rnOwwaeEYzi/p3ibFUc2XD07fmQ==
X-Received: by 2002:a05:6402:40c1:: with SMTP id
 z1mr2659881edb.23.1644416131097; 
 Wed, 09 Feb 2022 06:15:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n25sm4848300eds.89.2022.02.09.06.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D7371FFB8;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/28] tests/Makefile.include: clean-up old code
Date: Wed,  9 Feb 2022 14:15:02 +0000
Message-Id: <20220209141529.3418384-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is no longer needed since a2ce7dbd91 ("meson: convert tests/qtest
to meson", 2020-08-21)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220204204335.1689602-2-alex.bennee@linaro.org>

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9157a57b1a..646c8b1334 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -34,10 +34,6 @@ endif
 ifneq ($(wildcard config-host.mak),)
 export SRC_PATH
 
-# Get the list of all supported sysemu targets
-SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
-   $(wildcard $(SRC_PATH)/configs/*-softmmu.mak)))
-
 SPEED = quick
 
 # Build up our target list from the filtered list of ninja targets
-- 
2.30.2


