Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F803655E3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:08:56 +0200 (CEST)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnJP-00073K-J1
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYnHH-0005OP-F3
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:06:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYnHF-0002z1-Tn
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:06:43 -0400
Received: by mail-wr1-x433.google.com with SMTP id p6so30273134wrn.9
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W9OC2SjJKjhNFFm9KsgAbw8ROn42bCQlR3gdLS6tCkQ=;
 b=H1E3JnqPo2YloCZSHSSPZPhQ4wBws991yr0AKcGiXBHpjFY3cBz6MRgarlIuTmqFyJ
 ujLLgFt45MoJy88+YWBubN9nokYDIIb1DGZYXgmVadhEGI3T1Rt5E0RetTSyPnb3QESs
 9dJcBklN0hLEkEeZWpIqjvxDJFfQ/CWjP5x3mb7ZtUEzNw+4pQQhKXu3IH6t1mZnETG3
 VRjonCGsA5x+UNFiY0AHcA4kEoDq8ofAKcTxtv628y/f8014XdzWCZKXV+HTPNc0Iypt
 Bi/2AbWB8HTy4I+zkPMipCmQCdKVrPUHhIv0lCFaOQrd5aenzfvXoiK742ro907J++sW
 2W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=W9OC2SjJKjhNFFm9KsgAbw8ROn42bCQlR3gdLS6tCkQ=;
 b=hb4nHJIINiU1422NHCVzv29HsK8MpuykJS/BkPwWCa7wdP3KGVOuzXDfhV4TU/3I0h
 tX2QEltchoQxlshWzixa+Ys9DD/8s10/PcMzURwbj1KNA3tH1EOJ+r02hDqdVR6pj0Xz
 dNimQFzTuIpMHPA3g2oO2LLsAZ/iD9KB7uucXO5YqSi+zRwA7cVOTjGNIco9FjaL31zB
 jF1PIgfcHw8xqIjCQ8TpVtY+q7jQ1Ts0cWhhLPf3/xlNEe4wUZMabHgOmVenYY1t0RWA
 wtJivsUnuKx0GvWa9VzSmcJmCirxJ/NWdQjqgfBpMZEsqduFCyTk/QGWyYN/FsByyH1r
 ZQYA==
X-Gm-Message-State: AOAM530Ak14i3ubPIA4czPfZVs/yZFtxg+pCKoG3IvAON0PmUjRzje2r
 KKM+Vm24drbWJyvxLDoTJliMeDW+EVLQwQ==
X-Google-Smtp-Source: ABdhPJxnczl6o+2AHuOM0KGavix/f/RHopswEkgf2x3wB1sslpX5MSKgQbX6enwKejfh7yz8OgqGEw==
X-Received: by 2002:a05:6000:10f:: with SMTP id
 o15mr20234220wrx.98.1618913194674; 
 Tue, 20 Apr 2021 03:06:34 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o125sm2831656wmo.24.2021.04.20.03.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:06:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0 v2] target/mips/rel6_translate: Change license to GNU
 LGPL v2.1 (or later)
Date: Tue, 20 Apr 2021 12:06:32 +0200
Message-Id: <20210420100633.1752440-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When adding this file and its new content in commit 3f7a927847a
("target/mips: LSA/DLSA R6 decodetree helpers") I did 2 mistakes:

1: Listed authors who haven't been involved in its development,
2: Used an incorrect GNU GPLv2 license text (using 'and' instead
   of 'or').

Instead of correcting the GNU GPLv2 license text, replace the license
by the 'GNU LGPL v2.1 or later' one, to be coherent with the other
translation files in the target/mips/ folder.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Commit introduced after 5.2 release, during the 6.0 cycle.
Harmless and useful for 6.0-rc4 IMHO.
---
 target/mips/rel6_translate.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
index 139a7524eea..0354370927d 100644
--- a/target/mips/rel6_translate.c
+++ b/target/mips/rel6_translate.c
@@ -1,12 +1,11 @@
 /*
- *  MIPS emulation for QEMU - # Release 6 translation routines
+ *  MIPS emulation for QEMU - Release 6 translation routines
  *
- *  Copyright (c) 2004-2005 Jocelyn Mayer
- *  Copyright (c) 2006 Marius Groeger (FPU operations)
- *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
  *  Copyright (c) 2020 Philippe Mathieu-Daudé
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ * This code is licensed under the LGPL v2.1 or later.
  */
 
 #include "qemu/osdep.h"
-- 
2.26.3


