Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A82CAC4E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:31:13 +0100 (CET)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBMm-0000PG-Qa
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBJy-00074u-3g
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:18 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBJw-0006Co-Gn
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:17 -0500
Received: by mail-wr1-x444.google.com with SMTP id e7so4492328wrv.6
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zSlFyG+azHlf1O1jZlNYMT5Vr3wLituVoG139gBOWj0=;
 b=UZcRkjaz37n9UKoNvTk7V7Cfmcocf6VCT0kizSVSz7Wvj1dO+nvdlupidn0GWFKYug
 qiCqJN8u183uoEoZiTMgmqBoFD5wGNddPeDFaAbFzrMt7bBwH2FDSklHC8z1N3pTP1CO
 5P9ZJPXVT9/hBAtAjibR8h8H94r/fagnFRCPQ0KWN2ZC4vTXoBW6lyi3SJ8c9XrHfffk
 GKzJY5SEFJk2/67DmwJl9NkI9cFjx7yJ8ZJvSfzFuVxAfCq/wcAo/+RF0Ze+aodzBj/L
 ymqlyyTdjt7hljJlgbjUf7zd+SQ+RvYhAfVq440S4r6vmrppXhfXuMYQhVMPWduss8FY
 Lntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zSlFyG+azHlf1O1jZlNYMT5Vr3wLituVoG139gBOWj0=;
 b=lYqeY4owN9Z3CxFzLidM5CaGbQdDlSyhV6JfXtj9+tkD0iIgLIXd/Z1YYVnVSMrHeg
 cC5PjFYxs9JzuhIayORlKv00SSLiPRXPYHAECAklapWKf9e9fSp3ElQuVD2Hq6b66c5h
 SISqO5GSWzG5YleO7rp23yswj+NFiIvtWY87WczX6mgtrs7cKsGU723HheJvpnE5jKQ+
 9cWYKCTuoaFhA58frQypvjpqvxJFo0xZhPnk0jFxXoh3YQXUfCu5Tq2eXha4g3UAPxXU
 hzFHEpeNb843ee97iurkPHZWrMnnkN9oPLGnnkiI/pp2BlOQcaYYj/a3pOTiqSrMB1XM
 5bUQ==
X-Gm-Message-State: AOAM531gD4UpnDrvUjsNP1g5XXkcsW1Q7XdNF6QvYMzw6KdUjMZJ+cJP
 QWZnRZExhihAeDnCI4pbvXs=
X-Google-Smtp-Source: ABdhPJyluTtORl4OcC/Kbc/K9zmgrIk663o6Kn6axvHrFDZCmUZy5LGZ16/mJzY7xoDQNM49HCn1DQ==
X-Received: by 2002:a5d:5505:: with SMTP id b5mr5841491wrv.410.1606850895215; 
 Tue, 01 Dec 2020 11:28:15 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id z11sm1330178wmc.39.2020.12.01.11.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:28:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
Subject: [PATCH v3 1/6] linux-user/elfload: Move GET_FEATURE macro out of
 get_elf_hwcap() body
Date: Tue,  1 Dec 2020 20:28:02 +0100
Message-Id: <20201201192807.1094919-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201192807.1094919-1-f4bug@amsat.org>
References: <20201201192807.1094919-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we are going to add more macros, keep the function body clear.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a926025..aae28fd929d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,22 +989,22 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
+#define GET_FEATURE(_flag, _hwcap) \
+    do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-#define GET_FEATURE(flag, hwcap) \
-    do { if (cpu->env.insn_flags & (flag)) { hwcaps |= hwcap; } } while (0)
-
     GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
     GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
 
-#undef GET_FEATURE
-
     return hwcaps;
 }
 
+#undef GET_FEATURE
+
 #endif /* TARGET_MIPS */
 
 #ifdef TARGET_MICROBLAZE
-- 
2.26.2


