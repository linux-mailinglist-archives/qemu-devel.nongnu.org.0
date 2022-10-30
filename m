Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42F612D70
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGqN-0007Yt-FO; Sun, 30 Oct 2022 18:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGq5-0007PR-S3
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGq3-0008C2-Dr
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:33 -0400
Received: by mail-wr1-x434.google.com with SMTP id bs21so13674595wrb.4
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2DAvAxi1UoKkJ0GzuWn+f6o9F6QiQgdHldLL+8BJrA=;
 b=GrASW2XqPhzDe2buRxO4zhYZRq+13mHGih9n0LYeswCrRjpIV0Lzw3P1YGsvsVzZMZ
 1DnM0vhWdJvd1mNRoiaEICApT9LqMgYq8vC5cxUVjXelyLhaP6F9nH+B8kZsvfeE87Pm
 fUCfuy1IqwdPVRX3fK350CrFCFQa+w5FSzYiqy/BDizXjcm/exYIYWMKJ3pEfy9zVP0u
 SgDOv4e2KNTJY0RID1/EX+CDWcqI4fGUNhSLMNHmaTab6s2Q8tvWN7gAIrBknFV7RxWb
 LiAGns5wmCpGQjQ3ZNXrq9aGE+tRq8vkguu9O5f8r0n8RMSWlwNfb+2c6sCMVJ9wMB0z
 2Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2DAvAxi1UoKkJ0GzuWn+f6o9F6QiQgdHldLL+8BJrA=;
 b=Onxme1d6+Unbchw1hgZpE1VC/QlBMLGUxmiYyj3vic4dCoKnDqNJti/1AwDS7d8vRB
 VjQjCcIhccgrh4PB86QOtRLcJUjv1IEp0RGztGXShxFCIrb48q0crArK5YJ7uV4H1OKN
 8H6OWCfm/xE7WYgVhtYU62wK5bGH07OD0cff8o2YkVd9GznYm3JCLkIGqnXiuduDbyR/
 16gaEHAOipW7nEha/u8oGaNVON19+b9WWT3mU00TRqglOMnzbYtS5i2v8hjm88qOEyVd
 9wWjXg7v8F7BYI4wZ9s614e12Hxa3TKapnuKliRK5SFneZXo0HdK5xaB8XzGfybjEYFf
 zjkw==
X-Gm-Message-State: ACrzQf2yUA8mGdEHROaE3Tyh2IJnOwC9ABLmibyIgOd4KQDVa4JBg9t7
 eBPIQikkZuYeWJq614GK9JUakiRVQ6pTTQ==
X-Google-Smtp-Source: AMsMyM52C3x/W46s0mcJWIjPRAcR54LiiqE14EyKX/TcwhoDrudJxcZdyzjXK6+LG9c3ipXmRsdQtA==
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id
 p15-20020adfba8f000000b0022cdef31179mr6090703wrg.571.1667169089791; 
 Sun, 30 Oct 2022 15:31:29 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adffe4d000000b0022afcc11f65sm5228711wrs.47.2022.10.30.15.31.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:31:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 25/55] disas/nanomips: Delete nanomips.h
Date: Sun, 30 Oct 2022 23:28:11 +0100
Message-Id: <20221030222841.42377-26-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

Header file nanomips.h has been deleted for the nanomips disassembler to
stay consistent with the rest of the disassemblers which don't include
extra header files.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-12-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.h | 26 --------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 disas/nanomips.h

diff --git a/disas/nanomips.h b/disas/nanomips.h
deleted file mode 100644
index 0fd7299900..0000000000
--- a/disas/nanomips.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/*
- *  Header file for nanoMIPS disassembler component of QEMU
- *
- *  Copyright (C) 2018  Wave Computing, Inc.
- *  Copyright (C) 2018  Matthew Fortune <matthew.fortune@mips.com>
- *  Copyright (C) 2018  Aleksandar Markovic <amarkovic@wavecomp.com>
- *
- *  This program is free software: you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation, either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
- *
- */
-
-#ifndef DISAS_NANOMIPS_H
-#define DISAS_NANOMIPS_H
-
-#endif
-- 
2.37.3


