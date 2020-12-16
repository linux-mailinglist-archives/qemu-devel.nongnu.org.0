Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D462A2DC17E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:46:46 +0100 (CET)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpX8f-0001vg-Uv
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5f-0000Qb-Tl
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:39 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpX5d-0005LU-Py
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:43:39 -0500
Received: by mail-wr1-x429.google.com with SMTP id y17so23206669wrr.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oTFmDDA44RDOidqjiT8+P76cR09Vmr7mXPAwAUfdyQ4=;
 b=HHYdF7ZSiuZBH+hnyv/y0XGCnZdGwfcGRe5Mk5foWBgg5j33VU+zVMrWNdREAno0eQ
 +9XNcHB0DW4QYW65QV9q3eUaqOrfzEL+XURBC7Tg/x+DcJ6131uec8HmPXFdlQZp9AvH
 j48XZfquwQVGoCtmxIbjqlqBkQxXr0H2yLKt2w5s0mrgqbXBk/jjPlVlyTTNpk4SQfNz
 wsgshU+qI1L4tqdJ+acF5BWwUpGkdQXxeRMdiCjsfaorAZWBBb9F4SwLEx/sQPNo8+yN
 mw7+cXHKyKOAG+WBMmtpsLgeU2/TZisYMxRFhTiTm+G3WXSaB9ocomcxt1LF7U2klkMV
 8yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oTFmDDA44RDOidqjiT8+P76cR09Vmr7mXPAwAUfdyQ4=;
 b=BHZNhlJquziGX11dLcLbfK/HWGsDc0jjUGkJSLDYsvMTEatA5ZJSzygBsiqAVN15Gq
 7gVNc8voWVlIkfJgGxzmk+MxUgmZP39e69as5ntO64csYvm+6Y1mfkqx4DaF2R5aKl8X
 uAmfL7TnNWTKrdLEhz+a1wsl2CSdVjwUBQtDb6ergVM2w9KAQBfjgYHQdYgKClrphuWd
 Oezohm0seFiNp/WBztURsWDhZUOCW14lAndFpKPutWQp1xWHfvwTnGc/JUIk1dz/oou9
 7Qyh7eiZl5KVk/D4Qb4SLyhB8RU+Qeev6/gAOznKuCp6ar9NJzA/y4qHkc+9hOLEkrRz
 jxaw==
X-Gm-Message-State: AOAM531v1IabMQW8BQCzLliqYFD4ZrRPG2ErMP2zCsp4jOxciFT/vlwO
 CpnXOMGJsYf0RQhnvWVcLuKjATUgT20=
X-Google-Smtp-Source: ABdhPJzGcoql/OB58uD9Roli2Wm8Gt4YBB8U++4Tv1kzU4mk7bRCclMbDtczxSWItE17QBIRSd1u7A==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr31800637wru.120.1608126216214; 
 Wed, 16 Dec 2020 05:43:36 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i9sm3439945wrs.70.2020.12.16.05.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:43:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] target/mips/mips-defs: Reorder CPU_MIPS5 definition
Date: Wed, 16 Dec 2020 14:43:18 +0100
Message-Id: <20201216134328.851840-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201216134328.851840-1-f4bug@amsat.org>
References: <20201216134328.851840-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move CPU_MIPS5 after CPU_MIPS4 :)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 805034b8956..f4d76e562d1 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -70,13 +70,12 @@
 #define CPU_MIPS2       (CPU_MIPS1 | ISA_MIPS2)
 #define CPU_MIPS3       (CPU_MIPS2 | ISA_MIPS3)
 #define CPU_MIPS4       (CPU_MIPS3 | ISA_MIPS4)
+#define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)
 #define CPU_VR54XX      (CPU_MIPS4 | INSN_VR54XX)
 #define CPU_R5900       (CPU_MIPS3 | INSN_R5900)
 #define CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
 #define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)
 
-#define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)
-
 /* MIPS Technologies "Release 1" */
 #define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
 #define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
-- 
2.26.2


