Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6292E827C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:50:53 +0100 (CET)
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6mS-0001yB-7W
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6l0-0000UN-By
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:22 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6kz-0006H1-1I
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:22 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d13so21001140wrc.13
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SOhKBz9bQ6VQPdGkLKDSp+AoU5nJP8IFyHDySBpgUlw=;
 b=VTJkgzymKsJFiPovzuEyYLOZRbtxsP0BcwV+kaCkZcP8o/6ATiRnOiF5TeaXiHEo7Q
 sgt5i/qF61zbyTY3XhmFKJd3N7hNcWgdeDUhUpgZti5XdLB/rw57tffgn00zcvY2tWKh
 wu+grp0vgKdXvBF2GOKLzMp9Gpn8/9F3ztoSYVimO26govlg9OVHP4SF+iXw09Bg+edH
 3MU+MBvkKIoxoNuitBGlul6Z/6bgxd1M5rw+QPlN3md0lx3n930ROY7rB/N8N7ynWRMs
 AKiaYU+hGfOQNEZLY7+13wsp+4J4m3jE6LUsZ1JbV5LyuvWo5J+vKzglg79FjKK4O4Sd
 okeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SOhKBz9bQ6VQPdGkLKDSp+AoU5nJP8IFyHDySBpgUlw=;
 b=sszKF0QeEaXEPZBGXwIf/rAtu24uEJhAIrN9GpVcTlDeO+zew3MNN/NFuyF1JFiWDb
 6d04wRa2XjKsdgVKKT7ElW0UpCESXxGS4kdTKRAM+q62ZiPMc0i0seQIIsfwhNzLo4x9
 7v+Fdi1vkkScAbDngNJJj9cwT2TDlw8zu1OxNdDVXp+gxaPGy1q9/nmMD96gbjIUhjb+
 4UtZXhT4YS7Vj0wBrf4pNgLKE0j4ZPNwWa0Erjl3V70Eh/E+/XuVcrIemWwBYtgdDsBv
 9Q05vbrMrj4eOQ8E1cPuPTnQau9HjFKjPTvs0T3/2hogzuhxBCO010+oAZmKWHbMbj6u
 dhGQ==
X-Gm-Message-State: AOAM533281I1hV4lAqQpX3BBWIVi3klo1WgkGn+fjjJ648nzvekpb0Ht
 hQs7m4OwII7TIsHesmuBeRDVCr6aaBg=
X-Google-Smtp-Source: ABdhPJy7gNWuIxWfnM+zbZPWMebEMV1VJxglH4vLVmd+6/JbMZSao2Y6FSi5dLn7psDcF6gOErLA+g==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr66754667wrb.194.1609454959508; 
 Thu, 31 Dec 2020 14:49:19 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id l20sm77266228wrh.82.2020.12.31.14.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/18] hw/pci-host/bonito: Remove unused definitions
Date: Thu, 31 Dec 2020 23:48:54 +0100
Message-Id: <20201231224911.1467352-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced0657..0634f3289c4 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -189,12 +189,6 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define BONITO_PCICONF_REG_MASK        0xFC
 #define BONITO_PCICONF_REG_OFFSET      0
 
-
-/* idsel BIT = pci slot number +12 */
-#define PCI_SLOT_BASE              12
-#define PCI_IDSEL_VIA686B_BIT      (17)
-#define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
-
 #define PCI_ADDR(busno , devno , funno , regno)  \
     ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
     (((funno) << 8) & 0x700) + (regno))
-- 
2.26.2


