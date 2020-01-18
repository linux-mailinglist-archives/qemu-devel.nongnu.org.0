Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641B14193C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 20:42:40 +0100 (CET)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1istzT-0005u8-49
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 14:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1istfU-0006ae-82
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:22:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1istfS-0007r8-Jk
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:22:00 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37610)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1istfS-0007pM-BK
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:21:58 -0500
Received: by mail-wm1-x342.google.com with SMTP id f129so10819862wmf.2
 for <qemu-devel@nongnu.org>; Sat, 18 Jan 2020 11:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FO1i9jNY/IqNN8OXTh2PCvWPjBwlbpfjWssHyPnRa18=;
 b=qImf7M5EQ99XuQFvror3XsENnmzxKFdvcFOuudghmB2Fbla4po5PelnVkSOKQWqTbM
 CqmofMnjVS27k2Hq3Xqxe73CymoPiQ9sCkA9AnxKaHLsg2V124VYLEwsvEyOO6GzCwmY
 obQoajy017nSUZzeAirKu5+kZnxupQBHOnZqzIJPJmiYiES984LptKgnlJFZnEGy9b4N
 SJxUifh3uYztQOu517bLDP3SfM2+ANRiHTgcH5XWweFUiH8+WtrHj6HPFutI9/IEsyYF
 oY3TWtbXqyQ+Mrehf24xpJj5TeuISfus0zJGc6+wok4OXXN0qU3qxC4DhT+2nDK7sU1U
 x6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FO1i9jNY/IqNN8OXTh2PCvWPjBwlbpfjWssHyPnRa18=;
 b=pefLSq9xmwNSkxRmQanckfDonnhE+XR6dLAbcojSF6bjRxQHxzxNyOxhwbC/zfRHl/
 VQCMPNfs8m0rMelE0EjTSns+FsKo1j0zhMl9RNvksshzB9c5Pzc0MyYQm70zQVXZMp+H
 s6AfxZ1/4Y6HNQNDuUP2zj5h3DucxG8QJTNSU4v5P4O8+ALnvNpPZuMVNF5VVuZEtEbA
 oP89zdVWKfm4pCwREqOaMhcnReaYrichxpNwzl/DAIeLor7Hj6v0kVqjWfWDZYsAKEif
 FA0fLFjJBnxn4NIcMYEV7zgoif201VnlkB6GzWTF1fZS4zLkGx+R7IFgCTq/zatTz4oE
 OG6w==
X-Gm-Message-State: APjAAAVHYHiq9pwxc56IGDUj7RLOQj2bgzU/odtGcDre1snIisWb+avW
 YYUFlT0IrvcBNjic5l8ann/5ws4VC4i965U0
X-Google-Smtp-Source: APXvYqwab2NOFlD0egcRdDcdMt2BJXDVFFyoRJY0UCiIpsXfu3DoEqD7zW89351X0RxWGK4NajO/tg==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr10808505wma.5.1579375317202; 
 Sat, 18 Jan 2020 11:21:57 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-109-65-108-13.red.bezeqint.net. [109.65.108.13])
 by smtp.gmail.com with ESMTPSA id o16sm2875468wmc.18.2020.01.18.11.21.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 18 Jan 2020 11:21:56 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v41 21/21] target/avr: Update MAINTAINERS file
Date: Sat, 18 Jan 2020 21:14:16 +0200
Message-Id: <20200118191416.19934-22-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20200118191416.19934-1-mrolnik@gmail.com>
References: <20200118191416.19934-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 me@xcancerberox.com.ar, richard.henderson@linaro.org, dovgaluk@ispras.ru,
 imammedo@redhat.com, philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include AVR maintaners in MAINTAINERS file

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 MAINTAINERS | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55d3642e6c..c70d77b1ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -163,6 +163,15 @@ S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
 
+AVR TCG CPUs
+M: Michael Rolnik <mrolnik@gmail.com>
+R: Sarah Harris <S.E.Harris@kent.ac.uk>
+S: Maintained
+F: target/avr/
+F: tests/acceptance/machine_avr6.py
+F: default-configs/avr-softmmu.mak
+F: gdb-xml/avr-cpu.xml
+
 CRIS TCG CPUs
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
@@ -481,6 +490,18 @@ F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
 
+AVR Machines
+M: Michael Rolnik <mrolnik@gmail.com>
+R: Sarah Harris <S.E.Harris@kent.ac.uk>
+S: Maintained
+F: hw/avr/
+F: hw/char/avr_usart.c
+F: include/hw/char/avr_usart.h
+F: hw/timer/avr_timer16.c
+F: include/hw/timer/avr_timer16.h
+F: hw/misc/avr_mask.c
+F: include/hw/misc/avr_mask.h
+
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
-- 
2.17.2 (Apple Git-113)


