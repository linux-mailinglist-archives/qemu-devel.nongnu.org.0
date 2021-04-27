Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B936BF44
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 08:27:29 +0200 (CEST)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbHBw-0004Nf-3T
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 02:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lbHAN-0003gJ-LG
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 02:25:51 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:55118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lbHA5-00031W-Jg
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 02:25:47 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210427062523epoutp03a0cf3b205cc8a9aeaf9b1c59202b93a3~5ovc9Slv62654026540epoutp03E
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 06:25:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210427062523epoutp03a0cf3b205cc8a9aeaf9b1c59202b93a3~5ovc9Slv62654026540epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619504723;
 bh=Ai0MS4k1b35tZdyI5cAZUrWqkYoh6iVgWvvSxznJSZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=auvUgQp2mm8EKqeAysv52su/mVUjHMJJXw4Sz8HHxRucAgnxtg2pUc2145+nS3LCO
 Nub+NrmTrf0eYT0mmA5WBQ8wkUGkyp59rXitu1IaK5K+xDN/GsdyU+pf9XOjwa+DrL
 gwiBvjX2J+olCSFEUQbv8SKMmxwnZwZAf7v6rfeI=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210427062523epcas5p4961861450a8b81e30e6f21d5a35e571b~5ovcxNlDv0719007190epcas5p4x;
 Tue, 27 Apr 2021 06:25:23 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 66.69.09606.35EA7806; Tue, 27 Apr 2021 15:25:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210427061047epcas5p3518947939854c31322b0b22aa34f3f64~5oitPTkJp0689006890epcas5p3O;
 Tue, 27 Apr 2021 06:10:47 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210427061047epsmtrp1189ff47c89eb9cd0a96840273e45f697~5oitOcOCV2110021100epsmtrp1_;
 Tue, 27 Apr 2021 06:10:47 +0000 (GMT)
X-AuditID: b6c32a49-bdbff70000002586-0f-6087ae53df78
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 8E.88.08163.7EAA7806; Tue, 27 Apr 2021 15:10:47 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210427061046epsmtip20442299de5f724d6e7f39109d95577e6~5oir8cfwo2255022550epsmtip2G;
 Tue, 27 Apr 2021 06:10:46 +0000 (GMT)
Date: Tue, 27 Apr 2021 11:36:16 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: fix csi field for cns 0x00 and 0x11
Message-ID: <20210427060615.GA15064@2030045822>
MIME-Version: 1.0
In-Reply-To: <YIad6KpbnA2ihJ7e@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA03SfVAMcRgH8Pnt3W5b48wW8VTycmEco0JlJ+dkGA4TBtN418lOoavcSWiY
 lEqIylud0Z3JTMSkSZqr6GXFEdPNoSbl5ShvuVwldZTL3a1m/PfZ5/l9n9/LLMlzK8A9yd0x
 +xlFjCxaSLjwyx+IZsxeX5we7t/eM5F+WaNHdE1dP07nsM2IvmZg6PxWH1r1PZ2gdZlaPv0t
 ZxgPIaWWxnRC2qjVO0lLizIIaUfzHUxqrm4i1uKbXcS7mOjdBxiFnyTcJarjzwARd87rYFLy
 miTU5X4SOZNABUCv+TRmtxtVhYBtkJxELjb3Ivhep8a5xg8EJQXikUB2aSWfW1SJ4IpejbiP
 TgRXDbWOUXxqGvQYVchugpoLl7tMDo+lpsJH631HmkdlI9BmDhH2xhhqORQ+vu4ICyg/YHMf
 4pxd4UleB99uZ9ugvsFjDrtTPlBbrsPsg4BKJaHw8zMed76lYDrDBYAaA526MifOnvD1bJrN
 TjYnwgMFFz2B4NGLEoJbsgisny46DsqjouDenWScq3vDhYZijKuPhszBDoyrC0CbP+LpoGkd
 +LfVBMgbavuXlUL7j2GCe6EKBOebLE5ZaJLqv7up/tuPczBkdNtN2uwFhVaSowhuV/ppEF6E
 PJg4pTySUQbGzYlhEnyVMrkyPibSNyJWXooc/9HMFVr0xtjtyyKMRCwCkiccKyAqU8PdBLtk
 hw4zitgdivhoRskiL5IvHC9wXZIY7kZFyvYzexkmjlGMdDHS2TMJG5VyrKc7zFRLP64SXbrZ
 fAQz3xbtaa2Z4j1ZuyVpR3G29/ogn5/u4gMbQo8ODSZsPPh8XLCy7q3xncSjTG3IMoZVFzQv
 FLq3sWo2cKsRO9QecWoAu3U30f/3al31pOOSXLxsOW4o0Uy1vKpf1yuxllrFqy/3B/b8ztKI
 W5bNN+XqL/E1li+u5rQpEYHMHs91fSf6UmJTQ2Sh8Uvbi/1nVexse/4rKGCJvClo+0rnfdtS
 ihZ3atLMW8Pyf427ivrf6wzSnCuqjL5nwav2kXoP4TxRmNlnuKHl0agukaV88Ycb0QPDjWpT
 Veb2p0PlrzPq6zdZJ6d7sPKVhlNfEwTTKhYI+coo2ZyZPIVS9he9b5U/tgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSvO7zVe0JBg82Gllc2X+e0WL/wW+s
 FpMOXWO0WHIx1WLeLWWLWe/a2SyO9+5gsXg96T+rA4fHj3PtbB7ndpxn99i0qpPN48m1zUwe
 7/ddZQtgjeKySUnNySxLLdK3S+DKeH+nm6XgqETF4tNnmRsYdwp3MXJySAiYSEzctIuli5GL
 Q0hgB6PExI3PWCESMhK/Tk1lhrCFJVb+e84OUfSCUeLpx81gRSwCqhIfH8xiBLHZBIwkZr99
 A2aLCKhIPP23F2wqs8BERokdvX/YQBLCAu4Sy0+sYAKxeQX0JQ7NOMoKMXUno0RH61U2iISg
 xMmZT1hAbGYBM4l5mx8CncEBZEtLLP/HARLmBFr25XcjWImogLLEgW3HmSYwCs5C0j0LSfcs
 hO4FjMyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGC40FLawfjnlUf9A4xMnEwHmKU
 4GBWEuFl29WaIMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILUIpgsEwen
 VAOT50GO55Na5bJ2eUuf+3zq721dhdI1IfO33P36zTfFWmrPg6/ySopvplTIbDj/9fRBU5V3
 fVkmT99uZNsS9a5o+sbehGU6N3g1qo48NzDuynIpWOlwq/379NQ02cTFU/13Lan92B4wQUHe
 TJrlE29I33Hvmtdbb4ls6PZJlHOUbzv4w2lvZUh30Ly5S1e8Whvfq+gt8oC35lz4IcF74hu0
 zbdK7X7bH7E4xK9H9ZfdzOzVr2b9Z//BociYc2iJgMyX/IU/zLiS/NrO8JlUnF25S8R266LN
 a193XSqvr7TL+aqpePaGZNXnpPmzRMRquwzmbTnRzOvP9eiXn5hvACPnhGVW+YtSmqodZpn4
 75msxFKckWioxVxUnAgABlMqKfYCAAA=
X-CMS-MailID: 20210427061047epcas5p3518947939854c31322b0b22aa34f3f64
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----bUxwuCCDCMHmmogRYL-gh-gjXt6gU8i4.RAtra32WMoi9E65=_3542c_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210426074741epcas5p1ac30fed5ef8c21a1b7e5685920ff6847
References: <CGME20210426074741epcas5p1ac30fed5ef8c21a1b7e5685920ff6847@epcas5p1.samsung.com>
 <20210426074650.24245-1-anaidu.gollu@samsung.com>
 <YIad6KpbnA2ihJ7e@apples.localdomain>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------bUxwuCCDCMHmmogRYL-gh-gjXt6gU8i4.RAtra32WMoi9E65=_3542c_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Mon, Apr 26, 2021 at 01:03:04PM +0200, Klaus Jensen wrote:
>On Apr 26 13:16, Gollu Appalanaidu wrote:
>>As per the TP 4056d Namespace types CNS 0x00 and CNS 0x11
>>CSI field shouldn't use but it is being used for these two
>>Identify command CNS values, fix that.
>>
>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>---
>>hw/nvme/ctrl.c | 11 ++++++++---
>>1 file changed, 8 insertions(+), 3 deletions(-)
>>
>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>index 2e7498a73e..1657b1d04a 100644
>>--- a/hw/nvme/ctrl.c
>>+++ b/hw/nvme/ctrl.c
>>@@ -4244,11 +4244,16 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
>>        }
>>    }
>>
>>-    if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>>-        return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
>>+    if (active && nvme_csi_has_nvm_support(ns)) {
>>+        goto out;
>>+    } else if (!active && ns->csi == NVME_CSI_NVM) {
>>+        goto out;
>>+    } else {
>>+        return NVME_INVALID_CMD_SET | NVME_DNR;
>>    }
>>
>>-    return NVME_INVALID_CMD_SET | NVME_DNR;
>>+out:
>>+    return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
>>}
>>
>>static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
>>-- 
>>2.17.1
>>
>>
>
>Looking closer at this, since we only support the NVM and Zoned 
>command sets, we can get rid of the `nvme_csi_has_nvm_support()` 
>helper and just assume NVM command set support for all namespaces. The 
>way different command sets are handled doesn't scale anyway, so we 
>might as well simplify the logic a bit.
>
>Something like this (compile-tested only) patch maybe?
>
>diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
>index 2e7498a73e70..7fcd6992358d 100644
>--- i/hw/nvme/ctrl.c
>+++ w/hw/nvme/ctrl.c
>@@ -4178,16 +4178,6 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *n, NvmeRequest *req)
>     return nvme_c2h(n, id, sizeof(id), req);
> }
>
>-static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
>-{
>-    switch (ns->csi) {
>-    case NVME_CSI_NVM:
>-    case NVME_CSI_ZONED:
>-        return true;
>-    }
>-    return false;
>-}
>-
> static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
> {
>     trace_pci_nvme_identify_ctrl();
>@@ -4244,7 +4234,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
>         }
>     }
>
>-    if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>+    if (active || ns->csi == NVME_CSI_NVM) {
>         return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
>     }
>
>@@ -4315,7 +4305,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
>         }
>     }
>
>-    if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>+    if (c->csi == NVME_CSI_NVM) {
>         return nvme_rpt_empty_id_struct(n, req);
>     } else if (c->csi == NVME_CSI_ZONED && ns->csi == NVME_CSI_ZONED) {
>         return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
>

Sure, will make changes and submit v2

------bUxwuCCDCMHmmogRYL-gh-gjXt6gU8i4.RAtra32WMoi9E65=_3542c_
Content-Type: text/plain; charset="utf-8"


------bUxwuCCDCMHmmogRYL-gh-gjXt6gU8i4.RAtra32WMoi9E65=_3542c_--

