Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9E4F08A2
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 12:04:23 +0200 (CEST)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nax5p-0001mw-72
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 06:04:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1nax2R-00011w-3h
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 06:00:52 -0400
Received: from [2a00:1450:4864:20::636] (port=44665
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1nax2N-0001uD-Jp
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 06:00:49 -0400
Received: by mail-ej1-x636.google.com with SMTP id qh7so4312884ejb.11
 for <qemu-devel@nongnu.org>; Sun, 03 Apr 2022 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bkD7F9HQhLe+zvyeKJGHtcuZ6MkDVZPNfi+E5eIempo=;
 b=ENrRauFvjqUwuKm44AZELPk/61J4JJnSwmq6Y7Y5rF0cbHn4OdHpGwx3xmkQLyr7OI
 LRaYftwxOZG63kYOKlw2PS2hkkyzsY8OrzrPdhlOT5pEv9yhZ7j43lA2QE/6vaBopsvH
 igzZ7lUyBPLL8/arRrSwilFh1+UuOIBGUuWvcNzaOB1VG2TPckLq+N+pbkJKUTGsMWIy
 7JHNcNB3dTR6P5BbUtWe98aI9LNapV80x8VsU6ERttNiLqkTBdO1pSdPE3Lm70LR3C24
 CaDTeSq7uh6Vw3xi4iSNE9RKmjTtNW5zn0JxPcioy77B69kaDMAJyp6LXGLzKL6GjGi+
 7aCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bkD7F9HQhLe+zvyeKJGHtcuZ6MkDVZPNfi+E5eIempo=;
 b=to6w+Oo3hc4HUadsQ2/VAOuGqSFy6fLbgg5PkMDAxiIUwEo2qXHdexRr6dv+vIQnFr
 p+oAv7ZbLOyFx8xB68mMrVLt93zI1rro85u4nzd8hJGkyI9ZVaLjKhA1WPy3aeXh2mJl
 Y8RFwN4R7lP4erS9IglT+JXlljijMIToilLTh3l/MihUzNZBsPVDPe+SadepcsZk32Bu
 clb+GfRj+rd+Z1kfL1N0pIEACEDtP3lvHBL70HeiplIiAfOkKk55IgWMqSNGjRKUgWm0
 audkevBBG60Nfaim0HNI6bERZEPGHWT2EFG8br+VmoruO8CegB5ysDM/SO6qxcYThptl
 OP2A==
X-Gm-Message-State: AOAM5314YqmwbJRWhh6wY1eVVTPef90ObkueG6GduCCNXtt4E9+F0JrZ
 ZZCk9G8yN0esh9fGC/DgxfKdXdXHUqA=
X-Google-Smtp-Source: ABdhPJyOZLdEwzOVGlHyfcJar4yZtlamzCKbMn7l9FOA34uFEZHx84YkIYGJnbVg/fzgB/B/7YxUIw==
X-Received: by 2002:a17:906:69d1:b0:6ce:7201:ec26 with SMTP id
 g17-20020a17090669d100b006ce7201ec26mr6496039ejs.105.1648980045557; 
 Sun, 03 Apr 2022 03:00:45 -0700 (PDT)
Received: from localhost.localdomain ([5.29.20.198])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1709063a0500b006da8fa9526esm3090445eje.178.2022.04.03.03.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 03:00:44 -0700 (PDT)
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
To: qemu-devel@nongnu.org, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com
Subject: [PATCH] hw/pvrdma: Some cosmetic fixes
Date: Sun,  3 Apr 2022 12:58:37 +0300
Message-Id: <20220403095837.2378-1-yuval.shaia.ml@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
 hw/rdma/vmw/pvrdma_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 91206dbb8e..aae382af59 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -159,13 +159,13 @@ static void free_dsr(PVRDMADev *dev)
     free_dev_ring(pci_dev, &dev->dsr_info.cq, dev->dsr_info.cq_ring_state);
 
     rdma_pci_dma_unmap(pci_dev, dev->dsr_info.req,
-                         sizeof(union pvrdma_cmd_req));
+                       sizeof(union pvrdma_cmd_req));
 
     rdma_pci_dma_unmap(pci_dev, dev->dsr_info.rsp,
-                         sizeof(union pvrdma_cmd_resp));
+                       sizeof(union pvrdma_cmd_resp));
 
     rdma_pci_dma_unmap(pci_dev, dev->dsr_info.dsr,
-                         sizeof(struct pvrdma_device_shared_region));
+                       sizeof(struct pvrdma_device_shared_region));
 
     dev->dsr_info.dsr = NULL;
 }
@@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
 {
     struct pvrdma_device_shared_region *dsr;
 
-    if (dev->dsr_info.dsr == NULL) {
+    if (!dev->dsr_info.dsr) {
+        /* Buggy or malicious guest driver */
         rdma_error_report("Can't initialized DSR");
         return;
     }
-- 
2.20.1


