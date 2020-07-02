Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AC12124FB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 15:41:58 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqzTR-0000QI-3R
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 09:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqzP2-0001pl-F7
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 09:37:24 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqzP0-0004JN-Na
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 09:37:24 -0400
Received: by mail-wr1-x443.google.com with SMTP id a6so28440862wrm.4
 for <qemu-devel@nongnu.org>; Thu, 02 Jul 2020 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtizzpQr1GYmPcWd98FPJMknxa4G0kQlRGMT2q0PmKE=;
 b=UwRyDijTC2tC2apQ2L0+SQcU1Sy1uCc2SGlYMEP029M5d7FbuL/IT0aAQknx21VVa+
 FWfXG/UStmo9xAWSQ0pyyI/kRZ0/lM9B1uxTM65V0GqbJluZia/YzJAB+t1dOtGNxtcK
 TcbTzbhj3DSPklFXP29kMa+I4hL2l8pCSt50eHEs/IMp7l/jbHCMWLKmRzNlBE+bp1bw
 w1pWga/BRNoJaGTiDVd5Xyx+YCFN4lGjWppEKzZSzEi1inb1lsE1ljJVJzmh9DpFSU24
 b1iKXLt75/LzGYv1AQ/ZOT1/6mTN6kx3Xjc04Jg0IaTTpqPJAzJ7TckW7fEebE0nffbN
 huDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NtizzpQr1GYmPcWd98FPJMknxa4G0kQlRGMT2q0PmKE=;
 b=PZeyrXviZRBhfElz83Av42nnaIyWGFaYWnFwz5pOdcFcxNc+PyIQ3aFhD6Rx/2pLPC
 e/o6nXHPA1pK2wVyeMbd/ej6dEdZerTXperd3YgVASXnMHXrT/J2Vnt3D9WP8gyzXo9D
 VTeB73PbR9VhNU0PGqbnE8FxfSPzeq6iJXlGaHlh3e5zK/Lz0iTNoP/9AkeS+W0kHUQ2
 fhRCDp35G+HEBkekM1McvU801qGaUGsG0f+0PbbDnMDHYswZsxVwS7U59Q7ojtsF+MqX
 IbApLZPjuXwoZhhYBrr4cIwfixLTUSZI9Lq0MhTI3eR6Vpo/ZX5SZkVxQ6K7a8aTAMS/
 k/Fg==
X-Gm-Message-State: AOAM532YS8vCwkCQCTon3V0Uu3uXafzOSX4WhYnqQf5uIndL5IHmc8b9
 0t987Nn8RIQ5ImdJN7rC2onl2JBF66Q=
X-Google-Smtp-Source: ABdhPJx+gDRgqC5V1i7KX+zXOIH7pJG/PAECyVi5Yd1a/xEFuNoxUPiGWTxxKjYJSZg0udEW00Y5SQ==
X-Received: by 2002:a5d:40cf:: with SMTP id b15mr31038531wrq.319.1593697041129; 
 Thu, 02 Jul 2020 06:37:21 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id p17sm10190511wma.47.2020.07.02.06.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 06:37:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] MAINTAINERS: Adjust MIPS maintainership (Add Huacai Chen
 & Jiaxun Yang)
Date: Thu,  2 Jul 2020 15:37:01 +0200
Message-Id: <20200702133701.25237-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200702133701.25237-1-f4bug@amsat.org>
References: <20200702133701.25237-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yunqiang Su <ysu@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Lichao Liu <liulichao@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>

Huacai Chen steps in as new energy [1].

Aurelien Jarno comment [2]:

  It happens that I known Huacai Chen from the time he was
  upstreaming the Loongson 3 support to the kernel, I have been
  testing and reviewing his patches. I also know Jiaxun Yang from
  the #debian-mips IRC channel. I know that they are both very
  competent and have a good knowledge of the open source world.
  I therefore agree that they are good additions to maintain and/or
  review the MIPS part of QEMU.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg718434.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg718738.html

Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-Id: <20200701182559.28841-3-aleksandar.qemu.devel@gmail.com>
PMD: [Split patch in 3, added Aurelien comment]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Aurelien comment is probably worth an Acked-by tag.

Cc: Yunqiang Su <ysu@wavecomp.com>
Cc: Lichao Liu <liulichao@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>

 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 64f54c553c..8155525077 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -213,6 +213,7 @@ F: disas/microblaze.c
 
 MIPS TCG CPUs
 M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
+R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Maintained
 F: target/mips/
@@ -375,6 +376,7 @@ S: Maintained
 F: target/arm/kvm.c
 
 MIPS KVM CPUs
+M: Huacai Chen <chenhc@lemote.com>
 M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
 S: Odd Fixes
 F: target/mips/kvm.c
@@ -2672,6 +2674,8 @@ F: disas/i386.c
 
 MIPS TCG target
 M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
+R: Huacai Chen <chenhc@lemote.com>
+R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Maintained
 F: tcg/mips/
-- 
2.21.3


