Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58913392A6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:05:05 +0100 (CET)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkHg-000241-Ip
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKk8P-00086o-7E
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:55:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKk8N-0007Gb-Ng
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:55:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id x16so2052480wrn.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tcxu4RysNIGJ7eHY8sfNHUztIwfmDxyi76Oab9FOw1o=;
 b=KNv2ZXGS82RZiTvu5hei9/a7Lp1BGy47/3H4ouhumeBNTfO8aVh/oAXgPeNKmsB5dC
 hZhqX+CccpCuko06hGImwhlhBGGgR9LyRIl5JhwThdLtWTWeVJ83Z7ax+PtkXygIocFz
 CBO3dAiT8D0cgyZe2XAkZXJfUaOcL1GOawYzbMxldh7d3KkibSzbB3v9+w2ZdDvfP8yG
 IAnzZ7gN4wzILtC9jJNwMWFEQB/g0fLtLe33D5g4CgM9C7BrSU/MPjt4uNSKjVvDJg2r
 l5lsPRDGSH7+vw2/0QTfMTsxulqwik+ASBI5Az38Yaw6YH7XPeObVOL4gfGNEctFbEcC
 pRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tcxu4RysNIGJ7eHY8sfNHUztIwfmDxyi76Oab9FOw1o=;
 b=GNITgz/KY0+hQ8vdqEX01Kcjubh6mRndm/3giOHn1tIYYuCrQARt4SNThEwLYU8QSN
 C+EQO7TMBKy0OvPu1Y4J++88373Zek5noQeZXrv7jT1cTNyF3e6rDmhw9Vd44FAfdPaw
 SY2o2BBdUQaAbwZIfknEP6sUxKWASgepa2UIopjeKyqLRvcKacwhVUv3NyJlw1bA0vSe
 fLSJbZwDvmxlvcudzMUHxIghOEOq7RSckENyjOQE3aUzcsGCQERQQ3pH/Sr0p/kuSuVm
 YSPon/+uJP75I1Gg/8BMAJJ1k+xdBxusFjMHJTN17YXdqSLJcUaOOkbL9LIlEQRlhJwm
 asVw==
X-Gm-Message-State: AOAM530urLTnOvBV25Be2sQaIKdUwuhZ4NojTARP5/C7K8DkSSusfppW
 DUgYGGNgSv13wdamEtJx/J1U4vDHv0w=
X-Google-Smtp-Source: ABdhPJyYR+5a6jBxGBHAGGrUzEsj1egSFYZ6kwX8ZLUQyMDTYJs+JltCWyDJl5ZEHs7sekL3UqzV3g==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr14821158wro.249.1615564526097; 
 Fri, 12 Mar 2021 07:55:26 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d29sm8090414wra.51.2021.03.12.07.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 07:55:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] MAINTAINERS: Mark SH-4 hardware emulation orphan
Date: Fri, 12 Mar 2021 16:55:13 +0100
Message-Id: <20210312155513.1849109-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312155513.1849109-1-f4bug@amsat.org>
References: <20210312155513.1849109-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yoshinori Sato doesn't have time to manage QEMU reviews.

The code is in good shape and hasn't started to bitrot,
so mark the SH-4 hardware as orphan to give the possibility
to any contributor to step in and fill the gap.

CC: Magnus Damm <magnus.damm@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 95abfd6b818..3ba7b47f8e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -321,8 +321,8 @@ F: tests/tcg/s390x/
 L: qemu-s390x@nongnu.org
 
 SH4 TCG CPUs
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
-S: Odd Fixes
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
+S: Orphan
 F: target/sh4/
 F: hw/sh4/
 F: disas/sh4.c
@@ -1401,7 +1401,7 @@ F: tests/acceptance/machine_rx_gdbsim.py
 SH4 Machines
 ------------
 R2D
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
 F: hw/char/sh_serial.c
@@ -1412,7 +1412,7 @@ F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 Shix
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
 F: hw/block/tc58128.c
@@ -2163,7 +2163,7 @@ F: include/hw/*/*xive*
 F: docs/*/*xive*
 
 Renesas peripherals
-M: Yoshinori Sato <ysato@users.sourceforge.jp>
+R: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
 F: hw/char/renesas_sci.c
-- 
2.26.2


