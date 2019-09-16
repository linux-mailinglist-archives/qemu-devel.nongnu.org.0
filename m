Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E1B3DCE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:39:46 +0200 (CEST)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9t6P-0004Yz-6E
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCu-0006Rj-Q5
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCs-0007Se-Jj
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34582)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1i9sCs-0007SB-7k
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id y135so189765wmc.1
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GX4JaDIbHHodc8bsVUgp1wGeHcMPOFe7Qx97BWjaFus=;
 b=FCxFw+xghXiUmKYNhE198znwVLIUZda2m/8UBJJgbDBcLRsPQjbEdx1kvjU0oUHkiA
 RSyDqqnqhqoVGj0PUf6hb4RpT/Kx8IDymD3Z5go/2K/ZYYqr3iYvo5RskL5dCGF4LZc7
 /VUUzm9Qd2H5McNfNj1qzvSvseDSbSstr5ynJZIvm3I9zRoAzkBPfOMramMYJAXKWLAJ
 53fxp+PFjxZ+Rf37+OP7eueu09jPvRycRypQi82/L7KNQNzz431NVc9PX3H9O0YGE194
 tSPFlYz80Y9KrWRJbu7QFGmlRKdnfomT8W2ThBfFIHOZvqy9KXx8mU/W65F2S3qEP3VQ
 mvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=GX4JaDIbHHodc8bsVUgp1wGeHcMPOFe7Qx97BWjaFus=;
 b=k4EWq5FsksboCmsVs20wQA9i+htDm5wRtWDvrdouVOX4AKvO5pMRFpHagR0xAghwIK
 JG/nEaU5oF2BAMMQZnyVATgDleNcZ9fLndUMBq/9OV2cm9OSzQehdbxgYaJig6CpMKXD
 yKycnrnUh0oLtRHz51vd5xkbM0oTQyRIvmARcXgSi2wWNBcVoUF3LxHKT9O+5meahgZ/
 2WPo+UQT/68SAU2Tqj71sZWQ9ISQCXzF1/T8xPaypHukyx/bKtt23Irkxev4g0DRTAIa
 InxXML2hejbmOQBeQ6aPliMcH6SGC+cxUktNE+N6gnIUBHPoxPvJmIMQrljv8mUvdYkn
 dMwA==
X-Gm-Message-State: APjAAAUKJId6TMJsLeUAOCi1HhXJamM0l9RZBDyCx9QEDBI19PpILu36
 VByapI5TDwP7EfJubyZwiBmZYe2C
X-Google-Smtp-Source: APXvYqxflfHNVMG4M5fWxYGBMUT75qzIWMA+KkazjPNnyJE11t5I9klrxJDesHGcJ65usyS36xoOxg==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr80372wma.6.1568644940650;
 Mon, 16 Sep 2019 07:42:20 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i14sm17024298wra.78.2019.09.16.07.42.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 07:42:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 16:41:49 +0200
Message-Id: <1568644929-9124-10-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
References: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
Subject: [Qemu-devel] [PULL 09/29] hw/i386: Move CONFIG_ACPI_PCI to CONFIG_PC
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cole Robinson <crobinso@redhat.com>

CONFIG_ACPI_PCI is a hard requirement of acpi-build.c, which is built
unconditionally for x86 target. Putting it in default-configs/ suggests
that it can be easily disabled, which isn't true.

Relocate the symbol with the other acpi-build.c requirements, under
'config PC'. This is similar to what is done for the arm 'virt' machine
type and CONFIG_ACPI_PCI

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Message-Id: <e73e6edff68fd30d69c6a1d02c9ef9192f773c63.1568049871.git.crobinso@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 default-configs/i386-softmmu.mak | 1 -
 hw/i386/Kconfig                  | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
index cd5ea39..ba3fb3f 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -25,4 +25,3 @@
 CONFIG_ISAPC=y
 CONFIG_I440FX=y
 CONFIG_Q35=y
-CONFIG_ACPI_PCI=y
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 6350438..c7a9d63 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -29,6 +29,7 @@ config PC
     select MC146818RTC
     # For ACPI builder:
     select SERIAL_ISA
+    select ACPI_PCI
     select ACPI_VMGENID
     select VIRTIO_PMEM_SUPPORTED
 
-- 
1.8.3.1



