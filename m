Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C79B34E869
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:06:56 +0200 (CEST)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRE59-0006cE-5E
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRE1r-0005SX-Rl
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:03:32 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:12515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRE1n-00084T-Fx
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:03:31 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210330125425epoutp01f7ed67ffc8ead8fdbf7fbff7b1d95f3d~xH-Hxxv5u2074820748epoutp01h
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 12:54:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210330125425epoutp01f7ed67ffc8ead8fdbf7fbff7b1d95f3d~xH-Hxxv5u2074820748epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617108865;
 bh=ClHNmqmNm4g7ET79TMarez/4wxhOEL+weaVXj9rU0Vc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iR1MF6EbHyQC1pUDmQrqeHyh88ZUv9ku5ES6ShkOFjWwcptq0qS/CWL+XcXFFkdVI
 yiQypV/i/uJLb2pc4N14cVyhwdT+fKEL3174kvQht4C0Oj5Zm9RvWFby29Hm3/yV5w
 eMW/XdNvdX80cZu8w+/CFEoccirkSMv6RK8fFk3Y=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210330125424epcas5p22e662c28e2576e4e2b9f8e13997c7e2e~xH-HjXATh1147911479epcas5p2o;
 Tue, 30 Mar 2021 12:54:24 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 1D.16.39068.08F13606; Tue, 30 Mar 2021 21:54:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210330115017epcas5p4d70a0f9f84b6843f41102dd993d37f0d~xHHINGGQN0542105421epcas5p4u;
 Tue, 30 Mar 2021 11:50:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210330115017epsmtrp18174ab5fa620db48dc56f70e608c1b46~xHHIMXQf50136501365epsmtrp1V;
 Tue, 30 Mar 2021 11:50:17 +0000 (GMT)
X-AuditID: b6c32a4a-60fff7000000989c-af-60631f807530
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 92.BF.33967.97013606; Tue, 30 Mar 2021 20:50:17 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210330115015epsmtip1b6d2d62a2f1efd3219396f088974b6df~xHHG1LJdn2720027200epsmtip1E;
 Tue, 30 Mar 2021 11:50:15 +0000 (GMT)
Date: Tue, 30 Mar 2021 17:17:09 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 1/7] hw/block/nvme: fix pi constraint check
Message-ID: <20210330114709.GA20347@2030045822>
MIME-Version: 1.0
In-Reply-To: <YGLSS4LFLLHHqnKD@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7bCmum6DfHKCwYZbphZX9p9ntNh/8Bur
 xcnGPawWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK+PDlVamgvU8Fd9X32dqYJzG1cXIySEh
 YCJx788q9i5GLg4hgd2MEss2dLJAOJ8YJVZNPsgE4XxjlPh47ycjTMuMKZPZQWwhgb2MEvfe
 VUEUvWKU6L43gw0kwSKgKnFo03wwm03ASGL22zdgzSICKhJP/+0FW8Es8JdRYsbuAywgCWEB
 d4kXs36wgti8AvoSV6a/Z4GwBSVOznwCZnMCDXrXehVskKiAssSBbcfBzpMQmMghse7zLKBm
 DiDHRaLhFDfEpcISr45vYYewpSRe9rcB2exAdrXE4SKIzg5GiWOXN7BBlNhL/Hs2jRFkCrNA
 hsS9nT4QYVmJqafWMYHYzAJ8Er2/nzBBxHkldsyDsdUkFtz6DrVJRmLmn9usELaHxKnTT6Ah
 2sok0X36GdsERvlZSD6bhbBuFtgKK4nOD02sEGFpieX/OCBMTYn1u/QXMLKuYpRMLSjOTU8t
 Ni0wykst1ytOzC0uzUvXS87P3cQITlBaXjsYHz74oHeIkYmD8RCjBAezkgiv8IHEBCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8OwwexAsJpCeWpGanphakFsFkmTg4pRqY/C70rb38+JLA3LQP
 04oKL73WL/nOHKMiUnST8dk1qem7qjiCNWIKm168lDTdEHpPSXtFjj7vH9dMT//CaSv9VaIO
 bVqkkuB6rj8j+tabX37ljhvimV98XrlST/edNk9cCoveAlWDhtNsW3tObToWK6QycfVe83ql
 e/6XrJdsn/vc36VWaaLTyT0ttid6Q9duu3dnp6WPd9zDPNXVEapXtxWLPGtvfzV7d7Njzc97
 TCuvq5/Ss9gYte9oecy275PeH207tvS8jNquBdzHH14+OpHNe3rFH8aEbQ9XuDgyhv/jszp0
 /oLhjq/de61Xeoic15H/uKtlcdUvt0/vXM0uNK5cuW369Z0HinQv6gmm3FRiKc5INNRiLipO
 BADF5JZOvwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSnG6lQHKCwfHVvBZX9p9ntNh/8Bur
 xcnGPawWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK+PQzgssBQ85K76/fcrYwPiIvYuRk0NC
 wERixpTJQDYXh5DAbkaJyU/fsEIkZCR+nZrKDGELS6z89xyq6AWjxPlvl8C6WQRUJQ5tms8G
 YrMJGEnMfvuGEcQWEVCRePpvLwtIA7PAf0aJuReegjUIC7hLvJj1A2wDr4C+xJXp71kgprYz
 STw9vpYZIiEocXLmExYQm1nATGLe5odAcQ4gW1pi+T8OkDAn0LJ3rVfBlokKKEsc2HacaQKj
 4Cwk3bOQdM9C6F7AyLyKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4RrQ0dzBuX/VB
 7xAjEwfjIUYJDmYlEV7hA4kJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5N
 LUgtgskycXBKNTCts4rf5PTxyTRLIXVOjT/B07afvxPXsq1OyO+ua070ui0VZtzNMx4t0Hlq
 cFts8Z5fV897x+acqHgS4TpFxsSpqCRZ+rPQkjl9/u2npj9lWy2x9JrI4zc37zKemcpe3h7X
 t6T7qcifBdcVue54Zgpwbg2NKjw7+bf9Gc0lwnEPnl5OPjMteq76dwWnpsAbhiH5lauCA+MM
 0hdO/mnDwHVyleTUsrSrxhWOD2eqRn0+GJFQMe/BzZApuj3CEvqWCzgY04L+b35tbfhU2PuP
 yc6dQv0c1lJN2nmmi5PSfmS6OKUtXPb11bx2t87vazTtik9PdvD98KI/73n6B8ELmuyCp69s
 0i5X97GLvvleLk+JpTgj0VCLuag4EQDOObzxAAMAAA==
X-CMS-MailID: 20210330115017epcas5p4d70a0f9f84b6843f41102dd993d37f0d
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----Q-msIrZUiOdgFIXW25bFqaDApMD6FguveSXWgTQzG2RiKNeM=_1a240_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210329142606epcas5p45c24d24ea384e7bd68c368f1083c1b84
References: <20210324200907.408996-1-its@irrelevant.dk>
 <20210324200907.408996-2-its@irrelevant.dk>
 <CGME20210329142606epcas5p45c24d24ea384e7bd68c368f1083c1b84@epcas5p4.samsung.com>
 <20210329142258.GA23272@2030045822> <YGLSS4LFLLHHqnKD@apples.localdomain>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------Q-msIrZUiOdgFIXW25bFqaDApMD6FguveSXWgTQzG2RiKNeM=_1a240_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Tue, Mar 30, 2021 at 09:24:59AM +0200, Klaus Jensen wrote:
>On Mar 29 19:52, Gollu Appalanaidu wrote:
>> On Wed, Mar 24, 2021 at 09:09:01PM +0100, Klaus Jensen wrote:
>> > From: Klaus Jensen <k.jensen@samsung.com>
>> >
>> > Protection Information can only be enabled if there is at least 8 bytes
>> > of metadata.
>> >
>> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> > ---
>> > hw/block/nvme-ns.c | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>> > index 7f8d139a8663..ca04ee1bacfb 100644
>> > --- a/hw/block/nvme-ns.c
>> > +++ b/hw/block/nvme-ns.c
>> > @@ -394,7 +394,7 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
>> >         return -1;
>> >     }
>> >
>> > -    if (ns->params.pi && !ns->params.ms) {
>> > +    if (ns->params.pi && ns->params.ms < 8) {
>> and also it is good check that "metadata size" is power of 2 or not?
>>
>
>While I don't expect a lot of real-world devices having metadata sizes
>that are not power of twos, there is no requirement in the spec for
>that.
>
>And the implementation here also does not require it :)

Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

------Q-msIrZUiOdgFIXW25bFqaDApMD6FguveSXWgTQzG2RiKNeM=_1a240_
Content-Type: text/plain; charset="utf-8"


------Q-msIrZUiOdgFIXW25bFqaDApMD6FguveSXWgTQzG2RiKNeM=_1a240_--

