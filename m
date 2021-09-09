Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D734048E7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 13:06:00 +0200 (CEST)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHsV-00056T-Nd
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 07:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mOHpl-0001nw-O5
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 07:03:09 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mOHpY-0002DV-KQ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 07:03:09 -0400
Received: by mail-pl1-x630.google.com with SMTP id v1so816884plo.10
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZdyAS/BhM/njJeRLyypL7KRqBLVZHGDhoXs8k7Qq6iQ=;
 b=RQtjWjigH8qGuFyUtAkcii4eybtRGmmGe0OPp3UJkQEnqtKPdT7vqvLWCqoksGPYLz
 2IV6eWxfZmeUUq+Q8G++KH3znwP3cSJ1zxcQ6DVqQ28vid8ep29gV9b4tV6cW25BATGQ
 8QW37wwv4hQx4XU6ek+3et8efWeX+h+eQ4jCsUnDpOmza83HakpJYJlzDcKhX8JT+r8H
 pUi3TBFvKkupf3SNHhjrkoDcYnlD5F0zUgMuTUU0XO0jgqsQ0UCmh9Ch1UihU4Qs1r10
 kvzpaEV5whn5c7WaybIXLm0lOnXH3VsoMk5Vg3hQV4+T/IKLFcpJtncVh/XOIQqmQ4gy
 G9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZdyAS/BhM/njJeRLyypL7KRqBLVZHGDhoXs8k7Qq6iQ=;
 b=o+8d3Aed4uXtBqNX3XhHL8cPDQf7KBPJ/Vy/2TdVH4W0Fswh1VldrAK7fZqDTQdqYV
 VUsucdwPWUkMaLAMyCd/r4s85nOlzCMf2+Yqb6tXqlPj8DhiJ+VwQwxXb7iDvmfFIe/W
 GLjK3pYHBRnJqefnxw82cFhN8iVzg16035XJ7z4MYdZhxLkOiXIASv8po4EDA/Dxerhv
 IUR6VedVvyij6Oa+01CBbGqlwWZ70GfUbA3AaYrF+9H52+e1Ax2D+4XmmU0+CB1hkaW8
 laToVsey444117nWdNDvZBySpl06A0X0fWq6mFbZTd9zSnh57OdXWO9kiO+gRSyUQAhw
 ad+Q==
X-Gm-Message-State: AOAM532dMVmCwKi17k/fx2ti6AFAQGbJV/Nh+JFV52ApeZFtp3PD7pYc
 NIYP9X67Vazvcca/5HW6lW/DW5J7IaC1dw==
X-Google-Smtp-Source: ABdhPJzhnzFqpIaUNlpgi2YxIz6+6h6GBVCHI/WE+nufFN5N0WyfUg/PEHp8Aj3w5LV4pG3z3qHgEw==
X-Received: by 2002:a17:903:4112:b0:13a:7afa:f9c4 with SMTP id
 r18-20020a170903411200b0013a7afaf9c4mr433116pld.66.1631185375053; 
 Thu, 09 Sep 2021 04:02:55 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.198.246])
 by smtp.googlemail.com with ESMTPSA id g19sm1894103pjl.25.2021.09.09.04.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 04:02:54 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH v1 3/3] docs: pcie: RCEC
Date: Thu,  9 Sep 2021 16:32:21 +0530
Message-Id: <20210909110221.703-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210909110221.703-1-mchitale@ventanamicro.com>
References: <20210909110221.703-1-mchitale@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x630.google.com
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
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update root bus section to include information on how to
enable PCIe RCEC for any given machine.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 docs/pcie.txt | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/docs/pcie.txt b/docs/pcie.txt
index 89e3502075..da5d7b676b 100644
--- a/docs/pcie.txt
+++ b/docs/pcie.txt
@@ -57,12 +57,14 @@ Place only the following kinds of devices directly on the Root Complex:
     (4) Extra Root Complexes (pxb-pcie), if multiple PCI Express Root Buses
         are needed.
 
+    (5) Root complex event collector (pcie-rcec).
+
    pcie.0 bus
-   ----------------------------------------------------------------------------
-        |                |                    |                  |
-   -----------   ------------------   -------------------   --------------
-   | PCI Dev |   | PCIe Root Port |   | PCIe-PCI Bridge |   |  pxb-pcie  |
-   -----------   ------------------   -------------------   --------------
+   ------------------------------------------------------------------------------------
+        |                |                    |                  |                |
+   -----------   ------------------   -------------------   --------------   -------------
+   | PCI Dev |   | PCIe Root Port |   | PCIe-PCI Bridge |   |  pxb-pcie  |   | PCIe RCEC |
+   -----------   ------------------   -------------------   --------------   -------------
 
 2.1.1 To plug a device into pcie.0 as a Root Complex Integrated Endpoint use:
           -device <dev>[,bus=pcie.0]
@@ -72,6 +74,10 @@ Place only the following kinds of devices directly on the Root Complex:
       connected to the pcie.1 bus:
           -device ioh3420,id=root_port1[,bus=pcie.1][,chassis=x][,slot=y][,addr=z]                                     \
           -device pcie-pci-bridge,id=pcie_pci_bridge1,bus=pcie.1
+2.1.3 To plug a PCIe RCEC into pcie.0 use:
+          -device pcie-rcec
+      PCIe RCEC must always be the first device on the root bus, pcie.0. So any RCiEP
+      devices plugged into pcie.0 must appear after the rcec in the command line.
 
 
 2.2 PCI Express only hierarchy
-- 
2.17.1


