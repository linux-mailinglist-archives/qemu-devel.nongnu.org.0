Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20623067C8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:24:03 +0100 (CET)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uAN-0002xz-0O
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8l-0001K8-2s
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8j-0006Gi-MJ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:22 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e15so3067986wme.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vwNqOiA5PW40PQw1O00kFHSY1G6Pg3UV8mvbDmHKFwE=;
 b=ejU+uMffEJ180KMbpTYRAzO8WQfWdt3WG1jAi13CcWyjj2ahWumVdUHuTPDFxnq7/A
 LYXUts0GofDqz5G/QxQEMD1BwLaJ5UywkOoINPUQ3Fh0b7KSnmwNUWvKhz0BDyC/oQ/u
 h5MEth3diAOAF7tdWK4XVGYri6Xhuajj9dIiuRQGMwAerTtsxGU3o+H+t+fyMcO4vkPa
 y2FdfRvhz8ajWicu7cJOZMxAtNsU0FXIJKp5+UEf4hoBBMdTkF9Jxu1UQxmwFKOf2sdl
 R5A+l3aXpcLUUU0vepC8w1KxmINHViT0t2nU8j/yaFXwRN1mT3W8FcENhYYYeUDp8WHw
 ITUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vwNqOiA5PW40PQw1O00kFHSY1G6Pg3UV8mvbDmHKFwE=;
 b=joDZn9q9PQebxTI/QqEObHcTWZiKoKR3/zqjmaPR8nLys4asygF86yrswZ627bHd3Q
 Svgfo9JxwVPjZS/ps7MP2fxFNcjoEFR90ezSCNQyd/NNCJMPOzzIpBrOtfR9smvKJDs8
 GPZYxhZnY/PSvpkb9LmVA1oTYuOLf4WHe8C9sGFHPYRbks8yZ2m7JXK0dc8WG1ThnGXn
 4J92Tn2fBzb2C34JoJBl5VLZUy9UvGEMujybT/pq1ibH68wZr/SEtCK5XfeFo7Lne2sM
 ELe51FCQCYnYbeEY7gKddBn0QiJBIaCDG5iNuab6SAS30Aso6T9306nRJ6MlHgmSB6Dh
 xQ9w==
X-Gm-Message-State: AOAM530isE0yfNbLVaSYwhmPtKDCzkHPETCxJj7CFkXF19KklBWVj+lP
 dm/OYHmwoQ4893jZXKMNQCUPv/nVPKc=
X-Google-Smtp-Source: ABdhPJw0KQBWxfEg6MW3XHMuCpJ8N/VC1GdEPhgtQ3hUqPmQygvBvYI/pWDWWZ4plnkVJixpLDDJkg==
X-Received: by 2002:a1c:2c0b:: with SMTP id s11mr5800716wms.13.1611789740220; 
 Wed, 27 Jan 2021 15:22:20 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y6sm3887566wma.19.2021.01.27.15.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:22:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] target/sh4: Remove unused definitions
Date: Thu, 28 Jan 2021 00:21:51 +0100
Message-Id: <20210127232151.3523581-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127232151.3523581-1-f4bug@amsat.org>
References: <20210127232151.3523581-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove these confusing and unused definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/cpu.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 714e3b56413..01c43440822 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -271,17 +271,6 @@ typedef SuperHCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-/* Memory access type */
-enum {
-    /* Privilege */
-    ACCESS_PRIV = 0x01,
-    /* Direction */
-    ACCESS_WRITE = 0x02,
-    /* Type of instruction */
-    ACCESS_CODE = 0x10,
-    ACCESS_INT = 0x20
-};
-
 /* MMU control register */
 #define MMUCR    0x1F000010
 #define MMUCR_AT (1<<0)
-- 
2.26.2


