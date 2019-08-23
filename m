Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F19A6F3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 07:14:44 +0200 (CEST)
Received: from localhost ([::1]:51444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i11uN-00064s-66
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 01:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rC-0003xO-1V
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 01:11:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rA-0002Uv-Us
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 01:11:25 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40291)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i11rA-0002UU-Ps; Fri, 23 Aug 2019 01:11:24 -0400
Received: by mail-pg1-x544.google.com with SMTP id w10so5085563pgj.7;
 Thu, 22 Aug 2019 22:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=rNLm6cRmQnR+aWSvvg8z9lVz1WacHHyN0XGP8sjZ7OY=;
 b=hkYewr6JoRLWNAHvOgf6VZ2ltgsyBtYvc74WEfrdymhJ3z/Jk3PALy7IL/ornu2xSg
 jnG/JKpl3Ke9QslA7XMRYW9Q4x/RqaS/5DoWZ7sUk5Nmo5xcHNSJQdJIBV9m63POxOOs
 Sf5KeB7/HJoCrPZf232oF1TekcOiKIgYuV/2ahRSGbh1dRGysvwKJc3XtHtuSQQAzBds
 6SortFKRwdlKVBQrbQ2dYqTAYDiEV11AgEuc/6ynKewLczCR88C2dYjXu+qdED0Tp+q1
 /K436vJSFL/e0NYc919mZ/kcys+SKNob4jsp3OBGSjE+eqLlJLRMiaoUwQOxy0A+7dJr
 3wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=rNLm6cRmQnR+aWSvvg8z9lVz1WacHHyN0XGP8sjZ7OY=;
 b=XdaKOXCl9XWV9wTq4fsA81cvmpNmnHTx6lDgQzWKNWMTOFPcWNtPfqFG7twHIO2qX1
 xMkVZRxH05C3w/1WWLwqTWOuP5RShgQfyGNv3m4B162myGp1b1foDl8nlE55zzNxtOHS
 nJI4gI9Rn7fUSM0FhiM2r9BuAir9RSLmUakecJTw72g5t8G63xdX/CD20Dz4qtLqQcdJ
 OlO4wEzfXmxKL1aYhttgSyoJ0ffqqczDWvL+T5Ov+5vFcZBMkyk/0bKznJkEePLNYIMG
 nx5qLQHL35HJZKyxUykvLH8HkMq6X10WwjUgDOlxJvRpdJ7/tc/buG9O8GpQ6a3+n3hP
 ED/g==
X-Gm-Message-State: APjAAAXmVnPVIjJQUICKYpszTePsIhVTJP8DA491i0XGyH+BoDaKqJLu
 iQmTn+U+MfgK1YYwAG+B8Dg=
X-Google-Smtp-Source: APXvYqwTQDapXk8O+Wk5E11nS2a5X+jE3mW+4LI+wM427YSF+FFQCHqx7bgPUoGqEwUx+oVmAnfpBQ==
X-Received: by 2002:a17:90a:1916:: with SMTP id
 22mr3382486pjg.62.1566537084102; 
 Thu, 22 Aug 2019 22:11:24 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v189sm1122527pfv.176.2019.08.22.22.11.23
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 22 Aug 2019 22:11:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Thu, 22 Aug 2019 22:10:46 -0700
Message-Id: <1566537069-22741-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v5 07/30] riscv: roms: Remove executable
 attribute of opensbi images
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

Like other binary files, the executable attribute of opensbi images
should not be set.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v5: None
Changes in v4:
- new patch to remove executable attribute of opensbi images

Changes in v3: None
Changes in v2: None

 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin

diff --git a/pc-bios/opensbi-riscv32-virt-fw_jump.bin b/pc-bios/opensbi-riscv32-virt-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-virt-fw_jump.bin b/pc-bios/opensbi-riscv64-virt-fw_jump.bin
old mode 100755
new mode 100644
-- 
2.7.4


