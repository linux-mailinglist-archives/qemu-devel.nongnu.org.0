Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441F1E22FB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 15:35:56 +0200 (CEST)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdZkJ-00037O-6P
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 09:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdZhT-0006Hc-7e
 for qemu-devel@nongnu.org; Tue, 26 May 2020 09:32:59 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdZhS-0005oZ-Gd
 for qemu-devel@nongnu.org; Tue, 26 May 2020 09:32:58 -0400
Received: by mail-ed1-x542.google.com with SMTP id i16so17662208edv.1
 for <qemu-devel@nongnu.org>; Tue, 26 May 2020 06:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QG/Ao1FLrrqA3qiyJ5oTk9vVoadIo9/g3miLYRH/cTM=;
 b=UhINZHjqPp42NtO7UMuRdvE9NzPRNaS1MnEPXJYERZ3JsSfT5DLmnWrn1qWMYWHILS
 NsEBMEblg51/gpgrlwaRGjBRLAaO9tTZWVlQHIQd/mjwytL3fIvvFAqqhUw/USwq5gZn
 Zx4mIwjCI6PmLjWJ5kxzGBKkeDbeiE8WrXACM1ivgdxLpOrqidd36g8tizTPztyGpkr0
 ItjHMYzqMDyTYfJyACuTnN2OXZRVGNBRRhiIfEh/pqrDUjpXTjFkOJL+OhOtnGUJVGIM
 7qPCze5uNDEkYU12OjaM617LKYpTOmrUcZDcN5eyCVV4iNjiTtFPT54O4VUE/y50gkCV
 twBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QG/Ao1FLrrqA3qiyJ5oTk9vVoadIo9/g3miLYRH/cTM=;
 b=NA+henUQiD7UGxkeDiRqaosBMbFtwEEDCXyCLqjzhCNpWIF3LZ6dI+HMHevznUoS+C
 Id/lV1ZavLM1fMQy9woiJ8TTeaagBWZxQ7Lg4Rr8UbmKDlS1z52N9RpEBGdVB5jVZbkL
 17yHd3kFVvpdRPh/nXu1QEsjnI7C2vqRgzSuKsbvyFHIRZx5BYEB17V6j6FpM2iSPJAZ
 G5jmB3UvDWa/GpHUIsAkI4z7xwuEqx3oKisupbcFdL9pVNJaw30I4Zv1nBE6wCpxMX3l
 fj7zcBQcLTorZJb/eoM4DlYj3MvrIgpdXPYWV5FLnDjdk6Sdu9P8nzs4oz473p27Dl5I
 KDKQ==
X-Gm-Message-State: AOAM531eKUfn5rPZdq35/aQ4KNj4gJXkimwyOMkZKhAUkkgTs/ePM5pd
 I1qa1qVkhy4hdqkcZjAx1LPMLoAy/As=
X-Google-Smtp-Source: ABdhPJyWdSXLY9491hDMgvcO33Na4sZlNb+WpZ5LUv3lhSQND6DBAw8s+jS6/Bs6Ye2KVS6u5zVdgg==
X-Received: by 2002:aa7:c444:: with SMTP id n4mr19857088edr.308.1590499977017; 
 Tue, 26 May 2020 06:32:57 -0700 (PDT)
Received: from x1w.redhat.com (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id n25sm1623084edo.56.2020.05.26.06.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 06:32:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] hw/pci-host/bonito: Map all the Bonito64 I/O range
Date: Tue, 26 May 2020 15:32:38 +0200
Message-Id: <20200526133247.13066-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200526133247.13066-1-f4bug@amsat.org>
References: <20200526133247.13066-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, libvir-list@redhat.com,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To ease following guest accesses to the Bonito64 chipset,
map its I/O range as UnimplementedDevice.
We can now see the accesses to unimplemented peripheral
using the '-d unimp' command line option.

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-id: <20200510210128.18343-9-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 3 +++
 hw/pci-host/Kconfig  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index b90e5a636d..f09bb1c6a8 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -48,6 +48,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
+#include "hw/misc/unimp.h"
 
 /* #define DEBUG_BONITO */
 
@@ -644,6 +645,8 @@ static void bonito_realize(PCIDevice *dev, Error **errp)
     sysbus_init_mmio(sysbus, &phb->data_mem);
     sysbus_mmio_map(sysbus, 2, BONITO_SPCICONFIG_BASE);
 
+    create_unimplemented_device("bonito", BONITO_REG_BASE, BONITO_REG_SIZE);
+
     memory_region_init_io(&s->iomem_ldma, OBJECT(s), &bonito_ldma_ops, s,
                           "ldma", 0x100);
     sysbus_init_mmio(sysbus, &s->iomem_ldma);
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 8db41edc7e..036a61877a 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -58,4 +58,5 @@ config PCI_EXPRESS_DESIGNWARE
 
 config PCI_BONITO
     select PCI
+    select UNIMP
     bool
-- 
2.21.3


