Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957BA3C8448
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 14:09:01 +0200 (CEST)
Received: from localhost ([::1]:55778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3dhE-0006M1-KH
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 08:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1m3dfC-0003rn-VL
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:06:54 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:22607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1m3dfA-0004Fo-3v
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 08:06:54 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210714120649epoutp01fac60d1dfb79419a93289654d1f8d81b~Rpt1MFGrb0778407784epoutp01G
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 12:06:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210714120649epoutp01fac60d1dfb79419a93289654d1f8d81b~Rpt1MFGrb0778407784epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1626264409;
 bh=idB5pPjE8/lhLgILhc+WduTyqEmKqFXS3bzszHQDOOU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZG/tNpy3CFTFQZ1a9jTM/lTcAGc3WtxtH9BLaXCf67qAGMfRgZvilOuMCyobfg0Yq
 89E5koJFV8z02aGf683hHnh/wqIL4xrfeNPjn2Va+aM/Her/l6T0lTahTQAZk+ZasV
 nyNCCmCO5oWeUIlk6HMnOe4FkcwsjAft1VZF3UOQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210714120649epcas5p3a4fa98ca71eef005ba306a40640600da~Rpt0ksULf1056710567epcas5p3p;
 Wed, 14 Jul 2021 12:06:49 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.40.194]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4GPx7V65XQz4x9Pr; Wed, 14 Jul
 2021 12:06:46 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EE.8A.55882.653DEE06; Wed, 14 Jul 2021 21:06:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210714113905epcas5p3d582216af16ab401f806757cad6bcc8d~RpVnY03q80345403454epcas5p3X;
 Wed, 14 Jul 2021 11:39:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210714113905epsmtrp20b35d65c74884b1671ced0a95caa9eb8~RpVnXxRGd0216802168epsmtrp2A;
 Wed, 14 Jul 2021 11:39:05 +0000 (GMT)
X-AuditID: b6c32a49-f65ff7000001da4a-8d-60eed356ab61
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D4.FD.08394.9DCCEE06; Wed, 14 Jul 2021 20:39:05 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210714113903epsmtip192fd26c267c666e84d2ad09e7483c897~RpVlRepPh1239412394epsmtip1O;
 Wed, 14 Jul 2021 11:39:03 +0000 (GMT)
Date: Wed, 14 Jul 2021 17:05:18 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 1/5] hw/nvme: split pmrmsc register into upper and lower
Message-ID: <20210714113518.GA28548@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210714060125.994882-2-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGJsWRmVeSWpSXmKPExsWy7bCmum7Y5XcJBjM2aFtc2X+e0WL/wW+s
 Ficb97BaTDp0jdFiycVUi08NUhbzbilb7N/2j9VizpkHLBa9y36zW8x6185mcbx3B4vF60n/
 WS1WHrNx4PP4ca6dzePcjvPsHptWdbJ53Lm2h83jybXNTB7v911l8+jbsooxgD0qxyYjNTEl
 tUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6GAlhbLEnFKgUEBi
 cbGSvp1NUX5pSapCRn5xia1SakFKToGhUYFecWJucWleul5yfq6VoYGBkSlQZUJORsfXiywF
 OxUqTkzvYWtgXCvZxcjBISFgItF/2qmLkYtDSGA3o0TT/GUsEM4nRol9h+azQzjfGCU6mrsY
 uxg5wTq+9H9hhEjsZZRYdWAllPOKUaKh9wYrSBWLgKpE+4+lzCA2m4CRxOy3b8C6RQRUJJ7+
 2wu2g1ngCrPEzq8fmEASwgKBEl/33GQHsXkF9CWWHTvABmELSpyc+YQFxOYUsJB4cGQlWI2o
 gLLEgW3HmUAGSQgc4JDYfGEuK8R9LhInTmxih7CFJV4d3wJlS0l8frcXaCg7kF0tcbgIorWD
 UeLY5Q1sECX2Ev+eTQM7lFkgU+LDnA9QI2Ulpp5axwQR55Po/f2ECSLOK7FjHoytJrHg1neo
 VTISM//chur1kFi6ZyaYLSSwk1Hi8/SCCYzys5C8NgvJOgjbSqLzQxOQzQFkS0ss/8cBYWpK
 rN+lv4CRdRWjZGpBcW56arFpgWFeajlyhG9iBCdoLc8djHcffNA7xMjEwXiIUYKDWUmEd6nR
 2wQh3pTEyqrUovz4otKc1OJDjKbAuJrILCWanA/MEXkl8YamRmZmBpYGpsYWZoZK4rxL2Q8l
 CAmkJ5akZqemFqQWwfQxcXBKNTBti3/U88N8V1XUPm0DzedNtR0HfjdKL/vw22m6x6NLeVKn
 vc+eqfo96VfQhvuGK+8nyLfOrLpZwMWwoStH4/mDB3fWJoU4H/xw0PP8M8NWcRON9cxMn33W
 x0orlylydm159DZx6eUk8QuGkheCBRzjY+e1uR03CUl9svPKzVShted/SFruibq3S+Pcjo1B
 f9++W/BP5sNh5vl730e7an5vzpn3P37ltc87q1gfzHS0Sz+pEpL0Wu3b9c011+VcJtb7eMrP
 17n0/nzKldIId5dXeuKqxu/+R0rvabfXTvIKLnSr6nNUOT9D5g/Pbf5X10P3MN9cuPXDvmvT
 zhbbnV6xatvl957OKQwHOOZLnrY8pcRSnJFoqMVcVJwIAO1hdJhZBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJTvfmmXcJBnOPK1tc2X+e0WL/wW+s
 Ficb97BaTDp0jdFiycVUi08NUhbzbilb7N/2j9VizpkHLBa9y36zW8x6185mcbx3B4vF60n/
 WS1WHrNx4PP4ca6dzePcjvPsHptWdbJ53Lm2h83jybXNTB7v911l8+jbsooxgD2KyyYlNSez
 LLVI3y6BK+PehAfMBS9kK84fPMjcwPhNrIuRk0NCwETiS/8Xxi5GLg4hgd2MEhN+v2GHSMhI
 /Do1lRnCFpZY+e85O0TRC0aJlS9nMoIkWARUJdp/LAUrYhMwkpj99g1YXERAReLpv70sIA3M
 AjeYJSY+6GUCSQgLBEp83XMTbAOvgL7EsmMH2EBsIYFUie4NVxgh4oISJ2c+YQGxmQXMJOZt
 fgi0gAPIlpZY/o8DJMwpYCHx4MhKsDGiAsoSB7YdZ5rAKDgLSfcsJN2zELoXMDKvYpRMLSjO
 Tc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjiwtzR2M21d90DvEyMTBeIhRgoNZSYR3qdHbBCHe
 lMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYtmdfzA6+Ky94
 +57c+rtmiy/daXa1PXPucPS2l1+fXj23/riWi0Ck2xVD1icOG1k43K466mR93bvkaU3E1Fkh
 Z+wmBP3ttrCclc7s37BGeuOe1Wl6v/7d8U8XVs+0+vRiUeRk3YjeDLHPz5+cVdHT5694ZMCS
 Nb2mqmUOQ0vXExUh9gudC4yucKrOX+XrvF8nwCWTrVY4+KtZjnrnd6eqqSuUczbKZFtz/amN
 28V7zP9cGOu3gG+z/hw5Ecx1L/Zn27+96fsNNjkmHNW2FA2qSAlQ6n0WW3TvgQfXnoreDxrC
 B98d38Au/2OzF1NVnPUsg7D16h9C/gtlrA0v89mj/kiYu07wMEf+JuPu1EAlluKMREMt5qLi
 RAB+FxwyGwMAAA==
X-CMS-MailID: 20210714113905epcas5p3d582216af16ab401f806757cad6bcc8d
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----hb-dvdiRZtWrjeusMudXEerT0TTrvs-OGX_88iZ4NSx451yS=_11c195_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210714113905epcas5p3d582216af16ab401f806757cad6bcc8d
References: <20210714060125.994882-1-its@irrelevant.dk>
 <20210714060125.994882-2-its@irrelevant.dk>
 <CGME20210714113905epcas5p3d582216af16ab401f806757cad6bcc8d@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------hb-dvdiRZtWrjeusMudXEerT0TTrvs-OGX_88iZ4NSx451yS=_11c195_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Jul 14, 2021 at 08:01:21AM +0200, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
>make up the 64 bit logical PMRMSC register.
>
>Make it so.
>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> include/block/nvme.h | 31 ++++++++++++++++---------------
> hw/nvme/ctrl.c       |  9 +++++----
> 2 files changed, 21 insertions(+), 19 deletions(-)
>
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index 527105fafc0b..84053b68b987 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -26,7 +26,8 @@ typedef struct QEMU_PACKED NvmeBar {
>     uint32_t    pmrsts;
>     uint32_t    pmrebs;
>     uint32_t    pmrswtp;
>-    uint64_t    pmrmsc;
>+    uint32_t    pmrmscl;
>+    uint32_t    pmrmscu;
>     uint8_t     css[484];
> } NvmeBar;
>
>@@ -475,25 +476,25 @@ enum NvmePmrswtpMask {
> #define NVME_PMRSWTP_SET_PMRSWTV(pmrswtp, val)   \
>     (pmrswtp |= (uint64_t)(val & PMRSWTP_PMRSWTV_MASK) << PMRSWTP_PMRSWTV_SHIFT)
>
>-enum NvmePmrmscShift {
>-    PMRMSC_CMSE_SHIFT   = 1,
>-    PMRMSC_CBA_SHIFT    = 12,
>+enum NvmePmrmsclShift {
>+    PMRMSCL_CMSE_SHIFT   = 1,
>+    PMRMSCL_CBA_SHIFT    = 12,
> };
>
>-enum NvmePmrmscMask {
>-    PMRMSC_CMSE_MASK   = 0x1,
>-    PMRMSC_CBA_MASK    = 0xfffffffffffff,
>+enum NvmePmrmsclMask {
>+    PMRMSCL_CMSE_MASK   = 0x1,
>+    PMRMSCL_CBA_MASK    = 0xfffff,
> };
>
>-#define NVME_PMRMSC_CMSE(pmrmsc)    \
>-    ((pmrmsc >> PMRMSC_CMSE_SHIFT)   & PMRMSC_CMSE_MASK)
>-#define NVME_PMRMSC_CBA(pmrmsc)     \
>-    ((pmrmsc >> PMRMSC_CBA_SHIFT)   & PMRMSC_CBA_MASK)
>+#define NVME_PMRMSCL_CMSE(pmrmscl)    \
>+    ((pmrmscl >> PMRMSCL_CMSE_SHIFT)   & PMRMSCL_CMSE_MASK)
>+#define NVME_PMRMSCL_CBA(pmrmscl)     \
>+    ((pmrmscl >> PMRMSCL_CBA_SHIFT)   & PMRMSCL_CBA_MASK)
>
>-#define NVME_PMRMSC_SET_CMSE(pmrmsc, val)   \
>-    (pmrmsc |= (uint64_t)(val & PMRMSC_CMSE_MASK) << PMRMSC_CMSE_SHIFT)
>-#define NVME_PMRMSC_SET_CBA(pmrmsc, val)   \
>-    (pmrmsc |= (uint64_t)(val & PMRMSC_CBA_MASK) << PMRMSC_CBA_SHIFT)
>+#define NVME_PMRMSCL_SET_CMSE(pmrmscl, val)   \
>+    (pmrmscl |= (uint32_t)(val & PMRMSCL_CMSE_MASK) << PMRMSCL_CMSE_SHIFT)
>+#define NVME_PMRMSCL_SET_CBA(pmrmscl, val)   \
>+    (pmrmscl |= (uint32_t)(val & PMRMSCL_CBA_MASK) << PMRMSCL_CBA_SHIFT)
>
> enum NvmeSglDescriptorType {
>     NVME_SGL_DESCR_TYPE_DATA_BLOCK          = 0x0,
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 2f0524e12a36..28299c6f3764 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -5916,11 +5916,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>             return;
>         }
>
>-        n->bar.pmrmsc = (n->bar.pmrmsc & ~0xffffffff) | (data & 0xffffffff);
>+        n->bar.pmrmscl = data & 0xffffffff;
>         n->pmr.cmse = false;
>
>-        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
>-            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
>+        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
>+            hwaddr cba = n->bar.pmrmscu |
>+                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);
>             if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
>                 NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
>                 return;
>@@ -5936,7 +5937,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>             return;
>         }
>
>-        n->bar.pmrmsc = (n->bar.pmrmsc & 0xffffffff) | (data << 32);
>+        n->bar.pmrmscu = data & 0xffffffff;
>         return;
>     default:
>         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
>-- 
>2.32.0
>
>
Changes LGTM.

Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>


------hb-dvdiRZtWrjeusMudXEerT0TTrvs-OGX_88iZ4NSx451yS=_11c195_
Content-Type: text/plain; charset="utf-8"


------hb-dvdiRZtWrjeusMudXEerT0TTrvs-OGX_88iZ4NSx451yS=_11c195_--

