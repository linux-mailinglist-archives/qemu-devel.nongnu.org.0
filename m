Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9892313868
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:47:52 +0100 (CET)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98lT-0007bg-Sd
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1l92cy-0006g1-1Q
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:14:44 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1l92cd-0003nZ-04
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:14:38 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210208091409euoutp02d7d8ea54b0b401266cbc7d8907db3751~huuhvDvjE1037310373euoutp02c
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 09:14:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210208091409euoutp02d7d8ea54b0b401266cbc7d8907db3751~huuhvDvjE1037310373euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612775649;
 bh=0TYOe0XzSvtp6NBAqP1M7ZJuPD8D5CVrgQDKSVltfIs=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=UodyMg64LX65owVd0rFUDt9IkcZ15pdw/GjOhKlRxxqUAYxN/JL3jqbmjdAs5TCDQ
 b9ilnkBja0T7w0MRoUX7wRmYAN4o0H3+OcSDZ1VL/Ri6ujf6yzpS9isG+ygxdGxsAY
 WjHPb13VDoN+Qrq/vdnCb/DaV/UKVOW25Gag7Roc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210208091408eucas1p2d81484dea6ada5058274f7bca9744b34~huuhoutAF1741417414eucas1p2o;
 Mon,  8 Feb 2021 09:14:08 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 34.52.45488.0E001206; Mon,  8
 Feb 2021 09:14:08 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210208091408eucas1p15a6657520a9064e86f49b0421697b180~huuhPW-1X1358713587eucas1p15;
 Mon,  8 Feb 2021 09:14:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210208091408eusmtrp2550152892b9939ba3b9361350ba15702~huuhOsOeM2180521805eusmtrp2N;
 Mon,  8 Feb 2021 09:14:08 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-9a-602100e0c12c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 02.2D.16282.0E001206; Mon,  8
 Feb 2021 09:14:08 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210208091408eusmtip282f4a1c1be2e7a0129574b2208afbd7a~huuhCDTz-2032120321eusmtip2d;
 Mon,  8 Feb 2021 09:14:08 +0000 (GMT)
Received: from apples.localdomain (106.210.248.28) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
 Mon, 8 Feb 2021 09:14:07 +0000
Date: Mon, 8 Feb 2021 10:14:05 +0100
From: Klaus Jensen <k.jensen@samsung.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/nvme: fix Close Zone
Message-ID: <YCEA3epavfji6gyZ@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
X-Originating-IP: [106.210.248.28]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87oPGBQTDK7uNLFY297NZjHp0DVG
 iyUXUy3m3VK2ePDnMbtF77Lf7BbHe3ewOLB7bFrVyebx5NpmJo/3+66yebQf6GYKYInisklJ
 zcksSy3St0vgyjjQEluwmK1ixstnLA2M/1i6GDk4JARMJF5fMOti5OIQEljBKPF992ygOCeQ
 84VR4tfFMIjEZ0aJhgt7mUASIA1bbpxngUgsZ5Q4t2U9I1zVuksLmCCcPYwSnad+soK0sAio
 SEydt5QRxGYT0JTY/uc/2A4RAXuJF+v3MIM0MAtcYpT4cPMz2A5hASOJZbe7wYp4BQwlbm1+
 xwZhC0qcnPkE7HBmoEHrd+lDmNISy/9xgFQwC8hLNG+dzQxicwrYSWxa2cYIcbWSxPEjW1gg
 7FqJtcfOsEPYLzgkfm2WgrBdJFb0tkDVC0u8Or4FqkZG4v/O+WB/SQh0M0r0ffjKDOHMYJSY
 vuw7GyQgrSX6zuRANDhKrD17kQkizCdx460gxG18EpO2TWeGCPNKdLQJTWBUmYXkr1kIf81C
 +GsWkr8WMLKsYhRPLS3OTU8tNs5LLdcrTswtLs1L10vOz93ECEw4p/8d/7qDccWrj3qHGJk4
 GA8xSnAwK4nwBnbKJQjxpiRWVqUW5ccXleakFh9ilOZgURLn3bV1TbyQQHpiSWp2ampBahFM
 lomDU6qBSWVeoh7/rIeP9qzllwy9/T+r9Nn0HbxcbS/bT8z/L8DrIbfzl0N0Runes1WTzEqs
 bic1Mf/caZx2Od7mqM3iaQvD9//IzGNOWlH2/6926GyF1B1BGtIS7zrKDHQ0ts2Z68GTp/Z2
 qYL1qsLLjwJUmY6ySV2aYuLTn3vt7+L/DRdZ+v7O9Fla3sNxXbDPcNOmlUk3WG+Waax8zybs
 /1w7kiX43r2dxz1q1xro6fInrxQvXfNqo9MF1YCy48Z7MgWf7HDJ3cwQsb/7oNLLBL+97U+n
 z3ePX7Pvq11R46o52U73TRT6mF2Ka02P3Lg6ef6EVif9U1Xf2XI2bWQQLwlZcc9YXGOjsm2M
 VoWMqp6JEktxRqKhFnNRcSIA5Iy9SKcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xe7oPGBQTDB4vFLNY297NZjHp0DVG
 iyUXUy3m3VK2ePDnMbtF77Lf7BbHe3ewOLB7bFrVyebx5NpmJo/3+66yebQf6GYKYInSsynK
 Ly1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQyzjQEluwmK1i
 xstnLA2M/1i6GDk5JARMJLbcOA9kc3EICSxllLjwYysbREJG4tOVj+wQtrDEn2tdYHEhgY+M
 Et/7uSHsPYwSz5dFgNgsAioSU+ctZQSx2QQ0Jbb/+Q+2QETAXuLF+j3MIAuYBS4xSny4+ZkJ
 JCEsYCSx7HY3WBGvgKHErc3v2CCuOMwosf/oGiaIhKDEyZlPgIo4gLo1Jdbv0ocwpSWW/+MA
 qWAWkJdo3jqbGcTmFLCT2LSyjRHiZiWJ40e2QD1ZK/Hq/m7GCYwis5AMnYUwdBbC0FlIhi5g
 ZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGJHbjv3csoNx5auPeocYmTgYDzFKcDArifAG
 dsolCPGmJFZWpRblxxeV5qQWH2I0BYbQRGYp0eR8YErIK4k3NDMwNTQxszQwtTQzVhLnNTmy
 Jl5IID2xJDU7NbUgtQimj4mDU6qBad3f5a2XPbdl3r4c82qpWGTflCmmfcJF3bbJyrVPHCN/
 trus4V6vfuDR5Jz7vOEpOtaen2o75hh434nOu3c88lxvZ8JrBY6ztUYPrH/psa63+NOcM+uG
 jIe11MG7hQsWL/p7SfZp5c2VIuG79ohHCR5/POv45w/rosy6AvmUr99mWHDoX8+czaavtknd
 Z0+bqrZzvpXV66+CyXaMu+Mi7gkzli4X2rNiYt+aoILlT9t1mhbWlnxMfXc2ltV0FYf/RP2H
 hY/Yt1QVXn598eJPTtPc6I/i7y7tWbQ2q1fGPsGY5TZzSxd746/nXvY78wQ+idROXfZn6rSC
 n5u/GLroz752QD5oRcLK0ATJRMmtwUosxRmJhlrMRcWJAAobhJhRAwAA
X-CMS-MailID: 20210208091408eucas1p15a6657520a9064e86f49b0421697b180
X-Msg-Generator: CA
X-RootMTR: 20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418
References: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
 <CGME20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418@eucas1p1.samsung.com>
 <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
Received-SPF: pass client-ip=210.118.77.12; envelope-from=k.jensen@samsung.com;
 helo=mailout2.w1.samsung.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Feb  8 10:03, Philippe Mathieu-Daudé wrote:
> Hi Dmitry, Klaus.
> 
> On 2/8/21 1:32 AM, Dmitry Fomichev wrote:
> > Implicitly and Explicitly Open zones can be closed by Close Zone
> > management function. This got broken by a recent commit and now such
> > commands fail with Invalid Zone State Transition status.
> > 
> > Modify nvm_zrm_close() function to make Close Zone work correctly.
> > 
> > Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > Fixes: 053b5a302c3("hw/block/nvme: refactor zone resource management")
> 
> '053b5a302c3': unknown revision or path not in the working tree.
> 
> If you point at an unmerged commit, why not fix it directly
> before merging?
> 

Sure, I can squash it in. That's why we have a staging tree I guess ;)

Thanks Philippe!

