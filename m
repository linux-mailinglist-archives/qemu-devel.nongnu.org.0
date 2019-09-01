Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280A6A46F5
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Sep 2019 05:19:34 +0200 (CEST)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4GOr-0000lN-4R
	for lists+qemu-devel@lfdr.de; Sat, 31 Aug 2019 23:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48158)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4G01-0007wB-VJ
 for qemu-devel@nongnu.org; Sat, 31 Aug 2019 22:53:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4G00-00072l-Nq
 for qemu-devel@nongnu.org; Sat, 31 Aug 2019 22:53:53 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41469)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4G00-00071g-Hc; Sat, 31 Aug 2019 22:53:52 -0400
Received: by mail-pl1-x643.google.com with SMTP id m9so5052696pls.8;
 Sat, 31 Aug 2019 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=eYDHIIbYQJpyAy/bT7aeh6kA5/PLSsHgdEanCdj3s9Y=;
 b=NPmt6OcN80zzOFfoQ5MoBcj9ZH3O+3y5AAfrMmQwb9rn6hT58VwJagqh5yBf8Hrzly
 z68feNYflfW6RTDbRyJ279uMHQ0QE+wnA14OqepJCd7t+w7HYA5R5/JuTJQUiR6On/rM
 nikn09iImxMISKzK3kim/mjj7rZPV4gkGsay8gni9Fo0iEskHifgPwLB3Vg0l/8O+DoN
 PuTlRwCRJOGxKRHSrObQdeTZGdTVV4tkrDn9/sjR+VV9jvhreeqmPiqEKb1xIzquJ0Sx
 KYPMtz+3/V4Yb/Bfshx9dRXYx5T9QwmEm9HhNFISn/gnoMv1slM4hO89NOdNdk8UpfzX
 QREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=eYDHIIbYQJpyAy/bT7aeh6kA5/PLSsHgdEanCdj3s9Y=;
 b=Jurfpkm2D8ne/xkuRmB1Vyezi1yrTC1ZeNjmoS3AFvkGOb0oJLJArq+o9W1X03k4sw
 jMgq/LVIseKDasMbUkNOFfVLZmGo8tvVkdRxycxVC6hDUi8xH/8NH/AwBrspvLbYej70
 L2QZB6sdYfI8pQ9y3HPGCSHcoTTK4smb9csEqGdFmq6Pf1Nqj/6WFXMasFCy7FALWz8E
 FAMebGc3SkNv9hQhhO/WZOyy9+BgVd1dCSuipaHKmBdkJxrhVB0ZmF7H1qsk1HEL8CWV
 7MdgrCc8r8FdsfPW3XgtXrQumSDEhSmOZ1DNbG+5Aud6W9WBVmmZf4H9MOpCa6cXKZor
 JQEQ==
X-Gm-Message-State: APjAAAXJAeL422Apxg79tyJHeO2lRnQY3YmbM+LPTQ2nnEU/WADCGKWO
 pyT8hChz2+p355oJO6LWnbCG1h2U
X-Google-Smtp-Source: APXvYqxgrSY6l/z25Zkjpi9s/nFquIT0Vi9eTCnFBBCh6CXvI2gUzdGEC6IYhEwCMfAJDs+6LoPXiA==
X-Received: by 2002:a17:902:b718:: with SMTP id
 d24mr22983258pls.204.1567306431818; 
 Sat, 31 Aug 2019 19:53:51 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.50
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:53:11 -0700
Message-Id: <1567306391-2682-31-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v7 30/30] riscv: sifive_u: Update model and
 compatible strings in device tree
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

This updates model and compatible strings to use the same strings
as used in the Linux kernel device tree (hifive-unleashed-a00.dts).

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f14217c..c7f7c2c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -96,8 +96,9 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         exit(1);
     }
 
-    qemu_fdt_setprop_string(fdt, "/", "model", "ucbbar,spike-bare,qemu");
-    qemu_fdt_setprop_string(fdt, "/", "compatible", "ucbbar,spike-bare-dev");
+    qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
+    qemu_fdt_setprop_string(fdt, "/", "compatible",
+                            "sifive,hifive-unleashed-a00");
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
 
-- 
2.7.4


