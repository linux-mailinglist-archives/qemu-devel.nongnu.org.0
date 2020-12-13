Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7957B2D9068
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:21:55 +0100 (CET)
Received: from localhost ([::1]:45196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXsQ-0002J4-EF
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqX-0000nu-BS
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:19:58 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqV-00051d-R0
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:19:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id d3so11950468wmb.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+0f4MZSwT7Z4ULpAMMMf+Y2JWijk+gFO9yAfDJUPRo=;
 b=UJMr2i9eDj/K0MVcCJ+eHoqUUGk/nd2qt7yFEqMack+wSX2s7WSSO6FxE+tCIP/Ys7
 N1neLRDTRYdoM1prp+IqS1S/88Ms03F0CT9Z0sQCLxORgWu8ynoO/3J3Ivji5uFMuG84
 25MsLPNiUWV7VedPd4IHFWPH5y0xuG1Ftc6OXkFi25B8PBoLKTF4TCU0pUWg+8Eip5cl
 avfscgy49AaE9FsWpQB6/I/IZ8O9Eal3JQYYMEXTpOlCsmZO7RZ3xKPAbhkFQoTQvmDI
 aFgPPqnGlHqso7eYh2r5Rsc93wLo2YYc3GDhQkfmQdo8dBh2gyGN5p4jRDoqiKNFgvWr
 7WBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h+0f4MZSwT7Z4ULpAMMMf+Y2JWijk+gFO9yAfDJUPRo=;
 b=IA0Nf6hyS4aovc6l5bGTRm1L2atlonYAWlzBPhWc4cjyT5KTz3pYJ7HfJRi/FEUEjR
 dOtBXzLH7Ps2tUNOPKuj9W62DPr+K9MKSIT/gm1sIddgUQirju8avEc9IAeGFna1cNsK
 q8g6PPklH+uUYwMAOHogD3MdqDd8Lu82V+U1gnn1GVaccp2LF9IClxlDBqzuFp0lp/EV
 nUY38FZRst6KPvAwbb26Zw8igpifRoADYeT621wFeqElliShYrAG+XbOvQ1iMH1RNiSh
 qtipMcN+AKeSh1DHPqsWzLkezLojWTfIIaQ2RO24rWv46Ub6o7VR0hYppSMnY4BsUobp
 Y8Iw==
X-Gm-Message-State: AOAM533UiUD4ZA0uo95KEhsOJeOPpdYxhJHzzO/EHQVmAEX2UqCemHWE
 IdwmVLkb/yipZbKRqRREBVDf++NJqJs=
X-Google-Smtp-Source: ABdhPJyQGcPstFoF2k+UOL35hL2hnxGP87DnUYgX7saUmt1VArW5Q/W9u0DyNBvUw9DDWFHQkeJQJQ==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr24472231wmi.157.1607890793929; 
 Sun, 13 Dec 2020 12:19:53 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b4sm27219980wrr.30.2020.12.13.12.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:19:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/26] MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org
Date: Sun, 13 Dec 2020 21:19:21 +0100
Message-Id: <20201213201946.236123-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Huacai Chen <zltjiangshi@gmail.com>

Use @kernel.org address as the main communications end point. Update the
corresponding M-entries and .mailmap (for git shortlog translation).

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1607160121-9977-1-git-send-email-chenhuacai@kernel.org>
---
 .mailmap    | 2 ++
 MAINTAINERS | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index 663819fb017..a1bd659817d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -49,6 +49,8 @@ Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
 Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
 Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
+Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
+Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
 Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index d48a4e8a8b7..d396c5943b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -388,7 +388,7 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS KVM CPUs
-M: Huacai Chen <chenhc@lemote.com>
+M: Huacai Chen <chenhuacai@kernel.org>
 S: Odd Fixes
 F: target/mips/kvm.c
 
@@ -1149,7 +1149,7 @@ F: hw/mips/mipssim.c
 F: hw/net/mipsnet.c
 
 Fuloong 2E
-M: Huacai Chen <chenhc@lemote.com>
+M: Huacai Chen <chenhuacai@kernel.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Odd Fixes
@@ -1159,7 +1159,7 @@ F: hw/pci-host/bonito.c
 F: include/hw/isa/vt82c686.h
 
 Loongson-3 virtual platforms
-M: Huacai Chen <chenhc@lemote.com>
+M: Huacai Chen <chenhuacai@kernel.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Maintained
 F: hw/intc/loongson_liointc.c
@@ -2861,7 +2861,7 @@ F: disas/i386.c
 MIPS TCG target
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
-R: Huacai Chen <chenhc@lemote.com>
+R: Huacai Chen <chenhuacai@kernel.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
-- 
2.26.2


