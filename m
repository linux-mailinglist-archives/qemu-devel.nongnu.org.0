Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9525A3C844C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 14:11:16 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3djP-0008Sz-MT
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 08:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1m3dfD-0003uV-Sa
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:06:55 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:22575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1m3df8-0004BA-GI
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:06:55 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210714120642epoutp01cbef1f2066f31e9bf71f9c605e39ea05~RptuqxbMe0517105171epoutp01W
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 12:06:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210714120642epoutp01cbef1f2066f31e9bf71f9c605e39ea05~RptuqxbMe0517105171epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1626264402;
 bh=eT0ssQChiIDWUUQGQgTKSsSylCSDuvWuWXr4eqMasqA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=leSt3UDdpYkqccoI8ThOLtZ5kAl/C8IH4QMuoQ+dgK1xLSZbPvXshrjQkePeOKiDv
 99JXszNPZ02VkAWxcRyAUxbHjfWE1sIOIuCRatU09h/LoHs+eSflocXfS0fc+egtyW
 iTTMmfw8V+BWBBVJ71VuBKQ1Ci3OyU4y1++xHFr8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210714120642epcas5p4afc13a9aa07aeb284685bcd76c47407b~RptuG0yLQ0782807828epcas5p4w;
 Wed, 14 Jul 2021 12:06:42 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.40.210]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4GPx7M5yJkz4x9Pr; Wed, 14 Jul
 2021 12:06:39 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 1A.8A.55882.F43DEE06; Wed, 14 Jul 2021 21:06:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210714114548epcas5p41a562395f6b695aabcfa4a531f2285d3~Rpben9vSf1773817738epcas5p4T;
 Wed, 14 Jul 2021 11:45:48 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210714114548epsmtrp1b2fb7a7df6131522161f288a84cce05d~RpbenFMcZ1014010140epsmtrp10;
 Wed, 14 Jul 2021 11:45:48 +0000 (GMT)
X-AuditID: b6c32a49-f4fff7000001da4a-80-60eed34f15a0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 72.E1.08289.C6ECEE06; Wed, 14 Jul 2021 20:45:48 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210714114546epsmtip23c57f621c8ba7fa5a6211f02fc8369f1~RpbcbkjGb2537225372epsmtip2v;
 Wed, 14 Jul 2021 11:45:46 +0000 (GMT)
Date: Wed, 14 Jul 2021 17:12:05 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 2/5] hw/nvme: use symbolic names for registers
Message-ID: <20210714114204.GB28548@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210714060125.994882-3-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHd/vj9ZWszbPWeK0asOgCGkpbbfdgMF2GrI7NEU32x9xCC7y0
 DaXt+lpxYDL8MRkwcLiVaUXDIiAlbhDnWIEC8zHbqY1AZDAZzYzrCDBxxAKKsLKWVxL++5zv
 ud+cc+65F2UKPIgI1RuthMWoMYiRGFZ7X2JC0nv3n6ilt3p24UO9/QDvvTnPxm+fcLPxc9Qw
 wBsGCfxpqQi/PBqP97aH2Hid7yELr2pa5OCOJ2UI7q1ysfB/zi2zcacnbR9f9fxeGaK65+rn
 qK63lCOqsWE3ogoM/8BQ/dvzG6KqvtECsjkfGNJ0hCafsMQRxjxTvt6oTRdnHc55M0ehlMqS
 ZCn4q+I4o6aQSBdnvJOdlKk3hBsWxx3VGGxhKVtDkuLk19MsJpuViNOZSGu6mDDnG8wyuVlC
 agpJm1EryTMVpsqkUrkifFJt0F2qfgDME5nHQst3QSkYkFcALgqxPZBaqGdUgBhUgHUB2Dk4
 idDBUwCdV19EgyCAZX39rFXL8/OnopZOAP+qqWVHEgJsCsArg6oIs7AdcP6bOk6EEUwOL04/
 BhEWYtvh36FuVsTMxIaYsGNuhhFJrMf2w4pHC0iEeVgypErtTJrXwdsXAmEDinIxHNobd0fk
 DVg8/Lndu9IExNwovPV1K0J3lwHnF50cmtfDKe+NKIvg5NkzYeaEuQT2WWjr5wB67rdFrXth
 aLx2pU8mpoetE18xaH0rtN/5nkHrfFi1GIjqPOi6vMqvwPrRZ9FSW+CFpT/YNKvgxbabHPqy
 OgA8Mf4F40sQ61gzmmNNPZpTYfnMSbYjPDIT2wyvhlAaE2FrZ3I9YLeATYSZLNQSpMIsMxJF
 axd+Haw86J0HXMD/cEZCAQYKKABRpljIa5RPqwW8fM0nxYTFlGOxGQiSAorwrmqYog15pvCP
 MFpzZAq5UilNkSp240qZeCOvkUOpBZhWYyUKCMJMWFZ9DJQrKmU0L3xHHhEu5J72D55iq+XZ
 FeioumOeDzn6k1zbSx5q8qfxBq2/W527J0XIKuKDw3v5hwLFW0YI3VsJs7lLfafLCyRB59tC
 UOJFfbkwa0xld7cfrNnctavkTHB25FJxzNQRbiK140CsZfvxHqn3l7Frv26q5C5Wfhw7EDo/
 cHT0oz+1n76wK7EPy7dti92YYMucKGhoc846Min3o2NMx7txPrsQPUTewb37rL+f7aTeNzZJ
 pzzVEp7v8fIbzT92z12x3D3ueK3rgSzQ8d9+V0ad/2WTXyKbPkht7UrPUuqG0IkMX8zwyFhw
 vPJb6FqHfdYcXCpqqp0MpsZfm3smZpE6jWwn00Jq/gd5gcYZWQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42LZdlhJXjfn3LsEg29TZC2u7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxacGKYt5t5Qt9m/7x2ox58wDFoveZb/ZLWa9a2ezON67g8Xi9aT/
 rBYrj9k48Hn8ONfO5nFux3l2j02rOtk87lzbw+bx5NpmJo/3+66yefRtWcUYwB7FZZOSmpNZ
 llqkb5fAlbHt4Xn2gukuFdv29jI1MM406GLk5JAQMJH4MaOZqYuRi0NIYAejxN1r01ggEjIS
 v05NZYawhSVW/nvODlH0glHiz+wbbCAJFgFViW/T57CD2GwCRhKz375hBLFFBFQknv7bywLS
 wCxwg1li4oNeJpCEsICrRNejn2DNvAL6EocaIDYICaRKLO34wgoRF5Q4OfMJ2BXMAmYS8zY/
 BKrhALKlJZb/4wAxOQUsJKYuNQapEBVQljiw7TjTBEbBWUiaZyFpnoXQvICReRWjZGpBcW56
 brFhgVFearlecWJucWleul5yfu4mRnBcaWntYNyz6oPeIUYmDsZDjBIczEoivEuN3iYI8aYk
 VlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwHRaPdPwjGfLvNab
 rf+dHzZrPVWVC+5Rfb32dOX+gJCQRs1Jsxwvu5VI8E/2Tjsgm3bcvP7zgbwsvwYZ9aagaS9L
 tjJz/s2pOvj94zfr6+v7eX4eZP/YUbzRWDpkRtd04YQJbzwKlv/4JvjnQ7T1QjHpj3x7XoR4
 XDnycfnfNZHn169l2+duuuq1+5/CZzvXmzx9PvMGExe3uCTzBOGrUW6Rsqzzg/+9f9NfYnf1
 rb8ay1V+v+N8jifj+9TqGnqcp7Ad3254U3cbo8Vjvslu3tbzfA77/hL6nu70MNZU+HGL0fQl
 Xzer9Qoryj2YkFtgW6779fTbcIGmxPKDdcvFPsZ+yc3gm7V9erPl+38Mi5RYijMSDbWYi4oT
 Aehk46kaAwAA
X-CMS-MailID: 20210714114548epcas5p41a562395f6b695aabcfa4a531f2285d3
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----SnJais_EYPJzUqaDAwh7bj0QL11VbLJ05ranV90Q-MmUbzuL=_11c044_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210714114548epcas5p41a562395f6b695aabcfa4a531f2285d3
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-3-its@irrelevant.dk>
 <CGME20210714114548epcas5p41a562395f6b695aabcfa4a531f2285d3@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------SnJais_EYPJzUqaDAwh7bj0QL11VbLJ05ranV90Q-MmUbzuL=_11c044_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Jul 14, 2021 at 08:01:22AM +0200, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Add the NvmeBarRegs enum and use these instead of explicit register
>offsets.
>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> include/block/nvme.h | 29 ++++++++++++++++++++++++++++-
> hw/nvme/ctrl.c       | 44 ++++++++++++++++++++++----------------------
> 2 files changed, 50 insertions(+), 23 deletions(-)
>
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index 84053b68b987..77aae0117494 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -9,7 +9,7 @@ typedef struct QEMU_PACKED NvmeBar {
>     uint32_t    cc;
>     uint8_t     rsvd24[4];
>     uint32_t    csts;
>-    uint32_t    nssrc;
>+    uint32_t    nssr;
>     uint32_t    aqa;
>     uint64_t    asq;
>     uint64_t    acq;
>@@ -31,6 +31,33 @@ typedef struct QEMU_PACKED NvmeBar {
>     uint8_t     css[484];
> } NvmeBar;
>
>+enum NvmeBarRegs {
>+    NVME_REG_CAP     = offsetof(NvmeBar, cap),
>+    NVME_REG_VS      = offsetof(NvmeBar, vs),
>+    NVME_REG_INTMS   = offsetof(NvmeBar, intms),
>+    NVME_REG_INTMC   = offsetof(NvmeBar, intmc),
>+    NVME_REG_CC      = offsetof(NvmeBar, cc),
>+    NVME_REG_CSTS    = offsetof(NvmeBar, csts),
>+    NVME_REG_NSSR    = offsetof(NvmeBar, nssr),
>+    NVME_REG_AQA     = offsetof(NvmeBar, aqa),
>+    NVME_REG_ASQ     = offsetof(NvmeBar, asq),
>+    NVME_REG_ACQ     = offsetof(NvmeBar, acq),
>+    NVME_REG_CMBLOC  = offsetof(NvmeBar, cmbloc),
>+    NVME_REG_CMBSZ   = offsetof(NvmeBar, cmbsz),
>+    NVME_REG_BPINFO  = offsetof(NvmeBar, bpinfo),
>+    NVME_REG_BPRSEL  = offsetof(NvmeBar, bprsel),
>+    NVME_REG_BPMBL   = offsetof(NvmeBar, bpmbl),
>+    NVME_REG_CMBMSC  = offsetof(NvmeBar, cmbmsc),
>+    NVME_REG_CMBSTS  = offsetof(NvmeBar, cmbsts),
>+    NVME_REG_PMRCAP  = offsetof(NvmeBar, pmrcap),
>+    NVME_REG_PMRCTL  = offsetof(NvmeBar, pmrctl),
>+    NVME_REG_PMRSTS  = offsetof(NvmeBar, pmrsts),
>+    NVME_REG_PMREBS  = offsetof(NvmeBar, pmrebs),
>+    NVME_REG_PMRSWTP = offsetof(NvmeBar, pmrswtp),
>+    NVME_REG_PMRMSCL = offsetof(NvmeBar, pmrmscl),
>+    NVME_REG_PMRMSCU = offsetof(NvmeBar, pmrmscu),
>+};
>+
> enum NvmeCapShift {
>     CAP_MQES_SHIFT     = 0,
>     CAP_CQR_SHIFT      = 16,
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 28299c6f3764..8c305315f41c 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -5740,7 +5740,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>     }
>
>     switch (offset) {
>-    case 0xc:   /* INTMS */
>+    case NVME_REG_INTMS:
>         if (unlikely(msix_enabled(&(n->parent_obj)))) {
>             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_intmask_with_msix,
>                            "undefined access to interrupt mask set"
>@@ -5752,7 +5752,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>         trace_pci_nvme_mmio_intm_set(data & 0xffffffff, n->bar.intmc);
>         nvme_irq_check(n);
>         break;
>-    case 0x10:  /* INTMC */
>+    case NVME_REG_INTMC:
>         if (unlikely(msix_enabled(&(n->parent_obj)))) {
>             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_intmask_with_msix,
>                            "undefined access to interrupt mask clr"
>@@ -5764,7 +5764,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>         trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, n->bar.intmc);
>         nvme_irq_check(n);
>         break;
>-    case 0x14:  /* CC */
>+    case NVME_REG_CC:
>         trace_pci_nvme_mmio_cfg(data & 0xffffffff);
>         /* Windows first sends data, then sends enable bit */
>         if (!NVME_CC_EN(data) && !NVME_CC_EN(n->bar.cc) &&
>@@ -5798,7 +5798,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>             n->bar.cc = data;
>         }
>         break;
>-    case 0x1c:  /* CSTS */
>+    case NVME_REG_CSTS:
>         if (data & (1 << 4)) {
>             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_ssreset_w1c_unsupported,
>                            "attempted to W1C CSTS.NSSRO"
>@@ -5809,7 +5809,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                            " of controller status");
>         }
>         break;
>-    case 0x20:  /* NSSR */
>+    case NVME_REG_NSSR:
>         if (data == 0x4e564d65) {
>             trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
>         } else {
>@@ -5817,38 +5817,38 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>             return;
>         }
>         break;
>-    case 0x24:  /* AQA */
>+    case NVME_REG_AQA:
>         n->bar.aqa = data & 0xffffffff;
>         trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
>         break;
>-    case 0x28:  /* ASQ */
>+    case NVME_REG_ASQ:
>         n->bar.asq = size == 8 ? data :
>             (n->bar.asq & ~0xffffffffULL) | (data & 0xffffffff);
>         trace_pci_nvme_mmio_asqaddr(data);
>         break;
>-    case 0x2c:  /* ASQ hi */
>+    case NVME_REG_ASQ + 4:
>         n->bar.asq = (n->bar.asq & 0xffffffff) | (data << 32);
>         trace_pci_nvme_mmio_asqaddr_hi(data, n->bar.asq);
>         break;
>-    case 0x30:  /* ACQ */
>+    case NVME_REG_ACQ:
>         trace_pci_nvme_mmio_acqaddr(data);
>         n->bar.acq = size == 8 ? data :
>             (n->bar.acq & ~0xffffffffULL) | (data & 0xffffffff);
>         break;
>-    case 0x34:  /* ACQ hi */
>+    case NVME_REG_ACQ + 4:
>         n->bar.acq = (n->bar.acq & 0xffffffff) | (data << 32);
>         trace_pci_nvme_mmio_acqaddr_hi(data, n->bar.acq);
>         break;
>-    case 0x38:  /* CMBLOC */
>+    case NVME_REG_CMBLOC:
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbloc_reserved,
>                        "invalid write to reserved CMBLOC"
>                        " when CMBSZ is zero, ignored");
>         return;
>-    case 0x3C:  /* CMBSZ */
>+    case NVME_REG_CMBSZ:
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
>                        "invalid write to read only CMBSZ, ignored");
>         return;
>-    case 0x50:  /* CMBMSC */
>+    case NVME_REG_CMBMSC:
>         if (!NVME_CAP_CMBS(n->bar.cap)) {
>             return;
>         }
>@@ -5876,15 +5876,15 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>         }
>
>         return;
>-    case 0x54:  /* CMBMSC hi */
>+    case NVME_REG_CMBMSC + 4:
>         n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
>         return;
>
>-    case 0xe00: /* PMRCAP */
>+    case NVME_REG_PMRCAP:
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
>                        "invalid write to PMRCAP register, ignored");
>         return;
>-    case 0xe04: /* PMRCTL */
>+    case NVME_REG_PMRCTL:
>         if (!NVME_CAP_PMRS(n->bar.cap)) {
>             return;
>         }
>@@ -5899,19 +5899,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>             n->pmr.cmse = false;
>         }
>         return;
>-    case 0xe08: /* PMRSTS */
>+    case NVME_REG_PMRSTS:
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
>                        "invalid write to PMRSTS register, ignored");
>         return;
>-    case 0xe0C: /* PMREBS */
>+    case NVME_REG_PMREBS:
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrebs_readonly,
>                        "invalid write to PMREBS register, ignored");
>         return;
>-    case 0xe10: /* PMRSWTP */
>+    case NVME_REG_PMRSWTP:
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
>                        "invalid write to PMRSWTP register, ignored");
>         return;
>-    case 0xe14: /* PMRMSCL */
>+    case NVME_REG_PMRMSCL:
>         if (!NVME_CAP_PMRS(n->bar.cap)) {
>             return;
>         }
>@@ -5932,7 +5932,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>         }
>
>         return;
>-    case 0xe18: /* PMRMSCU */
>+    case NVME_REG_PMRMSCU:
>         if (!NVME_CAP_PMRS(n->bar.cap)) {
>             return;
>         }
>@@ -5974,7 +5974,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
>          * from PMRSTS should ensure prior writes
>          * made it to persistent media
>          */
>-        if (addr == 0xe08 &&
>+        if (addr == NVME_REG_PMRSTS &&
>             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
>             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
>         }
>-- 
>2.32.0
>
>

LGTM.

Reviewed-by : Gollu Appalanaidu <anaidu.gollu@samsung.com>


------SnJais_EYPJzUqaDAwh7bj0QL11VbLJ05ranV90Q-MmUbzuL=_11c044_
Content-Type: text/plain; charset="utf-8"


------SnJais_EYPJzUqaDAwh7bj0QL11VbLJ05ranV90Q-MmUbzuL=_11c044_--

