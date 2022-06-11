Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9FF547461
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:45:30 +0200 (CEST)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzYX-0001C5-DE
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUf-00079R-Ng
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUd-0006rA-IW
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:25 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u8so1452898wrm.13
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fY6esjUWpYJQRunP4ZAyyQfjXBIe+rdz0gCX7PSDfA8=;
 b=d3nzn8aPhJHV+3EvhFZUCs/Tv2pMZcYX6m5fn7DgoSb8uairEPoM8GRHS1COHlT35E
 Jzd51NvM+PUkOgM/nPkUiu99ERdHEtzXFnIOrV/PORW9DT24oBFi8KaXWF9lYNoUIewH
 mRNh80b2S4hE//eFyHwzmxgTZUnHi4hi19n8NQNDSZakxEAIPFJoq07ttGh0KvIEUux6
 ouvBDwrMuci2Kzz0sGyvBLRy2hcThFrLsZtpinNPPIGrVhKpFxI2D9PWH06rCjQXJZNN
 4hcMFV6AhJON6GqKkKyCkCBprNKdHFPDB1VPKRpz3hHvAeCXpOuNHroJvPTmKAEZ54V1
 Gb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fY6esjUWpYJQRunP4ZAyyQfjXBIe+rdz0gCX7PSDfA8=;
 b=IC1d3jiutRpErYpeOeZm+agsjtZFxXMA82clK9UtmJFA9n2bT1m0DcFvx6tr8HJChf
 40xXXXqs1rFUTrDmgooFE1KGou8fybrdPaA7w+yjcVxooEH3p5WKtiUkUydHbBXuEoOJ
 tc84QNrT0iJIIyjnL9Q6wIA+P6OFbe22WTQEVm0jeDnL9NQgUt+LxjuwdZmtS0Pnzuns
 NTHdub5ZcnPgJzKEA+n9ICsqYHmrlND/UUQYjUXYR5uPYaq0TJP/ltBhdGIgTrj/+jO3
 /hwYbn+lhOy54ZaE189r5aGteQp9sBLB32Q73nQ4N4+Rq8IiWVDLHj4GRbX3IUa8PILm
 8C9A==
X-Gm-Message-State: AOAM530RgtRL2ZBYP/aqCkzUREsXwMTThf7QF0tz5PvLikkkR560hPVj
 iT7f+fnggxSNPJJwCS3+wD+HMWZ8Fzc=
X-Google-Smtp-Source: ABdhPJyXfgYO2k7wWHWMYv41gfYtI6S3UM68ITOw8MkjY2lGI/sjLJrmZVlBZ5jnM7+1SRVzTo6JoA==
X-Received: by 2002:a5d:59ac:0:b0:218:5b7e:1c1c with SMTP id
 p12-20020a5d59ac000000b002185b7e1c1cmr19910017wrr.621.1654943840999; 
 Sat, 11 Jun 2022 03:37:20 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6887000000b0020fdc90aeabsm2121911wru.82.2022.06.11.03.37.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:37:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 48/49] accel/tcg: Inline dump_opcount_info() and remove it
Date: Sat, 11 Jun 2022 12:33:11 +0200
Message-Id: <20220611103312.67773-49-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

dump_opcount_info() is a one-line wrapper around tcg_dump_op_count()
which is also exported. So use the latter directly.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-10-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c      | 2 +-
 accel/tcg/translate-all.c | 5 -----
 include/exec/cpu-all.h    | 1 -
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7cbf9996b7..a565a3f8ec 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1091,7 +1091,7 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
         return NULL;
     }
 
-    dump_opcount_info(buf);
+    tcg_dump_op_count(buf);
 
     return human_readable_text_from_str(buf);
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 291034cb09..8fd23a9d05 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2124,11 +2124,6 @@ void dump_exec_info(GString *buf)
     tcg_dump_info(buf);
 }
 
-void dump_opcount_info(GString *buf)
-{
-    tcg_dump_op_count(buf);
-}
-
 #else /* CONFIG_USER_ONLY */
 
 void cpu_interrupt(CPUState *cpu, int mask)
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9a716be80d..f5bda2c3ca 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -421,7 +421,6 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 #ifdef CONFIG_TCG
 /* accel/tcg/translate-all.c */
 void dump_exec_info(GString *buf);
-void dump_opcount_info(GString *buf);
 #endif /* CONFIG_TCG */
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.36.1


