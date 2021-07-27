Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484553D7B90
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:06:06 +0200 (CEST)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QWr-0008FF-9K
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QVD-000691-1z
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:04:23 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QVB-0006aR-5b
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:04:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id q3so16106192wrx.0
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yuJfLUlF735ota23WYSTKPmJcW+n4urjayMKmX6ywKU=;
 b=jnplopY1LaroMhLU/Vflxygk3JSOq29n7Vp0usWMBtY+0XgH5d1vBT3zqSWuuFUxHo
 9knXl3iisfTMlpXUa1lhyLuRP3Oq6UNqvgU7JpVw5pXGYjX2mVarQFQYYwjCQ7yC5+zA
 pWv02E5jZZT2Kfov7kOWF8D/o/RvdBQ3JWBhzJhLm8KLweycoMJn3lM8hQak+6HGE0br
 9roP2vM9TAE6B350QdHDran0ecW6OnGzF8ncZuKczF2AYofd/oR6Osg/87xwfHELRQZG
 mTpVUw1uY4AmzPYKBi9qSUfiH2BW5WeTOVSLPmvwEu4PrWzMg4j+cs6arajUf14r2KzR
 0SIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yuJfLUlF735ota23WYSTKPmJcW+n4urjayMKmX6ywKU=;
 b=PSSebUtv2rb69tVDtwXotGNG0TmNYVIS67ObHEmfcjt+x28Ca0SYWoKgWAL6Hw1/rc
 c4PqkVhHtk4ge0c3sATEgD6Pl3/M8mMmpX5icKiXpv+OiaygMMV2yXdXcLgd9iJrnSfn
 Ha/KwJT//CehLB2d7RyGhgJsmkpMWTV64h0bho911/5403JF0fpHaDIu9xNilYeU4wiY
 1EWEte5f4SMkiKogLjQw47yMRFZIfKHT71VPIbZaRkp89XshMFBMHM54X6PVo0w7YHX1
 ndbU2k0ndg1JeEVtesPKnShOxGkpXqfi04GebIiYeTAeHX9PN4PLdt5xjTs0BAqAovLb
 ghNg==
X-Gm-Message-State: AOAM5331w+RLMt9iIFtgJC6VQCoPB6pPyI//At1YC3YkLagy5Ccx40t2
 /gdkLc8IH9JJtwwerUTtthpZdHjpOibQWA==
X-Google-Smtp-Source: ABdhPJyDqNFlEsjnNPdPRLBW1BoJlwxnVDU1gAqVshWhye/gZhl1z4r+NxeB1n6w0RY4+y5kQ0jxIA==
X-Received: by 2002:a05:6000:1625:: with SMTP id
 v5mr22829678wrb.80.1627405459801; 
 Tue, 27 Jul 2021 10:04:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 129sm3708518wmz.26.2021.07.27.10.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:04:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] docs/specs/acpi_pci_hotplug: Convert to rST
Date: Tue, 27 Jul 2021 18:04:12 +0100
Message-Id: <20210727170414.3368-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727170414.3368-1-peter.maydell@linaro.org>
References: <20210727170414.3368-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the PCI hotplug spec document to rST.
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


