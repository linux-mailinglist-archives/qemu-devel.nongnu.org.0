Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847F442FBB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:02:47 +0100 (CET)
Received: from localhost ([::1]:56404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuNC-0003Aw-Ju
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu45-0007Rh-Lm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu43-0005x1-2i
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2127254wmd.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+6os92o+OmHs2GzDtEOA7Zk03dLIh2eNcVK+D5fvKF4=;
 b=M50F7ZedAOyT43Qvas6r98r2sApvd+pUGx2bIem5C++4ohuRVm9dej3ljT385ZySZ9
 jE0GLQ5lAFd2zM8XjN3qP+Q2gn3GWC8PSnup5rwFuXkrcIYK79sIi3FIzsrcn3q/RIiE
 rpogVifDeKrZTrayBIbyGnxoACNJqv+yIO/rBmcFgSIJ4/YqQr729M3SAWkfE199Qm28
 aGp36yq89lsOVCbT7UYx3dMKYH2O5BQsQfzK7hzOFe0psHg1UatLC6O7BKgPh0l11sS+
 VsjrIfXj0fn6swPixW1vYuh2CFvG/G6v3LJbiDlwamZx/td77TfXQj4pmh3bgKCaZw0Q
 mhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+6os92o+OmHs2GzDtEOA7Zk03dLIh2eNcVK+D5fvKF4=;
 b=U+hf8pDwis0EIYPjxukLt+DVqf2xNgquWc5QNeYGLQeKH8CT0BLOgwzRUXkRJqVUVi
 3XLnSv3RzoN4/YvOnEvz0mw5+2FGEBa4BpEXFCbrzWaechDZvPteoxT8h5BXeV7NmNT/
 u3PGNjwO2BXbb9mM07EQWOVdrxarc1wo0tS4aVc6zcGScxxnaXEShfuRovHK32aQp7QQ
 eyS7vFuj9eCv5HorMTPU68bxQ8DrvbWP1yZJZgERsXurxt4eR6ra6rHdVd2lPr7fIUoh
 OMRkK+gFAZxrOlcRVlbivag11+ApkOKz8R8+YrM54guMmhrrhdB6J/Wbv4NJHYd2ENrL
 4hHw==
X-Gm-Message-State: AOAM533JM/TKyjXDXhl6zejAZ880T2wNk5inGXCfLh7ftRHHrstMYb5Q
 e4bDoWU2RZta/kiZueXwouwvf1TmP+M=
X-Google-Smtp-Source: ABdhPJwKfTSj9Qqa62cVgvMBaJwTaywTMxZ0oj+o1PM2/BqILseVxdAmAmCX7XLFb7xkr8q1mfelkQ==
X-Received: by 2002:a1c:f601:: with SMTP id w1mr7069392wmc.112.1635860577525; 
 Tue, 02 Nov 2021 06:42:57 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 d8sm13778935wrm.76.2021.11.02.06.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:42:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/41] MAINTAINERS: Split MIPS TCG frontend vs MIPS
 machines/hardware
Date: Tue,  2 Nov 2021 14:42:02 +0100
Message-Id: <20211102134240.3036524-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hardware emulated models don't belong to the TCG MAINTAINERS
section. Move them to a new 'Overall MIPS Machines' section
in the 'MIPS Machines' group.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211004092515.3819836-4-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 684990b63da..d58885d9b91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -236,11 +236,8 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: configs/devices/mips*/*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
-F: hw/mips/
-F: include/hw/mips/
 F: tests/tcg/mips/
 
 MIPS TCG CPUs (nanoMIPS ISA)
@@ -1169,6 +1166,13 @@ F: hw/microblaze/petalogix_ml605_mmu.c
 
 MIPS Machines
 -------------
+Overall MIPS Machines
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: configs/devices/mips*/*
+F: hw/mips/
+F: include/hw/mips/
+
 Jazz
 M: Hervé Poussineau <hpoussin@reactos.org>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
-- 
2.31.1


