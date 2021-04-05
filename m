Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71555354238
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 15:02:19 +0200 (CEST)
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTOry-0003kn-1B
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 09:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lTOpq-0002zK-9c
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:00:06 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:28496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lTOpn-0006FR-71
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:00:06 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210405125948epoutp03d7ec242c4509334594278b05c1518915~y97iMuAEo2846028460epoutp03J
 for <qemu-devel@nongnu.org>; Mon,  5 Apr 2021 12:59:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210405125948epoutp03d7ec242c4509334594278b05c1518915~y97iMuAEo2846028460epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617627588;
 bh=NIlM6lHubc/vs+TO/+gadwEFskPaEVY8kJKYnGBttOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=smn5EFRUroGl1Kr9GJYlZXcVyV9h31YjGUIAqy3X/QXu/amVknS3jtu5UL3HiCOKy
 DvDGi94PVXQOcTS1/aIL9vP3dcZHNDZbTTtksJQiP9V08RZvrnGr3I86L5B7NkoK7i
 vEY3K52evvQDmwQFEHGKkUnPpR8A2qFprVJfvShI=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210405125946epcas5p2b41fdd52096ea661c374c0ff6a032a6b~y97hD6Vny2820728207epcas5p2e;
 Mon,  5 Apr 2021 12:59:46 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 44.CD.15682.2C90B606; Mon,  5 Apr 2021 21:59:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210405123641epcas5p25c0651272e4252ad5b4a96ab638371e7~y9nWxgTFf2658226582epcas5p2E;
 Mon,  5 Apr 2021 12:36:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210405123641epsmtrp2823610a90448961c2ed73534d537bfe3~y9nWwsIpk1990719907epsmtrp2Q;
 Mon,  5 Apr 2021 12:36:41 +0000 (GMT)
X-AuditID: b6c32a49-8d5ff70000013d42-d7-606b09c260ea
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9F.F2.33967.9540B606; Mon,  5 Apr 2021 21:36:41 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210405123639epsmtip2b909a93dc529fd6020a5951e61f15744~y9nVTnHuK2750327503epsmtip2k;
 Mon,  5 Apr 2021 12:36:39 +0000 (GMT)
Date: Mon, 5 Apr 2021 18:03:40 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 0/7] hw/block/nvme: misc fixes
Message-ID: <20210405123340.GB1248@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210324200907.408996-1-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7bCmuu4hzuwEgw9njSyu7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8be7s+MBX+4KmZdmsbYwDiRs4uRg0NC
 wERi8wqRLkYuDiGB3YwSP2b+YINwPjFKvD13Fsr5xihxYftCpi5GTrCOie1r2CESexklZvVd
 ZwVJCAm8YpTYszMRxGYRUJGYvHILG4jNJmAkMfvtG0YQWwQo/vTfXhaQZmaBv4wS33ftBisS
 FrCSWHB0DlgRr4CexK/5H9kgbEGJkzOfsIDYnAIWEj86NzOD2KICyhIHth1nAhkkITCRQ2L6
 zm3MEOe5SMzu38QCYQtLvDq+hR3ClpL4/G4v0FB2ILta4nARRGsHo8SxyxvYIErsJf49mwZ2
 A7NAhkTr8q1QrbISU0+tY4KI80n0/n4CDQleiR3zYGw1iQW3vkPVy0jM/HObFcL2kJi/pp0F
 ElrdQA9ff8U0gVF+FpLfZiHZB2FbSXR+aGKdBYwfZgFpieX/OCBMTYn1u/QXMLKuYpRMLSjO
 TU8tNi0wzEst1ytOzC0uzUvXS87P3cQITlJanjsY7z74oHeIkYmD8RCjBAezkgjv8T9ZCUK8
 KYmVValF+fFFpTmpxYcYpTlYlMR5dxg8iBcSSE8sSc1OTS1ILYLJMnFwSjUwcS0MK/Dp2+HM
 zyg1xWjnUYbpmrMfbQtRaQhw25WfsOiq3q6SLxNs5nh1SwkVrfvyfPqRaT9k3A2+LbjronR7
 B7PS531Rb627/Z32njH6/mTSBoNJft3aB6/KHVPdIZ/BId4/f9lVX//fB6cLynQEPhMsZ+13
 jJ/3pT0nRePCAccZE2/tNut80PNhjs5ptUSruX/TP0Rbf5j8d+d9d9OAvGzvzHcOUYHr61M1
 Q6IrrRo9zq6U3F24+Pmnj4/Md99w2SyVlpHSFJt3InCW09wmsZBSziuC50XmG+p8vMBboJXN
 PPlpbPo1vZ7HHzmkNXsij2xb/MiBN83K40B+0MFPP5+3hjxgqLnX8O+jOkucEktxRqKhFnNR
 cSIA3V2Gh8EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDLMWRmVeSWpSXmKPExsWy7bCSvG4kS3aCwa734hZX9p9ntNh/8Bur
 xcnGPawWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK6O98QlbwTqOimWHNjA3MN5l62Lk5JAQ
 MJGY2L6GvYuRi0NIYDejxO5Dn1khEjISv05NZYawhSVW/nsOVfSCUeLVmj4mkASLgIrE5JVb
 wCaxCRhJzH77hhHEFgGKP/23lwWkgVngP6PEo91HwCYJC1hJLDg6B6yIV0BP4tf8j2DNQgLm
 EtcWLWCDiAtKnJz5hAXEZhYwk5i3+SFQLweQLS2x/B8HSJhTwELiR+dmsJGiAsoSB7YdZ5rA
 KDgLSfcsJN2zELoXMDKvYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjhAtzR2M21d9
 0DvEyMTBeIhRgoNZSYT3+J+sBCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeWpGan
 phakFsFkmTg4pRqYUtymG83UvXm2MFov/dP51rZulvrCuEufJBiXn2/nZv3KYnr3rMSCVlvl
 nPiDfidvvVI65/XMJedLr7WklgbPjh231gqsbWA+H93yaPG5yDfL/n7OnLJhWYt16sc/uqxv
 23mmy2ovYX94jsV+7qQLC7PqV219usycu+ye9gRBk//lf1KfrHZ1E2bOuqDbvUFb53pN7DpO
 rraDhsH3TzXZymzQnKPWndk622RTbv3CTU9ecLe07zBfFfW76uQzfwN5v/S4Ex9jeoUsH5XI
 XdbiORx4K6VjBt82nbypJxSi+RPm33C/9yhR8Ge+212VZ2GJni+1pZd9qfaaZ30oYcHOY9WP
 7rKuyJx//K6ckdciJZbijERDLeai4kQAI2gkgf8CAAA=
X-CMS-MailID: 20210405123641epcas5p25c0651272e4252ad5b4a96ab638371e7
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_4c63e_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210405123641epcas5p25c0651272e4252ad5b4a96ab638371e7
References: <20210324200907.408996-1-its@irrelevant.dk>
 <CGME20210405123641epcas5p25c0651272e4252ad5b4a96ab638371e7@epcas5p2.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
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

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_4c63e_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Mar 24, 2021 at 09:09:00PM +0100, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Various fixes for 6.0.
>
>Klaus Jensen (7):
>  hw/block/nvme: fix pi constraint check
>  hw/block/nvme: fix missing string representation for ns attachment
>  hw/block/nvme: fix the nsid 'invalid' value
>  hw/block/nvme: fix controller namespaces array indexing
>  hw/block/nvme: fix warning about legacy namespace configuration
>  hw/block/nvme: update dmsrl limit on namespace detachment
>  hw/block/nvme: fix handling of private namespaces
>
> hw/block/nvme-ns.h     |  12 ++--
> hw/block/nvme-subsys.h |   7 +--
> hw/block/nvme.h        |  45 ++------------
> include/block/nvme.h   |   1 +
> hw/block/nvme-ns.c     |  76 ++++++++++++++++++++----
> hw/block/nvme-subsys.c |  28 ---------
> hw/block/nvme.c        | 131 ++++++++++++++++-------------------------
> hw/block/trace-events  |   1 -
> 8 files changed, 129 insertions(+), 172 deletions(-)
>
>--

Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

>2.31.0
>
>

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_4c63e_
Content-Type: text/plain; charset="utf-8"


------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_4c63e_--

