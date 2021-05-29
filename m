Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464FA394C4D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 15:06:26 +0200 (CEST)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmyfY-00040n-So
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 09:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmyec-0003He-Pa
 for qemu-devel@nongnu.org; Sat, 29 May 2021 09:05:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmyea-0000a3-O6
 for qemu-devel@nongnu.org; Sat, 29 May 2021 09:05:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so7873847wmc.0
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D39LBDTjVnFeFcVzucnITXqDwlPmZkN3o0zbJa8Rm3A=;
 b=H6FRACHkUlx/jPbS0E2uWPFtQkDEk8c4ZLNgktzAGkdP37npdfEIhehE8zF7i4kHa7
 xV3rdlZL7gs2kWJ9+XG9bM7tGIUhzfyv13AlA6LThNktuMZYYKs4DmMGT5W26lNQ4v/B
 +y5/NFlI6Ev/jRqjajrYUsx7u1xI5aISsLLqrLTQhiQivaKpcpB9Y99rpxIixLZ57VZN
 w2liB1uNMcRlmYq9SqwEMTA9YR6nxojFH3YKBxl1o+LiYtT+lxDvRfAu8HCwLQE0eGnp
 LxTD2ievc7dymPyTGsg30pPdWmKlpQxzwWLwGmaLSuzOyoSM2icPIMGpBRMsqXeXHjNt
 Ii8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=D39LBDTjVnFeFcVzucnITXqDwlPmZkN3o0zbJa8Rm3A=;
 b=c/B+CceeNrPXGIXTB8yC5MhQUrzj3DBxkm0vJWUU/Rr3BEIeUVvObcjLDkZH8PeOJ6
 sspRL23wiP2insCd7AZsVrRMl5i0K0WvGcEsPIzuJfC5xaNmabYFV/VOvqPv4MScFsYD
 /4vxHbvphbYOv4CEmYOW2McTohXfUYaGzutjZ5u6DpthglZjiEf58SRUiZJkHWEmuS7I
 yPg6hrFUpbPl35dyCPB3pk8+AISsVAaGdwdnN2WM9v2BbJXI9JDMNzmB0oIiUosYXAUd
 zZ34/qEXyDx3q0mjUFh9RCesGjKolfiKVos4B9h84Zw5VPcx+5XOlDOm+/WBGwwZ6Ikv
 4eoQ==
X-Gm-Message-State: AOAM5335NOx3U4qGtG4qDqRAUBmfnG2G27MpSKsPhWCsji3fXuuCvUEa
 dA6sdl4AItZ0EGuQT5Xy+/auvliIp18iuQ==
X-Google-Smtp-Source: ABdhPJx4buMDjLpH+EtHOC0+yInh3rTxrS0/C+qeNNp8cncSwXAaji0ZH12OoygmUnbqCwgxpYb1WA==
X-Received: by 2002:a1c:e284:: with SMTP id
 z126mr12790524wmg.108.1622293522885; 
 Sat, 29 May 2021 06:05:22 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h9sm9489105wmb.35.2021.05.29.06.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 06:05:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Fix DBALIGN DSP-R2 opcode 'byte position' field
 size
Date: Sat, 29 May 2021 15:05:19 +0200
Message-Id: <20210529130520.1039274-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Jia Liu <proljc@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "MIPS® DSP Module for MIPS64 Architecture" manual (rev 3.02),
Figure 5.12 "SPECIAL3 Encoding of APPEND/DAPPEND Instruction Sub-class"
the byte position field ('bp') is 2 bits, not 3.

Cc: Jia Liu <proljc@gmail.com>
Fixes: 26690560240 ("target-mips: Add ASE DSP compare-pick instructions")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c03a8ae1fed..e68647ce14c 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -23016,8 +23016,8 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
             }
             break;
         case OPC_DBALIGN:
-            sa &= 7;
-            if (sa != 0 && sa != 2 && sa != 4) {
+            sa &= 3;
+            if (sa != 0 && sa != 2) {
                 tcg_gen_shli_tl(cpu_gpr[rt], cpu_gpr[rt], 8 * sa);
                 tcg_gen_shri_tl(t0, t0, 8 * (8 - sa));
                 tcg_gen_or_tl(cpu_gpr[rt], cpu_gpr[rt], t0);
-- 
2.26.3


