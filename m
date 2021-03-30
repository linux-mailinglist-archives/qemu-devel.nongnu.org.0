Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9634E80E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:56:48 +0200 (CEST)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDvL-0007rS-FM
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRDtX-0006Vg-3r
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:54:55 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:15140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRDtT-00037S-TI
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:54:54 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210330125449epoutp04002dbaf5e78085fddb71d10a7ebe8dd8~xH-eNTVtY1480014800epoutp04v
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 12:54:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210330125449epoutp04002dbaf5e78085fddb71d10a7ebe8dd8~xH-eNTVtY1480014800epoutp04v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617108889;
 bh=pF1U7PNCNCbyJtKYzShFs8OF+tKrpw3Y7iBS3MXTIak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ngo3mOy5oehByLwnfCIjIbDAXCbVQog/7fKVRzte92uI+rELKR8hogxYyOonKRyJN
 UIfrB0ULiK3nf5UvtmQ+8RvAFg9GQWUOar3kCpoaE45RxOYHL/8GjSQogDkpbFa7gs
 WS8swguW5lbxUs3ezvbsyTIi+M+g/W0B2qTrRZTU=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210330125449epcas5p1ceb143e637c6ce2209e05b9178dba397~xH-d9zu5a1589115891epcas5p10;
 Tue, 30 Mar 2021 12:54:49 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 59.71.15682.89F13606; Tue, 30 Mar 2021 21:54:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210330115514epcas5p20071ca07c66434dec11e4f8460267685~xHLct1mbS2750327503epcas5p2_;
 Tue, 30 Mar 2021 11:55:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210330115514epsmtrp1695682e864903b929cb4929f16d73bec~xHLctFqyP0320503205epsmtrp13;
 Tue, 30 Mar 2021 11:55:14 +0000 (GMT)
X-AuditID: b6c32a49-8bfff70000013d42-26-60631f986160
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 62.00.33967.2A113606; Tue, 30 Mar 2021 20:55:14 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210330115512epsmtip1c7e32d90e394cb04bfece9def531c4ac~xHLbayGHc3072430724epsmtip1c;
 Tue, 30 Mar 2021 11:55:12 +0000 (GMT)
Date: Tue, 30 Mar 2021 17:22:07 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 5/7] hw/block/nvme: fix warning about legacy
 namespace configuration
Message-ID: <20210330115207.GC20347@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210324200907.408996-6-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7bCmhu4M+eQEg28TzS2u7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8azF+tYCmbzVixrPM/cwHiOq4uRk0NC
 wERi4qM9jF2MXBxCArsZJZq/HWWFcD4xSrw7vIcNwvnGKNHz9w07TEtX51V2iMReRokNpxdD
 tbxilFh2+SEbSBWLgKpE59qlzCA2m4CRxOy3bxhBbBEBFYmn//aygDQwC/xllPi+azdYg7BA
 ksShzY/AVvAK6EtMb77HBmELSpyc+YQFxOYUsJB48aERbJCogLLEgW3HmUAGSQhM5ZA4uGsV
 K8R9LhJbO1cyQdjCEq+Ob4G6W0riZX8bkM0OZFdLHC6CaO1glDh2eQMbRIm9xL9n04DmcwAd
 lyEx5bcIRFhWYuqpdWATmQX4JHp/P4GaziuxYx6MrSax4NZ3qE0yEjP/3Ia6xkPi3YkXLJAA
 2sko0TDvIcsERvlZSF6bhbBuFtgKK4nOD02sEGFpieX/OCBMTYn1u/QXMLKuYpRMLSjOTU8t
 Ni0wzEst1ytOzC0uzUvXS87P3cQITlJanjsY7z74oHeIkYmD8RCjBAezkgiv8IHEBCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8OwwexAsJpCeWpGanphakFsFkmTg4pRqYcmKXXoqayP0yY90D
 hj0zxB4rrpscHSW5zSb79rmLfHdE3564L1yWGK1fVdt3znOBwHfGN9ZfHaKqTVMk62WVq38n
 JDY2rhV3ietsTInnN9uXbG5vI2J/pJs7nkM3yFR70bLpFpf/zfi5krkjebncwZrX/xkE7u46
 YL5i6rQa7wlnfJt9p1odOFu/qjljlYzq6X1itb032U9PXOBx0217XATH2er2qmib2scnPmUk
 /pWfdt9TzT3ojsh+7eDjfwK45jC3xhxRevHLTPX3WZvvf6Zx3hGpWcVZMu/mm5mcaw6d8V3u
 9MAzeKtA6TST+ROsfvTU8+lMNPS98lFznsL2pKnyvn/fvTqT4ZD4efE1JZbijERDLeai4kQA
 /FsejsEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsWy7bCSnO4iweQEg3O3uC2u7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8aBs8+ZCs5yVfz8sIK5gXEWRxcjJ4eE
 gIlEV+dV9i5GLg4hgd2MEtMa37FCJGQkfp2aygxhC0us/PecHcQWEnjBKHF4K1gNi4CqROfa
 pWA1bAJGErPfvmEEsUUEVCSe/tvLAjKUWeA/o8Sj3UfAioQFkiQObX4ENohXQF9ievM9Noih
 qRL/d01lgogLSpyc+YQFxGYWMJOYt/khUC8HkC0tsfwf2NGcAhYSLz40gu0SFVCWOLDtONME
 RsFZSLpnIemehdC9gJF5FaNkakFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZGcHxoae5g3L7q
 g94hRiYOxkOMEhzMSiK8wgcSE4R4UxIrq1KL8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5Ykpqd
 mlqQWgSTZeLglGpgEvu/odllwv75+jZCkz6kzZELZZv3J3VR1xPPD241B7YqPz6+KnqrvNVB
 ng8X/03fOP8L8/NUvYMvlzzafUNsW95HE1eGrDbJmwlnql2/6VoHrhPlKthQ0/LVTurGw4NS
 my9M3LLPeH75NZ84levn4nyE9/y0ulo4o1X2CQtXeEhCp4ivxszUMzMWSLuH57x6/8LnYFxi
 3Ky4mYuf8a79tn4KI+u86Ayxnoptb0zYX/JmLlbWVjlcW9m+p2beso6WxKJrhaxxW746Cf3l
 2v8n9uX5iV8dlzptemF9NvUmw407VuHH2h5cedjL6JL1e1fdPPmvK5dVv+zMOHGaZ9f3qJku
 WsyC8otL2P6280+om6TEUpyRaKjFXFScCABY6J9R/gIAAA==
X-CMS-MailID: 20210330115514epcas5p20071ca07c66434dec11e4f8460267685
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----tx2AvdYHwu2yUYDQ8qw3c4dYbA1ZoteR0iqvvn91UcBL9dAh=_1a2dd_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210330115514epcas5p20071ca07c66434dec11e4f8460267685
References: <20210324200907.408996-1-its@irrelevant.dk>
 <20210324200907.408996-6-its@irrelevant.dk>
 <CGME20210330115514epcas5p20071ca07c66434dec11e4f8460267685@epcas5p2.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
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

------tx2AvdYHwu2yUYDQ8qw3c4dYbA1ZoteR0iqvvn91UcBL9dAh=_1a2dd_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Mar 24, 2021 at 09:09:05PM +0100, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Remove the unused BlockConf from the controller structure and fix the
>constraint checking to actually check the right BlockConf and issue the
>warning.
>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme.h | 1 -
> hw/block/nvme.c | 2 +-
> 2 files changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/hw/block/nvme.h b/hw/block/nvme.h
>index c610ab30dc5c..1570f65989a7 100644
>--- a/hw/block/nvme.h
>+++ b/hw/block/nvme.h
>@@ -166,7 +166,6 @@ typedef struct NvmeCtrl {
>     NvmeBar      bar;
>     NvmeParams   params;
>     NvmeBus      bus;
>-    BlockConf    conf;
>
>     uint16_t    cntlid;
>     bool        qs_created;
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 7a7e793c6c26..403c8381a498 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -5807,7 +5807,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
>         params->max_ioqpairs = params->num_queues - 1;
>     }
>
>-    if (n->conf.blk) {
>+    if (n->namespace.blkconf.blk) {
>         warn_report("drive property is deprecated; "
>                     "please use an nvme-ns device instead");
>     }
>-- 
>2.31.0
>
>

Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

------tx2AvdYHwu2yUYDQ8qw3c4dYbA1ZoteR0iqvvn91UcBL9dAh=_1a2dd_
Content-Type: text/plain; charset="utf-8"


------tx2AvdYHwu2yUYDQ8qw3c4dYbA1ZoteR0iqvvn91UcBL9dAh=_1a2dd_--

