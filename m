Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB06F7A7D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:15:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsW-0004II-NY; Thu, 04 May 2023 21:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsT-00042F-LN
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:54 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsR-00077J-PQ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:53 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-51b661097bfso813075a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248690; x=1685840690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkMty94oAbLIxhqFblM8E1A1z94sOK+vVkAnvNy/KwI=;
 b=moR80q+omiN3nkg9EaOAAT3oJTDHftZ4IDOnoEHPLBWdY1VHW3J6QTVuonAMNsyf55
 rUr2mfA9Q/xFzhYmgApFJS+wWVg5w6KUwiOsq6bxU3zk5JL/RWgBY93ev+fR+l5xm7EG
 VE4m1T1gV+X1uEX7jwMgFTZVQiwF9+cD6wrduP//mSTshs4AYBRiz1sv3VYJYhhmvCqc
 I+D+fVgHeInst9c5WXX+DtGT9/hx4iO4wScnfMCKENPZfOv1KhuffCXsYW94N+ooo4gK
 vbtq1lXZ8ygO5luP6aTLVzj5p+jnu36aP2LGxkzoU2hbB+TUus3++vepZxcZ/l3zjPy4
 rebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248690; x=1685840690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkMty94oAbLIxhqFblM8E1A1z94sOK+vVkAnvNy/KwI=;
 b=Hnqwd+W5Pm0SxXCHhoNsz1/lG6m96r6ReQVqOTe4pW4EMKf9N6EYx3/+X9Xm99XmdP
 AnffdLnWHaD4Y2/uStA6evLcFi0hsV8j6djjHv5VCBMk3W436siCVGw7Fdo9tPEjYg4z
 xf7cIxU3+wrZodINhNY917v5dYDAJJE7Bfwrtmgnz7X+xQFmaBDePgKkKgQrZOElqxUn
 wXBCPAwE0bfkYoinLFEWIkyOvdfJZx4e8aORwQegeJw2Xm7MES5yh5Yrn2O5Aq28Whho
 xViAc+31R2SHzBC+1xSe9nwSnMiZxRAU6wH2zRR3SiGOlA6gkEPTsmAqeFhBtxN4K/hS
 8cJA==
X-Gm-Message-State: AC+VfDz6e6Gfk849NTi4klS4949tygaskK12BFBBZ+KW6US1/gRlXK/Q
 05kHvya0wkOJMLzkSzQzI+JeunEDFI0DwA==
X-Google-Smtp-Source: ACHHUZ6fNO2K08hRTTZ7euXj4VRjNxPv+fTj0O2CF4cSd82SJH2zq3wDwHjso5l07Q7FZP9YsHbNng==
X-Received: by 2002:a17:902:7048:b0:1ab:1bdd:b307 with SMTP id
 h8-20020a170902704800b001ab1bddb307mr4896710plt.51.1683248689898; 
 Thu, 04 May 2023 18:04:49 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:49 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/89] target/riscv: Set opcode to env->bins for
 illegal/virtual instruction fault
Date: Fri,  5 May 2023 11:01:39 +1000
Message-Id: <20230505010241.21812-28-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

decode_save_opc() will not work for generate_exception(), since 0 is passed
to riscv_raise_exception() as pc in helper_raise_exception(), and bins will
not be restored in this case.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230330034636.44585-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvh.c.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 9248b48c36..4b730cd492 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -20,6 +20,8 @@
 static bool check_access(DisasContext *ctx)
 {
     if (!ctx->hlsx) {
+        tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
+                       offsetof(CPURISCVState, bins));
         if (ctx->virt_enabled) {
             generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
         } else {
-- 
2.40.0


