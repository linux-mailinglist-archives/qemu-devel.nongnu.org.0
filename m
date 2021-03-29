Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E489634DEF3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 05:06:38 +0200 (CEST)
Received: from localhost ([::1]:45228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR4iC-0003Zh-Kv
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 23:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lR4gJ-0002dl-QT
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 23:04:40 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:33262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lR4gC-0002aV-Bw
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 23:04:39 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210330030421epoutp01b811b90119339e53756e429b86a62d17~w-77FVt752096720967epoutp01A
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 03:04:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210330030421epoutp01b811b90119339e53756e429b86a62d17~w-77FVt752096720967epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617073461;
 bh=8kVEg6pBMT78ogjL/bwtwbp1AfRJQUnQNaKH0b7oVVM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H72/owPDStza5RufAzcXdx4IM30T0uIySgktCoiexDFWOV+VgmomCkcMEfTi+fufv
 rj08cxja+NL+EwYv+7ZA119Bey01EEKihXpDPoWoFADTo89A/j/bCYCeN+JPx100Fn
 cu0NDfIfp2gu0LBndhhtuEBV6rVs11Y2DuxJ8nJI=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210330030420epcas5p4414cb342087802bb59561fc15167097e~w-76zLjOV1131511315epcas5p4v;
 Tue, 30 Mar 2021 03:04:20 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 69.14.15682.43592606; Tue, 30 Mar 2021 12:04:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210329142606epcas5p45c24d24ea384e7bd68c368f1083c1b84~w1l5NSg3q0733507335epcas5p4d;
 Mon, 29 Mar 2021 14:26:06 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210329142606epsmtrp18acd189b44c17ee46005d6d5e90b6f5c~w1l5Mjy033152931529epsmtrp1M;
 Mon, 29 Mar 2021 14:26:06 +0000 (GMT)
X-AuditID: b6c32a49-8d5ff70000013d42-36-60629534dc55
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 3C.8D.08745.E73E1606; Mon, 29 Mar 2021 23:26:06 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210329142605epsmtip27c5a70567ef70f804035437b12ae864b~w1l34ioiw0736507365epsmtip2C;
 Mon, 29 Mar 2021 14:26:05 +0000 (GMT)
Date: Mon, 29 Mar 2021 19:52:58 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 1/7] hw/block/nvme: fix pi constraint check
Message-ID: <20210329142258.GA23272@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210324200907.408996-2-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7bCmuq7J1KQEg989ahZX9p9ntNh/8Bur
 xcnGPawWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK+Ps4YiCbq6K+zfaWBsYZ3N0MXJySAiY
 SFx58Y29i5GLQ0hgN6PE240nGSGcT4wSD1fsgnI+M0p8fNzIBNNyf/4XFojELkaJf0c3M4Mk
 hAReMUq8fFIHYrMIqEpcXLmEBcRmEzCSmP32DSOILSKgIvH0316wZmaBv4wS33ftZgNJCAu4
 S7yY9YMVxOYV0Jd4PH8aC4QtKHFy5hMwm1PAQmLiso/sILaogLLEgW3HmUAGSQhM5JCY1DSH
 FeI8F4nGU19YIGxhiVfHt7BD2FISL/vbgGx2ILta4nARRGsHo8SxyxvYIErsJf49mwZ2KLNA
 hsTKq8ugxshKTD21jgkizifR+/sJNCR4JXbMg7HVJBbc+g61SkZi5p/bUOd4SJw6DXG/kMBO
 RonjS6UmMMrPQvLaLCTrIGwric4PTayzGDmAbGmJ5f84IExNifW79Bcwsq5ilEwtKM5NTy02
 LTDMSy3XK07MLS7NS9dLzs/dxAhOUVqeOxjvPvigd4iRiYPxEKMEB7OSCK/wgcQEId6UxMqq
 1KL8+KLSnNTiQ4zSHCxK4rw7DB7ECwmkJ5akZqemFqQWwWSZODilGpi2SAQX7f3lHbqDZ97b
 9RNYZqhwPJNbfCh/0sJpItPeLbyitcniEndQic6zExnH1yzVPDrFrOTXeY23XUYPAw8em6ak
 /MDyPfP2ad1Hbole3FOQ9/azYvbbG7ILG6ueLZm5rOKKXfx8jXPLRN+5tM1mX3H91OvLF27Z
 OMUkpZ5W3JZSHtwqJR6o5cpn1vR7zpHCwCc39Hwv3PS0Lta4e741/kPK15vcZkuEtVaKVmVW
 ci5rlLN/a1f9hiv9X0OO9g0f91dJ+cu5FudOkF6/KJKN98tUr6AzMcaxBzTMdfTeML7df9Y2
 3rK9TvX0djdXl5ptDyc7Z9Zu3ySvIMx0Pl/ofdIaoWNzYl6Y7HL2W1ihxFKckWioxVxUnAgA
 IRKu08ADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSvG7d48QEg92/1Syu7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bW512sBXvZKyZM3MDSwPictYuRk0NC
 wETi/vwvLF2MXBxCAjsYJZbMOQaVkJH4dWoqM4QtLLHy33N2EFtI4AWjRMPiZBCbRUBV4uLK
 JSwgNpuAkcTst28YQWwRARWJp//2gg1lFvjPKPFo9xGwQcIC7hIvZv0AW8AroC/xeP40Foih
 qRIrd85kgYgLSpyc+QTMZhYwk5i3+SFQLweQLS2x/B8HSJhTwEJi4rKPYPeICihLHNh2nGkC
 o+AsJN2zkHTPQuhewMi8ilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMjOD60tHYw7ln1
 Qe8QIxMH4yFGCQ5mJRFe4QOJCUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1O
 TS1ILYLJMnFwSjUwsUy7XT3l85YNVwvWKBdN/2a8OPdOXY9V9p7eDwUBLutjjYPmlBw9qJHn
 /Zt5sXa0iea1NaoF7UqSvz6ver1DLWD/VcM4gfXfWmxTfoZYNXxbGb6xsvALE5f45yZpUbvb
 movPyylO45GptXwjzh0T0Ltv3myWuOdxGxpWldx/eaJ0zpM3NzY7vD6/WkPumcDHdbJODPPm
 KK15ZnLSIGenm9d2x+cWYb0W/6/JN7Vam1V/emN938JH+E7rL+X7M1qkXZxvrVflTuRyTCoq
 8WT27jZYbsFp9KnfYW5UTwqHzcW9GtZb3eZsmW534fjFMgP2XW9sIrP2H6yb/6/v2CfPgjNL
 Yq5cc346Q/8Lh7O4EktxRqKhFnNRcSIAumMQ1f4CAAA=
X-CMS-MailID: 20210329142606epcas5p45c24d24ea384e7bd68c368f1083c1b84
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----rJxxaR0GuCM_dHQxpWiIChs6D.UommiO4QigGiW7XG79mXGL=_1444c_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210329142606epcas5p45c24d24ea384e7bd68c368f1083c1b84
References: <20210324200907.408996-1-its@irrelevant.dk>
 <20210324200907.408996-2-its@irrelevant.dk>
 <CGME20210329142606epcas5p45c24d24ea384e7bd68c368f1083c1b84@epcas5p4.samsung.com>
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

------rJxxaR0GuCM_dHQxpWiIChs6D.UommiO4QigGiW7XG79mXGL=_1444c_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Mar 24, 2021 at 09:09:01PM +0100, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Protection Information can only be enabled if there is at least 8 bytes
>of metadata.
>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme-ns.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>index 7f8d139a8663..ca04ee1bacfb 100644
>--- a/hw/block/nvme-ns.c
>+++ b/hw/block/nvme-ns.c
>@@ -394,7 +394,7 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
>         return -1;
>     }
>
>-    if (ns->params.pi && !ns->params.ms) {
>+    if (ns->params.pi && ns->params.ms < 8) {
and also it is good check that "metadata size" is power of 2 or not?

>         error_setg(errp, "at least 8 bytes of metadata required to enable "
>                    "protection information");
>         return -1;
>-- 
>2.31.0
>
>

------rJxxaR0GuCM_dHQxpWiIChs6D.UommiO4QigGiW7XG79mXGL=_1444c_
Content-Type: text/plain; charset="utf-8"


------rJxxaR0GuCM_dHQxpWiIChs6D.UommiO4QigGiW7XG79mXGL=_1444c_--

