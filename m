Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFF39BC5B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:57:14 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCC8-0002wO-Te
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8P-0002HP-56
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:21 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8L-0008MO-Uk
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:20 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so8215266wmk.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VydS99WQVqx+ym7s6ppugDiseMCd9bc+7KSAd2+foIM=;
 b=d8VWgbOfZnuu1mRgSriDmrd+UlQFOHJFhDh4AVTwPPW7YAh2cthrWurREZLLC7MKcQ
 uw2wu9zbbFPivCW+Br6usiYwz1IwMy8ylMmpzynJPiT/DTafq+bdPSaDzODoE2eX8vGH
 IKPf6q7crBG08MwtnXp9irnfMBA9TJWtprUO9taAiPjjkYTPJ4A9Y0O/cppP0CA5u7qH
 pYcoEUoyTTdfKhg9vRmmvfOVYbrYmG7aIAULdVJLcPG7ovL3Aycy9u3kKzR1V9LvMXaw
 LyBin32NpmXjwNdWCzEf5DBLikMxcKxuGWvcac0Y2J1NmTy0X4ELJuxPadIkMuDPp4lh
 3Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VydS99WQVqx+ym7s6ppugDiseMCd9bc+7KSAd2+foIM=;
 b=DVAP6wKeayakZ8eDNTRWKe/tzoR17qd5+UO8Mdk5WhZhFK2m2/7Yg0Zi9uVLy7zbDd
 Y9BAqBUsbszQPIpbK+RIpmJ98IMBwSXXMqRV97Up/BsGvqMLDFeTuxZrzwxNbjaBGB9a
 37UiZHpBaE7RkQPxLfyNZNR7fgj987+HNOM0Aq3DKC+WXj7dSkLSLGigGekoIR3W/rNa
 b4lIThiaLeo3/TMBOYJLdn/ZNwieGMFkfYkcoAI4fTNMty9+qTeMjSwekaurqmpVGBnU
 hiTlTiHPLRFWAh8MBuk5K4tub8ey8TxMR+aOFWmBst94q8yhFiVvWPkJj6PuEsrM19M+
 9Qhw==
X-Gm-Message-State: AOAM532q4jpyi69nSVgpXlWemML555utx1+KBM03v3sd31xq51IAx/2P
 zvF2F4t9k4+o+BnyMun+1anP9g==
X-Google-Smtp-Source: ABdhPJzQW7oUjaCYviGoJOnjOWcdXQSbB+AWU8JaI39cpje9osRaSMwlnLyHlVNbZzQg8DZzTy0lwA==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr4374471wmh.86.1622821994736; 
 Fri, 04 Jun 2021 08:53:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f20sm6989289wmh.41.2021.06.04.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6EA4D1FF87;
 Fri,  4 Jun 2021 16:53:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 01/99] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM
 TCG CPUs section
Date: Fri,  4 Jun 2021 16:51:34 +0100
Message-Id: <20210604155312.15902-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We want the ARM maintainers and the qemu-arm@ list to be
notified when this file is modified. Add an entry to the
'ARM TCG CPUs' section in the MAINTAINERS file.

Acked-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-2-philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96a4eeb5a5..1ff68116b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -155,6 +155,7 @@ S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
+F: tests/qtest/arm-cpu-features.c
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
-- 
2.20.1


