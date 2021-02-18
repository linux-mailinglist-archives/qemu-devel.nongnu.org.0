Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACAA31EB2B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:56:06 +0100 (CET)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkir-00026U-N7
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeb-0006sq-51
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:41 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeZ-0005dm-AT
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id m1so4213112wml.2
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eJ2mryPZyGxmrHSucm5V4T5lhVL5/SUxYpq7hW0/TjU=;
 b=Zd6L2bCbithGXbyLs0tB7b4tU/L92XgGyCVS62gjkM/WkwqMJ0nEdyin6/G9vsZYOj
 ioT/V54adfxgCqoM49/DNPFKcq5U4Bxu9g9zLhUk5X6SIBxpvxd2mBJK0CLHlYnOIlxg
 kOTaENs06gI86DEDYJf4C+2IVy6ufWaLp3BI97LXwmxKEJcfoXwBcUpHBz7rnnyM2M/d
 olg5E0oy1zGLk4yYMUuJoDI+Jdvo3yZrgau47O5TEXRgo+B83uIIZC4ipSi+2PmgRS+K
 N0M6X/aWuoWAaSksgDNT36DYMchRZKMfoXQc20yrw73tRAsJo1M9ff9DlK0g15cAW4wx
 4yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eJ2mryPZyGxmrHSucm5V4T5lhVL5/SUxYpq7hW0/TjU=;
 b=LvLsgze0wyJIFeSuumQGFS58/3fSbNfCImIqXTJwMitDKKzCcAaKBMF0YsJ87lm9WK
 eYNBSk8Rz4JM8chH5gdVGQPNEPyHElsxqmSzKAEFJceNxk5lop2VL24V+h70taeSnf0v
 lSBZ2skw3yRY8KHLU8kDZOGvQpkTZ6MVJYS/vDAGKm3Zaj+I3IayP5nwqRjmgjoJZ0tI
 nHKN8MMxfecaKoIudSppEcgpharN0GmB0XXY3pdMWL7S1bc1KZ6aD+T7VN5keSUyjokD
 kxHhXEF2d36TE8cxCLMSSeaAWTyflWE28ft9ivzAWBXaX5QbMIaJ1QwlgZnMXAzSG5OQ
 9q+w==
X-Gm-Message-State: AOAM533gjARB8uK8ev78gVTDd3PY8ce2yImzEYwddIAKIZiZ7wspLSyE
 913KXIncvOZueuQT2AsOL9QI86EYpFc=
X-Google-Smtp-Source: ABdhPJxPukVJWqxuXYHeajHavzMotijwV13NrSuLmcrfy025sGeCiA365VJO17ZYFtJU3gEBnmaHPg==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr2773412wmk.58.1613659897246; 
 Thu, 18 Feb 2021 06:51:37 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm11387917wrs.45.2021.02.18.06.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 06:51:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] target/sh4: Remove unused definitions
Date: Thu, 18 Feb 2021 15:51:11 +0100
Message-Id: <20210218145111.1591763-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218145111.1591763-1-f4bug@amsat.org>
References: <20210218145111.1591763-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove these confusing and unused definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


