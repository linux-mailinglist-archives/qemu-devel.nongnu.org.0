Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565732C04D4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:47:36 +0100 (CET)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAJh-00015A-TG
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFl-0004Lt-Dy
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFj-0002hl-QW
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id g14so3068689wrm.13
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4ivn/ktLPx5Rnt+negJ2Tzjd+4/epqKGGhH+Jrx5AP0=;
 b=mVBvafUkFqyFTgliPjP4phf47+6XpvIqiWegtOkjIBGnokS/o2SGiqdAEbNtw3Bcuy
 RLHHnp1Yh0gTx/myU4BDS2gutusb9z6HTUlMp2BU4gSa9K79t3wrRjVBOjwZzGUt+wuh
 c/goraLANVyuM1/uM/knnfX77JrLbU7KVsEvqKZToiw+njk2hIilO77BpNIG5iWOmju4
 3oEvawmjnjHj2GF3T9VTXX7e4XbwWst9EwSuI+0mboRfq2BrMtr+/tA0eFyzucV8a2VX
 VA11Bj9NNC/0+zqdy0uEkzRy8F/dxZIVrqeU0YOnmjtxMQtzd9qADU1ho6sNNXP8R/RY
 Bu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ivn/ktLPx5Rnt+negJ2Tzjd+4/epqKGGhH+Jrx5AP0=;
 b=Upi2AU7V2JqEMjoI5kMNSTNIJLBxZuj8xyayNtx3HQyXflkmEIF7eCzr+s8F3EoBGH
 Q1A12G3qEEcDK3UaOB+r56YIn7tG0R+hO3+/yMIe1vpjmEuZ+5HYxHWlPYeJbJDRJ61a
 fpG5BFybxIzV755CmWo43ZAD30Kva+zmetdsUuM7O7xs+Vx6VPbr4doA9pEnrQmK4ZpS
 ZRRJARW5nnE/AAlOxjMpxaOvrt7jtpd+vC8qzeoEu/iYHYAyuVGvIH4D/fMeQejBO+fH
 mpsLmpwtjM7LGxGEt48/mYknXQsuIhiO9NKWqMeKJ2sql6odk4l2THhwQwDnLfdWgAq+
 T1rg==
X-Gm-Message-State: AOAM532fCSVMjDeBkEHjbAWO0jtSnjCWhhbJvk5D8qax6RMojMLcv/0Y
 CVdV83KsERUOEXGT6ioJZ2iF2eYOgnZaqA==
X-Google-Smtp-Source: ABdhPJwAdK7GRM/VcAfAF57BVigQfcZqfsd9MjvpCBQIwxeF8KqHU8NtFlR0FIYq1Td8TeNPOc5DXg==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr31943301wru.115.1606131806297; 
 Mon, 23 Nov 2020 03:43:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/24] MAINTAINERS: Cover system/arm/sbsa.rst with SBSA-REF
 machine
Date: Mon, 23 Nov 2020 11:42:59 +0000
Message-Id: <20201123114315.13372-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201120154545.2504625-6-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e653ff70d9d..33e44b023ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -857,6 +857,7 @@ R: Leif Lindholm <leif@nuviainc.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
+F: docs/system/arm/sbsa.rst
 
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1


