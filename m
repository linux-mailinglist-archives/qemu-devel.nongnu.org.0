Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E913B5727FE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:58:00 +0200 (CEST)
Received: from localhost ([::1]:45016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMxE-0002xU-1i
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtp-00065Z-DE
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtj-0007FT-UH
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:26 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so89763wmb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wcyJ02wlNyzEg57m9Ur9GMAopAxBv6GVRoR8NlG5s+8=;
 b=l3AlmzQNo2IvbDgrjZIM0XbSdZJYXe6f6WXMlkiDdvFML65QeUazNx6XgX6cAcpGnZ
 KNIF7mKszl68ZM22Socu7Lx5/OmKFIzTjBu/5gymO1ilmgUZsltC0jOTWGfkY1PGRiec
 xmrjmHhannmKsxJi/Eq/KRj5hqsZIaO3yikDuoPHtWrHVqb+bYnJ/AgO9FLnoksRnWNN
 I1yY8FevT5ctWx21v6kcPrcPPx7SoH5ATgnWNQ745UA5CXhtLtKGhjQrvnB4vSPduJXt
 DmGs/B/v35nxr+hIg7JzTS4nh8NLRNHhjavnsh0RPVTLb7nWD5T5BZqzn8HwU4nWPBPP
 8nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wcyJ02wlNyzEg57m9Ur9GMAopAxBv6GVRoR8NlG5s+8=;
 b=JZSbkvNeojfeiqPdfPxamDQB8cPxmmSsN0YIaHFj5WeRiEm0kCys2bDRd6fyF96B1f
 XCpzliZwzt83Zslpsd8KR1N9Vm0Wafwh+M5HMniZ/ujSLn6keAPVydCJ7ru9VBoR63E/
 w01Zsi8cyYqkTvq8XjvTUyYgo54QEOo4vdQ7whf2Te3imxvPK9+01JLeoZv54R9BgbN7
 o7Lc4VjVhepwbLNM7o2s1XNWZlf9HGh2T59hff0/A4sXZrHSX9xiIJeRPmJyBmmG4bnj
 /1LT/tRIJReRhI4Yn0WuK+KerGkD5hZHAmXR7EfHyFDRJm8bSQfsOd02MZdwsEyIDNOl
 Yhdg==
X-Gm-Message-State: AJIora9+5IrYsarMDo4tLPtkdoL6+FyeFMe2zyhi58oGFLYFiiGuvM/C
 a67eQntKc6f9GPU4RguPzmdOScsdHp0WGTE4
X-Google-Smtp-Source: AGRyM1uJnGlFjj2Y8yNoGidzVogMDzoj4Ru/5G7ac/VzE/b/a5xn/f62xrnKQ0zLQrSFPrXblGQpYQ==
X-Received: by 2002:a05:600c:1992:b0:3a1:9252:c373 with SMTP id
 t18-20020a05600c199200b003a19252c373mr5848056wmq.140.1657659261978; 
 Tue, 12 Jul 2022 13:54:21 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bj22-20020a0560001e1600b0021d60994b0asm9492207wrb.100.2022.07.12.13.54.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:21 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/12] target/mips: Drop link syscall from semihosting
Date: Tue, 12 Jul 2022 22:53:41 +0200
Message-Id: <20220712205347.58372-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We don't implement it with _WIN32 hosts, and the syscall
is missing from the gdb remote file i/o interface.
Since we can't implement it universally, drop it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220628111701.677216-3-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 153df1fa15..93c9d3d0b3 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -362,15 +362,6 @@ void mips_semihosting(CPUMIPSState *env)
         FREE_TARGET_STRING(p, gpr[4]);
         abort();
         break;
-#ifndef _WIN32
-    case UHI_link:
-        GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
-        gpr[2] = link(p, p2);
-        gpr[3] = errno_mips(errno);
-        FREE_TARGET_STRING(p2, gpr[5]);
-        FREE_TARGET_STRING(p, gpr[4]);
-        break;
-#endif
     default:
         error_report("Unknown UHI operation %d", op);
         abort();
-- 
2.36.1


