Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16433A0BF
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:52:17 +0100 (CET)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAJ6-0000wx-F4
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFg-0005uL-Va
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:44 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFf-0006oh-Hf
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id g20so5761597wmk.3
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1fsEr4CTL/3Iyvv1LF8p7dPgqU+b0Kxc61FnxzTyzZo=;
 b=EZ7GmQY7U/HQ9eDiGIVMIbZLPERrpkhPBckiZsoThCoKhEm66iPx/8mYPqJdWdU43K
 voDl0EMLElunDWoEiIOA8ulGfqadf8uJdd6d+Ze1+CugdwveYs37Iw+mlOoqdQG7l35U
 K9PFFMrZLJnc1j0CCd7TXpljcgMW9XZViDt1u6ufMEkcjPSjqU16v1JjQb62Dzdg/bVx
 QMa0IzdtsEds+dyrbsBYQHuUZkQWfT2r7cIo8Ri8o7ymuik7o4/OWa694mHGAOqlPhXu
 HNiZqVUFDdj8N2uCuRjlpanZ6hZ3LO/IhbH2xuU5O/HEqZYHa/c1puabPHMaeEc2BVTC
 ENyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1fsEr4CTL/3Iyvv1LF8p7dPgqU+b0Kxc61FnxzTyzZo=;
 b=eXIEZSk9g/EDQIc0xr5YCH2bU/mbbWEjiJGjXfSy9bELLM940TF8S7bJkLRSDbqIzM
 koYVeoEkUsjFRfC04SbmgcGAHQUFOOUYKR66zQVDGn7fa8nHnDrsydICANp3wwMnIYrI
 j/oMXT3HyFGYMDlgqfcCJhxhnOInSzBGiF9hUOzCGCWYppADMlzLG3aeU1pX1Ix4QeMH
 dnVryL5+1Ny06C5QdwwqiPSsLCkwYBX2HWdlXWfYes8pKIKKRm8l/6o95a/hapz1gvqe
 ZzDsr+TkgXi7DvNSCT4qKX0eYL73boTY1r1VUaD0+BQTWGjGzCEklE8cwpcHW/yhw4gl
 kIxA==
X-Gm-Message-State: AOAM533SbIJ+LWoSRwUje8r9oQqOWypmTd+qK3KFZXoyUY5lzisdsLit
 MxRAD0pfagTXAAJ67n00lUHojv+JEEQiUw==
X-Google-Smtp-Source: ABdhPJyyaxqxk3q9+A1Yfht+mO2oHYqMOYMtAExibwW7qG3mxMLuO4IiNgcUHMtehKJVZIsDuzvZnQ==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id
 m15mr18877187wmq.29.1615664921904; 
 Sat, 13 Mar 2021 11:48:41 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k4sm17401976wrd.9.2021.03.13.11.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:48:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/27] hw/mips/gt64xxx: Simplify ISD MemoryRegion read/write
 handlers
Date: Sat, 13 Mar 2021 20:48:04 +0100
Message-Id: <20210313194829.2193621-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ISD MemoryRegion is implemented for 32-bit accesses.
Simplify it by setting the MemoryRegionOps::impl min/max
access size fields.

Since the region is registered with a size of 0x1000 bytes,
we can remove the hwaddr mask.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210309142630.728014-3-f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 6eb73e77057..99b1690af19 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -385,13 +385,12 @@ static void gt64120_writel(void *opaque, hwaddr addr,
 {
     GT64120State *s = opaque;
     PCIHostState *phb = PCI_HOST_BRIDGE(s);
-    uint32_t saddr;
+    uint32_t saddr = addr >> 2;
 
     if (!(s->regs[GT_CPU] & 0x00001000)) {
         val = bswap32(val);
     }
 
-    saddr = (addr & 0xfff) >> 2;
     switch (saddr) {
 
     /* CPU Configuration */
@@ -695,9 +694,8 @@ static uint64_t gt64120_readl(void *opaque,
     GT64120State *s = opaque;
     PCIHostState *phb = PCI_HOST_BRIDGE(s);
     uint32_t val;
-    uint32_t saddr;
+    uint32_t saddr = addr >> 2;
 
-    saddr = (addr & 0xfff) >> 2;
     switch (saddr) {
 
     /* CPU Configuration */
@@ -976,6 +974,10 @@ static const MemoryRegionOps isd_mem_ops = {
     .read = gt64120_readl,
     .write = gt64120_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
 };
 
 static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
-- 
2.26.2


