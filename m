Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D843F75A3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:10:49 +0200 (CEST)
Received: from localhost ([::1]:38302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsg4-00010f-FQ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYq-0008Qb-8z
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYl-0002WE-RB
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso4240701wmg.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kjbo44C+aLSAcGoSs3bQbdHITtr6Uuw/aGDBMO9Ay24=;
 b=ML78U4CiUiN502HOsW40Y6kVgwngsWhirhSDatD4U2XtgXDaIVgbZlZvhzgRR1wY4J
 AN1igNpbodzHqwXJbQuuYmWFORzTSRV6wtRsbhJcWGC6TKTidgZDqpou7fCQXorbDaHZ
 oyfzUsK9ZAv09EhyJBzAKonvAEtR23kp/agmGMv3Lc95i9FIGOo3KcOF5aE9bIJuEwR+
 BH/N2STJXuRJABzk/SkEtH5Pbjg9LpVNam/JiKQo9QTqLMSEak+m/YkYnqT0PY+l4PVq
 zZeZANMUPs36S/5XNcGBLeSD/vOKTpR+LSaEDduqDtawVrOL0wqAO5BfxhYE3JCUlmcy
 IB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Kjbo44C+aLSAcGoSs3bQbdHITtr6Uuw/aGDBMO9Ay24=;
 b=dAynx2YmQd+/iZMlvPSoPQaBkBTu62dVdl3qS58AjJQET5b1zK5qnirJntIiT5haQr
 R3h3Njq7MLwoRzPfO3MSwDze7Pd/I8+6Nt7My/biMxDGtIzdT+JjdnxX5Ys9qYQYjaND
 JaEvRnmJXTg0fHbjExTi3hp20Y1WAUxy5GSt8Z3qaeFnHA8Ww17qVZmRq9LgXD2eoZp9
 fD2nM1FRPnZp2QK5qersH7oaSYHB6TMKrlgH6ctybfZGRkK/rnUxudCUHyM73sOoJ/Bj
 WipQ+fgpazg6YkaJajS7ErHZkLZRD4dlFIDLKRFvNsz1Z5wepXOfP4OgIW9mwpNo91MT
 CIpA==
X-Gm-Message-State: AOAM530c/TJ53jAEY2YRiyZI4rVQ5RSTHxUtZEu+4Fqt7tlAl75dbXp/
 6VCgSKloxuBHqTGrCxzqdaS1TWnQVD0=
X-Google-Smtp-Source: ABdhPJyxbV1cugjobW9uTxc0iPNTDI2KK5KoSWshZ79MVs41sPP/lFmRcAXMo0dQ3n7cX1peNrvCKQ==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr9023526wmg.124.1629896594311; 
 Wed, 25 Aug 2021 06:03:14 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 n4sm6640372wri.78.2021.08.25.06.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/28] target/mips: Document Loongson-3A CPU definitions
Date: Wed, 25 Aug 2021 15:01:56 +0200
Message-Id: <20210825130211.1542338-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the cores on which each Loongson-3A CPU is based (see
commit af868995e1b, "target/mips: Add Loongson-3 CPU definition").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Message-Id: <20210813110149.1432692-2-f4bug@amsat.org>
---
 target/mips/cpu-defs.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index e03b2a998cd..c6ab3af190e 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -805,7 +805,7 @@ const mips_def_t mips_defs[] =
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-        .name = "Loongson-3A1000",
+        .name = "Loongson-3A1000", /* Loongson-3A R1, GS464-based */
         .CP0_PRid = 0x6305,
         /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size.  */
         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
@@ -835,7 +835,7 @@ const mips_def_t mips_defs[] =
         .mmu_type = MMU_TYPE_R4000,
     },
     {
-        .name = "Loongson-3A4000", /* GS464V-based */
+        .name = "Loongson-3A4000", /* Loongson-3A R4, GS464V-based */
         .CP0_PRid = 0x14C000,
         /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size.  */
         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
-- 
2.31.1


