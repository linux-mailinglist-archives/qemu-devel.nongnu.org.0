Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DDC34E80D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:56:45 +0200 (CEST)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDvI-0007iX-1x
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRDtP-0006Ou-RE
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:54:47 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:62318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRDtN-00033S-8C
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:54:47 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210330125442epoutp0142587207871b3e719994125d56385830~xH-YASfxg2074820748epoutp01n
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 12:54:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210330125442epoutp0142587207871b3e719994125d56385830~xH-YASfxg2074820748epoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617108882;
 bh=qSU6XhJL2nLw2mUOb3vGDfeJcMRXGdq7E7ZsVDdVEFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bFcQseGCHA8v/IoxhXbQZrIuzwaDxm9DEEk/AggjLH/tRnpqAdy7UIoPJdtBgnNhA
 VZ21jfS2NlF1qvW/z5zb7I2CwK/1psTPYz1l8UAovgxk1uBvBMykG+X39z2PU/hAur
 5a55+f4pY7aR06gPWrYsGbuiuSRqCvHhQaAJYUSM=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210330125442epcas5p1f728d3984b2d5a6994d62aa3318c7986~xH-Xf1V7i1589115891epcas5p1t;
 Tue, 30 Mar 2021 12:54:42 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 95.71.15682.19F13606; Tue, 30 Mar 2021 21:54:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210330115308epcas5p2f9a0bd130eccb2ce89cba840f2a10b41~xHJnSX16H1735517355epcas5p2u;
 Tue, 30 Mar 2021 11:53:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210330115308epsmtrp231c5e48eab89aad5ef0b0c8890d8ea03~xHJnRgC-30741807418epsmtrp28;
 Tue, 30 Mar 2021 11:53:08 +0000 (GMT)
X-AuditID: b6c32a49-8bfff70000013d42-18-60631f91bff2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8D.EF.33967.42113606; Tue, 30 Mar 2021 20:53:08 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210330115306epsmtip29ec20f1ddb07c2400e39cf0d507df476~xHJl9NOKj2569525695epsmtip2U;
 Tue, 30 Mar 2021 11:53:06 +0000 (GMT)
Date: Tue, 30 Mar 2021 17:20:01 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 6/7] hw/block/nvme: update dmsrl limit on
 namespace detachment
Message-ID: <20210330115001.GB20347@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210324200907.408996-7-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7bCmlu5E+eQEg39zrCyu7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8a6nhbGgtN8FZMnLmdrYNzL3cXIySEh
 YCKxbcMu9i5GLg4hgd2MEmdnrGGGcD4xSmxbtwrK+cYosbttLSNMy8FlHYwQib2MEutXLYVy
 XjFKzG1vZwapYhFQlVh89y8riM0mYCQx++0bsG4RARWJp//2soA0MAv8ZZT4vms3G0hCWCBG
 orf/HVgRr4C+xPNZU1ghbEGJkzOfsIDYnAIWEn2bZoPZogLKEge2HWcCGSQhMJVD4vXEJVD3
 uUjcuXKUBcIWlnh1fAs7hC0l8fndXqBl7EB2tcThIojWDkaJY5c3sEGU2Ev8ezYNbAyzQIbE
 3qktTBBxWYmpp9YxQcT5JHp/P4GK80rsmAdjq0ksuPUdapWMxMw/t4Hu5wCyPSQ2LPIECQsJ
 7GSU+LTCeQKj/Cwkn81Csg3CtpLo/NDEOguom1lAWmL5Pw4IU1Ni/S79BYysqxglUwuKc9NT
 i00LDPNSy/WKE3OLS/PS9ZLzczcxgpOUlucOxrsPPugdYmTiYDzEKMHBrCTCK3wgMUGINyWx
 siq1KD++qDQntfgQozQHi5I47w6DB/FCAumJJanZqakFqUUwWSYOTqkGJjZF0/OpPj57jl+f
 prw35pjEdcNo12beyfxOqUvOl7aezE4peWTxlrVOK3BumsJL/3O9IU92Z167lW+RrcLm+fdR
 ZEH9PMU5tbu7b7zfd3OTc0t+gf6mP3GFB1Zq88uu4zkyyfL084XLTFurr61juvrVPj9dIobn
 JM+kafUr/vWmmrN9v/a/OGJdoGDm1Ba1udbxZy0nKP5S0e58ayDXrtmserhxJdPyvzH/zhX1
 2j9atjDZIv7ciQ/PNzwNqmVeL/a29n5bbLp+VLbSQqHfCT2/3rqnPYqXb7B51S7p7+W3mMkj
 RskovO2tpcajeQc6i9QeveRVWex9JKRl7ue+RYdfXzObmJLJGcnpo3RfiaU4I9FQi7moOBEA
 zn8riMEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvK6KYHKCwf5GVosr+88zWuw/+I3V
 4mTjHlaLSYeuMVosuZhqMe+WssWsd+1sFsd7d7BYvJ70n9WB0+PHuXY2j3M7zrN7bFrVyebx
 5NpmJo/3+66yefRtWcUYwBbFZZOSmpNZllqkb5fAlTH/9Hqmgr/cFRefb2FtYOzk7GLk5JAQ
 MJE4uKyDsYuRi0NIYDejxO2Jy9khEjISv05NZYawhSVW/nvODlH0glHi/ftzYAkWAVWJxXf/
 soLYbAJGErPfvmEEsUUEVCSe/tvLAtLALPCfUeLR7iNgDcICMRK9/e/AingF9CWez5oC1iwk
 kCqx5g7EIF4BQYmTM5+wgNjMAmYS8zY/BOrlALKlJZb/4wAJcwpYSPRtmg1WIiqgLHFg23Gm
 CYyCs5B0z0LSPQuhewEj8ypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOAI0dLcwbh9
 1Qe9Q4xMHIyHGCU4mJVEeIUPJCYI8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1
 OzW1ILUIJsvEwSnVwGQXbLb2/HEJ7scBp2Ztds4+3e/cIZBVFZub9HBX0Mkbjms/VVdo9vez
 C/rM4bKfqNi9YdOaxrKAZ5UWX398kdk1Y3OQVKvqpnPf+679PFR2hfG3l3/J2quz1eJ+fr79
 gsc88rHnk1kqbJ1Btz88+jxpjeWPsHurZ3Pmf0tcPOH57q5H73/7NSoZFOWpcAh5dV36Z1H3
 snTOXZX5kn+PTv373m9XxMTwyu8X6qfe3vff2cXxDs/yBJX23yV9fw4H3N75pV59VrzezKt/
 limKv2NJZ9SV4e7r22U3W/xd35n3PQJH0lln8Uw/Zn+38+Lk9gUr55Us2Jsbs65UwPDORC++
 CzLp3/lr7rYafOPiDeFXYinOSDTUYi4qTgQAZe+tXP8CAAA=
X-CMS-MailID: 20210330115308epcas5p2f9a0bd130eccb2ce89cba840f2a10b41
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_1a351_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210330115308epcas5p2f9a0bd130eccb2ce89cba840f2a10b41
References: <20210324200907.408996-1-its@irrelevant.dk>
 <20210324200907.408996-7-its@irrelevant.dk>
 <CGME20210330115308epcas5p2f9a0bd130eccb2ce89cba840f2a10b41@epcas5p2.samsung.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_1a351_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Mar 24, 2021 at 09:09:06PM +0100, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>The Non-MDTS DMSRL limit must be recomputed when namespaces are
>detached.
>
>Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 403c8381a498..e84e43b2692d 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -4876,6 +4876,21 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
>     return NVME_NO_COMPLETE;
> }
>
>+static void __nvme_update_dmrsl(NvmeCtrl *n)
>+{
>+    int nsid;
>+
>+    for (nsid = 1; nsid <= NVME_MAX_NAMESPACES; nsid++) {
>+        NvmeNamespace *ns = nvme_ns(n, nsid);
>+        if (!ns) {
>+            continue;
>+        }
>+
>+        n->dmrsl = MIN_NON_ZERO(n->dmrsl,
>+                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
>+    }
>+}
>+

Looks good to me!

> static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
> static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
> {
>@@ -4925,6 +4940,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
>             }
>
>             nvme_ns_detach(ctrl, ns);
>+
>+            __nvme_update_dmrsl(ctrl);
>         }
>
>         /*
>-- 
>2.31.0
>
>

Reviwed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_1a351_
Content-Type: text/plain; charset="utf-8"


------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_1a351_--

