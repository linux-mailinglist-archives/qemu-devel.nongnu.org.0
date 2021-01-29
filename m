Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D0308DAB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:49:26 +0100 (CET)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zll-0001db-84
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5Zh8-000651-61; Fri, 29 Jan 2021 14:44:38 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5Zh6-0005Xi-MH; Fri, 29 Jan 2021 14:44:37 -0500
Received: by mail-wr1-x434.google.com with SMTP id a1so10014820wrq.6;
 Fri, 29 Jan 2021 11:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EyheNqEvlweyc8pfqxuPrMO5o2psFbiTPxAsZjVpwhY=;
 b=qIofSNrljqXWbGKGfLARTjbHeVtgwbbs0r4V1umoh0xI3nflgM4nASIiQJuwdA4nua
 rCEzHZUbty2GRBgGs232O1yj1l9BxVGS0ByynTZp6ADBgwwfsSJG/v5N1Q9iyNzVaCr5
 pXQLT81vwATf3D1Z3H4rJHnvI6VyqGxUOs+1fv9RcaIg96ROR1iAFc1sZpOByRTH4ieQ
 quxgo1qxmGtjVtnsXOTWrORxQXwYSMwzBrwZScSujG3k8KTu/4wYtN5nBjpUx94FWnvu
 OBxvjkPHPCFXDA1X3BF4wpwlXZQ7NEzciOKmIU8tNQMkIcp/PKsqrkkrSkl4tz6qhY2V
 FirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EyheNqEvlweyc8pfqxuPrMO5o2psFbiTPxAsZjVpwhY=;
 b=TTspzrrxwAvCxviNITIrVpZeBhXW8Zmju6d/qNRKbTuPbGQtxgiTDHP5PakfbV2w4j
 +U8FDm3uH6Fzj0cOHiEwNWoHW02fAZmmvSye2XpJvN6JbB80O665NgKYilTCCECGVRkJ
 pbJEATK69IT+7C8Md0DOavKpHplK27CX+vgEGlIDibHj8k+gX7ymDROsrzWVqzn73WR0
 L5EptUWB+KRtFiQYnDC3SmyLG0I4dvcQC+yQ46dEwoHsluWjK77ZI3uBvhByGa1KfGmh
 jfYaONesPUg0EdmIUFnRH9lL5MwtMWeqkP/IJWt89sJ7jenjZfD9OTX07M5vGCik38uf
 6Rcg==
X-Gm-Message-State: AOAM5320EIwagJb/08U5qF1UNnwW6SFcfH7SK0BkFi72fqzl0/7gDzAl
 u1s+fnHOkZya82h22ZxjsQ3wCUrBs0c=
X-Google-Smtp-Source: ABdhPJxL09ql51r7wWVPLwW3CG8HIUlcFhzN37I4sLD69tcHL1fXz5AfhfnyPi5U7coZwKgVsyDz3g==
X-Received: by 2002:adf:dd10:: with SMTP id a16mr6298623wrm.207.1611949474928; 
 Fri, 29 Jan 2021 11:44:34 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x128sm11741573wmb.29.2021.01.29.11.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 3/4] hw/xen/Kconfig: Introduce XEN_PV config
Date: Fri, 29 Jan 2021 20:44:14 +0100
Message-Id: <20210129194415.3925153-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210129194415.3925153-1-f4bug@amsat.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xenpv machine requires USB, IDE_PIIX and PCI:

  /usr/bin/ld:
  libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
  hw/xen/xen-legacy-backend.c:757: undefined reference to `xen_usb_ops'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `unplug_disks':
  hw/i386/xen/xen_platform.c:153: undefined reference to `pci_piix3_xen_ide_unplug'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `pci_unplug_nics':
  hw/i386/xen/xen_platform.c:137: undefined reference to `pci_for_each_device'
  libqemu-i386-softmmu.fa.p/hw_i386_xen_xen_platform.c.o: in function `xen_platform_realize':
  hw/i386/xen/xen_platform.c:483: undefined reference to `pci_register_bar'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/Kconfig     | 1 +
 hw/xen/Kconfig | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 hw/xen/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b5a4b..f2a95591d94 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -39,6 +39,7 @@ source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
 source watchdog/Kconfig
+source xen/Kconfig
 
 # arch Kconfig
 source arm/Kconfig
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
new file mode 100644
index 00000000000..15944144a17
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,6 @@
+config XEN_PV
+    bool
+    depends on XEN
+    select PCI
+    select USB
+    select IDE_PIIX
-- 
2.26.2


