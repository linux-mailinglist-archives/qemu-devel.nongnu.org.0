Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0B6326C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 09:53:00 +0200 (CEST)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkkvr-000777-On
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 03:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52154)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hkkty-0005jh-Tp
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:51:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hkktx-00012A-W3
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:51:02 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44159)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hkktx-000116-Os
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 03:51:01 -0400
Received: by mail-pg1-x543.google.com with SMTP id i18so9010099pgl.11
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 00:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cAdcykhsBr9KRoTt+e4UsNPsrOD05Rn6WRA4P8vaXKM=;
 b=HYNIrH28ZpPg18i1vmo5d8l1oNT6QxQMUi1kMKAb9z5YjaRQtND+t8FXDt3/cBdw/d
 6aHogVRJPt1ij8yvHdcCrSQxnsVNB4bOSv7w2ABVlGpUVnbAmXxRTl6OGSLhANPMAGJ0
 mIHshu0+JpHJIARZ69TOiDIgSjUuHmefK/ZFqCxuwUZURspSMJsvF+PbzPJfdPWRfJ3Z
 nIfwDDxHnybLa3tsgMeDvDr/hZNdh4ZOHY1CPnWSJqdZMeBhNWv6v9DBynSHvKEeegUa
 cdHtz6f2bBzGRWwDnzv7H8nvlPnFspGdeNkNlbbAthRFVmGNeEVCeb1E2/9N5quYIKoc
 yczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cAdcykhsBr9KRoTt+e4UsNPsrOD05Rn6WRA4P8vaXKM=;
 b=nfV/iZLqIcUAZs7i3QUj+ThiYb6Xs9GK8QfeqV5Eus4/yfhL9AKCfRBUGW5PulAsDW
 J/J/vu4iHzHBx3CSZ1fRhDEB8ogF9ZEc4/f0CxhWGFaJyPihNt4o4EwCZn3GlZSzarLQ
 K4Ed8XuubnyWbhSGFaaMTNXe00BnZB8nSuztlI7/TDL/sRBu/3wu+WBOlO21X7G/hoaz
 hNRDdObzsun817R9hS22TOa42hjaGecvh3c7AquXJq1VJZAt7R2rcQJ5EQ4P1Jc/yHsN
 DM5xzs+ZQPt4pO03vf9pZ/RGIPWzc6jQFhiLLh92fOFJi6nnJ7hWylrjbBioQt6pyslb
 XsXA==
X-Gm-Message-State: APjAAAVxJPGeVAT9aoCAKq+HCfY5koT9MKKOBA/36NWWdlW3uGScFWQK
 uBfxwdPO5OjeCW/mqill8kmkzBsaJUnFeA==
X-Google-Smtp-Source: APXvYqyrkydOQa+k3S03narlVU4z0XF3EYVXAbW1kEjjxGGVlDID32zUWrvUSv/mxAtelGnEChG8fw==
X-Received: by 2002:a17:90a:3544:: with SMTP id
 q62mr31463542pjb.53.1562658660342; 
 Tue, 09 Jul 2019 00:51:00 -0700 (PDT)
Received: from localhost.localdomain ([172.56.12.212])
 by smtp.gmail.com with ESMTPSA id y22sm28237375pfo.39.2019.07.09.00.50.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 00:50:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 09:50:39 +0200
Message-Id: <20190709075042.13941-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709075042.13941-1-richard.henderson@linaro.org>
References: <20190709075042.13941-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PULL v2 1/2] tcg/riscv: Fix RISC-VH host build failure
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Commit 269bd5d8 "cpu: Move the softmmu tlb to CPUNegativeOffsetState'
broke the RISC-V host build as there are two variables that are used but
not defined.

This patch renames the undefined variables mask_off and table_off to the
existing (but unused) mask_ofs and table_ofs variables.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <79729cc88ca509e08b5c4aa0aa8a52847af70c0f.1561039316.git.alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 1f0ae64aae..3e76bf5738 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -980,8 +980,8 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
     int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
     TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
 
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_off);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
 
     tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addrl,
                     TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-- 
2.17.1


