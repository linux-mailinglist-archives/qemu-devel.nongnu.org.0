Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8944305B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:26:19 +0100 (CET)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhujy-00035Z-1S
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6t-0005MG-VQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6n-0006Sw-37
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id b71so4209907wmd.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q3s3GZhFWrGY7gjToiSxwFx4tiZft1tygbK630ikQq4=;
 b=c7Qxh2W/gvJC+ZMbM9AIK5MB27JSopJ7oBjsjfZkFk6diZvgJxApW9r34awjtXzalu
 96lFEhEzysywCG6mhgc++D2QeBFrF8+tzQdZrcLtJ63HgrzD297KIu5fil0cfwXqRaZW
 CTZj0rdMtNYFPU2da273WapIP0MgRTyhpPQMKoeVI8hr+DLkChyFFFxUHXd84PIcY8Pu
 GjOqJ+ZNRGUdKbg8iskGU0SXJy2idiw6CoFBFl4uBxvh1v23GxaiyOPJJIs6SKIgnlMC
 iCOqt3n321TT8MYiqxb2/M7eaNRdOjTAEHbKp6j5LdSdIqO0zR7vsDSx4xCe6gQml1Xv
 9KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q3s3GZhFWrGY7gjToiSxwFx4tiZft1tygbK630ikQq4=;
 b=HeRkSRbZE48gGRMiNwIEqNuiRybYJ76yexx5sqrimor5tLpfbRsuqs0MXsqmMCEjLF
 4AluLUia/a/ir6c/k9JbgPrDwTE81QbJnJh8B8rjULIkMSII8rcPxqs4Z7DqaA34Te1w
 X+iugji9xRmvoTWKTw58xnfNZgm7znt9BFu1+aI/mVJQMp0znY8GmjCBT/1Iib9ti8b4
 ilmKBS1yZWb+RKNZOk8ov3ADdQw6DEzm3Ak/MdBmDbp7PSvVqBegi++ZbnNLbqHSppWW
 PXATO/pgBV2pMAsZ+INABTAbw6trJht4Uhc9Swe4U7EZbmCPOZouWZ+yFknE6ZVpDZB+
 ip2g==
X-Gm-Message-State: AOAM5325WGrNLExlUAR/PH6jNE/mNCCJZlVMbVOk0U8Krxi58hhfRW0g
 6kEyg6wTaTBfgvdo5goScheJAmPW/NU=
X-Google-Smtp-Source: ABdhPJxVhrZr5cPgss8IK5GR/TPqyAJTlEqc1/8SCbxMCmgQKEzFEFSTXZ5/QG+ZeLOfw2wjjw7h7A==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr6644516wmq.24.1635860740035; 
 Tue, 02 Nov 2021 06:45:40 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 n4sm1914383wri.41.2021.11.02.06.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/41] usb/uhci: Misc clean up
Date: Tue,  2 Nov 2021 14:42:36 +0100
Message-Id: <20211102134240.3036524-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Fix a comment for coding style so subsequent patch will not get
checkpatch error and simplify and shorten uhci_update_irq().

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <b68a57dfcf181e73272b4dc951f8cc6e76b0d182.1635161629.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-uhci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 0cb02a64321..c557566ec26 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -290,7 +290,7 @@ static UHCIAsync *uhci_async_find_td(UHCIState *s, uint32_t td_addr)
 
 static void uhci_update_irq(UHCIState *s)
 {
-    int level;
+    int level = 0;
     if (((s->status2 & 1) && (s->intr & (1 << 2))) ||
         ((s->status2 & 2) && (s->intr & (1 << 3))) ||
         ((s->status & UHCI_STS_USBERR) && (s->intr & (1 << 0))) ||
@@ -298,8 +298,6 @@ static void uhci_update_irq(UHCIState *s)
         (s->status & UHCI_STS_HSERR) ||
         (s->status & UHCI_STS_HCPERR)) {
         level = 1;
-    } else {
-        level = 0;
     }
     pci_set_irq(&s->dev, level);
 }
@@ -1170,8 +1168,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
 
     pci_conf[PCI_CLASS_PROG] = 0x00;
     /* TODO: reset value should be 0. */
-    pci_conf[USB_SBRN] = USB_RELEASE_1; // release number
-
+    pci_conf[USB_SBRN] = USB_RELEASE_1; /* release number */
     pci_config_set_interrupt_pin(pci_conf, u->info.irq_pin + 1);
 
     if (s->masterbus) {
-- 
2.31.1


