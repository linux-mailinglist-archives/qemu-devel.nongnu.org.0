Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5BF690056
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:26:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0MI-0000zw-0G; Thu, 09 Feb 2023 01:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0MC-0000yd-F8
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:24:32 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0M9-0007x0-R5
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:24:32 -0500
Received: by mail-pf1-x435.google.com with SMTP id y4so680730pfe.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 22:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rfCWSS9jG8oH/r1HKi/uvLvwEOlj2iUYuI+0QRVQEBI=;
 b=JX9AUpxnix8Mmj0KQMXg0OEVqeFJNIpZhExeW9R8Uzf6i7/nIVe3C3v9Kv+nYiLz4K
 fAxmnpJjbqt2YWL2SmJOweUYxVNvYlmeizR82/1LHEaLslx7I/cQA5R6e2zavM/fr/V+
 Lmoro6mVpJDBu14D/ICrtWEEfpmCzuIZLytUbPtv2S95/TlZMvFRRhoXmNll/xAfXhtM
 bcducoIsLGo1DQgo338SOaKfXXrzLX7hPZVbrTVHLGEsTCODA1V8msGs+ZhSFUMVlKQo
 MhK7euCfztQhLi6oxztcDnvE3Aafg8LNmpvSz1iStzs/MUaWeDtDhg/Js9sNUWYrS92O
 u/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rfCWSS9jG8oH/r1HKi/uvLvwEOlj2iUYuI+0QRVQEBI=;
 b=AYnJSClFI94h+yM+4qYxudySYAg+FhEPKk9+CaukcK6p6ouBWC6ovgkpWWyzmEDwep
 LqkfaZr0c+8i9QR7tfPfPl4BmuUGedl5lfVpY8xhSe3yo+oKek5plnWSxv3VPTqDl9Tw
 jiltYwguyHGHp8WQDp1IkynCrZpHMPrfAg34/ESsbFxZSqWaoRf3qMilJB/gWtPQBhDB
 8AdkWFS7V36GPVAHt/7ZBX9aEMVaPyXv9YVs/qAQEUkm7quVm5EVJAInribNwX4qGfpF
 IZY6J+zgHKro7EiwLaFUiIgziQzDZeiiZpOFiKD7qC/jOI0/nybbHcSJk7a5D7pr0j4k
 6pBA==
X-Gm-Message-State: AO0yUKUrpuV/m9fLCQ+hLhSCegJLh0m99jUeV2H1iD782aP+BgGt74pe
 M/I0dohFO/Ybqtf6xiQhVzsHGQ==
X-Google-Smtp-Source: AK7set839n6ikNwAbkrWdYqvM1B4a65Iw/g5D22S8UasZYGNb8RhDcMemUJpc8aG2TscgYPqCDipRw==
X-Received: by 2002:a62:16c7:0:b0:5a8:5424:d139 with SMTP id
 190-20020a6216c7000000b005a85424d139mr1194347pfw.20.1675923869059; 
 Wed, 08 Feb 2023 22:24:29 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:28 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 9/9] target/riscv: diassembly support for
 zisslpcfi instructions
Date: Wed,  8 Feb 2023 22:24:04 -0800
Message-Id: <20230209062404.3582018-10-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch adds support to disassemble Zisslpcfi instructions.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 disas/riscv.c | 127 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d216b9c39b..d16ee617b0 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -163,6 +163,7 @@ typedef enum {
     rv_codec_v_i,
     rv_codec_vsetvli,
     rv_codec_vsetivli,
+    rv_codec_lp,
 } rv_codec;
 
 typedef enum {
@@ -935,6 +936,19 @@ typedef enum {
     rv_op_vsetvli = 766,
     rv_op_vsetivli = 767,
     rv_op_vsetvl = 768,
+    rv_op_lpsll = 769,
+    rv_op_lpcll = 770,
+    rv_op_lpsml = 771,
+    rv_op_lpcml = 772,
+    rv_op_lpsul = 773,
+    rv_op_lpcul = 774,
+    rv_op_sspush = 775,
+    rv_op_sspop = 776,
+    rv_op_ssprr = 777,
+    rv_op_ssamoswap = 778,
+    rv_op_sschkra = 779,
+    rv_op_zimops_r = 780,
+    rv_op_zimops_rr = 781,
 } rv_op;
 
 /* structures */
@@ -1011,6 +1025,7 @@ static const char rv_vreg_name_sym[32][4] = {
 #define rv_fmt_pred_succ              "O\tp,s"
 #define rv_fmt_rs1_rs2                "O\t1,2"
 #define rv_fmt_rd_imm                 "O\t0,i"
+#define rv_fmt_imm                    "O\ti"
 #define rv_fmt_rd_offset              "O\t0,o"
 #define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
 #define rv_fmt_frd_rs1                "O\t3,1"
@@ -2065,7 +2080,20 @@ const rv_opcode_data opcode_data[] = {
     { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
     { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
     { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
-    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
+    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
+    { "lpsll", rv_codec_lp, rv_fmt_imm, NULL, 0, 0, 0 },
+    { "lpcll", rv_codec_lp, rv_fmt_imm, NULL, 0, 0, 0 },
+    { "lpsml", rv_codec_lp, rv_fmt_imm, NULL, 0, 0, 0 },
+    { "lpcml", rv_codec_lp, rv_fmt_imm, NULL, 0, 0, 0 },
+    { "lpsul", rv_codec_lp, rv_fmt_imm, NULL, 0, 0, 0 },
+    { "lpcul", rv_codec_lp, rv_fmt_imm, NULL, 0, 0, 0 },
+    { "sspush", rv_codec_r, rv_fmt_rs1, NULL, 0, 0, 0 },
+    { "sspop", rv_codec_r, rv_fmt_rd, NULL, 0, 0, 0 },
+    { "ssprr", rv_codec_r, rv_fmt_rd, NULL, 0, 0, 0 },
+    { "ssamoswap", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
+    { "sschkra", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "zimops_r", rv_codec_r, rv_fmt_rd, NULL, 0, 0, 0 },
+    { "zimops_rr", rv_codec_r, rv_fmt_rd, NULL, 0, 0, 0 }
 };
 
 /* CSR names */
@@ -2084,6 +2112,8 @@ static const char *csr_name(int csrno)
     case 0x000a: return "vxrm";
     case 0x000f: return "vcsr";
     case 0x0015: return "seed";
+    case 0x0006: return "lplr";
+    case 0x0020: return "ssp";
     case 0x0040: return "uscratch";
     case 0x0041: return "uepc";
     case 0x0042: return "ucause";
@@ -3554,6 +3584,87 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 1: op = rv_op_csrrw; break;
             case 2: op = rv_op_csrrs; break;
             case 3: op = rv_op_csrrc; break;
+            case 4:
+                /* if matches mop_r mask */
+                if ((((inst >> 15) & 0b10110011110000000) ==
+                        0b10000001110000000)) {
+                    if ((inst >> 25) == 0b1000000) {
+                        switch ((inst >> 20) & 0b11) {
+                        case 0: /* sspush and sspop */
+                            if (((inst >> 15) & 0b11111) &&
+                                !((inst >> 7) & 0b11111))
+                                op = rv_op_sspush;
+                            if (!((inst >> 15) & 0b11111) &&
+                                ((inst >> 7) & 0b11111))
+                                op = rv_op_sspop;
+                            break;
+
+                        case 1: /* ssprr */
+                            if (!((inst >> 15) & 0b11111) &&
+                                ((inst >> 7) & 0b11111))
+                                op = rv_op_ssprr;
+                            break;
+
+                        default:
+                            op = rv_op_zimops_r;
+                            break;
+                        }
+                    } else {
+                        op = rv_op_zimops_r;
+                    }
+                } else if (((inst >> 15) & 0b10110010000000000) ==
+                            0b10000010000000000) { /* if matches mop_rr mask */
+                    switch (inst >> 28) {
+                    case 0b1000:
+                        switch ((inst >> 7) & 0b11111) {
+                        case 0b00000:
+                            /* collect 5 bits */
+                            switch (((inst >> 23) & 0b11111)) {
+                            case 23:
+                                op = rv_op_lpcul;
+                                break;
+                            case 22:
+                                op = rv_op_lpsul;
+                                break;
+                            case 13:
+                                op = rv_op_lpcml;
+                                break;
+                            case 12:
+                                op = rv_op_lpsml;
+                                break;
+                            case 6:
+                            case 7:
+                                op = rv_op_lpcll;
+                                break;
+                            case 4:
+                            case 5:
+                                op = rv_op_lpsll;
+                                break;
+                            default:
+                                if (inst ==
+                                    0b10001010000100101100000001110011) {
+                                    op = rv_op_sschkra;
+                                } else {
+                                    op = rv_op_zimops_rr;
+                                }
+                                break;
+                            }
+                            break;
+                        default:
+                            if ((inst >> 26) == 0b100000) {
+                                op = rv_op_ssamoswap;
+                            } else {
+                                op = rv_op_zimops_rr;
+                            }
+                            break;
+                        }
+                        break;
+                    default:
+                        op = rv_op_zimops_rr;
+                        break;
+                    }
+                }
+                break;
             case 5: op = rv_op_csrrwi; break;
             case 6: op = rv_op_csrrsi; break;
             case 7: op = rv_op_csrrci; break;
@@ -3883,6 +3994,17 @@ static uint32_t operand_vm(rv_inst inst)
     return (inst << 38) >> 63;
 }
 
+static uint32_t operand_lpl(rv_inst inst)
+{
+    uint32_t label_width = 9;
+
+    if ((inst >> 26) & 0b11) {
+        label_width = 8;
+    }
+
+    return (inst >> 15) & ((1 << label_width) - 1);
+}
+
 /* decode operands */
 
 static void decode_inst_operands(rv_decode *dec, rv_isa isa)
@@ -4199,6 +4321,9 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
         dec->imm = operand_vimm(inst);
         dec->vzimm = operand_vzimm10(inst);
         break;
+    case rv_codec_lp:
+        dec->imm = operand_lpl(inst);
+        break;
     };
 }
 
-- 
2.25.1


