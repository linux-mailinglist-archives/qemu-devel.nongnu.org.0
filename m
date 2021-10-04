Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212642081D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:18:44 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXK7P-00068o-5i
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXJUg-00029b-R5
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:38:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXJUd-0003pi-9D
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:38:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t8so29449375wri.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5HdIPyXOgCBn34giHGPu5/Ze6lFlkv9Za4KS/r242jE=;
 b=Rr5X65AQ3BkFFGSDezHMDFl3UHvKDOQzyptpbbvc9ITDCSJ+njA7Dw+um+I/bs92Tg
 TVtP8NBCK+kl9e0P7sYTYXBZJ1NPdPUsuK5IzUJlltR5f2vAyd2hmsXnPXNvHwicSY8i
 OhSmiWoYPYpElM1JFDcKwanSoUaz0K0Hl+D3yECuXhBIYb7qq24yzuH7u/WXe3Aq20mP
 pt1r2UN5UD+jlXGQc01TU869TNQUY0b2MFkltvJk7ILSmcQt74prP8n/oD/f9l9vOpDJ
 gAWiRBqSYBp3EyWaOlI0AmgKzTu0mhIPS8TrkZRrfEs07B0i4Xbv0FbfwkEKzWoz3yTR
 fVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5HdIPyXOgCBn34giHGPu5/Ze6lFlkv9Za4KS/r242jE=;
 b=cH9mUVO2Aixc4xTPOwhsUp9xDd90U5/ymDGO+seVFopXbq9DngBEsGCHzRzFaW60kL
 s/IwV28I/kD5+NIwxudWY85RRuMFaTmET+GXTKgw5l+LaPzXhfFJRInksh1oIOZxwcs7
 78AkKUsnI2AR+3OJa2VtbmTTmUT4mt/Rl8ClM8h/EqNz/F/AiqaDHSStRilaBwVL7dyn
 OGLmFulZmaTHst7PqTfUGLbC4pVQr9mUsm7ioyL5fOQpeayNU93l68D99HO2pLjU+hRn
 M1oqr7VwwqzlWpUjsHZDgJMHzS+S2WZb0RWsb4zK6+cXqcNcmzxZsNSTX4PogDMQY89E
 00AA==
X-Gm-Message-State: AOAM530IWiE/Ex7i6bv+gR9+UoyusVffwvSCrvtc0MqumlwR1/GlJzqz
 uyaMatvggG65KvY8i/azivsIO3WYtfM=
X-Google-Smtp-Source: ABdhPJx1XR4lzxxjScixSZVrCbc/S2PU7LCNqBzzwXv0Jx4x+YRqNj5BZXv9F6IZF8eTYxOKjkxzqg==
X-Received: by 2002:adf:fa0d:: with SMTP id m13mr12880162wrr.418.1633336716844; 
 Mon, 04 Oct 2021 01:38:36 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c18sm14477243wmb.27.2021.10.04.01.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 01:38:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
Date: Mon,  4 Oct 2021 10:38:35 +0200
Message-Id: <20211004083835.3802961-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hardware emulated models don't belong to the TCG MAINTAINERS
section. Move them to the 'HP-PARISC Machines' section.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..002620c6cad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -205,10 +205,7 @@ HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: target/hppa/
-F: hw/hppa/
 F: disas/hppa.c
-F: hw/net/*i82596*
-F: include/hw/net/lasi_82596.h
 
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
@@ -1098,6 +1095,8 @@ R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
 F: configs/devices/hppa-softmmu/default.mak
 F: hw/hppa/
+F: hw/net/*i82596*
+F: include/hw/net/lasi_82596.h
 F: pc-bios/hppa-firmware.img
 
 M68K Machines
-- 
2.31.1


