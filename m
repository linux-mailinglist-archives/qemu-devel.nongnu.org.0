Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3850FD91
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:50:43 +0200 (CEST)
Received: from localhost ([::1]:53350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKeQ-0002TG-HX
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKa8-00068C-T6; Tue, 26 Apr 2022 08:46:16 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKa7-0007CO-8L; Tue, 26 Apr 2022 08:46:16 -0400
Received: from quad ([82.142.9.138]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M7bND-1noZEv1wY1-007zxj; Tue, 26
 Apr 2022 14:46:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/pvrdma: Some cosmetic fixes
Date: Tue, 26 Apr 2022 14:46:06 +0200
Message-Id: <20220426124610.639614-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426124610.639614-1-laurent@vivier.eu>
References: <20220426124610.639614-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QI1KGqHB4RxbJZJMUyIIBLUM0qVUsPRZ6VjPgzKIbuqsgPMiHU7
 t/+6Z0mu5mdqrWj5DYJF04kUiNEPrTUyxGfutpLpFhQ9B29OyHGWku9ejIMeMWbFb4e7XRw
 185TppclwDmrshdlHMCMTIarUcjtm57LL+MrU8sF5kpVWucmrAQAz0B/hURoIqUFUEAHkm2
 V99eQSckrnX01xDfr/euQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3kGSB5lzYgc=:UMpCuz9pqhscMyP6EGb6zf
 dbVunRJ2wMpMwmTsCd0eUsC2+uc1GZcd69quWY0ALPSa+Dg2C3hyhDz6BjOFufFFE/ksShN++
 BfG23Usp/9kjst5ITlGijApeobbqNf9N0h8JcuOAWQB9XYuMQOBj92A90g37Rp1dI6gaHcGfP
 EGcEkbClaZOHDn1jEyS6s410JslCGVFb4LoOAOggHeP9yPQsP5AIYVWsF5r45rWmcLpkY3v1F
 4LPZxJKp/f6hXDFU4LkaCoDtUm4Vrc0e8eZ2i/3rym4a2aEG5ovwnsYOAnJ4TFhdSH5m939qF
 eUjjbAxw3fRep30XJ7iHVqCIBpttpDUfjcztsH4u01JJ7o0QpGZvZeQG2yyQHzZ/Du/JT+AT7
 6/zk1QLCjtc4iZWj0/JxHrcFXb1pA/t8triYE3vleSxuOiJuewCVHkILNnPcoL8QB6mC9iplj
 R/mVPDj45bpIGoR18MEv8XHTir9MROfVbfESvH8Pbo8KxlMbAGI87w2MlqCSr8E37TQRDkfkm
 FfA3FyxUXNAwEC7TxVKuf9V1Nuq95vHR0owR9aj8c1BnKT0/m9IjY5Zl6Z5jOld39F7RjdIoX
 4gJU36BxiW+SEcf+OqS1W8QHj3iCNe13/kDA2KCw7OkNMNXe7+keI5leCH91dFzqkTU4ZiUF3
 0Mj5oMlSjUF1BCcDTjCseWGS79GcexhpvQvs78qhxwYE7ysR/JSk8d9EWOdNFbuC3aAI=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuval Shaia <yuval.shaia.ml@gmail.com>

Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20220403095837.2378-1-yuval.shaia.ml@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rdma/vmw/pvrdma_main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 27a76224320e..58db0b8e3bb9 100644
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
2.35.1


