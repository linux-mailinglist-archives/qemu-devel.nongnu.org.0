Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D1F36344B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 10:05:06 +0200 (CEST)
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY2QS-0003Qv-EO
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 04:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lY2PG-00030L-MK
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 04:03:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lY2PF-0007Zr-47
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 04:03:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id e5so2111463wrg.7
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 01:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzNNaD6toomvGpveZKV6Ql7ayGu32RwRtZ+McGHJSjc=;
 b=HG/QKM97iJf+4imCRO6/M8rFC1WBneGqwwZ+lmFtluLzc3Cx7aSwx3GfaEirPrERuI
 vw7svadiCD5+z0wgGhhZPgqwnd7k6U5B1OFyD8B05yfymuw/QgS4/kZf4K8okGOEO60w
 SpVGe3s2rbW3vyI1117Hi5W4QAY/58aHsbPfWu/gnKYrESEG0rt0R6yCQlpsg4ZPCAEZ
 9zbRAVlRJPjBjkw1xQRaFwN4SXF8GOFoc9Yioy7VNlL9RKHLn0p4yAd5d8JtdzdSbTk4
 vUCeQG0JqFQ4QcgkyS7cE5fVayqr/yn1F3LDSzZGL6mcQwLSwceSQuq0tstaeuDGwDz7
 OcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qzNNaD6toomvGpveZKV6Ql7ayGu32RwRtZ+McGHJSjc=;
 b=UBJzuDFEKel+LeIqyOtpayNYwTw5SrAXY61ICJuU7b8Lfc3GaBt9a0ruXYFfZ8CwK/
 D+9CW4h0al48E97gxJAk69NKnOdCM/AsuIFjWAegtrv0E4a811+3n+5BCv3C9ncGAath
 L4D27pza0UGMREkzLHAb3KjafM1Xdn3leu6UG2+oSVN3946XPma+wYLQQ8IOeXG7dEar
 rZZ7r5qrICnUWrV0p5+RafQ1l+OqjpcmSvj63LzWvWHMCYTUceXyMWodaBbRwwDvkknn
 KzaeEJA1WCud1JYgWW86weipg2SsHSsIgnKVUGqA2NVJlcn5U4+oiqtdNVmmN4lmtfVL
 s2zw==
X-Gm-Message-State: AOAM531/Y+7/2Rf1CBihgb00XgFXcpKi82WjvQJq6DUe7Boj2ugtlBHp
 zKhv4Kro/vuuGRP8Tl9EEGpoWhfZdZoFEg==
X-Google-Smtp-Source: ABdhPJwGUtun/NeQVmAcTJK2PPT94X/bPFQ3PnD0ck3pJ1WX3vDrt1sM7uaSkzBYMcsIEwO230v9ZQ==
X-Received: by 2002:adf:e790:: with SMTP id n16mr7752619wrm.278.1618733027426; 
 Sun, 18 Apr 2021 01:03:47 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p18sm17564045wrs.68.2021.04.18.01.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 01:03:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0] target/mips: Correct the license text
Date: Sun, 18 Apr 2021 10:03:45 +0200
Message-Id: <20210418080345.926981-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The license is the 'GNU General Public License v2.0 or later',
not 'and':

  This program is free software; you can redistribute it and/ori
  modify it under the terms of the GNU General Public License as
  published by the Free Software Foundation; either version 2 of
  the License, or (at your option) any later version.

Fix the license comment.

Fixes: 3f7a927847a ("target/mips: LSA/DLSA R6 decodetree helpers")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Commit introduced after 5.2 release, during the 6.0 cycle.
Harmless and useful for 6.0-rc4 IMHO.
---
 target/mips/rel6_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
index 139a7524eea..c5843cbc5e2 100644
--- a/target/mips/rel6_translate.c
+++ b/target/mips/rel6_translate.c
@@ -6,7 +6,7 @@
  *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
  *  Copyright (c) 2020 Philippe Mathieu-Daudé
  *
- * This code is licensed under the GNU GPLv2 and later.
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
  */
 
 #include "qemu/osdep.h"
-- 
2.26.3


