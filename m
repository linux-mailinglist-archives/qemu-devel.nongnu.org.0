Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59F42CA41D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:45:04 +0100 (CET)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5xn-0006PL-PA
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5p4-0007B6-72
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:36:03 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5p1-0000VF-Qp
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:36:01 -0500
Received: by mail-wr1-x443.google.com with SMTP id p8so2666150wrx.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUGPXANrVSR7vk1/hKRmVk9HLhz3WKjuapZkdQG2BZQ=;
 b=jDInjVs8+ZHy0HlTcoNhUMf8dcFcUhRZl18o3xH5IME7+XJ5DTu3rlf9Nm1hZfEb55
 9UDGjT0iRMX8hcs5MJPAM+JPn/BVSaLlXT6SN1gYOU/0XTP3I6JzUj1Nz0Yho1ywexxM
 qiaXQaNworuuf8Md6qFl07fuVl/3WpCd++yqIUND4922TQS0AkZIINJAP1sy36oS7PlG
 jtY+hjCfv04kJ2XU9a16Ph/8MbL7oq6LDWpg+mfGI/Tw7u9OQ5GOzNT/41TeoCLLCxqO
 5/Mcs4McR5J+9kGhIXvtjfbS9qPCigzjZ1DOwU1r+F7mcUtY8v6rsgRsMZKstoKiPbEj
 uTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OUGPXANrVSR7vk1/hKRmVk9HLhz3WKjuapZkdQG2BZQ=;
 b=lFDzNhmvxERk4AipJZF01CqJhBzNyAYx4Vl3WBKyXktiaiRO/8geaTDJOZQ1JQjyjS
 JQcn8msf7XJiPg/5b/m+bKyGVejR0EtP9XrP25HeewrasULa9gy7wkaV4l1QmNFYNh0L
 3ZT4TIgX38QR7HzGcLcKmiLmUWZ3FGmi3rnJdZiZV9+dmWa+cNGZjd4uWsB1u0sU1TO3
 TfKegDvrXg0Z8pUYOE+pfhUiG2TJV3Bz29oQH01j6b8TJsmK4hi+s/ZTUEwf8OKX/PvE
 ru8dWUoWXBZobuPCxBQM/DiX2vizwDUlviInbnNwwsKjK+O/fbvWTKyDpRolKBb51zdz
 E0Qg==
X-Gm-Message-State: AOAM531zcE2hoKu1jaZaJsDG44ZUNOIjv8vvHGEr9reiyM3zHteTLxip
 4f//wElKinkDqVqE6TyOTlI=
X-Google-Smtp-Source: ABdhPJx4gc7qjwKLtXQ7JXU4Pmvb0MPcJqO2xxdHMUB11a/DvvhEfeaJzIJuCkryljiMCvEz2u7l5A==
X-Received: by 2002:adf:9d49:: with SMTP id o9mr3986050wre.413.1606829757835; 
 Tue, 01 Dec 2020 05:35:57 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w17sm3340096wru.82.2020.12.01.05.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:35:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] linux-user: Add support for MIPS Loongson 2F/3E
Date: Tue,  1 Dec 2020 14:35:25 +0100
Message-Id: <20201201133525.2866838-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201133525.2866838-1-f4bug@amsat.org>
References: <20201201133525.2866838-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Userland ELF binaries using Longsoon SIMD instructions have the
HWCAP_LOONGSON_MMI bit set [1].
Binaries compiled for Longsoon 3E [2] have the HWCAP_LOONGSON_EXT
bit set for the LQ / SQ instructions.

[1] commit 8e2d5831e4b ("target/mips: Legalize Loongson insn flags")
[2] commit af868995e1b ("target/mips: Add Loongson-3 CPU definition")

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 167ffbfb06c..3b4fc3126da 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1022,6 +1022,8 @@ static uint32_t get_elf_hwcap(void)
 
     GET_FEATURE_REG_EQU(CP0_Config0, 7 << CP0C0_AR, 2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
+    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
 
     return hwcaps;
 }
-- 
2.26.2


