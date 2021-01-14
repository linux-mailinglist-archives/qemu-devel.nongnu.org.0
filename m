Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411F2F666E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:53:46 +0100 (CET)
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05sX-0006KQ-7K
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NX-000469-3k
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05NV-0000fn-Q6
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:42 -0500
Received: by mail-wm1-x334.google.com with SMTP id 190so5041175wmz.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+bqKlnEfFRmj5v8E+YfbhSrC+aoDwaK7RGCVTYsQLQ=;
 b=AoOjr2FPFJl0+yxcJgQc7JKJxlaUWbKz9/hnrfvrKTpSMgCibZJuKTWKepTRgHjXzA
 C7ZPkXhSuY3yoy0yRuicGRTz6IEhRgDUavr0PyMKiFBPSMLIH0xQiGQM7mHAjwBqO4bu
 cf9J3RjKnceBKST2/8hCAGQa2eK19BAikNhzTryMIR2Tbn3O3zAcLMJ7VYatZls3FH8c
 QCFAc0YhOu6lbM1V1+5YMP1dDC/UAYwXdnX+ECxDoRkZTyRIhCTPXNVGiWkGt0jTRbaI
 ZB4kj5+3qCLtdDdxzZ2B47eV2sYBajecY37h/BCOTr7pzX+J9sLjWbr+il5yY/jzYCug
 jTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O+bqKlnEfFRmj5v8E+YfbhSrC+aoDwaK7RGCVTYsQLQ=;
 b=dIdOQ5MgLoaWRcbHl0KsHH4ULHs98ag2i4/U9PuanS4h55/fqanGZJGVZ669z/6Qv/
 cipBlK+iLk6+9sXg14CSjJNloih4BIX688/Y0Pelg+o7Og4koiM+Pl0sFQNO3qIY+GBs
 Mnr04bTXxpUkvsKVr2enZq3elmtrSOi4e9O2gwFK37G/ZOXPsTL+6Dk4WEzBrmhMBNaz
 gquwF/JYQoxC2Oe7AY5q4NG3vUiPLjWVhgsAaOuMy+D8PO1dh0Y2brlM5LRWEi5MD0wy
 iumtnS1P+OsmKysiWHXsq82ILC2fHnReKIZ5lYMxTN6K/XZ4iofwuDY5vrtjrV785lts
 i4rw==
X-Gm-Message-State: AOAM5308nedW/PC09qXYNyWolFq6r93p+URtpgnuCmMluAFKnL0SulWE
 X5bvN0pf5mEnk4QL5n6/33lsRY5aj5s=
X-Google-Smtp-Source: ABdhPJzPaNnsXuPTsQ952QlN85iMZIYEQfHfnE0p4XPI2RGtLQIrfFa6Zdk3UxlOeCIZKoyHanZURw==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr4695025wmi.164.1610641300225; 
 Thu, 14 Jan 2021 08:21:40 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z6sm10988226wrw.58.2021.01.14.08.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:21:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 66/69] target/mips: Remove CPU_R5900 definition
Date: Thu, 14 Jan 2021 17:20:14 +0100
Message-Id: <20210114162016.2901557-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 823f2897bdd ("target/mips: Disable R5900 support")
removed the single CPU using the CPU_R5900 definition.
As it is unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210112210152.2072996-2-f4bug@amsat.org>
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


