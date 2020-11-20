Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D352BB87D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:43:28 +0100 (CET)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgEBi-0007Iu-EM
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDgI-0004wz-Up
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:58 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDgG-0004SK-Jt
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:57 -0500
Received: by mail-wm1-x343.google.com with SMTP id s13so11252192wmh.4
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dewrVsFDGuxgSIArHJaBqqAmHYhFd/iS0jR527zZNV8=;
 b=lL3s8QmCDWH+51LD3yVYqrVNz/Z2bC+9qpnyu2bzjcwrEIta37AATKUE1RPGm+c5RS
 VFU2Chmwx8wP9RBghgDVyxic3m1oeA/cKUaxEnALsm0M9zE2IrjlYXw7KXZq1x5XjpGl
 OZe+vT1lmxCQS/2FUwvIkkmMTcuz/1MJFtZHOngoL6j+9A2Hams2H5AGofzu3TRV+Rlz
 5rWZN5Z824MlFrKNq7FEtdOERwnTVXDyxVGJ9DWDEE7hDNtazG839uwJQmpPAhNFbdFA
 /FmXeMMV8KRhQoprSt6EjHd82JL8NbwMSOdbyoLXP0yNHOTxwnDiFamWg/7FqNTtnLW6
 8dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dewrVsFDGuxgSIArHJaBqqAmHYhFd/iS0jR527zZNV8=;
 b=k8R7zhpTFLKRXl/cx+V2WiazKtWpL+jL8gGya1DRzaarZXqHJ+QmgW9wKixnUEylxF
 cvG+3S6yfbD1h0sjKxmA36A3xeGG4wD49w+nR9BZy0k1nydxyEp/IvopAcGWKctx9HFR
 LwKKuRryfGJGYOChz/XL5OipN0YtAhkjzQfiqckM+Lqom/34TozF3hKB6K61CRZGh5IL
 SU5mmjCP/WQapXtoLKiwmcb7LbqNEWxsydlUHgjkVNFRDEKU9H34so5tkwbJr//s5pz2
 hS+fdoi2qwnO6kbi0Lf7iYfZbF/i2NfaMQ7r2X55jf8ViR16644MgaCkNMosZiuW+npp
 FhQQ==
X-Gm-Message-State: AOAM530jvLroLsO8/urViWcofN0f6gVie9mKN9L55hB/Pa1Bq96Vg3a3
 RkuGn4A/O68LllRWuw3f68sCiROwW5U=
X-Google-Smtp-Source: ABdhPJzJNEzyT5EbNuw19Z2K17DuU0XlGOH8ll/gMv0RBi/zeTMUF1Ta3BMNRe5LntsQ/iky7huCwA==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr12502592wmc.159.1605906653845; 
 Fri, 20 Nov 2020 13:10:53 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id h17sm8131107wrp.54.2020.11.20.13.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/26] MAINTAINERS: Add entry for MIPS Loongson TCG
Date: Fri, 20 Nov 2020 22:08:42 +0100
Message-Id: <20201120210844.2625602-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an entry for the TCG core related to Loongson.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Adding Huacai and Jiaxun in case they want to be notified of
changes, patch conditional to their individual approval.
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce7fe949036..be42b56300f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,6 +240,13 @@ F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 K: ^Subject:.*(?i)mips
 
+MIPS TCG CPUs (Loongson)
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Huacai Chen <chenhc@lemote.com>
+R: Jiaxun Yang <jiaxun.yang@flygoat.com>
+S: Odd Fixes
+F: target/mips/vendor-loong*
+
 MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
 F: disas/nanomips.*
-- 
2.26.2


