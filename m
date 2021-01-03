Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF962E8E39
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:59:50 +0100 (CET)
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwATd-00032z-62
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKx-0002gM-Gr
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:51 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKw-0005mY-31
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id g185so16650201wmf.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzGWtZ4+YCQhnZaXQ8F+2J3H/K/1NpSbG3GLe6EBQno=;
 b=aumHAXvdNyFmKt/KoAL1UyCLRE6J8ALTXsM8n7SHRGprrgvpCh4bKIQj8xAGsBcNLF
 3j8PxJYz97UYfrinxsC38+R/vkxOe9HfplxxHf0p17yjLRqAUveRIK+90JsFr+AZfS+c
 rKO1suswd9N2ojy7QbDKy13QXekdKJoUxE2cGc7Puw436F92EpIDERoA25aAncftm2Gz
 SI0HWGfz5QkFYGggURp3UZPobqh8rsYOiVp2AcKu/1uBphRmIU70ktbeVe43aLQ0yysk
 s7MnvqiZYeixfNYViaHF59wu3UGVYZsjQf6nAJDMNBCIG9kXzqbIXPn5AjpfBgQYloFn
 doxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YzGWtZ4+YCQhnZaXQ8F+2J3H/K/1NpSbG3GLe6EBQno=;
 b=BwZB5wgehfP6uZnJ+JosnkIADg4JbbYAihF/Q6eLomjP5H2jyLVvVLndXwyz68FzFU
 Bu4jX5XtUmgPdTLzMHMrLqj66IdpNjaQ0U+9Lt+iebJrUPdzkfcgM7AYkjsUYIoq8iOQ
 NjWPRnUZ11PuFFiknZndYi0++ezKGczMks8AhegqCg/LEW7dbHoe/BwOWriXU+aXopnO
 9QfzLezKo05/W5KidcFV0eUWDSNB288OMw3qRES4MW4yRPE6EgnYWfQK+6vNB94IUI1i
 OdPgu4D6Wk6iF5Jofdh0bPMFwkJ237vT225koAdk0qOqqGoy2eqINBabo+SrxyzX3ylN
 AdjQ==
X-Gm-Message-State: AOAM530BIcXEomyPrWFiWQOmUflovt2rjJ5krRcssafHB42hglO2aTL7
 HaYOELGP0Hn1uUKerZ0xHvSxppQny/g=
X-Google-Smtp-Source: ABdhPJzr2ea6c5x3JBmPhq61/h/wrZfIwsiiIyaaNmVrCbpv4asURwace2a0GYhT276J+IgGFfnnwQ==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr24591101wma.84.1609707048707; 
 Sun, 03 Jan 2021 12:50:48 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id h9sm32135331wme.11.2021.01.03.12.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:50:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/35] hw/pci-host/bonito: Display hexadecimal value with '0x'
 prefix
Date: Sun,  3 Jan 2021 21:49:51 +0100
Message-Id: <20210103205021.2837760-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Message-Id: <20201231224911.1467352-3-f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 40dda237d8e..c2f71e5a132 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -468,8 +468,8 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, hwaddr addr)
     regno = (cfgaddr & BONITO_PCICONF_REG_MASK) >> BONITO_PCICONF_REG_OFFSET;
 
     if (idsel == 0) {
-        error_report("error in bonito pci config address " TARGET_FMT_plx
-                     ",pcimap_cfg=%x", addr, s->regs[BONITO_PCIMAP_CFG]);
+        error_report("error in bonito pci config address 0x" TARGET_FMT_plx
+                     ",pcimap_cfg=0x%x", addr, s->regs[BONITO_PCIMAP_CFG]);
         exit(1);
     }
     pciaddr = PCI_ADDR(pci_bus_num(phb->bus), devno, funno, regno);
-- 
2.26.2


