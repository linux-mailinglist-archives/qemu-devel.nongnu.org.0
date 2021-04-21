Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA483678AF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:27:42 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQwG-0008EI-7g
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZQsf-0002xM-LJ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:23:58 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:35183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZQsb-00017Q-3H
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:23:57 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210422042344epoutp0160f1274737ed5fbe2c0ec5f6476163c3~4E2z1PzLK0615506155epoutp01Q
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:23:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210422042344epoutp0160f1274737ed5fbe2c0ec5f6476163c3~4E2z1PzLK0615506155epoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619065424;
 bh=31V4XpcklwgvfqHna4dgzMGhVHlEtJ8mnNTYkHPou9g=;
 h=From:To:Cc:Subject:Date:References:From;
 b=NxmHl6wcb8l85mq3GmB3jOkPvcBRxs2s93Cu0fjTz2V83Rb/n/xWdy5kVvRDCc1/P
 o0DGT+kBEXqSQnHrsaWcqKPI/otIDdNB+GJbqaEXvZcr0C7WRYBUg/IK3pSE3Wuf3S
 YsLBvrz+IxUkmyAN74Xs9LBcI4YH9VQIw9pGI29I=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210422042343epcas5p4621060fcbe2d53bf542a9aefdbaa0576~4E2yi8AOA2370123701epcas5p4P;
 Thu, 22 Apr 2021 04:23:43 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3A.08.09697.F4AF0806; Thu, 22 Apr 2021 13:23:43 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210421125407epcas5p1f843d6b3035e05805de4bb410c93cb71~34LJHD_Qd1240912409epcas5p17;
 Wed, 21 Apr 2021 12:54:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210421125407epsmtrp2f97e5af035bc96d4e004d6f37ccc483f~34LJGKQ962654826548epsmtrp2K;
 Wed, 21 Apr 2021 12:54:07 +0000 (GMT)
X-AuditID: b6c32a4a-639ff700000025e1-95-6080fa4f3dbc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CD.B4.08637.F6020806; Wed, 21 Apr 2021 21:54:07 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210421125405epsmtip14e3fff55d6e6e09c87d6f23d5fc0b2fc~34LHpOQef1949819498epsmtip1P;
 Wed, 21 Apr 2021 12:54:05 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/block/nvme: fixes lbaf formats initialization and
 adds idns enums
Date: Wed, 21 Apr 2021 18:20:59 +0530
Message-Id: <20210421125100.12789-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7bCmlq7/r4YEg0tH+C1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC16l/1mt5j1rp3N4njvDhaL15P+szpwefw4187mcW7HeXaP
 Tas62TyeXNvM5PF+31U2j74tqxgD2KK4bFJSczLLUov07RK4MvZ9/clU8Iu54tbyxWwNjDOY
 uxg5OSQETCRWzvjI1sXIxSEksJtRYs7CNijnE6PEkzMbmCCcb4wSH3afYoJpWbLxLQtEYi+j
 xPE1XWCzhATamCR6tguB2GwCRhKz375hBLFFBCQlfnedZgZpYBY4xyjR/uol0A4ODmGBaImp
 /4tBalgEVCWeLb3LBmLzCthKrH9+jgVimbzE6g0HwHolBM6xA/XeYoVIuEh8fL4OyhaWeHV8
 CzuELSXx+d1eoEHsQHa1xOEiiNYORoljlzewQZTYS/x7No0R5ARmAU2J9bv0IcKyElNPrQP7
 kVmAT6L39xOof3kldsyDsdUkFtz6DrVJRmLmn9tQF3hILJ/SxQoJhliJZ9PPsk9glJ2FsGEB
 I+MqRsnUguLc9NRi0wKjvNRyveLE3OLSvHS95PzcTYzg5KDltYPx4YMPeocYmTgYDzFKcDAr
 ifCuLW5IEOJNSaysSi3Kjy8qzUktPsQozcGiJM4r6FydICSQnliSmp2aWpBaBJNl4uCUamBK
 TmLQk+QRKH/vUq993NFEeM5N1Y2fEj86tuxetksxerpvZyPXdcnTDJ9lLpSW6W4rE89MaHIM
 nVCms5s9rMs46dQGNaZtvnzpJz/zF+22t2+Mb1CWLblpH11/T9ehYVXl370p/Y9uxsU90Hds
 i1gpWd5lKFC4xvRoVu+LzERLzrAAfe4TW39PYJ2bwl11xXuJ780d2hO0/qWyvvJR65mwJslP
 yvY7W+Cz3g8fChmmGig8OFnDH3hZedn76ZK9M8VUrqtxxHhOSk3gP8D4PXJaiV9U06MC4xnP
 vmrVvf/0XdtY9v060Qk35vlUNx2NeZXH9f5Hj5wg7w6V7S06ijbW/r0HL32e4CnjttFAiaU4
 I9FQi7moOBEAD+xMT30DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprELMWRmVeSWpSXmKPExsWy7bCSnG6+QkOCwZxZfBavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyha9y36zW8x6185mcbx3B4vF60n/WR24PH6ca2fzOLfjPLvH
 plWdbB5Prm1m8ni/7yqbR9+WVYwBbFFcNimpOZllqUX6dglcGfu+/mQq+MVccWv5YrYGxhnM
 XYycHBICJhJLNr5l6WLk4hAS2M0oMW3FCUaIhIzEr1NToYqEJVb+e84OYgsJtDBJ/FkWCGKz
 CRhJzH77BqxeREBS4nfXaWaQQcwCtxgldn29xASSEBaIlHg69zQLiM0ioCrxbOldNhCbV8BW
 Yv3zcywQC+QlVm84wDyBkWcBI8MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgYNPS
 3MG4fdUHvUOMTByMhxglOJiVRHjv19YkCPGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkgg
 PbEkNTs1tSC1CCbLxMEp1cC0LqxqNfsS6WTRtlk353RYs2kerp/SbzPbIdLx48vOFboW+fMM
 5pvun3Hp3UfxV7NlP/0tqtfSemkoorWpMSZw2ZyON47OPya5CmlbH5N7V1kzTa1ui6povrey
 g8r/m+lHVDlv1E4Xv+1rGMDhe+ATx1kVU65pnbVz9EyalA7trXrVvCFXK/TC1Z4PwRXCDnrb
 duavW/V1YTf7NrarTiZ/7HzWT5PfyXpDcktQfgJf9dq9PVMvtn0+2iOnsSCv8fAFQdlNTX/v
 h8rtYJ240tWa8/rO8rPlOWf3Zm21KS6u/tUSNkkzdWO9tpNfy7nEp6+Mlxw2/WxXG/ft2vE+
 iy+C22R+qE5ap7rlQw6ryhslluKMREMt5qLiRAAqiQuspQIAAA==
X-CMS-MailID: 20210421125407epcas5p1f843d6b3035e05805de4bb410c93cb71
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210421125407epcas5p1f843d6b3035e05805de4bb410c93cb71
References: <CGME20210421125407epcas5p1f843d6b3035e05805de4bb410c93cb71@epcas5p1.samsung.com>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes the LBAF Formats intialization and Adds the
Identify Namespace Parameters enums to make to more readable.

Gollu Appalanaidu (3):
  hw/block/nvme: fix lbaf formats initialization
  hw/block/nvme: add id ns flbas enum
  hw/block/nvme: add id ns metadata cap (mc) enum

 hw/block/nvme-ns.c   | 51 +++++++++++++++++++-------------------------
 hw/block/nvme-ns.h   |  2 +-
 include/block/nvme.h | 10 ++++++++-
 3 files changed, 32 insertions(+), 31 deletions(-)

-- 
2.17.1


