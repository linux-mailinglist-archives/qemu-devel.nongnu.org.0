Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC15A2D9165
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:31:16 +0100 (CET)
Received: from localhost ([::1]:49440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koblj-0002tz-Ro
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobkA-0001hO-JH
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:38 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobk9-0002JZ-4S
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:29:38 -0500
Received: by mail-wm1-x344.google.com with SMTP id q75so13732939wme.2
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2xFsGmzc1fuZ2G3iL5EX9HLv7qGB+OAof9WxFDkQj8=;
 b=jewPMlRpR5YyONgSD9GyZLta6P+WZDopRuDiZyAbD4UT+65ScQ+Wa9s7dt/4iOn8+V
 K7oEi2Xj2ZdBX1yUYPLRNc4bXM/UMwR0GtzWibZRPO+6xjr/scvyz8A5sGlhqReKYkTZ
 Glbl6kEaxt2KQBh/CRURAcS44qladXIvGnjg/Arp9dHd5tgJ2FrggrATfmcKDYfSuzCz
 98Yz47PLczFYZGml4VHSjZ+0eLgBCx62g8G9oNYRy52+RIXorh4zG2QwIsAKh/3NnhMF
 sVexaF1Tp3STb5p17fMYOeDShAeorcZHbPLK3nSC/WJOVdD4uQQteTfhcyjfHS2ZUC6r
 be4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/2xFsGmzc1fuZ2G3iL5EX9HLv7qGB+OAof9WxFDkQj8=;
 b=ha00RmC0T0QU7ZkESsEiyC8oJQ8dUDA7fsFxBv2ZBiv1Q3cUCgT85ckzkGFJFrJfLM
 OHYdjNKk2urE3cpGsGNYYZCR5fY1RpQ0I9cND4mrBJOpG2KnohLlr1UeiAyCehR8wBc9
 ienoWhI7Th41xH0qXp7kXD2YWPvNZ6uM2ydYCaCvD6GtUfHMgRftPx0SrU03ivQtm3Ez
 eJVg1+Tc1gP1mpoQ+SvoJi7jHjTe/PD44FpnSd4dBFfL+t5Am0yWUWG2FnuqY22F44iC
 t990fKB8CwqIW8y75goGMaH1pvgy67QyJSwU/dPmQc/tE+QKf/zHvGiNkr9JXyNcVwCY
 BSHg==
X-Gm-Message-State: AOAM5331oQpC0/S93vR+YkPxqzQ4GWtAJrPE4pRziXIkabgChaXkFuTM
 vrphwPmcC4fZXBKN6b94fndepWhMiz8=
X-Google-Smtp-Source: ABdhPJyQl0bxA0QeCryCSgOAXI4ii+0mOcMCgQnk2budQeO7ikV/6tq3thhpoLE5eLM4DX4wmhLSXQ==
X-Received: by 2002:a1c:2586:: with SMTP id l128mr25141868wml.78.1607905775229; 
 Sun, 13 Dec 2020 16:29:35 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l7sm27699304wme.4.2020.12.13.16.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:29:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/7] MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org
Date: Mon, 14 Dec 2020 01:29:22 +0100
Message-Id: <20201214002928.343686-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214002928.343686-1-f4bug@amsat.org>
References: <20201214002928.343686-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
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
Cc: Huacai Chen <zltjiangshi@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Huacai Chen <zltjiangshi@gmail.com>

Use @kernel.org address as the main communications end point. Update the
corresponding M-entries and .mailmap (for git shortlog translation).

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


