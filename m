Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF265146D27
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 16:44:22 +0100 (CET)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iueeb-0007pr-P4
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 10:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrM-0004xI-Mv
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iucrL-0003Iu-7U
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:24 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:32912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iucrL-0003IJ-0k
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:49:23 -0500
Received: by mail-wr1-x431.google.com with SMTP id b6so3193169wrq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 05:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sSRCj6UHzSKPSE/jS0TsBZzey3FUZ4xZz9WVN3llpok=;
 b=Gm25RKwYQ1ffbx2mrFC30lLqBW3KBRS5+pq4iW6e9U8Q/lSq0L/Ryly9z+gMm/DB4g
 eKtt42NLU4aEXgDlztuZ/FwFxSMxHVXJTgA1gPUh22EnBc+G0QUkxPeNjYqUyRaXpggR
 3M7Dn9KE1JKqIwnubV70/YYEUF8XWHYPa6frg2prtco4q2tX0RHUFfjnJ030qWca70Lo
 W+WDq44HWpjaQylcsjTGmW1Brsy2+zz3kqPw5T9OVuAZWXSW4rvexHPMfznNPstIq/P5
 TeMvksg/2Vo9QAVAIpIwnL5ulPgVEWeP9vN4u9Pj9dme36C7hpEHXm+V9DwGdcL43cNB
 3vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sSRCj6UHzSKPSE/jS0TsBZzey3FUZ4xZz9WVN3llpok=;
 b=TJxYJHPBtkhLmglJGvx50vBg9Qzg6Ub4nhVMW4SF3lGdilh0ii4/9r7YmJ/sncsCsh
 hoSO++NIKzlCbt9hQruUV6qVL7XDQpeW/nLvI9zlnv1LznD6bvLbJ/1EoGPNkeUk4DXi
 Fu8LfVKanaIxBWkzzjJw9HjDrDIgRO4ZtJY/+Yn1CS1+pwWwAYde1Wi6sUprPk3kDlt5
 moC+K+jA7RQU2dl/2ybO7MUNuGXwAi2tfkW5lOGuFKC3D16mBlpnBBL8M/vV26omm5B4
 8vnRUBVjAgZKX3zaStqZpwG7iLTZhgY6lQz93T1RGOTQDOvuD0pcuTZ3YUsHZCF/Kg7U
 8Njw==
X-Gm-Message-State: APjAAAV/sAXg5tIsOLY+gIIWJeQaHhTSYIjQ5GderqyPKIFtgSHdJtHR
 VeHZHjUQVUfTO5yhIUF7bi5ccizQ
X-Google-Smtp-Source: APXvYqzLfpI3wLyNIP46Ai8mFu87iwH2jx0xl3FLdGR9u32XC1/vKNz8wq+74PJ24U0MaXV887lc8g==
X-Received: by 2002:adf:f501:: with SMTP id q1mr18051521wro.263.1579787361793; 
 Thu, 23 Jan 2020 05:49:21 -0800 (PST)
Received: from 640k.localdomain.com ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id s15sm3073171wrp.4.2020.01.23.05.49.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Jan 2020 05:49:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/59] hw/core/Makefile: Group generic objects versus
 system-mode objects
Date: Thu, 23 Jan 2020 14:48:20 +0100
Message-Id: <1579787342-27146-18-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
References: <1579787342-27146-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

To ease review/modifications of this Makefile, group generic
objects first, then system-mode specific ones, and finally
peripherals (which are only used in system-mode).

No logical changes introduced here.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200118140619.26333-7-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/Makefile.objs | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 2fea68c..a522b72 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -1,32 +1,32 @@
 # core qdev-related obj files, also used by *-user:
 common-obj-y += qdev.o qdev-properties.o
 common-obj-y += bus.o
+common-obj-y += cpu.o
+common-obj-y += hotplug.o
+common-obj-y += vmstate-if.o
+# irq.o needed for qdev GPIO handling:
+common-obj-y += irq.o
+
 common-obj-$(CONFIG_SOFTMMU) += reset.o
 common-obj-$(CONFIG_SOFTMMU) += qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) += fw-path-provider.o
-# irq.o needed for qdev GPIO handling:
-common-obj-y += irq.o
-common-obj-y += hotplug.o
 common-obj-$(CONFIG_SOFTMMU) += nmi.o
 common-obj-$(CONFIG_SOFTMMU) += vm-change-state-handler.o
-common-obj-y += cpu.o
-common-obj-y += vmstate-if.o
+common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
+common-obj-$(CONFIG_SOFTMMU) += sysbus.o
+common-obj-$(CONFIG_SOFTMMU) += machine.o
+common-obj-$(CONFIG_SOFTMMU) += null-machine.o
+common-obj-$(CONFIG_SOFTMMU) += loader.o
+common-obj-$(CONFIG_SOFTMMU) += machine-hmp-cmds.o
+obj-$(CONFIG_SOFTMMU) += machine-qmp-cmds.o
+obj-$(CONFIG_SOFTMMU) += numa.o
 
 common-obj-$(CONFIG_EMPTY_SLOT) += empty_slot.o
 common-obj-$(CONFIG_XILINX_AXI) += stream.o
 common-obj-$(CONFIG_PTIMER) += ptimer.o
-common-obj-$(CONFIG_SOFTMMU) += sysbus.o
-common-obj-$(CONFIG_SOFTMMU) += machine.o
-common-obj-$(CONFIG_SOFTMMU) += loader.o
 common-obj-$(CONFIG_FITLOADER) += loader-fit.o
-common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
 common-obj-$(CONFIG_REGISTER) += register.o
 common-obj-$(CONFIG_OR_IRQ) += or-irq.o
 common-obj-$(CONFIG_SPLIT_IRQ) += split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
 common-obj-$(CONFIG_GENERIC_LOADER) += generic-loader.o
-common-obj-$(CONFIG_SOFTMMU) += null-machine.o
-
-obj-$(CONFIG_SOFTMMU) += machine-qmp-cmds.o
-obj-$(CONFIG_SOFTMMU) += numa.o
-common-obj-$(CONFIG_SOFTMMU) += machine-hmp-cmds.o
-- 
1.8.3.1



