Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892872CAC67
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:32:03 +0100 (CET)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBNa-0000sR-Gq
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBKO-0007S4-SQ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:44 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBKM-0006KB-2L
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:44 -0500
Received: by mail-wm1-x344.google.com with SMTP id a6so6120550wmc.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s7pDHk5TWRhKxfiHRDgU3hUlTq0ZPB7a6gpYmX4zcmA=;
 b=oo/D/3NRFPdxL76A5JiVq3aE1NzlxiXpX3uidtOUhhcSuSgZ8hV2XBCEcQ2Tjn0GZe
 d8hHDvLdc0NcFKJncpaEphyVbovATAG5UZ7URGhyl2GzS1O5vyAaEf9obe0tYGEKdbdd
 jdFr5dIA32ajx0w4Cgi6TGFZzPK5PnMvkDqChHi/wSUVXidHRNXxUwv22CSGx/6j6XMQ
 fqvsqv90Lo754gPrRciWTC/G1xc94YSurzgZklhw7UgU1niOvvGI8oaEQUQdmn6zxGjp
 eN+54Yprznm2iJpGjT4fjsRMf1jDv1JuV0aSNENDUpVo07TCbmcpLftgv39E8DayNO/p
 xltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s7pDHk5TWRhKxfiHRDgU3hUlTq0ZPB7a6gpYmX4zcmA=;
 b=JwMeINw/0XUkkDPgBxPh5I1dLs2GNX5x46tPqkZoxbV3KEEDa1waoODNZpf4A4FCOl
 4QdnkKb1Og4aNHoYATIST5QgWSeQMzUOVZwfwoQSiYqhqRg01HbyDeji9KgsvGS22aL+
 fcG5n+tDQ7unqqZpDHbd57QCPAk4wgxAAb3fSKWmrYkHTr1dKhvgh5L8wy0ebokySiMb
 rZYLxDFl2WDbWUnroE8aHlfvZk00/ppv7mp4STPHmu/vdlM5fIMdeSUgC1odb/WGEWQH
 nLrBo+MbeRdiCbetnKKP93r6Neuk7CXdj9DzD9jsIRlUTxsfughrjM0A6FX/UFjRgdn6
 clbg==
X-Gm-Message-State: AOAM532E56Wp/nqjV/uQCoKfFNAuVEwJd2mQWfcoV8FbWwiqJr3zmuNz
 8f/gz7mk2mir4MyuPZXlm5WYDjrbTB4=
X-Google-Smtp-Source: ABdhPJzSlOMf/mTRhy/JCyDfPk/Cadp7eGCYfzwCZgZPPeHfEbEwHtr3UZFFIlndZCL5ctOMca3ADg==
X-Received: by 2002:a1c:2586:: with SMTP id l128mr4279079wml.35.1606850920916; 
 Tue, 01 Dec 2020 11:28:40 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id f2sm995192wre.63.2020.12.01.11.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:28:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
Subject: [PATCH v3 6/6] linux-user: Add support for MIPS Loongson 2F/3E
Date: Tue,  1 Dec 2020 20:28:07 +0100
Message-Id: <20201201192807.1094919-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201192807.1094919-1-f4bug@amsat.org>
References: <20201201192807.1094919-1-f4bug@amsat.org>
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
index 2ba42d8e4bd..5a39a7dc021 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1023,6 +1023,8 @@ static uint32_t get_elf_hwcap(void)
 
     GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, 3, 2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
+    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
+    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
 
     return hwcaps;
 }
-- 
2.26.2


