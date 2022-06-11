Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B2E5473F9
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:53:38 +0200 (CEST)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzykK-00043M-RK
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRk-0003Lj-TL
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRj-0006Fu-8W
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id v14so1487127wra.5
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dDhWhwpaGDBK8Q4fbZrV2hDpstODQvC/cOd95qzwgY=;
 b=bn9UkCd7PQwVZLfUV3H71Ad3zbxv4t+sDpSqLJJYm2Afv3adRwnKaiaDUq7OE3Oo60
 ukojDctVZKR0prdMbl/WBMw+x7qpWCL5UMCl/0Exh9x9goXcdsz/r5SsVrXeiTYZnVTu
 baBYpQaivOtWDjc1IOfxUyCUbEUCuOf2iwYnOOTWrQMsTVAWoRBjH06FJiICNcuyn6wP
 J55FGZKuqS8Qvteb8mmJEpLIkjxZ+yznavkrIFIRl+17KchzdAQh3k1N2vTl9Rkt4+Vn
 OZ+8Rg128qPy22u9r9ESouajKxJEQE0vuj80Ho5L2A2Oruq659Oj0pMG2p6KeA1qQUB+
 x35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dDhWhwpaGDBK8Q4fbZrV2hDpstODQvC/cOd95qzwgY=;
 b=k6+4IrAf61xyCzFYdnF4T8yudYzFn+dvl0RXhiAzOsciM4rfdbqpDwuXgKZVJL9HTS
 gHQ68jdgY33fhw6mnjIO4b3kYvYIWJv7GHubjBXnAQ89IL9sKs5ZTJVV+WXXSCCzDBTn
 9GjnMrtE0WZlmPtJKcZUsts/ZOljieJEsR6Vn2JOnP+psQK9KdyzHstxMVWsTqDhcPE8
 gqzz1ayL6W4XHDhGuqavqm56oEdDE89qnZujM+XTn+EGzQqg3LKkpiJVrBh6GXkbhl3U
 6HyN3mPealGIZUXNkK2zbAlIGF5FJRMHlsewGVfKyBy/m2aWG78f1JK3U4TlJ7edz/yN
 wcVQ==
X-Gm-Message-State: AOAM5327xExNUhFDnlXJ/XJctEwr5F8OW0/46Q6d10fGcfS0CYOwauW1
 7mpHLWj8y+kR30JCC4rAAQL8A4PPB7o=
X-Google-Smtp-Source: ABdhPJyAiQCnqzdS2nEldarerE1AfG9AQs1lg4XdHBaVui/RgHhxu/kPrnAu92GZJmPlbWP/VnKfbg==
X-Received: by 2002:a5d:6445:0:b0:211:7eee:2f94 with SMTP id
 d5-20020a5d6445000000b002117eee2f94mr47557555wrw.631.1654943661696; 
 Sat, 11 Jun 2022 03:34:21 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 p28-20020a05600c1d9c00b0039c7f790f6asm4211647wms.30.2022.06.11.03.34.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 13/49] target/mips: Add missing default cases for some nanoMIPS
 pools
Date: Sat, 11 Jun 2022 12:32:36 +0200
Message-Id: <20220611103312.67773-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

From: Stefan Pejic <stefan.pejic@syrmia.com>

Switch statements for the code segments that handle nanoMIPS
instruction pools P.LL, P.SC, P.SHIFT, P.LS.S1, P.LS.E0, PP.LSXS
do not have proper default case, resulting in not generating
reserved instruction exception for certain illegal opcodes.

Fix this by adding default cases for these switch statements that
trigger reserved instruction exception.

Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220504110403.613168-7-stefan.pejic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 1ee5c8c8d4..c0ba2bf1b1 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -2707,6 +2707,9 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
         case NM_SDC1XS:
             tcg_gen_shli_tl(t0, t0, 3);
             break;
+        default:
+            gen_reserved_instruction(ctx);
+            goto out;
         }
     }
     gen_op_addr_add(ctx, t0, t0, t1);
@@ -2797,6 +2800,7 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
         break;
     }
 
+out:
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
@@ -3944,6 +3948,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_shift_imm(ctx, OPC_ROTR, rt, rs,
                                   extract32(ctx->opcode, 0, 5));
                     break;
+                default:
+                    gen_reserved_instruction(ctx);
+                    break;
                 }
             }
             break;
@@ -4245,6 +4252,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         check_xnp(ctx);
                         gen_llwp(ctx, rs, 0, rt, extract32(ctx->opcode, 3, 5));
                         break;
+                    default:
+                        gen_reserved_instruction(ctx);
+                        break;
                     }
                     break;
                 case NM_P_SC:
@@ -4257,6 +4267,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         gen_scwp(ctx, rs, 0, rt, extract32(ctx->opcode, 3, 5),
                                  false);
                         break;
+                    default:
+                        gen_reserved_instruction(ctx);
+                        break;
                     }
                     break;
                 case NM_CACHE:
@@ -4265,6 +4278,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         gen_cache_operation(ctx, rt, rs, s);
                     }
                     break;
+                default:
+                    gen_reserved_instruction(ctx);
+                    break;
                 }
                 break;
             case NM_P_LS_E0:
@@ -4371,6 +4387,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         break;
                     }
                     break;
+                default:
+                    gen_reserved_instruction(ctx);
+                    break;
                 }
                 break;
             case NM_P_LS_WM:
-- 
2.36.1


