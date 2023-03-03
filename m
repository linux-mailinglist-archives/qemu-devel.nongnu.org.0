Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C936A92F0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:46:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zp-0000fy-Qx; Fri, 03 Mar 2023 03:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zb-0008QF-7C
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:20 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zZ-000858-P6
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:18 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so1589567pjz.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832936;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhVcyaR+wUHNG6/4VyYZTf+bfbXlrY349GdOzrTycmU=;
 b=dgk9U7kLWVlJ9PxwoGsoKY/S6CAm//dppwNf0gBPZcwvTkwRVLafmFrl0OX1yiTSv1
 RDufYx3H2iyE3J5PbUWJLOjXMQ9X2IZ/M34pxbq/cF1o90gZs/LapXoRopE8CCIvLrpb
 NLci7//FwpH4VP7HhT2IhQKD3/L+gMlrFrlQgxI4xcOhfm9k9pNVV6L/WThjB26OjgwL
 74zbFwqB0gJYNKpzJQskMe+GFLxYG0/bmOT6dUq2kfLqfwt3ewy1DZfBDSh1vFJdQ1v9
 WHi08ow15G4hUgp3D0sIacskFBy31KLtQ+9Ntk41pFKSG6SHaq5jf85eDikAnLi2IiU6
 P//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832936;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhVcyaR+wUHNG6/4VyYZTf+bfbXlrY349GdOzrTycmU=;
 b=uKx+Ii7b3UFu0++NFtZH0v7IH51GdIjV7zg5KHuQ5Cwyh8u5Q7LnlxRC1zJQAHvL/R
 29Ur1TM02x3m5opLD/gIqUd7EGIL5LUr0EUS595WcdxdvmS4GOqFe3FJbnqsmDU/AO3g
 Z5Pfgvo2KMdhvPuWgP/TwDLPyR7e7qYLl9mb3SskO+fAFG3Jrf6sw5CT8WNU5b5tznJB
 UignGG9B8kSfLpKgCQTOpNyUz8IN4/i1JDjwO/p8PVAZzbE6vpgRqfsmP7F9wYV5XoOQ
 Ib7CzVdhWN2UozZy3UQ4ninJE6h3Udg+YUsslEKBW8Jnfh32h+qlKSXXzzQg21fREfst
 mW5Q==
X-Gm-Message-State: AO0yUKUlszHEhB6C/ydwG1tkJQgrROocOT0XXjRgUtKhygOImY+DyqKG
 BLZ1PlfgoE/mUF5KkfVwTUjmaA==
X-Google-Smtp-Source: AK7set+S1HNkb2BFMOesMBPEGQQepTlPKZbLQVOcRVUKIEhib1EqOiCqhXvXJOsYsvz7OTS6aRnz8A==
X-Received: by 2002:a17:90a:194c:b0:237:ae98:a47f with SMTP id
 12-20020a17090a194c00b00237ae98a47fmr5195634pjh.1.1677832936545; 
 Fri, 03 Mar 2023 00:42:16 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 lj10-20020a17090b344a00b00233e937fef9sm1035279pjb.18.2023.03.03.00.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:16 -0800 (PST)
Subject: [PULL 44/59] RISC-V: XTheadMemPair: Remove register restrictions for
 store-pair
Date: Fri,  3 Mar 2023 00:37:25 -0800
Message-Id: <20230303083740.12817-45-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 ristoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Christoph Müllner <christoph.muellner@vrull.eu>

The XTheadMemPair does not define any restrictions for store-pair
instructions (th.sdd or th.swd). However, the current code enforces
the restrictions that are required for load-pair instructions.
Let's fix this by removing this code.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230220095612.1529031-1-christoph.muellner@vrull.eu>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_xthead.c.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index be87c34f56..cf1731b08d 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -980,10 +980,6 @@ static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
 static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
                              int shamt)
 {
-    if (a->rs == a->rd1 || a->rs == a->rd2 || a->rd1 == a->rd2) {
-        return false;
-    }
-
     TCGv data1 = get_gpr(ctx, a->rd1, EXT_NONE);
     TCGv data2 = get_gpr(ctx, a->rd2, EXT_NONE);
     TCGv addr1 = tcg_temp_new();
-- 
2.39.2


