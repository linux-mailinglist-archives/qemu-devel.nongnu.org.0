Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C31FC76B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 09:30:38 +0200 (CEST)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlSWr-0003s1-Sh
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 03:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSSC-0004V8-PU; Wed, 17 Jun 2020 03:25:48 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSSA-0002Z7-Vt; Wed, 17 Jun 2020 03:25:48 -0400
Received: by mail-wm1-x344.google.com with SMTP id g10so794474wmh.4;
 Wed, 17 Jun 2020 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRuYrkZwAIJ2Q2Q4lPg1tjWevvwY/3xzxDc6xxMros0=;
 b=Fa7mOoDl6z6gH7ieeOWAN3PUnzx1fNJLc+q0jN46c2JPc4h8S2Ov4N0uihhifmOV7S
 +R1l4ZHpxsStx1NWeJOMTMK7Bm26B611BLDM47Jfu+EolyCk6eOA8Q1KSyZQ5238vfOM
 O09eYKt36h+1FrJLMKNW525/ZVT91YIin3n0P4N1EeU/ebzxYw1nyy26CANizRCZ/W4t
 nxOfEEWBvyDUT1DDzdsP9WdU/nFc9ATgV9AbE5kcrrUvMyRXqZS7Oytj00olINuA+eIc
 xSZAHom3dyF1tvwN84GvOFl4rKUkrauZEwRYOzjvngrIFsYjxh+QhhEepXX+4xUMf0Fx
 7nJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gRuYrkZwAIJ2Q2Q4lPg1tjWevvwY/3xzxDc6xxMros0=;
 b=csLL3J8SZhxckzeF1UAK26Q+AZzvOb01GCJTngOKIcjN8CTmuI26uLo19/G7uwYuev
 pqcsu5hXowERYM/H7SYmYonCfqyRIYqPIUXFX3X5TxWbXse4FkKz6rl5FI0AQ7NoHh7d
 h2lhfblkIOgM36S/VDLs6kUcjtFklyopOH0TU7zYs674CHUDHOrDapTKPYNTpyezQlBL
 wfPoLlO9FzRYgCHBkNSDcUckgJ+1YFHLR4yGkMz0FBa3vCc0QwkRDXIagRxo0hGtNd6l
 zubvvKoAc3PmJzm+xDT1yGM6Bpy/33On3nWweU1bbaUeLvizLTNi95U2lmBBv+0tnY5A
 Qh/A==
X-Gm-Message-State: AOAM533eoCSLXmq18iT0m++1Y1Yyshch1HAHYaWQhH89rCuwBnYquHDY
 QI6KJRU2bVV5j9zxBwQwcHjNCfXN
X-Google-Smtp-Source: ABdhPJw2VhVf6l0Qk5HQfjK/pcndAJzkdzwNVdi9OyTzV21w2tlh5Cptb+Ktq/VUH294lNnOxnhzjQ==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr7343880wma.102.1592378745104; 
 Wed, 17 Jun 2020 00:25:45 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id j5sm32894781wrq.39.2020.06.17.00.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 00:25:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/14] hw/i2c/versatile_i2c: Add SCL/SDA definitions
Date: Wed, 17 Jun 2020 09:25:28 +0200
Message-Id: <20200617072539.32686-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617072539.32686-1-f4bug@amsat.org>
References: <20200617072539.32686-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use self-explicit definitions instead of magic values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/versatile_i2c.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 040139d701..0ce10a1bcc 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -45,6 +45,9 @@ REG32(CONTROL_GET, 0)
 REG32(CONTROL_SET, 0)
 REG32(CONTROL_CLR, 4)
 
+#define SCL BIT(0)
+#define SDA BIT(1)
+
 static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
@@ -76,8 +79,8 @@ static void versatile_i2c_write(void *opaque, hwaddr offset,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad offset 0x%x\n", __func__, (int)offset);
     }
-    bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SCL, (s->out & 1) != 0);
-    s->in = bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SDA, (s->out & 2) != 0);
+    bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SCL, (s->out & SCL) != 0);
+    s->in = bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SDA, (s->out & SDA) != 0);
 }
 
 static const MemoryRegionOps versatile_i2c_ops = {
-- 
2.21.3


