Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD193829CF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:28:56 +0200 (CEST)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaUa-0002xg-0u
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1liaLy-0004GE-Cs
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:20:03 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:36656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1liaLp-0001ho-RR
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:20:02 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210517101939epoutp0249fdf6851592d03d0a2b898966e5223c~-01sei1l91545215452epoutp02w
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:19:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210517101939epoutp0249fdf6851592d03d0a2b898966e5223c~-01sei1l91545215452epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621246779;
 bh=0YZSs5e1Y+kOpCKR84vzmGkwPTUQ+hs5zUTT6hauxs8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=IT6n5/VOHEqL3AAN51Ivt9lmkFvvCPKkvtkfsZwdCjIJJCNkeewmnrBvv82q0XjG3
 RkdwRFqo6sZ5deHLtvPymFqj5BKGXxnajJgVUdd9uWbGYvFYOw0fuRoj/6x3HEUrQF
 2Qhh3ge4PsrOAcWVafrnWwGGBcipM8A1q5ad5M+g=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210517101938epcas5p24f3b079135a4f0bbd807e4a2cbcf7d44~-01r_TRfv1666716667epcas5p2w;
 Mon, 17 May 2021 10:19:38 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FE.A4.09835.A3342A06; Mon, 17 May 2021 19:19:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210517101201epcas5p369289ffa35baa72b248bcc578f009f64~-0vCcvX2T1265312653epcas5p3d;
 Mon, 17 May 2021 10:12:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210517101201epsmtrp24a80775f0665a0d18c1a6ddc5fccb731~-0vCcGJqm2113421134epsmtrp2A;
 Mon, 17 May 2021 10:12:01 +0000 (GMT)
X-AuditID: b6c32a4b-7dfff7000000266b-89-60a2433a83ec
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FB.E6.08637.17142A06; Mon, 17 May 2021 19:12:01 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210517101200epsmtip1b2c7163e572491da68e694b32f983713~-0vBDcJZO1149511495epsmtip13;
 Mon, 17 May 2021 10:12:00 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] adding ctrl list (cns 0x13) support and random fixes
Date: Mon, 17 May 2021 15:37:33 +0530
Message-Id: <20210517100736.17063-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7bCmpq6V86IEg7YeJYvXO48zW1zZf57R
 Yv/Bb6wWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK2PtgYyCuSwVC1Z8ZG5gXMvcxcjJISFg
 IjH5Rjd7FyMXh5DAbkaJ04eWMEE4nxglPt5/zQ5SJSTwjVFi2ktNmI6vTaegivYySvw78pQN
 wulkkrjyazlYB5uAkcTst28YQWwRAUmJ312nwfYxg+z4NlcHxBYW8JSYvHw+WA2LgKrEhl3f
 wGp4BWwl5tz9zAaxTV5i9YYDzCALJAQOsUvsP9/KApFwkdg1fTsrhC0s8er4FnYIW0ri87u9
 QM3sQHa1xOEiiNYORoljlzdAzbSX+PdsGtBeDqB7NCXW79KHCMtKTD21jgniTD6J3t9PmCDi
 vBI75sHYahILbn2H2iQjMfPPbagLPCRWnLsJDaxYiZ3PPjJPYJSdhbBhASPjKkbJ1ILi3PTU
 YtMC47zUcr3ixNzi0rx0veT83E2M4ISg5b2D8dGDD3qHGJk4GA8xSnAwK4nwfgqbnyDEm5JY
 WZValB9fVJqTWnyIUZqDRUmcd8XDyQlCAumJJanZqakFqUUwWSYOTqkGpvmLrj3SvGD39iCD
 QvP9xQxHK34zLpvjZXj9c2vEtUeXlkfdL//Fbf5Ekak0dlEnz7WyyRyKKu92za1NjNBeVvDQ
 dCr/MW1un95v3VdWBcexiWw8W6TKPDdh9fwQJqPdXzc1LYyfdGxWr/2+JfwB8vJruM7Ptvgj
 b3e79I8G4xlut5mmTrxJf9lf1aosdpKrSZZwi79z9aZGRICiB7/rp39BXTXyk80l1k4uOMI3
 1exB/8zZtQGN9qpvZx897az4oDLztSbv/Hypi/P2us7wXrr2+0+nGbPXVN+84/ri6j4RBT1O
 2aMal4uvJ2nNdi+5wc8eIevSr7dMVKJnVwCrUdhJy3JRxdbJk67Ob9wTpsRSnJFoqMVcVJwI
 AJq2MVV3AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJTrfQcVGCwcJlyhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8baAxkFc1kqFqz4yNzAuJa5i5GTQ0LA
 ROJr0ymmLkYuDiGB3YwSpzZsY4RIyEj8OjUVqkhYYuW/5+wQRe1MEt2nG1hBEmwCRhKz374B
 axARkJT43XWaGaSIWeAoo8Tl9sksIAlhAU+JycvngxWxCKhKbNj1DWwqr4CtxJy7n9kgNshL
 rN5wgHkCI88CRoZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBIaaluYNx+6oPeocY
 mTgYDzFKcDArifB+CpufIMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJeCGB9MSS1OzU1ILU
 IpgsEwenVAOTw6Grd8InCwdpiTs+2ZvCEa+vqZb0d/+ELw3ce7Nt/Cfbs/YXVt7ZWfMwY8qu
 RPYuLq2IuB9BrD0To4MC7TYtZl9oZzX/91lxo9JvM7il6999vL5y3fzbaz9eET/cXfv6p7qF
 7PODkSsP1i9XuSa7q+rVE5VLT2crT1vySvKHa/w39rId97j1bij2svqm+0X33wiaFnBn1oOS
 ndHzrscaNEXJ17+8r/ZsE6N07AvjDXwKBk8+ZEUvmXRR55cvW+tDDR3TC8dEj4nl/+A2qToS
 w2I/S2nW/seJp39PZ6zNrlLd4B50U/ZBYl7+7tzs191Whr7P0vLSlz9huBE1YwrnbWvr2PT5
 O8tCqn/HtrQqsRRnJBpqMRcVJwIA4CXqUKACAAA=
X-CMS-MailID: 20210517101201epcas5p369289ffa35baa72b248bcc578f009f64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210517101201epcas5p369289ffa35baa72b248bcc578f009f64
References: <CGME20210517101201epcas5p369289ffa35baa72b248bcc578f009f64@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series will add the Identify Controller List (CNS 0x13) support
and NSID endian conversion fixes for CNS 0x12 and CNS 0x13.

Documentation fix for the '-detached' parameter.

Gollu Appalanaidu (3):
  hw/nvme/ctrl: add controller list cns 0x13
  hw/nvme/ctrl: fix endian conversion for nsid in ctrl list
  hw/nvme/ctrl: documentation fix

 hw/nvme/ctrl.c       | 28 +++++++++++++++++-----------
 hw/nvme/trace-events |  2 +-
 include/block/nvme.h |  1 +
 3 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.17.1


