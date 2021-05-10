Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AF2378C3F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:27:36 +0200 (CEST)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg50Z-0008Cs-G0
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yw-0005XJ-Tr
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yv-00038m-3S
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x5so16403576wrv.13
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SY9Eq14QwthAWesAyMtT78+tvNWJIa5qNzpG4zNe6V0=;
 b=VQB0Sp7mg22cLnnYLLq4fd9/DEHZIoQdDw8+saruK+ACYtTRoqmcKlVOm9+7JR6QqK
 4go8vG8bEPZrRkhnN2nS4peJ1BCDOc76fzUSzN1Fhui9bQtQA6I2WSELxmhAtcrhem2B
 mwF4DFx9KXpp5U5M2XRXyvrpAe2c+VbU5LdLEaJ4Sv47D8SB+J9lfdXxritGv21HLfG4
 3u9A8IVAs+R/H0A0pbeNThRI8TiIM9r2/eampdsJrVQ6APeH5dfSUWeVKAwFzFF+Nj1C
 V2xyu2eq3f1xDEnoegoNWh9v8YU7jB8E/GfOG8Y6TakgWz4vjlrhtxuYPFCAXXoxd3B1
 a7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SY9Eq14QwthAWesAyMtT78+tvNWJIa5qNzpG4zNe6V0=;
 b=BchU/Y8NlFOq2Ycqah6vvxN5rN1fOw1LnN1t+uXttPa2JOn6iD25Vtl8Nyd1kbSU/V
 fwTp7nO+UxqOYfvKOEm0sqFgvt9+KP9UgEZe/xaJJwnHn3Q7S4Xvr65wG5LO3ekEkftS
 8m1T1mHNPCesOctbbPKJjL0smXW8C1xW1eg81dEQS04vXblnyfO09O/yS3Hl5X6RVbzp
 wuiUiF2YZTwf3+y83obGcWN/2UaBLuAvG0n5251Dra3gH61zqJFQ13sGdhl+UCwYF/Ck
 sBUlO8yWut9Mqp7erp0x5+KDfvPrTdBRaDVwvZTmrMOtjj8aK6uguU+q3Vofp0hE+C/e
 dybg==
X-Gm-Message-State: AOAM532eNZ+ETC85aVphBXzmWI7YifEsQV2QxcOpa63UEjb6pkWgOdTH
 CJQgvhZawyKO3mbBoBpwIfzT+Oysx7QxHg==
X-Google-Smtp-Source: ABdhPJxPVIGuaiJnb4HVkTuiswFpBSL2maD6SyUtPQ5xMhkqrBlcoa9G0B1yBKlpRtmsIh+82UNd3g==
X-Received: by 2002:a5d:4d52:: with SMTP id a18mr30322493wru.45.1620649550909; 
 Mon, 10 May 2021 05:25:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/26] docs: fix link in sbsa description
Date: Mon, 10 May 2021 13:25:23 +0100
Message-Id: <20210510122548.28638-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

A trailing _ makes all the difference to the rendered link.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210428131316.31390-1-alex.bennee@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/sbsa.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index b8ecfdb62fd..27b0999aaca 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -4,7 +4,7 @@ Arm Server Base System Architecture Reference board (``sbsa-ref``)
 While the `virt` board is a generic board platform that doesn't match
 any real hardware the `sbsa-ref` board intends to look like real
 hardware. The `Server Base System Architecture
-<https://developer.arm.com/documentation/den0029/latest>` defines a
+<https://developer.arm.com/documentation/den0029/latest>`_ defines a
 minimum base line of hardware support and importantly how the firmware
 reports that to any operating system. It is a static system that
 reports a very minimal DT to the firmware for non-discoverable
-- 
2.20.1


