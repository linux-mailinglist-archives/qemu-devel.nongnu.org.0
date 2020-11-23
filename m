Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7581C2C04F2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:53:03 +0100 (CET)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAOz-0000sj-7L
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFj-0004GU-KA
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:27 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFh-0002gb-MR
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:27 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u12so18332911wrt.0
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uODcsvaiXPhZsJr0rQIAVtEP4ktkLs/t7lIz3a7KTNM=;
 b=gVfwqlx+htYnx/2OAxLxaR6LmmMmupynC/rXPNRjs3szhfUWWwQAArQk9Nod2g7lYV
 jWDhbFCYLa7NyXkATI4dNcLIzz1Oxjkvd8vHuggPsasj2+G9jNDIa/c+FtIerA5Gzv+l
 9V1qKxsPKavYIeohQNT/oIa0FstDqSunCr1a6+wCLGX41qc1ChScAG7OSxyKhs8lHaEp
 7uKasMq51onGav1OXU8DCgJ7v+C5ouwuqJRHqS0X6YEdJCwXQs2TyMYOQ+YXxaP3Ohdn
 /BAugXuopuVE4s+zlG14plw3mf8C0QvwqpKNT2Q7f48hVK3euGItX4xcw3g8LnkkvPE9
 Mr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uODcsvaiXPhZsJr0rQIAVtEP4ktkLs/t7lIz3a7KTNM=;
 b=caTcZ3YpSDEzqTx55q85ojMulk99dC7ex6oZPdlQ3klx3jyAiSVWNvfilVqIIseT6f
 i4IKyH2a91OCk11YxY4+RhJ/NC0/P1YrQ0R3m0kHMApktbKMAMpWUXjYLbRNcd0cr2Er
 gpZlr0q0fua+7ctX1Jel0XB1GDPKPYnCt0v5q4ilLBHQv7gfmg7RZr7/QP4uAalvV1w/
 i5FfvrNamPoSduft8Wn8ezQrqJUKqx935a4Qli+vgaH4QSfGvY9Dddiwy9XV3bZ73D2u
 5Bmnf2xZnFWREJFOK4cS8fVH2ayXBZtLot8oP2/7X4auT+0XSxB1XQi/MVL+UkIDgQhh
 G1Cg==
X-Gm-Message-State: AOAM5337ZWl5kUVQ2IsyKiZqIIU7xqSXgf74EmakLS8/xhxZzDS3i+l4
 5RaFnwjtRgcJlZMtv0dOi4AXwCIpaGHtLA==
X-Google-Smtp-Source: ABdhPJy0KeQM5f4aW7P0vCAUDmVMwix9gQoHfoduSQBR0Q1qK43XdXvtQtzP7WAQHb5psN83Tw2XFQ==
X-Received: by 2002:adf:f3cf:: with SMTP id g15mr11777090wrp.71.1606131804115; 
 Mon, 23 Nov 2020 03:43:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/24] MAINTAINERS: Cover system/arm/nuvoton.rst with Nuvoton
 NPCM7xx
Date: Mon, 23 Nov 2020 11:42:57 +0000
Message-Id: <20201123114315.13372-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201120154545.2504625-4-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 02f8b6f696c..5e478f9a26d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -763,6 +763,7 @@ F: include/hw/*/npcm7xx*
 F: tests/qtest/npcm7xx*
 F: pc-bios/npcm7xx_bootrom.bin
 F: roms/vbootrom
+F: docs/system/arm/nuvoton.rst
 
 nSeries
 M: Andrzej Zaborowski <balrogg@gmail.com>
-- 
2.20.1


