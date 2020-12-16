Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DAA2DC1B0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:56:24 +0100 (CET)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXHz-0004xd-OL
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX6O-00014d-G4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:24 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX6I-0005ZH-6Y
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:44:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m5so23208072wrx.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRaZ2XrSqwps5n75JXC431veK2scZnrGflijkMP5vE0=;
 b=gPixu00/qQdNIfXMdf4Dj4PGq8/0T9qt+wpxGk7pZYRNOOP9eDvEdC4c8GsT2EmuQe
 OuzfGpvWrrshYHz0smfbmuXtb/bTsWYYpVDKnX5P8BVKiYpMSRJz9tGRoRoLpjhKtI6Y
 lnKi8Ckh1T6M9B7BVmlMJBW50Bc61zgGObKWtv1xhc6wiJTgAC0u3mp0H1ug0PgKdOdg
 4/uMi4c2P8Q1ZPWOdTg01WsO4/56bedWu79k4yatzvzP3uWlATyVEUtNTaGMhbHv14gv
 7qrYjez//4Cs0sLuPhIT5HySnstMGzKD+g7a+0pk6SuRZYaZCOjg3kc70Hi29rrK21hP
 zkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zRaZ2XrSqwps5n75JXC431veK2scZnrGflijkMP5vE0=;
 b=MGXpDay6Olx0k2a1cU6RubjCH+60OPH09Tbm+UtwSDagUpIrQF/oLV9NyZGKqZzySx
 f3/BXvjyXO8tJJGu9LNlKoN2qmGPAKPXiD4ui5WBTbq1kGAO+G36ZMynJ+OtAqxKvwbt
 Ep40jHK4TbLDFpYakiUOoezrGKDMfeAZtQ4jdwcZpnmrqfQ7fzBS/4MNxvYJmEi1vzs+
 NQ/aw3F6kPfbE9kr/QSMCaygUAfznbCYSdxgC2oUJqfLT4stQNS2XClMkE8dfQ1HIKT6
 FbSNZMSx2XCf8IJ0X9SXRhUyA8ffjRUMSl/SUZuqtu0rq63/mtc3UeB9ES3DmvThW4RP
 k7jQ==
X-Gm-Message-State: AOAM530xJcv4MkhEwFRp2KLD3/aqdtYO8hZPm5Y+hv4bc+nM1WZKiZLx
 M+f7RbLEhHq9wGEFqc9UOeFoXWUJ9CY=
X-Google-Smtp-Source: ABdhPJypgcHaU1DTZ2y1IDanTJ49ZworgxgovFChPohdimUbrs0QJBkjHn8lPLMH5kqMFotyixE6uQ==
X-Received: by 2002:adf:eb88:: with SMTP id t8mr39492070wrn.105.1608126255629; 
 Wed, 16 Dec 2020 05:44:15 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f14sm2844170wme.14.2020.12.16.05.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:44:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] target/mips/mips-defs: Rename ISA_MIPS32R3 as
 ISA_MIPS_R3
Date: Wed, 16 Dec 2020 14:43:26 +0100
Message-Id: <20201216134328.851840-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216134328.851840-1-f4bug@amsat.org>
References: <20201216134328.851840-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPS ISA release 3 is common to 32/64-bit CPUs.

To avoid holes in the insn_flags type, update the
definition with the next available bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 9ef3f517aaa..171d94c16dc 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -24,7 +24,7 @@
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS_R1       0x0000000000000020ULL
 #define ISA_MIPS_R2       0x0000000000000040ULL
-#define ISA_MIPS32R3      0x0000000000000200ULL
+#define ISA_MIPS_R3       0x0000000000000080ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
@@ -80,7 +80,7 @@
 #define CPU_MIPS64R2    (CPU_MIPS64 | ISA_MIPS_R2)
 
 /* MIPS Technologies "Release 3" */
-#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
+#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS_R3)
 #define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3)
 
 /* MIPS Technologies "Release 5" */
-- 
2.26.2


