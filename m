Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742A736A37D
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 00:24:44 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laQhf-0004Y6-In
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 18:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeI-00017n-Nk; Sat, 24 Apr 2021 18:21:15 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeH-0005k3-Dc; Sat, 24 Apr 2021 18:21:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so51929917wrw.10;
 Sat, 24 Apr 2021 15:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+dFOkI8bPZaiK79ThIQ9LdlMB5G45m7AJVe6I7EqgU=;
 b=LUPFyRfYd/6E9Dz/JYPhuaS7QsXcfHwnogWrO2VNOxv8WJ53TRL6sdZUar37d8BdwE
 MLEXd9qmGwNW3xUUGtzE0lq1UX2z+cOKneEMvypSqZMdPvtQZAT9spyl8kwUI9V43/8n
 Xwvxu9oWElqw1N1RCfIplnw7MAPE4NunfULzgVQU8z0+h1MLC3LdJN9XcKrqDhOmlMwr
 g3vWAWxZBeOU72NTqHNsiHPBBiUYT8v0Uto1w0FILUQaWu4Lyz4tFDIalZBM3dLCDk/R
 SR/aZM1njmOtO3gaajKHjddgDH4mmLz+pAM50Qer+mrO5KS57+4drJkWM0md0kwnuCNX
 L4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3+dFOkI8bPZaiK79ThIQ9LdlMB5G45m7AJVe6I7EqgU=;
 b=C21sqHoBiJpISB1FKjCPj9kFq6r+ai9RA68tkwnBXm5dt0q9x2Xz3qazGaSO4f9Piz
 iXggJQP0s/DkhFmi73adO14hhIlYj5+EGdYjpPpu7Dkm06KxXpLrSA/APFha2dIDPf96
 CiU5YXvW6Tnn2yyPkJ3Hunqct2vcTTC12nvuNrDYkh3hLAFF9AgmahcMaXw2U4n0KNrs
 ApEfsgTAeTxcGal+Dk/OhAXDH2AoKXNDi22EkweSSFpKmMEqSJhuY/sPKPB1OteRR297
 ZEcZY+w0je/wiJKET5gBLrmDg9Emzm3XtZpgivrd3u4hpxBVuBZKqCjygWARzM/qLEM3
 WaZQ==
X-Gm-Message-State: AOAM5315RBIV7eRjs0VRD38wnSnyTaRJbs5Gjli9VnwPkobRaST6BVhb
 RRggQHjHYuzoZLybH02C55JSbU4Yy3D6ow==
X-Google-Smtp-Source: ABdhPJw27TvlrH/oWkS/+4Ylwl7fSAXXVSu3gFGct6a7zgHm2DVcrNvTbY1jD2WFKux8jggWHsmj2A==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr45309wry.265.1619302870880; 
 Sat, 24 Apr 2021 15:21:10 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m14sm13589558wrh.28.2021.04.24.15.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:21:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
Date: Sun, 25 Apr 2021 00:20:56 +0200
Message-Id: <20210424222057.3434459-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424222057.3434459-1-f4bug@amsat.org>
References: <20210424222057.3434459-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Microdrive Compact Flash can be plugged on a PCMCIA bus.
Express the dependency using the 'depends on' Kconfig expression.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 5d9106b1ac2..8e2c8934549 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -41,6 +41,7 @@ config IDE_VIA
 config MICRODRIVE
     bool
     select IDE_QDEV
+    depends on PCMCIA
 
 config AHCI
     bool
-- 
2.26.3


