Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2B6A3AD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 10:15:57 +0200 (CEST)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnIct-0001Ci-Na
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 04:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60157)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hnIYl-0000QQ-SE
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hnIYk-0003Og-Je
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36915)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hnIYk-0003NO-Ay
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n9so19863628wrr.4
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=tshHt4G4q3ui9I+sSPWIHYaUh996kXUQlnNfLEsgFxI=;
 b=uudvgFcLoiJhMg66r/ipDm2wNJ8LS5780ZUojRKsbhyeCTzzvrLvleKtzkJkRnTpuo
 leVZn2Du4MrtQUuARq+wCW4h3KQ0+kS6ZvSPLUwR6cEI8sISIyH4RWbH4ALWiivfGWgP
 KmQWOhGInXsCmx5i48QW2sKJX/iLf+DK5H+fuMCV+JDI1FKL7qKiqtbdClzAYtr1TZbz
 xy/DXxBXsMQeDWEPnTPTgRdrskrbR3YtZseyLkYhKxEcOqI2YQmcZGvlPVZar/v+6TeS
 mU9J7TWmlkRMhpC/ibEQ064tY/cwDWtsn8/bWHOTsz8opKz6kECTqvRXLTnvHt2MycVm
 QoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=tshHt4G4q3ui9I+sSPWIHYaUh996kXUQlnNfLEsgFxI=;
 b=iY/FEozESIl2CyjL2AVQ0jTrnrxFAfGdJFh5xCPtrlyWVlxpynA0DbY42aAro3SGwy
 0Tcjs+pI3/+s73gJeb486osOorL6SrbGc4Z6N0DwP1L8MkgsGqEOk13MTXJR8ISvSuP7
 anfzynJPNC/f1QpVejv+MWpcbr/jprG4OrZdE3gli7UR33ZLiJkFmNrpOLGw1/hStk5h
 S/JVeh59kXdyi5JPm4hUZ1LL75Am1SOoWVEPJO2Ihhv8vuzMBNYJJ9LYa/hVCGDEqasp
 vjIAjEhiqTEboSemV07JLzgFtGqDLru2kqiqAC1PZSccHnhB0hkYhhJ7esrNiArFUj5/
 PElw==
X-Gm-Message-State: APjAAAWAAkIUiZWsXUGmgw9dMYQzD8JmAZ/yY3VmG6RqPG4A/a2UireF
 wQEBd3Gdri9J0HtyBva6Gp1AxcvZ+D0=
X-Google-Smtp-Source: APXvYqyify96jxUU6RUYUOnHZ2DlBSpp0zWcDdZ1v5YeOMnpv6KNRYh26/iayet3J9NiPvwMVDuYLA==
X-Received: by 2002:adf:df10:: with SMTP id y16mr9909120wrl.302.1563264697043; 
 Tue, 16 Jul 2019 01:11:37 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id c1sm37723879wrh.1.2019.07.16.01.11.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 01:11:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 10:11:15 +0200
Message-Id: <1563264677-39718-18-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563264677-39718-1-git-send-email-pbonzini@redhat.com>
References: <1563264677-39718-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: [Qemu-devel] [PULL 17/19] Makefile: do not repeat $(CONFIG_SOFTMMU)
 in hw/Makefile.objs
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

The device directories must be included only for softmmu builds.
Instead of repeating $(CONFIG_SOFTMMU), use an "if".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs | 61 +++++++++++++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index d770926..ece6cc3 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -1,42 +1,45 @@
+devices-dirs-y = core/
+ifeq ($(CONFIG_SOFTMMU), y)
 devices-dirs-$(call lor,$(CONFIG_VIRTIO_9P),$(call land,$(CONFIG_VIRTFS),$(CONFIG_XEN))) += 9pfs/
-devices-dirs-$(CONFIG_SOFTMMU) += acpi/
-devices-dirs-$(CONFIG_SOFTMMU) += adc/
-devices-dirs-$(CONFIG_SOFTMMU) += audio/
-devices-dirs-$(CONFIG_SOFTMMU) += block/
-devices-dirs-$(CONFIG_SOFTMMU) += bt/
-devices-dirs-$(CONFIG_SOFTMMU) += char/
-devices-dirs-$(CONFIG_SOFTMMU) += cpu/
-devices-dirs-$(CONFIG_SOFTMMU) += display/
-devices-dirs-$(CONFIG_SOFTMMU) += dma/
-devices-dirs-$(CONFIG_SOFTMMU) += gpio/
+devices-dirs-y += acpi/
+devices-dirs-y += adc/
+devices-dirs-y += audio/
+devices-dirs-y += block/
+devices-dirs-y += bt/
+devices-dirs-y += char/
+devices-dirs-y += cpu/
+devices-dirs-y += display/
+devices-dirs-y += dma/
+devices-dirs-y += gpio/
 devices-dirs-$(CONFIG_HYPERV) += hyperv/
 devices-dirs-$(CONFIG_I2C) += i2c/
-devices-dirs-$(CONFIG_SOFTMMU) += ide/
-devices-dirs-$(CONFIG_SOFTMMU) += input/
-devices-dirs-$(CONFIG_SOFTMMU) += intc/
+devices-dirs-y += ide/
+devices-dirs-y += input/
+devices-dirs-y += intc/
 devices-dirs-$(CONFIG_IPACK) += ipack/
 devices-dirs-$(CONFIG_IPMI) += ipmi/
-devices-dirs-$(CONFIG_SOFTMMU) += isa/
-devices-dirs-$(CONFIG_SOFTMMU) += misc/
-devices-dirs-$(CONFIG_SOFTMMU) += net/
-devices-dirs-$(CONFIG_SOFTMMU) += rdma/
-devices-dirs-$(CONFIG_SOFTMMU) += nvram/
-devices-dirs-$(CONFIG_SOFTMMU) += pci/
+devices-dirs-y += isa/
+devices-dirs-y += misc/
+devices-dirs-y += net/
+devices-dirs-y += rdma/
+devices-dirs-y += nvram/
+devices-dirs-y += pci/
 devices-dirs-$(CONFIG_PCI) += pci-bridge/ pci-host/
-devices-dirs-$(CONFIG_SOFTMMU) += pcmcia/
+devices-dirs-y += pcmcia/
 devices-dirs-$(CONFIG_SCSI) += scsi/
-devices-dirs-$(CONFIG_SOFTMMU) += sd/
-devices-dirs-$(CONFIG_SOFTMMU) += ssi/
-devices-dirs-$(CONFIG_SOFTMMU) += timer/
+devices-dirs-y += sd/
+devices-dirs-y += ssi/
+devices-dirs-y += timer/
 devices-dirs-$(CONFIG_TPM) += tpm/
-devices-dirs-$(CONFIG_SOFTMMU) += usb/
+devices-dirs-y += usb/
 devices-dirs-$(CONFIG_VFIO) += vfio/
-devices-dirs-$(CONFIG_SOFTMMU) += virtio/
-devices-dirs-$(CONFIG_SOFTMMU) += watchdog/
-devices-dirs-$(CONFIG_SOFTMMU) += xen/
+devices-dirs-y += virtio/
+devices-dirs-y += watchdog/
+devices-dirs-y += xen/
 devices-dirs-$(CONFIG_MEM_DEVICE) += mem/
-devices-dirs-$(CONFIG_SOFTMMU) += smbios/
 devices-dirs-y += semihosting/
-devices-dirs-y += core/
+devices-dirs-y += smbios/
+endif
+
 common-obj-y += $(devices-dirs-y)
 obj-y += $(devices-dirs-y)
-- 
1.8.3.1



