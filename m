Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B435EE08
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 09:15:05 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWZjs-00070R-K8
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 03:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lWZj3-0006VN-4M
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 03:14:13 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:26915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lWZiz-0006Z5-I6
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 03:14:12 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210414071355epoutp01fec577328b46d086f955adce6039d067~1qBHnuDCZ2394023940epoutp01W
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 07:13:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210414071355epoutp01fec577328b46d086f955adce6039d067~1qBHnuDCZ2394023940epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618384436;
 bh=MTgA9e9HecYl82ZFodr+ANEeRuYtMozhuDoc1dMjWZg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=fZDw7opc684pvCBtuhvlo/BE+v/BGZRwYzmRb66aDER+LjdYMK/6ICwkrrmutVIcs
 ecC5x+Kpfq/7YnqWohWn+EEhKSFhhX25Kj9awmCd64LOJxTIoYG1XNPKAW+0TDxglk
 QyBO+qNo53pIajF64XMwC1GxAccdeBBR7/GxDQYI=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210414071355epcas5p36cde69c4f8edb0dbe08663a08c58378b~1qBHA5i342933829338epcas5p3f;
 Wed, 14 Apr 2021 07:13:55 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FA.C3.41008.33696706; Wed, 14 Apr 2021 16:13:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210414070803epcas5p32e695f55e3421e0af51ba6adfd157cc6~1p7_8EIcQ2968129681epcas5p3b;
 Wed, 14 Apr 2021 07:08:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210414070803epsmtrp26d8e683ddda1bb5e4b3ce25cb617f55a~1p7_7SaNj1039610396epsmtrp2-;
 Wed, 14 Apr 2021 07:08:03 +0000 (GMT)
X-AuditID: b6c32a4b-64bff7000001a030-23-60769633be3b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 55.6B.33967.2D496706; Wed, 14 Apr 2021 16:08:02 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210414070801epsmtip195c841476a3f012f539f137adcbd518a~1p79kQ4Jg1435714357epsmtip1Q;
 Wed, 14 Apr 2021 07:08:01 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: remove redundant invalid_lba_range trace
Date: Wed, 14 Apr 2021 12:34:35 +0530
Message-Id: <20210414070435.3702-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7bCmlq7xtLIEg++n+Sxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErozeowvZC56LVqxoLWtgbBboYuTkkBAw
 kWha9Ja9i5GLQ0hgN6PEzDftUM4nRomHm76yQTjfGCWuTbjHCtPy6dAcJojEXkaJhqWHWCGc
 NiaJa9O3MINUsQkYScx++4YRxBYRkJT43XUaLM4MsuTbXB0QW1jAQ6Jr/x+wGhYBVYmjr/8y
 gdi8AjYSf3vWMEFsk5dYveEAM8gCCYFD7BL/X50HcjiAHBeJd41BEDXCEq+Ob2GHsKUkPr/b
 C3Q2O5BdLXG4CKKzg1Hi2OUNbBAl9hL/nk1jBJnCLKApsX6XPkRYVmLqqXVMEFfySfT+fgJ1
 Aa/EjnkwtprEglvfoTbJSMz8cxsaJh4STSfWsYDYQgKxEoc23macwCg7C2HDAkbGVYySqQXF
 uempxaYFxnmp5XrFibnFpXnpesn5uZsYwQlBy3sH46MHH/QOMTJxMB5ilOBgVhLhdZtSkiDE
 m5JYWZValB9fVJqTWnyIUZqDRUmcd4fBg3ghgfTEktTs1NSC1CKYLBMHp1QDU9TsmQvWmHz5
 Ev08zCt7B59nca9E/3HZsp/eZnKl/Ubvf51j+X6xfPsbhlMFXIFioU3iH9WWTY9ZrTolvCD5
 85sbusELtgZf8a06t2a7mldolsaJqfx36ueX1rxdbHOaY1by0x/sCisdMlcdzrvt7Lxg79YK
 zk8RaQqL1/qYKG92PWtg93lXzebZFkE/OTa+TGvYuErrgFB77aKg1ktsISKsgpvW/pNYrxyc
 Uv18MYv/v7kHr4T9Tby7uTb6VmDLH9euyS8Nny/y6G1+7ljz58kp+wMZfY43naofOrLLR09h
 eqQjW5NayLKh58D3FpmdXvc+71jVdyBLMIJvTvuWy7EX/I+8X7I4i3vl6xOLnJVYijMSDbWY
 i4oTAaZ9cpx3AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJTvfSlLIEg8tbzS1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErozeowvZC56LVqxoLWtgbBboYuTkkBAw
 kfh0aA5TFyMXh5DAbkaJKZeXMkEkZCR+nZrKDGELS6z895wdoqiFSWLCzi9sIAk2ASOJ2W/f
 MILYIgKSEr+7TjODFDELHGWUuNw+mQUkISzgIdG1/w9YEYuAqsTR13/BNvAK2Ej87VkDtU1e
 YvWGA8wTGHkWMDKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIDjEtzR2M21d90DvE
 yMTBeIhRgoNZSYTXbUpJghBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtS
 i2CyTBycUg1Mrtd2lsVY6nMfj5vOllxYv0pB9nCfme6NnsK6uv3mK/NTMsMXPBbwyZvSz8mV
 v9n0yrT45c2OAVK/FQVaVO5XHxV3++eqeOWy7KoDLD9e/zn0Z0VV7In8CfMjuYKTDp9WWavG
 bnPUJ/bFZeHvV7oOCm19ey/lUVPYodTsvA/LXi7Q4ufYMl+Sf/t3iU0WW3sPyt1f3O1zkVfr
 qF3t+8nVwVWv/pb2b42t9FLueTK7RPxN9/LsUzt/MstP0Nh1RpNxxZzNSj/zi3xvP4//fuWd
 Ztajmwcmccltk1pqOfPq6dkX1VQVD7Gd5eQQ/RUfeJfpqdLH8NmO826uzZa9vmXByefCepFn
 t7x5JL5n4orMVUosxRmJhlrMRcWJAAMkPe2gAgAA
X-CMS-MailID: 20210414070803epcas5p32e695f55e3421e0af51ba6adfd157cc6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210414070803epcas5p32e695f55e3421e0af51ba6adfd157cc6
References: <CGME20210414070803epcas5p32e695f55e3421e0af51ba6adfd157cc6@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently pci_nvme_err_invalid_lba_range tace being called indvidually
at each function, add this in nvme_check_bounds and remove redundant
usage of it.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6842b01ab5..c67d3315a1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1424,6 +1424,7 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
     uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
 
     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
+        trace_pci_nvme_err_invalid_lba_range(slba, nlb, nsze);
         return NVME_LBA_RANGE | NVME_DNR;
     }
 
@@ -2266,7 +2267,6 @@ static void nvme_copy_in_complete(NvmeRequest *req)
 
     status = nvme_check_bounds(ns, sdlba, ctx->nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb, ns->id_ns.nsze);
         goto invalid;
     }
 
@@ -2528,8 +2528,6 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
             uint32_t nlb = le32_to_cpu(range[i].nlb);
 
             if (nvme_check_bounds(ns, slba, nlb)) {
-                trace_pci_nvme_err_invalid_lba_range(slba, nlb,
-                                                     ns->id_ns.nsze);
                 continue;
             }
 
@@ -2602,7 +2600,6 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         return status;
     }
 
@@ -2687,7 +2684,6 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
         status = nvme_check_bounds(ns, slba, _nlb);
         if (status) {
-            trace_pci_nvme_err_invalid_lba_range(slba, _nlb, ns->id_ns.nsze);
             goto out;
         }
 
@@ -2816,7 +2812,6 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         return status;
     }
 
@@ -2935,7 +2930,6 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         goto invalid;
     }
 
@@ -3015,7 +3009,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         goto invalid;
     }
 
-- 
2.17.1


