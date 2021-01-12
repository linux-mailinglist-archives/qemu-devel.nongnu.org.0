Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5522F3BAF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:03:40 +0100 (CET)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQpH-00050v-42
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzQnk-0003m1-Ef
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:04 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzQni-0007oc-Lb
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id y17so3910978wrr.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RJJLxkpXkJjGXmCJae7fsV6ghakSrAYFr/SC+ZdN6PI=;
 b=HtLUznLTTLiLDXFfEOTjYaHWSVL6eocrdSABAxZ/ifN/OO131FIZ9gzoE5tRjTMs8p
 2xqBlvP3P62IHnHFxZWVnlfeumtyNYNPbDTDwg4DIgh10kNK63AJ3zaFJwwSwOjYvyMY
 zEvzYUJXGJm4Qzt08IirMMRySaWT+VMHNxSClrbJFn3VUjAYWtd2i9RmYO62+CG3BYra
 h3rb+3OnSuRSuxY+MLk6Ipy1af2d2pzbA58eyqMFHgQVe2jQYhgm/S9mOW6KdUB6Z5Xh
 /KiJxnAjDfzmToHVEB5z4qByq6G+ELhzEOD0uozebeeZVWTFq6n/RuZXNKJQkgDRWbQK
 xI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RJJLxkpXkJjGXmCJae7fsV6ghakSrAYFr/SC+ZdN6PI=;
 b=AGt1aqg1BEigx5EmcQafiU8LzhhfLVSbGD3JVEpUEph2WB44GZY/Azcvyze3VkAYkm
 aLgiYtg9pJX2OpqlnYEGDQnqaXw2BSjDpHO1UZoRdlhHo9yMdc+LegWMof6rtdgL0gwi
 ozd8JvYaIWWA0GtWmrKEnkx4RwevovnrRXr9cH6Zln3GEvD2AT+jMKadWsd9HCU39QWH
 Xi6L5hIFFVMxvwvH62Yd4owbmlaqWOQLezVPnWox7C4+es76qbaiTCrActFNkKpiZq0L
 fTOU+8VWf7ldpb9/3sFzusE4DCk8I93KjLbug8tyyn65y42B4pkzri99OZfrwOJfOeBf
 X+ag==
X-Gm-Message-State: AOAM530rkVYVlfgNOfwJinypcZFLkFR3fejB/wm3oyoRnLpHmoPd/C19
 PWkeCr144YMaQRlHdrg26diEPPjjX+U=
X-Google-Smtp-Source: ABdhPJy094wQL2D6fc5UtS9U/7Lx2XiuPsWPVaMCbEePd1MMtZSEM+W5FrRNjh/LoMD5XEidYdIF3Q==
X-Received: by 2002:adf:dc87:: with SMTP id r7mr640530wrj.305.1610485320328;
 Tue, 12 Jan 2021 13:02:00 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id x66sm5562386wmg.26.2021.01.12.13.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:01:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/mips: Remove CPU_R5900 definition
Date: Tue, 12 Jan 2021 22:01:50 +0100
Message-Id: <20210112210152.2072996-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112210152.2072996-1-f4bug@amsat.org>
References: <20210112210152.2072996-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 823f2897bdd ("target/mips: Disable R5900 support")
removed the single CPU using the CPU_R5900 definition.
As it is unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 6b8e6800115..b7879be9e90 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -61,7 +61,6 @@
 #define CPU_MIPS4       (CPU_MIPS3 | ISA_MIPS4)
 #define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)
 #define CPU_VR54XX      (CPU_MIPS4 | INSN_VR54XX)
-#define CPU_R5900       (CPU_MIPS3 | INSN_R5900)
 #define CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
 #define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)
 
-- 
2.26.2


