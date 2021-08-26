Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7863F8CB0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:06:27 +0200 (CEST)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIpe-0008PI-77
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImm-0005QN-1l
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImi-0008Ms-8m
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so2640017wml.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kFz9cdCuHFlGvHx243QpYrt+H+eFiCSkf8eXbm4ZxFQ=;
 b=h/o3ohNiRLXIj8k7+gcEezV3X2a2nfOJLzYF1cKBsgDwXMNAC9xlo4UzmwjATh7pHp
 XOSfOycQd8SilljuD3X7YEfsjq33SRRnVR1yMqRgDBJUgCGayrBdDFf23FmNzDylPypd
 VYXp5gvWacdh9qvJ9q6htttdOkcl03zX4jET//9OtrC/Xr/cOzjEnLyGDakcNge9j1eb
 cxDnJ20oUUbCE0SOh3vH0lcq7Vwi972TJiR6I/CeXFCseFyeZs4hAYBg1iwqN4xc+pq+
 3sP2R4FK/3Pa5e5LOE2MW/jmPTpynfu1WrwoVloe56IjeDLqXK78UEpdKMjOj0yhF67S
 oHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFz9cdCuHFlGvHx243QpYrt+H+eFiCSkf8eXbm4ZxFQ=;
 b=lME6f4h1Xk0I6l4LUey0/MGFWoQrLKeGW2ERsj36sRwvFUZJGFLvhb9UwTnkszMqmu
 jbtKU/dx61rErC4yegryAN8bXkHnJHNyqfOL4aODNHtP6YioX7tT5PuzNcILytF1Gvrp
 VHWi6kegeluKhHk2A3st8VuQLWsw38lpWeZM+iu8ay9Crbj2IXRcvA9cGkBYmcsDWMpk
 /xS9b9z+jQ0XU/TztCyCj2EJtGIus4WbhgtQdXFJEnAkYSCiAwUV7H+4TIf3wOU1CyHg
 QC2pyPVA4cijkd8Laywa4Cni28gTS2+SHWCd+033kr8LUweTC4PnQ16T4C6L/GtuQlJP
 7MWg==
X-Gm-Message-State: AOAM533BsyW+yvLBpUVJJ8XV6EOzTLYJHP9vvRmxzgDusuyoz9pbx5vY
 vtdUnPqT2vpu3l5JzTwSQlp37Yppfa46Gw==
X-Google-Smtp-Source: ABdhPJyDSajbCraK47ZA6o/DkHta0USasPY2MCXDr6IHJFz6bD2EFq3mSAPaMSRh4jaVJpKSZ84aCA==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr4745049wmc.30.1629997402745; 
 Thu, 26 Aug 2021 10:03:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/37] docs/specs/acpi_pci_hotplug: Convert to rST
Date: Thu, 26 Aug 2021 18:02:42 +0100
Message-Id: <20210826170307.27733-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the PCI hotplug spec document to rST.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 ...i_pci_hotplug.txt => acpi_pci_hotplug.rst} | 37 ++++++++++---------
 docs/specs/index.rst                          |  1 +
 2 files changed, 21 insertions(+), 17 deletions(-)
 rename docs/specs/{acpi_pci_hotplug.txt => acpi_pci_hotplug.rst} (51%)

diff --git a/docs/specs/acpi_pci_hotplug.txt b/docs/specs/acpi_pci_hotplug.rst
similarity index 51%
rename from docs/specs/acpi_pci_hotplug.txt
rename to docs/specs/acpi_pci_hotplug.rst
index a839434f313..685bc5c322f 100644
--- a/docs/specs/acpi_pci_hotplug.txt
+++ b/docs/specs/acpi_pci_hotplug.rst
@@ -1,45 +1,48 @@
 QEMU<->ACPI BIOS PCI hotplug interface
---------------------------------------
+======================================
 
 QEMU supports PCI hotplug via ACPI, for PCI bus 0. This document
 describes the interface between QEMU and the ACPI BIOS.
 
-ACPI GPE block (IO ports 0xafe0-0xafe3, byte access):
------------------------------------------
+ACPI GPE block (IO ports 0xafe0-0xafe3, byte access)
+----------------------------------------------------
 
 Generic ACPI GPE block. Bit 1 (GPE.1) used to notify PCI hotplug/eject
 event to ACPI BIOS, via SCI interrupt.
 
-PCI slot injection notification pending (IO port 0xae00-0xae03, 4-byte access):
----------------------------------------------------------------
+PCI slot injection notification pending (IO port 0xae00-0xae03, 4-byte access)
+------------------------------------------------------------------------------
+
 Slot injection notification pending. One bit per slot.
 
 Read by ACPI BIOS GPE.1 handler to notify OS of injection
 events.  Read-only.
 
-PCI slot removal notification (IO port 0xae04-0xae07, 4-byte access):
------------------------------------------------------
+PCI slot removal notification (IO port 0xae04-0xae07, 4-byte access)
+--------------------------------------------------------------------
+
 Slot removal notification pending. One bit per slot.
 
 Read by ACPI BIOS GPE.1 handler to notify OS of removal
 events.  Read-only.
 
-PCI device eject (IO port 0xae08-0xae0b, 4-byte access):
-----------------------------------------
+PCI device eject (IO port 0xae08-0xae0b, 4-byte access)
+-------------------------------------------------------
 
 Write: Used by ACPI BIOS _EJ0 method to request device removal.
 One bit per slot.
 
 Read: Hotplug features register.  Used by platform to identify features
 available.  Current base feature set (no bits set):
- - Read-only "up" register @0xae00, 4-byte access, bit per slot
- - Read-only "down" register @0xae04, 4-byte access, bit per slot
- - Read/write "eject" register @0xae08, 4-byte access,
-   write: bit per slot eject, read: hotplug feature set
- - Read-only hotplug capable register @0xae0c, 4-byte access, bit per slot
 
-PCI removability status (IO port 0xae0c-0xae0f, 4-byte access):
------------------------------------------------
+- Read-only "up" register @0xae00, 4-byte access, bit per slot
+- Read-only "down" register @0xae04, 4-byte access, bit per slot
+- Read/write "eject" register @0xae08, 4-byte access,
+  write: bit per slot eject, read: hotplug feature set
+- Read-only hotplug capable register @0xae0c, 4-byte access, bit per slot
+
+PCI removability status (IO port 0xae0c-0xae0f, 4-byte access)
+--------------------------------------------------------------
 
 Used by ACPI BIOS _RMV method to indicate removability status to OS. One
-bit per slot.  Read-only
+bit per slot.  Read-only.
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 17cc7868b91..8296fb19b72 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -15,3 +15,4 @@ guest hardware that is specific to QEMU.
    acpi_hest_ghes
    acpi_cpu_hotplug
    acpi_mem_hotplug
+   acpi_pci_hotplug
-- 
2.20.1


