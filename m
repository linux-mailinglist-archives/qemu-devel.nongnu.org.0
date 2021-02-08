Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A1831430D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:34:45 +0100 (CET)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F7E-0005pr-S3
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:34:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1l9Ajf-0002IX-Ig
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:54:07 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1l9Ajd-0002o4-TE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:54:07 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210208175403euoutp02fd92d21c485ae42d33159bcac6e7e292~h10dgPd_53142931429euoutp02R
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 17:54:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210208175403euoutp02fd92d21c485ae42d33159bcac6e7e292~h10dgPd_53142931429euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612806843;
 bh=uzA8oGktgrWtpHsE/Ch6IsJD1Aq2HAY+zB30Z5iukwY=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=VvVqheU3D4LNse8Hz07lcToG9dMovvUkLdX4/drMrAuDShdYK8MFQy2OUibfN5pvM
 BjuXjcwayXG8rhhz3B69tIp9LfoDiQUV6ERce8FhsglHYdBrM7nvdqprB2q/vPpgAH
 EVpWyR5BmVHyCY8pfKCzExMQNMrJ0rUXYhazZtg8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210208175402eucas1p2d6ff8efd2581e25012b4dff76ae5597d~h10dMtp9C2083120831eucas1p2T;
 Mon,  8 Feb 2021 17:54:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 83.D6.44805.ABA71206; Mon,  8
 Feb 2021 17:54:02 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210208175402eucas1p2c8d1dbe0e2d3da5e09b95fbe25491389~h10c4CNnP2083120831eucas1p2S;
 Mon,  8 Feb 2021 17:54:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210208175402eusmtrp11400abcbd4e0fb06bf3d327b4540d068~h10c3XwSr0213002130eusmtrp1J;
 Mon,  8 Feb 2021 17:54:02 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-65-60217aba4809
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 95.AF.21957.ABA71206; Mon,  8
 Feb 2021 17:54:02 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210208175402eusmtip24205715b542b29ce13edde69b727b4ab~h10cqLPgz2306323063eusmtip2J;
 Mon,  8 Feb 2021 17:54:02 +0000 (GMT)
Received: from apples.localdomain (106.210.248.28) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
 Mon, 8 Feb 2021 17:54:01 +0000
Date: Mon, 8 Feb 2021 18:53:59 +0100
From: Klaus Jensen <k.jensen@samsung.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/nvme: fix Close Zone
Message-ID: <YCF6t5X2udfNmJwp@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <880cbe61-9913-d26f-188f-a0b25c04219d@redhat.com>
X-Originating-IP: [106.210.248.28]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djP87q7qhQTDHY061isbe9ms5h06Bqj
 xZKLqRbzbilbPPjzmN2id9lvdovjvTtYHNg9Nq3qZPN4cm0zk8f7fVfZPNoPdDMFsERx2aSk
 5mSWpRbp2yVwZTxes56lYCtPxaTtq9kbGJ9wdjFyckgImEhMPvSdvYuRi0NIYAWjRP+7uVDO
 F0aJF9P+M0I4nxklDmyezALT8rJnLhuILSSwnFGi6bgDXFH/n2+sEM4eRomvz2cwdTFycLAI
 qEj8OlUA0sAmoCmx/c9/sEEiAvYSL9bvYQapZxa4xCjRvXMnWEJYwEhi2e1uMJtXwFBiUvMC
 NghbUOLkzCcsIDOZgQat36UPYUpLLP/HAVLBLCAv0bx1NjOIzSlgJ7G2bS3UzUoSx49sgbJr
 JdYeOwP2pYTACw6JM3deskMkXCQm3PrOCGELS7w6vgUqLiNxenIPC0RDN6NE34evzBDODEaJ
 6cu+s4FcISFgLdF3JgeiwVFi7dmLTBBhPokbbwUhjuOTmLRtOjNEmFeio01oAqPKLCSPzUJ4
 bBbCY7OQPLaAkWUVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYNI5/e/4lx2My1991DvE
 yMTBeIhRgoNZSYQ3sFMuQYg3JbGyKrUoP76oNCe1+BCjNAeLkjhv0pY18UIC6YklqdmpqQWp
 RTBZJg5OqQYmyYUc7kmtff+uGfz5ljPt2+uNq7Jl80WlfW9N+bJvpf/DX5WFX2PV5h2etUVF
 wEZn1f+Ja/gs/xvOqWkP0zomq926YBWTxqobh2eIt23btO7YihTGys9GevsTtFPcUzfJX3u8
 3bWPa5f/9PWVod7Frdxs5R6TS7aunSsluNi/OXbvra+PWp//sXn2akbwxhdL+F81bHzHd96A
 a1pk2sQdHzLXrpxwd0/U6dW/JCeLcp+7sHl7c451OU/zfLfDU3hnTFvy8Dr/qqhfV4zlnnq0
 TLuvOdlmwo7mBf+XPF/Y1bux5XVZxoPKSUs4Ze98X7J4pjvvmufXnUvm1b+MOR10QVFpnQGb
 nVy7UftDR8f39beVWIozEg21mIuKEwF8vRMwqQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xe7q7qhQTDL4fEbZY297NZjHp0DVG
 iyUXUy3m3VK2ePDnMbtF77Lf7BbHe3ewOLB7bFrVyebx5NpmJo/3+66yebQf6GYKYInSsynK
 Ly1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQy3i8Zj1LwVae
 iknbV7M3MD7h7GLk5JAQMJF42TOXrYuRi0NIYCmjxNRJv9ghEjISn658hLKFJf5c64Iq+sgo
 ceDmdyhnD6PE5jsHmLsYOThYBFQkfp0qAGlgE9CU2P7nPwuILSJgL/Fi/R5mkHpmgUuMEt07
 d4IlhAWMJJbd7gazeQUMJSY1L4AaepNJYuvKrawQCUGJkzOfsIAsYAaaun6XPoQpLbH8HwdI
 BbOAvETz1tnMIDangJ3E2ra1LBBHK0kcP7IFyq6VeHV/N+MERpFZSIbOQhg6C2HoLCRDFzCy
 rGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiMym3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeAM7
 5RKEeFMSK6tSi/Lji0pzUosPMZoCA2gis5Rocj4wLeSVxBuaGZgamphZGphamhkrifNunbsm
 XkggPbEkNTs1tSC1CKaPiYNTqoFJ1ujll0tvzvccvmvifp5vrjUX+7+CunN/PuZ7t2kdv+Es
 VDzHfqE1W/blk3nrHn1ZZ7Jwi8Vb1b3zBe89tDU+4b67PSbwmsvOaUmXH5yNnia8fLPj7U8B
 v5KvFU5xubFn40YOkfvfuFo27k7suLtu0S6fl0ePRN/ktg4u6K+9PWmGwRyusBeV193Ofzr6
 483DJOnoFTLX3hTueSvn0ntc+fWPX8/3CIhG/+sSEJnemjvF4abx2oUyn43d9Vj+2+/KDVNt
 3GvXMjH16P7pskfXr5f+v16gPPTRBrWwstdy/NMtEndw1zKaTktw3FYZbPzC93yNwbVsOcaT
 +osSvoUGX2CUNTAK5gj4oaWR3BrWr8RSnJFoqMVcVJwIAIazWtJTAwAA
X-CMS-MailID: 20210208175402eucas1p2c8d1dbe0e2d3da5e09b95fbe25491389
X-Msg-Generator: CA
X-RootMTR: 20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418
References: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
 <CGME20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418@eucas1p1.samsung.com>
 <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
 <YCECcyQx8oUVfNvM@apples.localdomain>
 <20210208155436.GD16360@redsun51.ssa.fujisawa.hgst.com>
 <880cbe61-9913-d26f-188f-a0b25c04219d@redhat.com>
Received-SPF: pass client-ip=210.118.77.12; envelope-from=k.jensen@samsung.com;
 helo=mailout2.w1.samsung.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Feb  8 17:19, Philippe Mathieu-Daudé wrote:
> Hi Keith,
> 
> On 2/8/21 4:54 PM, Keith Busch wrote:
> > On Mon, Feb 08, 2021 at 10:20:51AM +0100, Klaus Jensen wrote:
> >> On Feb  8 10:03, Philippe Mathieu-Daudé wrote:
> >>> Hi Dmitry, Klaus.
> >>>
> >>> On 2/8/21 1:32 AM, Dmitry Fomichev wrote:
> >>>> Implicitly and Explicitly Open zones can be closed by Close Zone
> >>>> management function. This got broken by a recent commit and now such
> >>>> commands fail with Invalid Zone State Transition status.
> >>>>
> >>>> Modify nvm_zrm_close() function to make Close Zone work correctly.
> >>>>
> >>>> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> >>>> Fixes: 053b5a302c3("hw/block/nvme: refactor zone resource management")
> >>>
> >>> '053b5a302c3': unknown revision or path not in the working tree.
> >>>
> >>> If you point at an unmerged commit, why not fix it directly
> >>> before merging?
> >>>
> >>
> >> Dmitry, you OK with me squashing this fix and appending
> >>
> >>     [dmitry: fix broken Close Zone]
> >>     Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> >>
> >> to the commit message?
> > 
> > IMO, we should avoid the habit of rebasing and force pushes on staging
> > trees once they're public.
> 
> Well I had not information this patch was targeting another tree.
> 
> If you don't want to send regular pull request, it would be useful
> to ask the NVMe contributors to provide an information on which
> tree their patch is based.
> 

I'm just behind on sending a that pull request. I'll do that :)

