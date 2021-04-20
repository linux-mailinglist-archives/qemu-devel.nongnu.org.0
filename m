Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2393D366489
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:26:32 +0200 (CEST)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4Rb-0007L4-8A
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZ4Hs-00018F-D4
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:16:28 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:25633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZ4Hm-0004Db-I6
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:16:28 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210421041610epoutp016b653d5180327b813c17132442f7a4c3~3xG6kUsGA2575125751epoutp014
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 04:16:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210421041610epoutp016b653d5180327b813c17132442f7a4c3~3xG6kUsGA2575125751epoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618978570;
 bh=O9cna9EIV/tbE6hUQY7W8RoStCXm0BKHoL1CW+/yc/4=;
 h=From:To:Cc:Subject:Date:References:From;
 b=RrXEF+6FpDg+/p8b/noHvG366mugRVZuAMg2c4KxF8pYf8qx1zr69+1mhwgDudKUD
 8HXfWwCMUAsmEhFwNBt6M8hOWaDOvBUbfGgAD2yO18N57qrXJhCDdV3pBXvWsdsXS4
 Q171/X3xjjF6+1qC2GnaUBYnbebiLaouEfdA0Zug=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210421041609epcas5p2ae37618a22eac0de2af2bbbc8e2de7b1~3xG5v56Ew2137321373epcas5p2M;
 Wed, 21 Apr 2021 04:16:09 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.EA.09835.907AF706; Wed, 21 Apr 2021 13:16:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210420192552epcas5p4d48e9f845a34bd1881ab1b297ed5d780~3p351VHN-2030720307epcas5p46;
 Tue, 20 Apr 2021 19:25:52 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210420192552epsmtrp26e65b2ef8cc0688db6c26d2695c4b8db~3p35zxitC1789717897epsmtrp2V;
 Tue, 20 Apr 2021 19:25:52 +0000 (GMT)
X-AuditID: b6c32a4b-7c9ff7000000266b-31-607fa70918c2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 EB.C7.08163.0CA2F706; Wed, 21 Apr 2021 04:25:52 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210420192550epsmtip2cd431667b83496258ac0118002fca938~3p34SV2EK2419924199epsmtip2S;
 Tue, 20 Apr 2021 19:25:50 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: function formatting fix
Date: Wed, 21 Apr 2021 00:52:59 +0530
Message-Id: <20210420192259.21447-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7bCmli7n8voEg9+P5C1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroxdfT+YCiayVmz8/J+5gfEHcxcjJ4eE
 gInEjOVHGUFsIYHdjBJH+gMh7E+MEpeeSXUxcgHZnxklXp6ZwA7TcLN9HSNEYhdQ0cZjbBBO
 G5PEluWfWECq2ASMJGa/fQM2VkRAUuJ312mwdcwgK77N1QGxhQXMJQ6s2ssKYrMIqEqs2tXO
 BGLzCthKTP13DWqbvMTqDQeYQRZICBxjl1hw6gBUwkWif8luKFtY4tXxLVC2lMTnd3uBLmIH
 sqslDhdBtHYwShy7vIENosRe4t+zaUC3cQDdoymxfpc+RFhWYuqpdUwQZ/JJ9P5+wgQR55XY
 MQ/GVpNYcOs71CYZiZl/brNC2B4SL27/YQMZKSQQK3HwtdQERtlZCAsWMDKuYpRMLSjOTU8t
 Ni0wzkst1ytOzC0uzUvXS87P3cQITgda3jsYHz34oHeIkYmD8RCjBAezkgjv/dqaBCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8gs7VCUIC6YklqdmpqQWpRTBZJg5OqQamBLeGIhZ2Nye2CbbG
 hpUfJ7e3tBQvmyJgbnlct/8Vw7/e9lI9lb08X9ddUM6fKX+vJ7zuoNk1qe64ghX5L9KssiKm
 X86UZ8ppeHdJVSrzpNG/5yZbxItsDCZv+th2lcuS+7VWepydfcTjOWY3nViUGeQu76xdMJF1
 n9xLv8lxWenlC5Z3PvkcvukN51Xj6oKeq1uvNv7e2SK+zPbEDvkLPZ1H+G6viY/71+xWGCd9
 wX82p9XVg+H77OS+uT7epXj/j1BWjtaeZzsfh9nOZvbqualYz38qonS7pYOfya/p/becns70
 OCJ9qi6wb2Gv5NwZlpdYdnzr7zrspjNffa38j7tzm9dr/dNl+Wk4h0mJpTgj0VCLuag4EQAr
 vngXdgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LZdlhJXveAVn2CQfsHCYvXO48zW1zZf57R
 Yv/Bb6wWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK2NX3w+mgomsFRs//2duYPzB3MXIySEh
 YCJxs30dYxcjF4eQwA5GiaVfPjFCJGQkfp2aClUkLLHy33N2iKIWJolzW5uZQBJsAkYSs9++
 AWsQEZCU+N11mhmkiFngKKPE5fbJLCAJYQFziQOr9rKC2CwCqhKrdrWDNfMK2EpM/XeNHWKD
 vMTqDQeYJzDyLGBkWMUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERxkWlo7GPes+qB3
 iJGJg/EQowQHs5II7/3amgQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YW
 pBbBZJk4OKUamA4caNoVdXvquQ+CAbJ+aj1v7hlFu89aNG3G1JULQvoefer+Esn+0/z4pFCu
 hmM8e8/9jesL+S135HxjxqGNFU/PXzKp2/mo55Wc3OnIk4bmBvycnGt//5YO6+gqSvMPYFNt
 /cNsWN58KjxEP69MqOblhMmnet0+zfuSICN0K/dN1Ku1NWcui6lt//JD9MPGlKO3T4tc2rjM
 cLb7i+4FR3pc/l89zq0V/0HsXS/HmrZZ6h4H/J/OYZQTr0xr6lseeWa7qwPz8x/uXBr6Xysk
 Pi9IzNnNpzzpi2WuzuatCuFP0/YF5vRsjT0zbaPom8DXMw/84XrSF/9Vco1coMO6w5fmZ+qF
 VJ3JWtnVmtUoLKLEUpyRaKjFXFScCAAhCEPkoQIAAA==
X-CMS-MailID: 20210420192552epcas5p4d48e9f845a34bd1881ab1b297ed5d780
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210420192552epcas5p4d48e9f845a34bd1881ab1b297ed5d780
References: <CGME20210420192552epcas5p4d48e9f845a34bd1881ab1b297ed5d780@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

nvme_map_addr_pmr function arguments not aligned, fix that.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 624a1431d0..63ceeb47bd 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -574,7 +574,7 @@ static uint16_t nvme_map_addr_cmb(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
 }
 
 static uint16_t nvme_map_addr_pmr(NvmeCtrl *n, QEMUIOVector *iov, hwaddr addr,
-    size_t len)
+                                  size_t len)
 {
     if (!len) {
         return NVME_SUCCESS;
-- 
2.17.1


