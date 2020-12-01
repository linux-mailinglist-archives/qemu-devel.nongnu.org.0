Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E82CA3F9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 14:39:36 +0100 (CET)
Received: from localhost ([::1]:47400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5sV-0002er-Pm
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 08:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5oi-000785-Gj
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:40 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk5oh-0000JG-2J
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 08:35:40 -0500
Received: by mail-wr1-x442.google.com with SMTP id k14so2679973wrn.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Sjq+vGi0jQtoXVIp2ZnkhapP2PiaaKuqCiejzgYfOE=;
 b=K9AD2di1eCqVJL8MM2FzWrlRTBq9si4xkKf5M2Fz11C/ZJNSP0cOYilkAt87KaYBiw
 Cd/JwMWfolVcejDrcIK7+g1HFynjiyTGAX/kivKwY/EYiqN/dF8XOn3xoKDSFYCniCs1
 wyNmibbYrEfkmLXg+2IKlD4xrOCRQEzMhMJdx7ZB750BRBIcwm3aiaV0CFiZTaL7kCB8
 4vXNMp8QSHyprKj3Gb4AULcBw7kr+93k8RofBwseEJFldWwTR4IY25NkCpQV9RSjncOF
 ILloq8mdI0LSgM8tWwfjVKpj4q8nkNEEf0yvtaX5L2wAQ8DKaYJVFVAKjWe7JZRgZDVP
 AuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9Sjq+vGi0jQtoXVIp2ZnkhapP2PiaaKuqCiejzgYfOE=;
 b=sL/NIM6Tc8M2QakM0iBjdX77InG+/lhapoTGZpw3rYEaYWS/sQL408jrZ9oCDcK865
 9O66oC5JhKldCpXP6jFvMJzTjSUkIHfMb9VzZKc4UR/0W197nIOos0DTq4v3jzhn5p+j
 au1E/d43q23DIDL/uTe8QNNLlr8FhEJ6dFaQSzoZhq4x798+PQY9gV4eyplD7sep5QLs
 FdFQzZXKuB0XllKg3xjOWRxMnamPNhXagcbNTXmDRdfCCClhTz+Ymfmr92dIozxas1ck
 slDOktk92giSIUx8BDjIQ9GnprIpjytY0SWU6Ie5QTHGy1jw9Qxk2SuOJOg8nBPd8AIv
 Fc+Q==
X-Gm-Message-State: AOAM531sQfgpq+2/Uidfk3rkMkccxQowZja/kvGyTLZoDWiQg0wPD+Ev
 D1GiGadIPSk45deurh9nqsk=
X-Google-Smtp-Source: ABdhPJypBGUSS5XuNCMUlnIBd0xSdMryk1aoJoSCWl//PhfGw822iMZG0YcNixlb6ZhGGKdUQ4vk1w==
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr3912007wrr.48.1606829737894; 
 Tue, 01 Dec 2020 05:35:37 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id z19sm2940679wmk.12.2020.12.01.05.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:35:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] linux-user/elfload: Rename MIPS GET_FEATURE() as
 GET_FEATURE_INSN()
Date: Tue,  1 Dec 2020 14:35:21 +0100
Message-Id: <20201201133525.2866838-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201133525.2866838-1-f4bug@amsat.org>
References: <20201201133525.2866838-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
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

We want to add macros similar to GET_FEATURE().
As this one use the 'insn_flags' field, rename it
GET_FEATURE_INSN().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index aae28fd929d..0e1d7e7677c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -989,7 +989,7 @@ enum {
 
 #define ELF_HWCAP get_elf_hwcap()
 
-#define GET_FEATURE(_flag, _hwcap) \
+#define GET_FEATURE_INSN(_flag, _hwcap) \
     do { if (cpu->env.insn_flags & (_flag)) { hwcaps |= _hwcap; } } while (0)
 
 static uint32_t get_elf_hwcap(void)
@@ -997,13 +997,13 @@ static uint32_t get_elf_hwcap(void)
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
-    GET_FEATURE(ASE_MSA, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_INSN(ASE_MSA, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
-#undef GET_FEATURE
+#undef GET_FEATURE_INSN
 
 #endif /* TARGET_MIPS */
 
-- 
2.26.2


