Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360FB2CAC4D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:30:59 +0100 (CET)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBMX-000072-SX
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBJt-00071d-C2
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:13 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkBJr-0006Ai-UQ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:28:13 -0500
Received: by mail-wm1-x344.google.com with SMTP id d3so6117085wmb.4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yrhuzYmOu+3uXq5IUJkB8rbZNNFZuBwVHMeDrFWGxQ=;
 b=Oz6Cfd5Aef4MOb9AwSYt3ljFBmbk9DMQsa3Qgm221GDVVgdYLFvX94HJgxcOycSKz9
 P8CWa/XWNBoQdcAIBNxpin5hHBmJyE2Z+GBJs2u+fdJqBJwKE9Jql60/+O3lNYZUxhIU
 GIQxW9qnYfgmbMub4ofahnR7pR5LXd3/Q3mYKtwkPL83LYB2jZKA4vQTxO3z89VjN1F5
 a3yIjFjUDsrWYULjI5qxvMq3dxMI9+ahCWphHye8XsP9tszb187daOsCZKIf0XkArnI0
 xpTSV/AzEu1WCAahhfSUATeai//UzZFiaFbmeMxZMpDfGPIQq9qqj7t4sQO84vZPvHS0
 q0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6yrhuzYmOu+3uXq5IUJkB8rbZNNFZuBwVHMeDrFWGxQ=;
 b=HjKrBs5JFb7xu5I+6li8ckddQH1m2QEDTvA0WY9o9kPCWsYC0JvZzpp4h/aN73VMP+
 T6feojB1slr5bGw9US/eXoFsSKCWpV/0/0xia/RJCeEFrIJKCRffg83RDrH1MwKhtf7x
 rm2T2M6eOC8qoV/NeWCFPj+N5APViHSfRs6BUHEsjHjr2WvyOmNb1Kx18B7czq8LvAju
 X0xl16ScENNM02tlu8cNASRy1PyWIZb1iWD1NsUDHlm/iEGJwLlc7bJeXdV2HTF4WovA
 o+kHryHFUSQZfLOI3nc+1Nlbi8Nw4ZbiN2nt704VkH8swwJv18Ehb1lMcfV2Qyv/X97k
 +Ikg==
X-Gm-Message-State: AOAM532GURiN7qswiqtP746r0VtybiIbOXTRxbEg5diUn+UKpeKzgncf
 ilsKrnPe1oskZZsZ79MGbEM=
X-Google-Smtp-Source: ABdhPJy43Ah9FOSiY8HpE8ZL7Ddv7D9Di+s1lHYsLFRvTvfK2Jwp4LqUghFwV0I2Oww9IFcGf5Yl7Q==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr4133710wme.183.1606850890343; 
 Tue, 01 Dec 2020 11:28:10 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b83sm1181486wmd.48.2020.12.01.11.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:28:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>
Subject: [PATCH v3 0/6] linux-user: Rework get_elf_hwcap() and support MIPS
 Loongson 2F/3E
Date: Tue,  1 Dec 2020 20:28:01 +0100
Message-Id: <20201201192807.1094919-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

Missing review: #4=0D
=0D
Since v2:=0D
- Use extract32() in GET_FEATURE_REG_EQU (rth)=0D
=0D
Introduce the GET_FEATURE_REG_SET() and GET_FEATURE_REG_EQU()=0D
macros to check if an instruction set is supported by a CPU=0D
using CP0 read-only bits (instead of QEMU insn_flags which=0D
is not always coherent - we might remove it soon).=0D
=0D
Use these macros to test for MSA ASE and Release 6.=0D
=0D
Update the ELF HWCAP bits and set the Loongson instructions=0D
so we can run 2F/3E userland binaries.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  linux-user/elfload: Move GET_FEATURE macro out of get_elf_hwcap() body=0D
  linux-user/elfload: Rename MIPS GET_FEATURE() as GET_FEATURE_INSN()=0D
  linux-user/elfload: Introduce MIPS GET_FEATURE_REG_SET() macro=0D
  linux-user/elfload: Introduce MIPS GET_FEATURE_REG_EQU() macro=0D
  linux-user/elfload: Update HWCAP bits from linux 5.7=0D
  linux-user: Add support for MIPS Loongson 2F/3E=0D
=0D
 linux-user/elfload.c | 42 +++++++++++++++++++++++++++++++++++-------=0D
 1 file changed, 35 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

