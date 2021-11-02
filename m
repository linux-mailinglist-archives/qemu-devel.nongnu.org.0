Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7802442F58
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:48:51 +0100 (CET)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhu9i-0000J5-T1
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu40-00077u-3U
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:42:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu3y-0005wa-8S
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:42:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id 133so6463386wme.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/xEM6vLjAWjy6ZJIHvYWNvgWXnKjywi5uLYZJGHzmE=;
 b=cpUPYV48r+4jB0BKZZNCGg8rubkzc34VE5gD1jwdSI4kn0wR7cnSHMSRkVv25XF5Yy
 xPsBA+W5PDQrmAk2vfdZXmShdLUTZsXXqlhiiy42+6k4Qirj+9Mt98sS8E1YcrqTyZf3
 T08XJtgnMilGnHtD7Qs82D15V2c/88WAmKsWUIFziRGdhGiIAuVfhxKeka83vPO8UEHr
 XP/LzQwiW2jTaCFVpdTtvMY6PladH7SYAPtt2WVMMjWNsv1mCWJWxMOpyBsJ8iTEghN9
 JlKELjHtJ5nZaUqTJX3/sSHUhmx12QtDo+cD/961y3RitE/Hy2t5MC1Pq1334fwMnDrS
 AUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j/xEM6vLjAWjy6ZJIHvYWNvgWXnKjywi5uLYZJGHzmE=;
 b=gYTE94sa1+7xd3bgl1Mp7CWmWjE6VeoIMkTCkSmhJH/7XX3VaipJZ7OLZaZaolVwIq
 y4hdaArmI46pYIBgSGpEUtFXVUkqFssWTl88EOCySkrGXoWAbb+IqLB8SG0WuWxkehaK
 DBt9pzg2C5OAWPNBidMJSrwfNfWnxPv9sc9Mqt3v+IoDyBDNr3nMJZwPU0oGQUnG79Dw
 ydjJQyIk2cxqOUe6S+zujFONgeIoqX2tx+vjui7moX2mpMbmu0Edn12EMkRp9VPUcFab
 P+RHZyGGDqYRAbvC4GwZ5AxjpG6HhKXXB55h60VvnALPDsuxrsapyCxnTEC+ce+kMIff
 t77Q==
X-Gm-Message-State: AOAM533YNbPLx8UQ739rz1c7b1YZQg0BFWY9VYLVeqE1TOXEm2OcDuk+
 ZKDGvcOlHJPD9ph36KarO7f3Un4BS0g=
X-Google-Smtp-Source: ABdhPJz4oxyGdR/08nX1VxHXHYuwzyeQyGS/2mhveDoCpTNyVWX4rnmOH/VJihHjp8CUCDJrKwSlMA==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr6988317wmb.183.1635860572542; 
 Tue, 02 Nov 2021 06:42:52 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 v185sm2550116wme.35.2021.11.02.06.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:42:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/41] MAINTAINERS: Add entries to cover MIPS CPS / GIC hardware
Date: Tue,  2 Nov 2021 14:42:01 +0100
Message-Id: <20211102134240.3036524-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS CPS and GIC models are unrelated to the TCG frontend.
Move them as new sections under the 'Devices' group.

Cc: Paul Burton <paulburton@kernel.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211027041416.1237433-3-f4bug@amsat.org>
---
 MAINTAINERS | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a156c4bffc0..684990b63da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -239,14 +239,8 @@ F: target/mips/
 F: configs/devices/mips*/*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
-F: hw/intc/mips_gic.c
 F: hw/mips/
-F: hw/misc/mips_*
-F: hw/timer/mips_gictimer.c
-F: include/hw/intc/mips_gic.h
 F: include/hw/mips/
-F: include/hw/misc/mips_*
-F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 
 MIPS TCG CPUs (nanoMIPS ISA)
@@ -2272,6 +2266,20 @@ S: Odd Fixes
 F: hw/intc/openpic.c
 F: include/hw/ppc/openpic.h
 
+MIPS CPS
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: hw/misc/mips_*
+F: include/hw/misc/mips_*
+
+MIPS GIC
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: hw/intc/mips_gic.c
+F: hw/timer/mips_gictimer.c
+F: include/hw/intc/mips_gic.h
+F: include/hw/timer/mips_gictimer.h
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.31.1


