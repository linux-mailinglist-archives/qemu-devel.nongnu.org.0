Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495531B1F8
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:26:07 +0100 (CET)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM5u-0001XB-Dm
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhf-0008Af-VM
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:04 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhd-0004ZG-Jv
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t15so6049009wrx.13
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/yA3MiSiB3uT9Xjxi1oykbexC0jiCz4UetHOuLmN0wM=;
 b=TjzNSbs82iu20bf6vdpCrg/tmk9LD8qup1ZmGFUl1F32zBMNu3bdJdJ0ovPvakEqYZ
 gbACev4mp/OoM0BD9jnPXAOTDlT8QGqES1C1HbiX8MSOBrT7PCdlCz0J64ZfnJqMh/NG
 o/jFxOn3O9hTBYKn+u6g/1RwFk7c8AiQsx92PC+X5Oe1hGCzz15YAwlFMELNTg57ZQhD
 MpOkn/njEJjUM+6dYRN2edKm0iXYd+hZA/RncnpdjY5QGl2yJHqbUyTb+VpjK+9m6cOe
 U3xG3tMo2/Rgxr2anI9yuIACvJGLZHn6Vij0Ls83Ysqe5DLD8SV8fVFtNiluzm8b1qFi
 YD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/yA3MiSiB3uT9Xjxi1oykbexC0jiCz4UetHOuLmN0wM=;
 b=lwFVXL7qbVV59rf4MiWa8pOIUiXtbIK56QO8u6zAnJk8wSM2aA+Kq6yQf64fVrLBGY
 w2r1gXxkkzG02s2a2mzrkNJgdk8qECtb4AFCcRcd0IZnsR2mxxjfvRW0hxJNxtn1XlKk
 /VTAXGYyFhw9kO2DYu54SkPs+ExVrYkBpy3pBA47/r3VxVQs+mB4ssjufHBBsFReHkBw
 9jN8H0/ozn8HKEQhz5BZZZyVkXxoDxmDEAeb8K697qD0mAzGPI7Ft4MHVQ8KygzSuMJj
 2T6NcmNbvO5LZvfGZrHnyJ0/+iWrGh94EpBwCivDTUtBt2QGHS+9UFWUv+K/H/KrLHy8
 LUyw==
X-Gm-Message-State: AOAM532zYfnrcsiq3Z062WmxqVZTTpJ2mi6iBCgYPHYn3miZeu0QzffG
 2b9d0XdUksXerX+aJPbO4NUydtiixT0=
X-Google-Smtp-Source: ABdhPJzONsXCB+l4iVwMQBpVTDvHzSE55wTcqRkLLeQzJmym63dncZaoUpnYZzfGFNFfa+s5LdfbJQ==
X-Received: by 2002:adf:9031:: with SMTP id h46mr14874490wrh.19.1613325660008; 
 Sun, 14 Feb 2021 10:01:00 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s10sm20256521wrm.5.2021.02.14.10.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 21/42] target/mips/tx79: Introduce PPACW opcode (Parallel
 Pack to Word)
Date: Sun, 14 Feb 2021 18:58:51 +0100
Message-Id: <20210214175912.732946-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the PPACW opcode (Parallel Pack to Word).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  1 +
 target/mips/tx79_translate.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 63fbe9694bb..653910371d2 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -38,6 +38,7 @@ PCGTH           011100 ..... ..... ..... 00110 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
 PCGTB           011100 ..... ..... ..... 01010 001000   @rs_rt_rd
 PEXTLW          011100 ..... ..... ..... 10010 001000   @rs_rt_rd
+PPACW           011100 ..... ..... ..... 10011 001000   @rs_rt_rd
 PEXTLH          011100 ..... ..... ..... 10110 001000   @rs_rt_rd
 PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
 
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 04249b0c20a..ac75d95b82b 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -416,6 +416,36 @@ static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
  * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
  */
 
+/* Parallel Pack to Word */
+static bool trans_PPACW(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 a0, b0, t0;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    a0 = tcg_temp_new_i64();
+    b0 = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+
+    gen_load_gpr(a0, a->rs);
+    gen_load_gpr(b0, a->rt);
+
+    gen_load_gpr_hi(t0, a->rt); /* b1 */
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], b0, t0, 32, 32);
+
+    gen_load_gpr_hi(t0, a->rs); /* a1 */
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], a0, t0, 32, 32);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(b0);
+    tcg_temp_free(a0);
+
+    return true;
+}
+
 static bool trans_PEXTLx(DisasContext *ctx, arg_rtype *a, unsigned wlen)
 {
     TCGv_i64 ax, bx;
-- 
2.26.2


