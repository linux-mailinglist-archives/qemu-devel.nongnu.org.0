Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A8309CAA
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:25:57 +0100 (CET)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Dfo-00009I-NV
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYd-0001Mk-Ib
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYc-0007gd-01
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:31 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z6so13690573wrq.10
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 06:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1iUBKmTUYZTioyGS/rhl1Ra2yNWVBdikWriqZM/Im58=;
 b=lXXSAE9J1Y5ZtYJKsoxwAqiFlt7+B7vFUBM09lA/IJOklFpMVJ+Dn4xC/d0qfON75d
 7d4LwlxtxhClhKgMvf1kP3SeqeEEqDvtrtPHjyymgq++vo6QXrCo/GfUPn37zmJs/dHB
 b/5u+ElRBF2MimMqSynaekRNxCEU6RCnK7UocZpH2jyH0Brxb96rsIpaJJec3gkqhvux
 yYPReeqiJWZtvpzXO082LrvouNKG/NveWCrLJhu2t6mUZOmNXiKRLEqfYFT0E4XZUgWW
 WZcBcMM+duaItsh2IpskfWv5f0QELPjiKDYUE8XdX+aJwU3RaZT0qp+UVmQf81NSIUvj
 iP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1iUBKmTUYZTioyGS/rhl1Ra2yNWVBdikWriqZM/Im58=;
 b=dmz0/YgyfS8pMGlz9L8JcRjBSn29DCywIcCdyDLt4YYvuS01a/75WOHXl11bgUnEUq
 Lt0ZuYCkx+ml/+5kgzX3L/KQgGC3FK95DyzK6QpGJtDfm8okDTvw/Z3W6HApvOugdyzJ
 GaxveLG5QiMTe9wVTP/93jqmYdvjvXNz7rfUZwbedB4BTj4fHhWAY3EHsiz2gZhLzyBU
 AeKst5enPV/1fLLzaDMtcQ6XFJniXWZ6Wr5fg9rCN/3T7yPYmrkmW3qDUhjOTobCoY6E
 JSPkxTBV5EJZtbFdih3rSZ2tKcvAdObS73L0j4DB/i5Gx7H3qizNnlkO04yGQa7lqsQz
 uqxQ==
X-Gm-Message-State: AOAM532oYJWdaq4RnMBneBHGb137ijtFNuJ/BsChJEWXcSNr/Zvaw2oJ
 ysJyIyhX/2s0T3ZMORE4Fvg=
X-Google-Smtp-Source: ABdhPJxIgwNKaEHdqAJauuf3Ui5v/VP5KSWum8cYT2MZ2lfxJraZueLa/5/ANCkzhVlAiuHFjqsB/A==
X-Received: by 2002:adf:eccc:: with SMTP id s12mr7567416wro.383.1612102708748; 
 Sun, 31 Jan 2021 06:18:28 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id y6sm18426517wma.19.2021.01.31.06.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/xen/Kconfig: Introduce XEN_PV config
Date: Sun, 31 Jan 2021 15:18:09 +0100
Message-Id: <20210131141810.293186-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131141810.293186-1-f4bug@amsat.org>
References: <20210131141810.293186-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
 hw/xen/Kconfig | 7 +++++++
 2 files changed, 8 insertions(+)
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
index 00000000000..0b8427d6bd1
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,7 @@
+config XEN_PV
+    bool
+    default y if XEN
+    depends on XEN
+    select PCI
+    select USB
+    select IDE_PIIX
-- 
2.26.2


