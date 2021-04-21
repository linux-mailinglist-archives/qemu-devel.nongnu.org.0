Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C93668D4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 12:07:16 +0200 (CEST)
Received: from localhost ([::1]:54928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ9lL-0006tA-6O
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 06:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZ9kO-0006No-CK
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:06:16 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:12860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZ9kF-000050-UF
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:06:16 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210421100601epoutp01b1c662e713077888c532775b70facbae~314YAdkOB1980019800epoutp01c
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 10:06:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210421100601epoutp01b1c662e713077888c532775b70facbae~314YAdkOB1980019800epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618999561;
 bh=m6d2seiHEAYHgrjtG/6FdzpinFc4xeMEgCfbGlCA2Vo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aKhPAjtAGVXvYUjPDxalQIqUuKLFV/EYzEzZmqAxLXmivZ/d2agb7egOB6IacLg9W
 aU3+Iazno+bA85Wx+y5Ogt9Vbzbd9Rm+RNeWUEUEM5q+ETctL+HHfSwJ3eBK59aYSs
 to5BiBp4a7aWlm/QBnDhQ5CfS0huojoK0YVLcPKo=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210421100601epcas5p123de75ef0741060b65db74985e325013~314Xhq7Rc1578415784epcas5p18;
 Wed, 21 Apr 2021 10:06:01 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F4.39.09606.809FF706; Wed, 21 Apr 2021 19:06:00 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210421100549epcas5p4539620254ebce0717645f6e5bd7d5db6~314MxBMP00574705747epcas5p4L;
 Wed, 21 Apr 2021 10:05:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210421100549epsmtrp22d93bbf322c34124a6adfc22ecac1528~314Mvigux0892408924epsmtrp2m;
 Wed, 21 Apr 2021 10:05:49 +0000 (GMT)
X-AuditID: b6c32a49-bf1ff70000002586-29-607ff908f308
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 48.9B.08637.DF8FF706; Wed, 21 Apr 2021 19:05:49 +0900 (KST)
Received: from 2030045822 (unknown [107.99.42.33]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210421100548epsmtip2c85a7daff716ec23b3f23cd83aee380b~314LlJo4l2585125851epsmtip2I;
 Wed, 21 Apr 2021 10:05:48 +0000 (GMT)
Date: Wed, 21 Apr 2021 15:33:04 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3] hw/block/nvme: fix lbaf formats initialization
Message-ID: <20210421100303.GA3854@2030045822>
MIME-Version: 1.0
In-Reply-To: <YH8vtPtI2OkOAkOw@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7bCmhi7Hz/oEg2nPzS2u7D/PaLH/4DdW
 i0mHrjFaLLmYajHvlrLFrHftbBbHe3ewWLye9J/VgcPjx7l2No9zO86ze2xa1cnm8eTaZiaP
 9/uusgWwRnHZpKTmZJalFunbJXBlHPl/jLWgTbWi6dQllgbGs1JdjJwcEgImEm8WPWbrYuTi
 EBLYzSjx9NsaJgjnE6PE53UdrBDON0aJKwd+MsO0/PhwlRHEFhLYyyhxuc0Xoug5o8StWSuY
 QBIsAqoSjw6sYwWx2QSMJGa/fQPWICKgIvH0314WkAZmgYmMEjt6/7CBJIQF3CQmfJkLVsQr
 oCex5s0/FghbUOLkzCdgNifQoGvbT4HViwooSxzYdhzsVgmBVg6JxavmsUOc5yKx58IBVghb
 WOLV8S1QcSmJz+/2AjWzA9nVEoeLIFo7GCWOXd7ABlFiL/Hv2TSwG5gFMiT6166GapWVmHpq
 HRNEnE+i9/cTJog4r8SOeTC2msSCW9+h6mUkZv65DXWCh0TTgmXskBDayShxaepy5gmM8rOQ
 /DYLyT4I20qi80MT6yxGDiBbWmL5Pw4IU1Ni/S79BYysqxglUwuKc9NTi00LDPNSy/WKE3OL
 S/PS9ZLzczcxglOSlucOxrsPPugdYmTiYDzEKMHBrCTCe7+2JkGINyWxsiq1KD++qDQntfgQ
 ozQHi5I4r6BzdYKQQHpiSWp2ampBahFMlomDU6qBSfR494yHFt19ZucPaR/ml9Xy4+F/+Vfc
 +FeH0Xf3nAdWG7898H+40KD15ueAjHf61ovbPt4KWjShp7HpjtHxiwUZFitZplcK68qXbYhZ
 O+cxwy1tt9YHd36J5qfbai3Zee3b3ed1dxXkgxNyFqx3rr0pvenyjnytrEWJ3/4dV+j7yL29
 rkjwm8iGV/X7Ny491eVWW/FWRDPG7/31N/9cG7jsDRZuWMYkNP8Cc/Hut49/3bkxZfWPp8+T
 4ieuvRBl37N/2f5W+5f7ax7IJtb8eH6mpsP2q5bQLrGwRSGWf4ySBcM93c9/ZP1W/Ozbm9Tq
 Svn2WwGHLs2yX6S7UE+cn/FZeNYu2V/Tlt84sm2OxhMlluKMREMt5qLiRADX1u9muAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSvO7fH/UJBrP+SFlc2X+e0WL/wW+s
 FpMOXWO0WHIx1WLeLWWLWe/a2SyO9+5gsXg96T+rA4fHj3PtbB7ndpxn99i0qpPN48m1zUwe
 7/ddZQtgjeKySUnNySxLLdK3S+DKaG+6wlqwQ6li67WfTA2MMyW6GDk5JARMJH58uMrYxcjF
 ISSwm1FiW/9VFoiEjMSvU1OZIWxhiZX/nrNDFD1llOhqu8cOkmARUJV4dGAdK4jNJmAkMfvt
 G0YQW0RAReLpv70sIA3MAhMZJXb0/mEDSQgLuElM+DIXrIhXQE9izZt/LBBTdzJKXHnRxA6R
 EJQ4OfMJ2BnMAmYS8zY/BDqDA8iWllj+jwMkzAm07Nr2U2AzRQWUJQ5sO840gVFwFpLuWUi6
 ZyF0L2BkXsUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERwPWpo7GLev+qB3iJGJg/EQ
 owQHs5II7/3amgQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4
 OKUamFYey4vgPaHxe19Ms0Br93MBlw8TzxUuM3Vw31mut7ST9Vek4KRfb1f6tDO/k/lg3dV1
 /WJRc8LHqNVbFcynFf2RDhQ4v/y0SGzapz8W6vph647+ZZx3U/T2jus5ux8avNBVCOg2uGW3
 Z0bnyalRi59FZs5ZY8h5onn/qk9B8tnL9NLmdpYKXA84qbW4T3ea1bXJuW3l1WUBG7KazKqM
 I14aidUWnF8Y2P1FKSAyQ+7iPRWf6i7TenkP7rWXo1Iq4tfY+V5sWSTXW/DsTciypMOuN/PU
 ZGXDmCZ4aXBOXRCx3iTi+WTT73O3Pok63bqt2veQbe7sM9zTXacpLLpU9GnfKiOny4LHfnqa
 ejFfVGIpzkg01GIuKk4EADiFOJ72AgAA
X-CMS-MailID: 20210421100549epcas5p4539620254ebce0717645f6e5bd7d5db6
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----VykvYSSejOdlZPZked-c5GBuo-J3axZ25gz06rerctM8gJuw=_17bc7_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210416120324epcas5p354e2f196cc68680aba45341f385b59ed
References: <CGME20210416120324epcas5p354e2f196cc68680aba45341f385b59ed@epcas5p3.samsung.com>
 <20210416115907.30625-1-anaidu.gollu@samsung.com>
 <YH8vtPtI2OkOAkOw@apples.localdomain>
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
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------VykvYSSejOdlZPZked-c5GBuo-J3axZ25gz06rerctM8gJuw=_17bc7_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Tue, Apr 20, 2021 at 09:47:00PM +0200, Klaus Jensen wrote:
>On Apr 16 17:29, Gollu Appalanaidu wrote:
>>Currently LBAF formats are being intialized based on metadata
>>size if and only if nvme-ns "ms" parameter is non-zero value.
>>Since FormatNVM command being supported device parameter "ms"
>>may not be the criteria to initialize the supported LBAFs.
>>
>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>---
>>-v3: Remove "mset" constraint  check if ms < 8, "mset" can be
>>set even when ms < 8 and non-zero.
>>
>>-v2: Addressing review comments (Klaus)
>>Change the current "pi" and "ms" constraint check such that it
>>will throw the error if ms < 8 and if namespace protection info,
>>location and metadata settings are set.
>>Splitting this from compare fix patch series.
>>
>>hw/block/nvme-ns.c | 58 ++++++++++++++++++++--------------------------
>>1 file changed, 25 insertions(+), 33 deletions(-)
>>
>>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>>index 7bb618f182..594b0003cf 100644
>>--- a/hw/block/nvme-ns.c
>>+++ b/hw/block/nvme-ns.c
>>@@ -85,38 +85,28 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>>    ds = 31 - clz32(ns->blkconf.logical_block_size);
>>    ms = ns->params.ms;
>>
>>-    if (ns->params.ms) {
>>-        id_ns->mc = 0x3;
>>+    id_ns->mc = 0x3;
>>
>>-        if (ns->params.mset) {
>>-            id_ns->flbas |= 0x10;
>>-        }
>>+    if (ms && ns->params.mset) {
>>+        id_ns->flbas |= 0x10;
>>+    }
>>
>>-        id_ns->dpc = 0x1f;
>>-        id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
>>-
>>-        NvmeLBAF lbaf[16] = {
>>-            [0] = { .ds =  9           },
>>-            [1] = { .ds =  9, .ms =  8 },
>>-            [2] = { .ds =  9, .ms = 16 },
>>-            [3] = { .ds =  9, .ms = 64 },
>>-            [4] = { .ds = 12           },
>>-            [5] = { .ds = 12, .ms =  8 },
>>-            [6] = { .ds = 12, .ms = 16 },
>>-            [7] = { .ds = 12, .ms = 64 },
>>-        };
>>-
>>-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>>-        id_ns->nlbaf = 7;
>>-    } else {
>>-        NvmeLBAF lbaf[16] = {
>>-            [0] = { .ds =  9 },
>>-            [1] = { .ds = 12 },
>>-        };
>>+    id_ns->dpc = 0x1f;
>>+    id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
>>
>>-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>>-        id_ns->nlbaf = 1;
>>-    }
>>+    NvmeLBAF lbaf[16] = {
>>+        [0] = { .ds =  9           },
>>+        [1] = { .ds =  9, .ms =  8 },
>>+        [2] = { .ds =  9, .ms = 16 },
>>+        [3] = { .ds =  9, .ms = 64 },
>>+        [4] = { .ds = 12           },
>>+        [5] = { .ds = 12, .ms =  8 },
>>+        [6] = { .ds = 12, .ms = 16 },
>>+        [7] = { .ds = 12, .ms = 64 },
>>+    };
>>+
>>+    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>>+    id_ns->nlbaf = 7;
>>
>>    for (i = 0; i <= id_ns->nlbaf; i++) {
>>        NvmeLBAF *lbaf = &id_ns->lbaf[i];
>
>This part LGTM.
>
>>@@ -395,10 +385,12 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
>>        return -1;
>>    }
>>
>>-    if (ns->params.pi && ns->params.ms < 8) {
>>-        error_setg(errp, "at least 8 bytes of metadata required to enable "
>>-                   "protection information");
>>-        return -1;
>>+    if (ns->params.ms < 8) {
>>+        if (ns->params.pi || ns->params.pil) {
>>+            error_setg(errp, "at least 8 bytes of metadata required to enable "
>>+                    "protection information, protection information location");
>>+            return -1;
>>+        }
>>    }
>>
>
>If you do this additional check, then you should maybe also check that 
>pil is only set if pi is. But if pi is not enabled, then the value of 
>pil is irrelevant (even though it ends up in FLBAS). In other words, 
>if you want to validate all possible parameter configurations, then we 
>have a lot more checking to do!
>
>Currently, the approach taken by the parameter validation code is to 
>error out on *invalid* configurations that causes invariants to not 
>hold, and I'd prefer that we stick with that to keep the check logic 
>as simple as possible.
>
>So, (without this unnecessary check):
>

Sure, will remove this check and send v4

>Reviewed-by: Klaus Jensen <k.jensen@samsung.com>



------VykvYSSejOdlZPZked-c5GBuo-J3axZ25gz06rerctM8gJuw=_17bc7_
Content-Type: text/plain; charset="utf-8"


------VykvYSSejOdlZPZked-c5GBuo-J3axZ25gz06rerctM8gJuw=_17bc7_--

