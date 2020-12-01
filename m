Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FB2C99B9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:41:19 +0100 (CET)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1Dq-00044S-RF
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1Cd-0002ri-9e
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:40:03 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1Cb-0004wt-U5
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:40:03 -0500
Received: by mail-wr1-x441.google.com with SMTP id t4so1292708wrr.12
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 00:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9Bt3X6xPCr7/BcZn2HlcvKyFcnzlHLrGtYhaMWM8dQ=;
 b=C8nQzzYH88o+skNEo01KqUw7vhnrPiZE/dV9q/ap8S3CTLVBCDmmt+HKfIC13RVfAu
 9sqbaRRo0XkFf/AnnJgizqNjIdOm/9EvmZoM1TdEPXYDb0/Y7e9FmpLfFyZQcA+tszuT
 At77MJ237VL2RzgEJVeQ3VJircVKHv/n5/CaYH7WxkE4yq7reB0iP9rw/zbtgAkkxDkn
 oTCPxvL13JEnI1CNpZk1KkfXg9FnO/8pFTfyjyX2KB7eqB4l/fv/h6IHSonQqY5l8QhR
 v3ZF7sEcpm20/k4SX5I3fEtp7rhiV2rqgt8aimcE0njVKsby3KyTk+Z40z9jjuzeWR77
 asqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V9Bt3X6xPCr7/BcZn2HlcvKyFcnzlHLrGtYhaMWM8dQ=;
 b=fNO+1mtPiX8JZjtct1Sf0WSMo2KTEzKa82jNAiKQUE5spPSaEcLk9CLoQ+aRqu/ChJ
 rw0NZAcrQrforHBrEKdfMW7RDQ4ii+Hdq0l/epuPnq+7egnZPdRULWnQGW9hIMNCKqIu
 DXPuqqYLg8vkcmShVOWiZBjkI3LlHrAacCPdzsY6gt6cKn14Dtt4LbK5j+3IbcVlizfB
 +gqS5bZ+mc//iXYmrtxxO0jjKzny77RdTV2NbN+cIRvssMbxD0sB6awMrGcz42zZs+AD
 Lws8lo5v21DkR4JqSx+VMe2O8kxDUaHhTOLcIBIDGv4u6ajLCgI/CDGxKVYg5sjX2JdZ
 p9CA==
X-Gm-Message-State: AOAM533aF8vwBXI+TM56aShnQ41pcmVyxcasmIswItfFisejZ8AM9uHm
 IkgyDgdeYDm2pM8aihzZuQYcRmiIpEM=
X-Google-Smtp-Source: ABdhPJxXlRKccHtw6VMpLNQBdO6ROhr+ipchiSaSdOc4oGQ5wfW1MPoUkGT/PC+w/s6X4000yDhd9w==
X-Received: by 2002:adf:f085:: with SMTP id n5mr2302801wro.371.1606811999357; 
 Tue, 01 Dec 2020 00:39:59 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id g184sm1730113wma.16.2020.12.01.00.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 00:39:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] linux-user: Update HWCAP bits from linux 5.7
Date: Tue,  1 Dec 2020 09:39:50 +0100
Message-Id: <20201201083951.2745111-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201083951.2745111-1-f4bug@amsat.org>
References: <20201201083951.2745111-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a926025..17371f8b8cd 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -985,6 +985,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMIPSState *e
 enum {
     HWCAP_MIPS_R6           = (1 << 0),
     HWCAP_MIPS_MSA          = (1 << 1),
+    HWCAP_MIPS_CRC32        = (1 << 2),
+    HWCAP_MIPS_MIPS16       = (1 << 3),
+    HWCAP_MIPS_MDMX         = (1 << 4),
+    HWCAP_MIPS_MIPS3D       = (1 << 5),
+    HWCAP_MIPS_SMARTMIPS    = (1 << 6),
+    HWCAP_MIPS_DSP          = (1 << 7),
+    HWCAP_MIPS_DSP2         = (1 << 8),
+    HWCAP_MIPS_DSP3         = (1 << 9),
+    HWCAP_MIPS_MIPS16E2     = (1 << 10),
+    HWCAP_LOONGSON_MMI      = (1 << 11),
+    HWCAP_LOONGSON_EXT      = (1 << 12),
+    HWCAP_LOONGSON_EXT2     = (1 << 13),
+    HWCAP_LOONGSON_CPUCFG   = (1 << 14),
 };
 
 #define ELF_HWCAP get_elf_hwcap()
-- 
2.26.2


