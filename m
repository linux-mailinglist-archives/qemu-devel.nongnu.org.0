Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533141D66E9
	for <lists+qemu-devel@lfdr.de>; Sun, 17 May 2020 11:32:50 +0200 (CEST)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaFf7-000283-CW
	for lists+qemu-devel@lfdr.de; Sun, 17 May 2020 05:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaFXD-0004c5-D4
 for qemu-devel@nongnu.org; Sun, 17 May 2020 05:24:39 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:38591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaFXB-0001pA-H1
 for qemu-devel@nongnu.org; Sun, 17 May 2020 05:24:39 -0400
Received: by mail-lj1-x22d.google.com with SMTP id e25so6631964ljg.5
 for <qemu-devel@nongnu.org>; Sun, 17 May 2020 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VkY06hFmUtrhwfHs0njKUa5fecjb4LGKMIk7vsimrnU=;
 b=NnLaCGFelfBEwo3SGKXHBwZ30VbzOiF8cLNLG0U5M4nAB4tnEueOIalfTLt1AMslll
 LWO8BQ5AUIqp0jxg0fdUhUayi2XHPQwMlO9ROIEybPXOor+/qqfavLh0ENr3vOI+GLsr
 yuYlRVh+du5JTHtBnxDALck6yBcfk9cObRJQv/ui6vINbNByWSVaQrTwbhG+hj5B7OKS
 atL3HbiwZChNYbvTyFploy4bpyQHn0iGrxR4gERrNFjQd676naubbdz550l9pn6+oR08
 EOVyRj+Hl/GMXSQqVL1+1p/2magJGI30FUY/QUJ4ARwFldvZ1weNfPqMUY6KY+7VEOpw
 ucSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkY06hFmUtrhwfHs0njKUa5fecjb4LGKMIk7vsimrnU=;
 b=F1+hu2Rmj0QD4EAP2BtrFl2CC4MQ+K4zyGA1zTfWdYsbDAs3v/Goxoie2P4Mg+oFS5
 IaSfsGobK0ZC/9YF8pnLnHxWFo6nIMpa2czqKRcX3K+ysWO3Txqo+xcfYf+GGeWHGvU1
 zqnaSOt9C0rtoYtFUO3/RJFoG3pEfgwwZKwuoTWH3C82k4yETJac3EZA5HY6Lz5R41Cq
 WUquxyGbvmuihJTKzFuAxxIDFX/Wo49J2H2CqtWR0LpfjGi86UcXsZxP/TdOR7dCleq0
 IUm/pt4HuLVYrXLQJxNxKjIQ8M6juzntiVXrFS0hj17zYy8a3L+vJ2ndh9HeNyr1LpZO
 d3vw==
X-Gm-Message-State: AOAM530pyHp+NurOeaqcj9NDvqA59yL8xJ57fZEB7NtzZ4Ca2e6+C95E
 2O/RpqdsHh6cVzJsjtp9WtaiTePAvzA=
X-Google-Smtp-Source: ABdhPJzphs5ydoJmcJsheIvhuWLi2EK9xPGTnYYM7RhCMw1vR6w1b1ESO9QNHxfmKliOtRUtsYLZfw==
X-Received: by 2002:a05:651c:1025:: with SMTP id
 w5mr7199636ljm.113.1589707475285; 
 Sun, 17 May 2020 02:24:35 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id l2sm3872138ljg.89.2020.05.17.02.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 02:24:34 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/19] MAINTAINERS: Change Aleksandar Rikalo's email address
Date: Sun, 17 May 2020 11:23:56 +0200
Message-Id: <20200517092357.1469-19-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200517092357.1469-1-aleksandar.qemu.devel@gmail.com>
References: <20200517092357.1469-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x22d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.rikalo@syrmia.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aleksandar Rikalo wants to use a different email address from
now on.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 .mailmap    |  3 ++-
 MAINTAINERS | 12 ++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/.mailmap b/.mailmap
index 6412067bde..e3628c7a66 100644
--- a/.mailmap
+++ b/.mailmap
@@ -42,7 +42,8 @@ Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-devel <qemu
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <aleksandar.markovic@mips.com>
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <aleksandar.markovic@imgtec.com>
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <amarkovic@wavecomp.com>
-Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
+Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
+Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 1f84e3ae2c..8d5562c5c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -212,7 +212,7 @@ F: disas/microblaze.c
 MIPS TCG CPUs
 M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
 R: Aurelien Jarno <aurelien@aurel32.net>
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Maintained
 F: target/mips/
 F: default-configs/*mips*
@@ -1041,7 +1041,7 @@ MIPS Machines
 -------------
 Jazz
 M: Hervé Poussineau <hpoussin@reactos.org>
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Maintained
 F: hw/mips/mips_jazz.c
 F: hw/display/jazz_led.c
@@ -1062,7 +1062,7 @@ F: tests/acceptance/machine_mips_malta.py
 
 Mipssim
 M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: hw/mips/mips_mipssim.c
 F: hw/net/mipsnet.c
@@ -1070,7 +1070,7 @@ F: hw/net/mipsnet.c
 R4000
 M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
 R: Aurelien Jarno <aurelien@aurel32.net>
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Obsolete
 F: hw/mips/mips_r4k.c
 
@@ -1085,7 +1085,7 @@ F: include/hw/isa/vt82c686.h
 
 Boston
 M: Paul Burton <pburton@wavecomp.com>
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Maintained
 F: hw/core/loader-fit.c
 F: hw/mips/boston.c
@@ -2582,7 +2582,7 @@ F: disas/i386.c
 MIPS TCG target
 M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
 R: Aurelien Jarno <aurelien@aurel32.net>
-R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
+R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Maintained
 F: tcg/mips/
 
-- 
2.20.1


