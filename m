Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539D38F87D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:08:43 +0200 (CEST)
Received: from localhost ([::1]:37840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llNQv-00015n-N4
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1llNOU-0006f2-H9
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:06:10 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:31325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1llNOP-0001Ur-18
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:06:10 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210525030550epoutp0113bbbdac55b548ceb9e75b0fdeea0d5a~CMFNIO3rb1470514705epoutp01N
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:05:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210525030550epoutp0113bbbdac55b548ceb9e75b0fdeea0d5a~CMFNIO3rb1470514705epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621911950;
 bh=RjeNf9iv7SU4128zYG7Sc9pxAvzbFxWmOVHOBHJMqe0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Yf3YvIoRQVKWyh/uQ18mlvV6GfVXebuFXHxy/XirUnrORH1U2Q+MV7CTFuT/rZ4RO
 HCKUX5HoL8as3xS7gt3DO2udrrK5LrR6TIbvfIXfmYR5IZLIEOtIra2GW33R7BeG25
 94tyvieQHjwtUjocadaxxkNMEJdrbgJ/pjpYezmg=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210525030549epcas5p1c2baaa3d101431c1b75d8006f7339ce5~CMFMpN9-d3184731847epcas5p1Q;
 Tue, 25 May 2021 03:05:49 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0C.23.09697.D896CA06; Tue, 25 May 2021 12:05:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210524212838epcas5p4b51562e83bd3f0cebec83cfe6ff91aab~CHeyl8E-02814828148epcas5p4O;
 Mon, 24 May 2021 21:28:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210524212838epsmtrp231427fe6c4fcb3d28406eccdfe1bba41~CHeylEYvr2698226982epsmtrp28;
 Mon, 24 May 2021 21:28:38 +0000 (GMT)
X-AuditID: b6c32a4a-639ff700000025e1-1f-60ac698dc2c1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 DC.CE.08163.58A1CA06; Tue, 25 May 2021 06:28:37 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210524212836epsmtip1b04c8400768468f16e867b99c5eb6ff1~CHexO5HqW0276202762epsmtip1r;
 Mon, 24 May 2021 21:28:36 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] add boot partitions support and read test case
Date: Tue, 25 May 2021 02:54:14 +0530
Message-Id: <20210524212416.26652-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCmpm5v5poEgzW9Mhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bWPd+ZC+axVCy4ndLAuJS5i5GTQ0LA
 RGL39Z9ANheHkMBuRokDz84yQTifGCV+Pf3GBuF8ZpQ492MyXMuGdV9ZIRK7GCW+z90N5XQy
 Scx/vJQdpIpNwEhi9ts3jCC2iICkxO+u02DdzCBLvs3VAbGFBZwlzp55xQZiswioSmyftowV
 xOYVsJW4dOwKE8Q2eYnVGw6AHSghcIxd4t3+VlaIhIvEvFfN7BC2sMSr41ugbCmJz+/2Ag1l
 B7KrJQ4XQbR2MEocu7yBDaLEXuLfs2lAt3EA3aMpsX6XPkRYVmLqqXVMEGfySfT+fgJ1Aq/E
 jnkwtprEglvfoTbJSMz8cxvqGg+J5pkbwOJCArES0zfvZ53AKDsLYcMCRsZVjJKpBcW56anF
 pgVGeanlesWJucWleel6yfm5mxjBKUHLawfjwwcf9A4xMnEwHmKU4GBWEuH927cyQYg3JbGy
 KrUoP76oNCe1+BCjNAeLkjjvioeTE4QE0hNLUrNTUwtSi2CyTBycUg1MxQnu4fbpEdvjv6nz
 /ri5XG3mzBQx97w5Qlc/nHlXzb/woRDnPRe+ig3zpv42LH0t9HLW5gfHH75L6knV451psO9b
 9+eXGS8nBBz9m/irzKx1Q4/kueDEjTeMZ57br82R8yTxXu85aw2xisg9H3/4LKsKjsksnprQ
 sKnm5x2JbQ2tu5XO7EtfuE8g+mMBoxnrL4N9r446rlEsZGU75+j31VPDKLDzX+HexddkH73X
 1Vna32Hokf9U+lPNu+nct+Y5c+6cHnDLzenJ3w/7DNrbtv4/UirJoZbPo7XH8PC2kMh1N9e+
 z/++ptzb8RvHkskpz5jLbv2KFtfMVZp6XCPk4qpTOqK7/x+a277qSIv1SyWW4oxEQy3mouJE
 AA3OY254AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJTrdVak2CwbYGc4vXO48zW1zZf57R
 Yv/Bb6wWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK2Prnu/MBfNYKhbcTmlgXMrcxcjJISFg
 IrFh3VfWLkYuDiGBHYwSfRses0MkZCR+nZoKVSQssfLfc7C4kEA7k8TBj5YgNpuAkcTst28Y
 QWwRAUmJ312nmUEGMQscZZS43D6ZBSQhLOAscfbMKzYQm0VAVWL7tGWsIDavgK3EpWNXmCAW
 yEus3nCAeQIjzwJGhlWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMEBpqW1g3HPqg96
 hxiZOBgPMUpwMCuJ8P7tW5kgxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTU
 gtQimCwTB6dUA9PmXqZHhRaXLk47XXdZtvXDa24Hs+v1zSpuPcqlQqecqo9ejxU/4TerxmTd
 oQTDKYGJLBZMEU2dOxVXnlH9YWH6IXzRwdxVh4S3Zdzf+fp3Yd23Jwtr115fs0/EKOC66cO9
 bDoSFw7IaAUGhSrect074xy/vpSwxa/s54c220z77Rp59eEfWU2XJ617GCrev+b6ZbXLbmZo
 ueo2bSs5z7Vmao8C/j/OiNXuzKwIv6/7e8WW6vXRj/psz5xL1yzh2Gn96vXmPh3nRMkQzu/l
 57gY/nrLTtr8xvjXqUSlS1yN/tmaexI+FjfZ9C5bMCX3n4H7rxDVM8ftSm6Ws1x5aaIwd950
 Odb1/TfsznJ8nqzEUpyRaKjFXFScCABEcjTknwIAAA==
X-CMS-MailID: 20210524212838epcas5p4b51562e83bd3f0cebec83cfe6ff91aab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210524212838epcas5p4b51562e83bd3f0cebec83cfe6ff91aab
References: <CGME20210524212838epcas5p4b51562e83bd3f0cebec83cfe6ff91aab@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds the boot partition feature as well test case for
reading boot partition area.

Gollu Appalanaidu (2):
  hw/nvme: add support for boot partiotions
  tests/qtest/nvme-test: add boot partition read test

 hw/nvme/ctrl.c          | 200 ++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h          |   3 +
 hw/nvme/trace-events    |   7 ++
 include/block/nvme.h    |  75 ++++++++++++++-
 tests/qtest/nvme-test.c | 118 +++++++++++++++++++++++-
 5 files changed, 401 insertions(+), 2 deletions(-)

-- 
2.17.1


