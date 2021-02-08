Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E9313927
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:19:45 +0100 (CET)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99GK-0003Hq-3G
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1l92jd-0007QL-SO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:21:44 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1l92jB-0005Eh-9K
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:21:27 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210208092054euoutp017e831ce0248110e5126509f21756b36b~hu0a8eKWR2562325623euoutp01k
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 09:20:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210208092054euoutp017e831ce0248110e5126509f21756b36b~hu0a8eKWR2562325623euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1612776054;
 bh=Q4XNI7KbG70ec8hHtp/ENmebWQsbmMmLMsCS4w0B/zo=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=QJy/NB1D2d4QkTNADNLat/yx6cIVP0oEtHPZs1BneB7INsXXq3Zg89SXKzagTBXAJ
 qtwD0G1FxHpGYF+V38D5MflCUnpOoQcjUmm3cZt4yNN/ZzLWQozR7oVqVv5oeGQM/o
 +kVOwGYXN8IVaYn2ciKZFjYHbBUYvoaw9C3MC540=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210208092053eucas1p2afdde2db76228a3bfc72ca47e61a9247~hu0a129bA0489004890eucas1p2D;
 Mon,  8 Feb 2021 09:20:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B2.4E.27958.57201206; Mon,  8
 Feb 2021 09:20:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210208092053eucas1p13f232beb5cc695152d9765ebd5d1d4dd~hu0aajoc20460604606eucas1p1b;
 Mon,  8 Feb 2021 09:20:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210208092053eusmtrp118cfaeae1f80b7d87fdc07541e14a925~hu0aZ2i9F2520625206eusmtrp1k;
 Mon,  8 Feb 2021 09:20:53 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-31-602102753cb2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7E.8E.21957.57201206; Mon,  8
 Feb 2021 09:20:53 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210208092053eusmtip2ed9a162e73c21515ec98cf6905f95c5b~hu0aQ9h3s2097720977eusmtip2T;
 Mon,  8 Feb 2021 09:20:53 +0000 (GMT)
Received: from apples.localdomain (106.210.248.28) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
 Mon, 8 Feb 2021 09:20:52 +0000
Date: Mon, 8 Feb 2021 10:20:51 +0100
From: Klaus Jensen <k.jensen@samsung.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/nvme: fix Close Zone
Message-ID: <YCECcyQx8oUVfNvM@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
X-Originating-IP: [106.210.248.28]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djP87qlTIoJBp1fjC3WtnezWUw6dI3R
 YsnFVIt5t5QtHvx5zG7Ru+w3u8Xx3h0sDuwem1Z1snk8ubaZyeP9vqtsHu0HupkCWKK4bFJS
 czLLUov07RK4MlbvWsde8J+t4tCzTvYGxpOsXYycHBICJhItC18zdTFycQgJrGCU+NF2nx3C
 +cIocbRnLiOE85lR4tH2XWwwLQe3zmSDSCxnlHi49B4zXNXjJYdZIJw9jBLrNnwA28IioCLR
 v3IVO4jNJqApsf3PfxYQW0TAXuLF+j1g3cwClxglPtz8zASSEBYwklh2uxusiFfAUOLHwxVM
 ELagxMmZT4DiHEANmhLrd+lDmNISy/9xgFQwC8hLNG+dzQxicwrYSWxa2cYIcbWSxPEjW1gg
 7FqJtcfOgP0pIfCCQ2Lrup9QRS4SJ09fYIewhSVeHd8CZctInJ7cwwLR0M0o0ffhKzOEM4NR
 Yvqy72wgV0gIWEv0ncmBaHCUWHv2IhNEmE/ixltBiOP4JCZtm84MEeaV6GgTmsCoMgvJY7MQ
 HpuF8NgsJI8tYGRZxSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJEZh4Tv87/mkH49xXH/UO
 MTJxMB5ilOBgVhLhDeyUSxDiTUmsrEotyo8vKs1JLT7EKM3BoiTOu2r2mnghgfTEktTs1NSC
 1CKYLBMHp1QD08x5ERnNvN3NBSoft162O9J2Uy5cxHlR+NY5i/mipW1Kex+YWSoyfnz9xDde
 MvK9VquH/y7HQ4L9yfrWx9fEvZjGlWhl9lDu9kr5gjdJtYtWzrZbfS+yp2bXPrZF276ufbex
 71iz0YFsv2mdrAtu+n087Dprz//c9V7hM+edNsm46HxDtKBxizzbXZ15O/z6DFnlfW677Gln
 mSh9OdHoVdfc91b+jhOv5LCWeV79OkHQxG/piYA4+80P7nmrydRqr/r8vPa1U2wA492DLQ+O
 ey1dlf7M+0GdAmfCz8mHrmw48/BNs+9TQ6X285IvUzsfHv91JUnl+uL/uwyPHaxtP/m/Zh/P
 ravPHhkyrL/7Pk2JpTgj0VCLuag4EQAHetMEqwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsVy+t/xe7qlTIoJBq9mSVqsbe9ms5h06Bqj
 xZKLqRbzbilbPPjzmN2id9lvdovjvTtYHNg9Nq3qZPN4cm0zk8f7fVfZPNoPdDMFsETp2RTl
 l5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZazetY694D9b
 xaFnnewNjCdZuxg5OSQETCQObp3J1sXIxSEksJRR4szVBiaIhIzEpysf2SFsYYk/17qgij4y
 Shxon84E4exhlGhY8wqsikVARaJ/5Sowm01AU2L7n/8sILaIgL3Ei/V7mEEamAUuMUp8uPkZ
 bIWwgJHEstvdYEW8AoYSPx6ugJp6mFFi/9E1TBAJQYmTM58AFXEAdWtKrN+lD2FKSyz/xwFS
 wSwgL9G8dTYziM0pYCexaWUbI8TVShLHj2xhgbBrJV7d3804gVFkFpKhsxCGzkIYOgvJ0AWM
 LKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzEC43LbsZ+bdzDOe/VR7xAjEwfjIUYJDmYlEd7A
 TrkEId6UxMqq1KL8+KLSnNTiQ4ymwBCayCwlmpwPTAx5JfGGZgamhiZmlgamlmbGSuK8W+eu
 iRcSSE8sSc1OTS1ILYLpY+LglGpgWn3q4tujT8K1nUqOCO+yMy/JUHgWZZmv2x76yO3D1Kig
 ty3NP+fWpCs8W9zUXuFirl+VdXuhaGG7q9Omvs2pc4U8/0q9vnGg4QqHbOsRwQVHH186Inia
 5e7yH2wuHJMaF6d7xL0zUXh4T6aSMShwf97FbzMzj7+8zZKuFvhvi7Dfow8/1l5d6Lcr6nXK
 hgXR2cnibF+Ygg13xXL9yfiSzf7oRGSyv0JkxM5LdUlvUoNkClasd1/rp8n64dg2od22p9qZ
 S+urOA3UDTpfxl+5scWvZPGqog4DmTg+r8l85aVHpp41/39ouYjolPwTWxUfOspbHva96r9k
 rse6qes9W5vUjmt23Bd6eZrppvQuJZbijERDLeai4kQA0DWFv1QDAAA=
X-CMS-MailID: 20210208092053eucas1p13f232beb5cc695152d9765ebd5d1d4dd
X-Msg-Generator: CA
X-RootMTR: 20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418
References: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
 <CGME20210208090325eucas1p1e86d183879827f4a8dfbed6d96051418@eucas1p1.samsung.com>
 <435eb631-e53d-a47a-6c27-68d12496fe00@redhat.com>
Received-SPF: pass client-ip=210.118.77.11; envelope-from=k.jensen@samsung.com;
 helo=mailout1.w1.samsung.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Dmitry, you OK with me squashing this fix and appending

    [dmitry: fix broken Close Zone]
    Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>

to the commit message?

