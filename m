Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F9191C65
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 07:23:12 +0200 (CEST)
Received: from localhost ([::1]:44656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hza8N-0000QV-8E
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 01:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43503)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZxq-0004xa-0i
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 01:12:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZxo-0007Ok-Sx
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 01:12:17 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:46079)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hzZxo-0007M6-NX; Mon, 19 Aug 2019 01:12:16 -0400
Received: by mail-pg1-x542.google.com with SMTP id o13so462024pgp.12;
 Sun, 18 Aug 2019 22:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gQebCmTkn7/k7cacd5SxBfQkqIy3C0/2cB37KB8fSp4=;
 b=a24+svC+jGeMqeTrzMDI/m0QcNG7+q1iKs6Del/a+0CrAeUx8d9cyWKbWque9uCDE5
 JF/RmU/905tk26R2oU5ap07tDPQFThHqM7C9p905ui+Zr8GbnCkxj7IHGbTJVtcwSVbj
 fRyMJUOyIl2WOkD5HgezfdJHU3rNyu0XsBH7aHT+1q+VmV8028YgVuHRwZ08hzwR8Z73
 Yq5M9T34ryU6ugMt+rZWROFxWUveujVa0cJvhHjP/zJfkqhjHI+jZBmxkjFG+hrqTmjp
 wUcQ1unwFnTkQ6drRmGCqS7IVd9AgmFSf1ScZ5UboclXKKlmNRDCGn6yyAyBGIKHftaT
 vT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQebCmTkn7/k7cacd5SxBfQkqIy3C0/2cB37KB8fSp4=;
 b=DSuWB32lfg+31codbaaI0/uQGynf3h/PxTuiBQ59J5VAHYPRauejzLiWoBdbNOcJs1
 Vw5qzuaQHa51EpnSqidiUIPruTr7Dnl66m/JgGjgqZ5uoifPjwY2ILHI1C52YRA/7II+
 kIrcYQUXYY4aNFDJug98oj23Nnggbz6ZneCA51Cw49ZsnUiFvpcLJaMGA4hWAxspktug
 306GVOvw2hp2OMVfzgbygv/O5F3N8fXYd9ajbneoZL+TAfxkVMhgBjF9sMWrMs3tbT00
 da8yI2r0bFoYS4DxtugfqaZTP4JSRPzmWLCmkjdR2H1G4rZ6pg+XYlRaMkjgaP1aJhE/
 VKcg==
X-Gm-Message-State: APjAAAVjq9am8AWqwauMNH2zqirDrwaLrsyb48/lpywQ/6S0JWUVpGxz
 92SrZVvcaMT+mx0iE+ojQhQ=
X-Google-Smtp-Source: APXvYqyrhzDI+Uy+UPUDx6MDl6DSl8YEE7vq2eU352beTXyOikb1XnykpuseNToZElUWhCUrTlpqHw==
X-Received: by 2002:a65:5b8e:: with SMTP id i14mr18277750pgr.188.1566191535956; 
 Sun, 18 Aug 2019 22:12:15 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id q13sm15464986pfl.124.2019.08.18.22.12.15
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 22:12:15 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 18 Aug 2019 22:11:41 -0700
Message-Id: <1566191521-7820-9-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
References: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v4 08/28] riscv: sifive_e: prci: Fix a typo of
 hfxosccfg register programming
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For hfxosccfg register programming, SIFIVE_E_PRCI_HFXOSCCFG_RDY and
SIFIVE_E_PRCI_HFXOSCCFG_EN should be used.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_e_prci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index e87a3ce..603a54b 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -89,7 +89,7 @@ static void sifive_e_prci_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
     s->hfrosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
-    s->hfxosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
+    s->hfxosccfg = (SIFIVE_E_PRCI_HFXOSCCFG_RDY | SIFIVE_E_PRCI_HFXOSCCFG_EN);
     s->pllcfg = (SIFIVE_E_PRCI_PLLCFG_REFSEL | SIFIVE_E_PRCI_PLLCFG_BYPASS |
                  SIFIVE_E_PRCI_PLLCFG_LOCK);
     s->plloutdiv = SIFIVE_E_PRCI_PLLOUTDIV_DIV1;
-- 
2.7.4


