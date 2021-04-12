Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83B35BC57
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:39:58 +0200 (CEST)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVs6v-0008Pe-FK
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lVs3X-0006yO-UB
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:36:27 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:63599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lVs3R-0006w1-HS
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:36:27 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210412083605epoutp025007f677d7f02a64a043ecd261304dc8~1D2RngPPR1850218502epoutp02R
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 08:36:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210412083605epoutp025007f677d7f02a64a043ecd261304dc8~1D2RngPPR1850218502epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618216565;
 bh=WtksaNVgK33f2jRIDDEhixg3GoTbUBBOGjwXJ4NwP6U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fnCcHBp8vtBsEcpBpQWBJ5PipW5fZ0jdYJSe4zdx6dj+57Vwfu0BlwdNneJo1g/L9
 mIObnhrha5UrG2b6uD8nCK2Sg1Anh2CtkfV8moFinGlAz0dLzwZQQVoyWSeapl/6M+
 WZo8qW+ITmjH03X3kJGW1KN+wAOukY31yy6l5USg=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210412083604epcas5p41a5337565b455ece23418437f385f023~1D2Q5vNT-3261232612epcas5p47;
 Mon, 12 Apr 2021 08:36:04 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.16.15682.47604706; Mon, 12 Apr 2021 17:36:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210412083540epcas5p4133543caae4e006d7698b37619b79b81~1D16VTxCX3261232612epcas5p4Y;
 Mon, 12 Apr 2021 08:35:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210412083539epsmtrp27330074c9ae7fa34137ed23a9d094e64~1D16UMULa2571125711epsmtrp2n;
 Mon, 12 Apr 2021 08:35:39 +0000 (GMT)
X-AuditID: b6c32a49-8bfff70000013d42-ce-6074067422ce
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2B.10.33967.B5604706; Mon, 12 Apr 2021 17:35:39 +0900 (KST)
Received: from 2030045822 (unknown [107.99.42.33]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210412083538epsmtip1da7d2feddb5b32c25bed892dd5b40b8e~1D15FErlb0747207472epsmtip1E;
 Mon, 12 Apr 2021 08:35:38 +0000 (GMT)
Date: Mon, 12 Apr 2021 14:02:45 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v3] hw/block/nvme: add device self test command support
Message-ID: <20210412083245.GA24260@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210412082749.GA24161@2030045822>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7bCmum4JW0mCwfqPLBZX9p9ntNh/8Bur
 xaRD1xgtllxMtZh3S9li1rt2NovjvTtYLF5P+s/qwOHx41w7m8e5HefZPTat6mTzeHJtM5PH
 +31X2QJYo7hsUlJzMstSi/TtErgyru9qYy24zV/RuXwCawNjC28XIyeHhICJxLtr3UxdjFwc
 QgK7GSUeH/0K5XxilHjUOR3K+cYo8eZIMytMy8beHjaIxF5GiZ5n16GqnjNKNPY/YgGpYhFQ
 lZh96RoTiM0mYCQx++0bRhBbREBZ4u78mawgDcwCExkltmy/zAaSEBbwlvjS9RNsBa+AvsSX
 VU3MELagxMmZT8CGcgoYSHyd8hisRhRo0IFtx8E2Swi0ckhcObwTqIgDyHGR+PpbDuJUYYlX
 x7ewQ9hSEp/f7QXaxQ5kV0scLoLo7GCUOHZ5AxtEib3Ev2fTGEGmMAtkSGyfbQgRlpWYemod
 2CvMAnwSvb+fMEHEeSV2zIOx1SQW3PoOtUlGYuaf29DA8pC4uvwSMyR8PjJK7O4+zDKBUX4W
 ks9mIaybBbbCSqLzQxMrRFhaYvk/DghTU2L9Lv0FjKyrGCVTC4pz01OLTQsM81LL9YoTc4tL
 89L1kvNzNzGC05GW5w7Guw8+6B1iZOJgPMQowcGsJMKbVFmcIMSbklhZlVqUH19UmpNafIhR
 moNFSZx3h8GDeCGB9MSS1OzU1ILUIpgsEwenVAOTbizLbUanC+ZzrnC3hJo+kr+bzZedy9Ej
 9llq/zvDtfpbpm53+tHiXHVW4TP70e/K/IVXa6rkXcz0XstvVEvuWWUzY47LtpQ5jWXbqj0e
 LJz+RCX08rmw8r1W0ovSXvxgdp2Xs2p2mWHpJC3uSoGXbznbxR/tV2VZf+SF1pnaVAGzGWKb
 +Lss4pLMdnYb28z7Kr9O9eHm0PI5B0RDc+bv+bbh++a3zxbEvqqY3rMsRfTmkTkvxNM1zebv
 aTmwiPlvlGJ357LWqdkKF4zirVVPMwh9k3ebb15QqtXyUHy7s0hFdT6HxeM7a8W9zWWmbd7j
 fnk/y6mDmmdWtxhUH493Vsy/JXQ4auu1/sjvAceVWIozEg21mIuKEwEn7D+YtgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSnG40W0mCwem5ZhZX9p9ntNh/8Bur
 xaRD1xgtllxMtZh3S9li1rt2NovjvTtYLF5P+s/qwOHx41w7m8e5HefZPTat6mTzeHJtM5PH
 +31X2QJYo7hsUlJzMstSi/TtErgy/q1uYC3o5a3oer6AqYHxAlcXIyeHhICJxMbeHjYQW0hg
 N6PEqb2OEHEZiV+npjJD2MISK/89Z+9i5AKqecoo8ejPFFaQBIuAqsTsS9eYQGw2ASOJ2W/f
 MILYIgLKEnfnz2QFaWAWmMgosWX7ZbANwgLeEl+6foI18wroS3xZ1cQMMfUjo8Tjd/sZIRKC
 EidnPmEBsZkFzCTmbX4IVMQBZEtLLP/HARLmFDCQ+DrlMdgcUaBlB7YdZ5rAKDgLSfcsJN2z
 ELoXMDKvYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIjgYtzR2M21d90DvEyMTBeIhR
 goNZSYQ3qbI4QYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5O
 qQamDF7WzR5Oe2u15hr+PVissltcwEV4F+elvWJuB1aeVTzllaJRNjtAPU61YHH0jqehW/mE
 bvE32JzbFfBpla7uZdUTIg841J7k9PQwLdDaaqaw4rnL9K95awtv5a7d/G3LZ+Nt1YZXW38a
 3nGJitxX8+eU1FWPrflfhfQkT/TWHK05nn7MoW363ofPI3JFkpym1xfU5BUmb+b8WyL+/eQS
 t8Xn36yrr1R8GKowvctIZ9+WPXu2p00sOC27uK9hjufbeXNf3N/TtSp3UqGf6vxCu1Xpbwtn
 GU5ZrecWyr2b0XSNqvm8oMUh8y+WlOy2/Zi7jblu3tPl+/v3vq1ZvD5GpPDnp7qwihftuzTM
 7Ux7lViKMxINtZiLihMB7rXos/UCAAA=
X-CMS-MailID: 20210412083540epcas5p4133543caae4e006d7698b37619b79b81
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_72ffe_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210331092753epcas5p33ef9360c0c8c6b6310108d2da9aa2687
References: <CGME20210331092753epcas5p33ef9360c0c8c6b6310108d2da9aa2687@epcas5p3.samsung.com>
 <20210331092427.13545-1-anaidu.gollu@samsung.com>
 <20210409153520.GC32304@redsun51.ssa.fujisawa.hgst.com>
 <20210412082749.GA24161@2030045822>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_72ffe_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Mon, Apr 12, 2021 at 01:57:49PM +0530, Gollu Appalanaidu wrote:
>On Sat, Apr 10, 2021 at 12:35:20AM +0900, Keith Busch wrote:
>>On Wed, Mar 31, 2021 at 02:54:27PM +0530, Gollu Appalanaidu wrote:
>>>This is to add support for Device Self Test Command (DST) and
>>>DST Log Page. Refer NVM Express specification 1.4b section 5.8
>>>("Device Self-test command")
>>
>>Please don't write change logs that just say what you did. I can read
>>the code to see that. Explain why this is useful because this frankly
>>looks like another useless feature. We don't need to implement every
>>optional spec feature here. There should be a real value proposition.
>>
>Hi Keith,
>It was useful to us to be able to test the feature against qemu - and
>we wanted to contribute the code, but we understand that features should
>be more "complete" for upstreaming.
>
>New features for SPDK (and nvme-cli) are use-cases for optional features
>like this, where one might not have physical device available and also users
>who is going to develop their in house host test tool this would be useful,
>since we are providing the functional behaviour as per the NVMe protocol.

Hi Keith,

It was useful to us to be able to test the feature against qemu - and
we wanted to contribute the code, but we understand that features should
be more "complete" for upstreaming.

New features for SPDK (and nvme-cli) are use-cases for optional features
like this, where one might not have physical device available and also users
who is going to develop their in house host test tool this would be useful,
since we are providing the functional behaviour as per the NVMe protocol.

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_72ffe_
Content-Type: text/plain; charset="utf-8"


------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_72ffe_--

