Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC8F33A0CD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:57:57 +0100 (CET)
Received: from localhost ([::1]:53106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAOa-0007oj-7i
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGj-00083M-MZ
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:49 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGi-0007Gp-92
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id b9so3617667wrt.8
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2Z0O0pMji5sPBGCo+tbE5Tls7XBWXUfioYeWCs//1A=;
 b=R685hd6x/p1qzSK0VJiGHHCflDztVaqPf0jZrQHAb5sUCZ4vYsnb1PZ7Wp0+5z+MXT
 WvKUx5yK1z5v2FDePVhSiVYzYLoQeLAngq2D5YC87ZUj3wA+/dFooi62prSn8dO6fuhv
 i2Bz6Nr5WGyx7We8pcWxzGDoefHLGYwYc2s7MiFNle3XuaKBQ6O3QfDGJb9FWwHPJmEu
 FEYNiRKP/10UhEIbduw5nVM9+yrLROWGxVZtrtnUOCvLYJNhSQP7+fTxsNpmOeeLikKm
 /QLD0sRBeybRxuA3fBvRnAjsWxdPZ4kwbdPm9zf+e6Nj/KF+UXnclqp4MxbL4a53Wd+i
 ihIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E2Z0O0pMji5sPBGCo+tbE5Tls7XBWXUfioYeWCs//1A=;
 b=InmIffDrSoGDCz5GDXgqa/GD/efzUCkIfmCZUDYGPGOL2D4VlvC7nWSCPR15owkazH
 OvqlopwV/ugE2MopzU+9EcbarEIYqj8rRDSkmcw5ZWY7ixrWjn45EveV05aGWOOQTKZM
 Lk+KrFIV5q0mmdwwbW5JSwoLs/SAcN2j7PdEWWUstoyotmT2K5cZ546lQNTJhZZMcveL
 kR+QZJjNsFW2IfLjnlnvtq55nDmZOdHGyzImeC5YkqgYslokE1LkDeioBfF1zysuKx30
 xk4njpo0uhfYFqJmx7I/4HyBWMRPrOzHmSjCBN5e68aWyZZRe0HpQl6cy8JXRvfw7DKq
 QOQQ==
X-Gm-Message-State: AOAM532z06S2Ha/q24XJhBqy38lMdr1f7SJWlBrIQW2vJeaMtHfRe0sQ
 LPSUGyOsxWd7jUCw5B3tvkRNXfjYN//nNg==
X-Google-Smtp-Source: ABdhPJxtKtcWK7vbBO+SZV0W+2fma3rZ6WGCJNiax5MFC+8dumDQ8L7TIzHcUOxkLMS75u3xRPd8Gw==
X-Received: by 2002:a05:6000:1ca:: with SMTP id
 t10mr20290464wrx.45.1615664986674; 
 Sat, 13 Mar 2021 11:49:46 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q19sm13924141wrg.80.2021.03.13.11.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/27] target/mips: Convert decode_ase_mxu() to decodetree
 prototype
Date: Sat, 13 Mar 2021 20:48:17 +0100
Message-Id: <20210313194829.2193621-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To easily convert MXU code to decodetree, making it return a boolean.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5c1909f0ba4..99269cd6691 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25779,18 +25779,18 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_ase_mxu(DisasContext *ctx, uint32_t insn)
+static bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
     if (opcode == OPC_MXU_S32M2I) {
         gen_mxu_s32m2i(ctx);
-        return;
+        return true;
     }
 
     if (opcode == OPC_MXU_S32I2M) {
         gen_mxu_s32i2m(ctx);
-        return;
+        return true;
     }
 
     {
@@ -25831,6 +25831,8 @@ static void decode_ase_mxu(DisasContext *ctx, uint32_t insn)
         gen_set_label(l_exit);
         tcg_temp_free(t_mxu_cr);
     }
+
+    return true;
 }
 
 #endif /* !defined(TARGET_MIPS64) */
-- 
2.26.2


