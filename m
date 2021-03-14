Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E6833A8ED
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:50:44 +0100 (CET)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaVP-0002q2-8P
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaRn-0007zx-Ij
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:46:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaRm-0003CK-6s
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:46:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id g25so7094639wmh.0
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rVI2a6u1OVdVkViPot1TNwScg4C28/AcdQyGrXAd9nw=;
 b=XUqlSC7XEYv4tnG1weRRZHn46djRC55aEgStFLNf3M5poiPc9WxluOl3dfMSblZD0z
 FbLyYpfPuREqsgXCzsZlaqzRHDme8DGcRn2i7TALCF5zsAOgElkmGAWAGFEwDeAYnkzc
 RKKkbP4jSw7TdhoZu5lHnVKszlaSYr99o08OGH30p+tc51BaenZWGGAJIqhxjQvFulT7
 S+YYCwRxK9FDshkhq5bleM7pwnNcFpwMFaV12KNGfy7yNEBILhA2b1PKHxZJEyn9OJu+
 7hg7IHR2fcGP04PMMyDdqfMhkLmCycj0n8LY+/O0H/i9R52NTRJHaLWZezKqgH8pigMM
 IlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rVI2a6u1OVdVkViPot1TNwScg4C28/AcdQyGrXAd9nw=;
 b=Vy89Xp3MYoe6DVZPcUm8eYaSdY+07CZ0+0CNHB92lEk9bx13oIXKAUQSlvSpycHh9p
 gZNkIgp0c6P32ADIt9uMIYIqg642l+N9rKSN1K7AYZBaCQCdFStVHHOLSxvwNqNNgxfH
 uwKNeNAs6R4ou984TL6giCWwslwbMsnoDLvwF4YHzcYvmFaxBSsvNkvh8k1zO60A5SML
 fKWT/3yi4sia7p79DLI+zTRRX3NlVrudQXaziGxD/ocCOEvegegi5AsRr1aD/6IuBYPM
 Zgqgc5B8oH5NwDIVSMYLhL72QLqwLLhCQQZfil3Z2l5KccNhK/6P+smkLx9ikyLVHldQ
 bSwA==
X-Gm-Message-State: AOAM5329jCReLmSvGipEX2nXyX5J8U8rk/Ps/VLQCgHCG6IYyTySxjTm
 R3PAYPbm8dbVrbXX4Rl+6G94c1BetfLx1A==
X-Google-Smtp-Source: ABdhPJweYELgaXrRSBqlhpZ7KSQ96sERAn15ePrxT6fMg35j5DYvXUJ+786AOMEWdy3Nv9ec2FsPrA==
X-Received: by 2002:a05:600c:2946:: with SMTP id
 n6mr23157169wmd.52.1615765616522; 
 Sun, 14 Mar 2021 16:46:56 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d204sm10810969wmc.17.2021.03.14.16.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:46:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] hw/misc/led: Add yellow LED
Date: Mon, 15 Mar 2021 00:46:46 +0100
Message-Id: <20210314234649.2614590-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314234649.2614590-1-f4bug@amsat.org>
References: <20210314234649.2614590-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the yellow "lime" LED.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20210313165445.2113938-2-f4bug@amsat.org>
---
 include/hw/misc/led.h | 1 +
 hw/misc/led.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
index aa359b87c20..29c08795708 100644
--- a/include/hw/misc/led.h
+++ b/include/hw/misc/led.h
@@ -27,6 +27,7 @@ typedef enum {          /* Coarse wavelength range */
     LED_COLOR_BLUE,     /* 475 nm */
     LED_COLOR_CYAN,     /* 500 nm */
     LED_COLOR_GREEN,    /* 535 nm */
+    LED_COLOR_YELLOW,   /* 567 nm */
     LED_COLOR_AMBER,    /* 590 nm */
     LED_COLOR_ORANGE,   /* 615 nm */
     LED_COLOR_RED,      /* 630 nm */
diff --git a/hw/misc/led.c b/hw/misc/led.c
index 5266d026d0b..f552b8b6483 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -20,6 +20,7 @@ static const char * const led_color_name[] = {
     [LED_COLOR_BLUE]    = "blue",
     [LED_COLOR_CYAN]    = "cyan",
     [LED_COLOR_GREEN]   = "green",
+    [LED_COLOR_YELLOW]  = "yellow",
     [LED_COLOR_AMBER]   = "amber",
     [LED_COLOR_ORANGE]  = "orange",
     [LED_COLOR_RED]     = "red",
-- 
2.26.2


