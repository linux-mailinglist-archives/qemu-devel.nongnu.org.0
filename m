Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3732E8E53
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:12:47 +0100 (CET)
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAgA-0003HE-9m
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMf-0004b6-3s
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:37 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:47037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMd-0006Kz-N4
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:36 -0500
Received: by mail-wr1-x433.google.com with SMTP id d13so29444558wrc.13
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0vkRCguef4QqSP1VfhMnrwC6mUwpGXd0wHoeU0fPcQ=;
 b=bjrAyAQgFUiAPrYpxahwww4iG3ixfY57pqkGA6Pdyz/CmMkAQfJEbNPkoXTz7cdUE4
 BBFUXbPWuwG/Iy7z+PXYMRyAohD16OTMxHjmAOBgKwy7WVBSDxFyTa/dXQtu/WwhokvA
 bQbkwlyR9hHBMwYOdHMzd8kvdLbonlkeUB3cJw5MunCfnKQg1EQAJLVy3ZUGtX7VS39y
 RPVHkx6HyMLqVPBBJan3wtS/+qSQSna596Ir4iiXCm+KFqJI+1I/JkZsd1z+Wp8aO8lU
 8XiT5kpt9eCIqFjmityoK938OifsNs1SMN0TJ64a+lzfusKEi+8zThRbAs23IRRP4zlI
 4Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K0vkRCguef4QqSP1VfhMnrwC6mUwpGXd0wHoeU0fPcQ=;
 b=LjdHMo3J6XlGG1pX1VVHi2HReUEC0meoFom7Z+qGufG1LHrlcee/3VEvT0LVsincqa
 K4/+PinTzOQ0s835NKpa6oE8a4E4HmM9m6M8Na815EGlQqzTjZChaAUt1WYE9kNMKiCg
 p4ZhHq1pW+iqtetxf9u+HPdT8m2TPRzuUEzVFpgX16Ix6YHD9Js0xfma+29Z/mqFnk62
 tYh9FxF0aZGkPzYkL5NMVhqEcSH12KcXsOIjtsNWa7Wp2vnTiDSVM7tZkxRsFXORa23G
 0BfzCLMwwL40DexmBcdkmatL7M5uIJyNCCyqbgpIwKLlt1rIOZ2lVeA/gX6aaCBnU5uB
 RfjA==
X-Gm-Message-State: AOAM530xlqncP0T8G+Gb97d9mLLanG6S3AnZBC/U3RK1TR8G/hCVeGJO
 DEfYAbRmHmQvYuiPPjd/hmlR1inqXSc=
X-Google-Smtp-Source: ABdhPJy+ZIsRcfE2h8raU+9Qw6ERxGKxEvw7Is1YWiTgTiHBpuMN4fXtbHNrl+loJ/L+0kShdhoZhA==
X-Received: by 2002:adf:e452:: with SMTP id t18mr74188482wrm.177.1609707154312; 
 Sun, 03 Jan 2021 12:52:34 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id j2sm85989859wrt.35.2021.01.03.12.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/35] docs/system: Update MIPS machine documentation
Date: Sun,  3 Jan 2021 21:50:13 +0100
Message-Id: <20210103205021.2837760-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Huacai Chen <chenhuacai@kernel.org>

Update MIPS machine documentation to add Loongson-3 based machine description.

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201221110538.3186646-6-chenhuacai@kernel.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/target-mips.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/system/target-mips.rst b/docs/system/target-mips.rst
index cd2a931edf9..138441bdec1 100644
--- a/docs/system/target-mips.rst
+++ b/docs/system/target-mips.rst
@@ -84,6 +84,16 @@ The Fuloong 2E emulation supports:
 
 -  RTL8139D as a network card chipset
 
+The Loongson-3 virtual platform emulation supports:
+
+-  Loongson 3A CPU
+
+-  LIOINTC as interrupt controller
+
+-  GPEX and virtio as peripheral devices
+
+-  Both KVM and TCG supported
+
 The mipssim pseudo board emulation provides an environment similar to
 what the proprietary MIPS emulator uses for running Linux. It supports:
 
-- 
2.26.2


