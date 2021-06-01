Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77915397671
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:22:04 +0200 (CEST)
Received: from localhost ([::1]:43804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6DT-0004NV-Dd
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo61G-0001Fe-TJ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:30 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:61209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo61E-00085d-R1
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:26 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210601150920epoutp014dbf4214c22e6afeadba67016b6ff4f5~Efd6ab0li2808828088epoutp01e
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 15:09:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210601150920epoutp014dbf4214c22e6afeadba67016b6ff4f5~Efd6ab0li2808828088epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1622560160;
 bh=Oo7EOD3ITFC/EJUUf0oBkvCuDVS0KIru4DN/BWqDAuM=;
 h=From:To:Cc:Subject:Date:References:From;
 b=eM2rRD+LKfSXZ8FrqrCah1sh5JYwJtsITqEpWvoQ3env8o2AZ13XUKzfRzUtt92b3
 wrJSqUc+Oloj5hQniGSTQQu7u4K+UJL2fiqcVBQoP98CXzYCXdO3tktPTh/nxme50G
 FbryMXYWuOUXe403X4PSDCe3Iqoul9tX+1cMf8D8=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210601150920epcas5p457cb8e032d0e4047e51825a0869586fd~Efd6Hs3Vu1569015690epcas5p4c;
 Tue,  1 Jun 2021 15:09:20 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 69.AC.09835.0AD46B06; Wed,  2 Jun 2021 00:09:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210601144231epcas5p3b931fe9421737d104dc3c5be50c928f3~EfGfRQWcw2796827968epcas5p3s;
 Tue,  1 Jun 2021 14:42:31 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210601144231epsmtrp21913dcc4c4e73d3e48b16d875564c5a5~EfGfQehZF3175731757epsmtrp2f;
 Tue,  1 Jun 2021 14:42:31 +0000 (GMT)
X-AuditID: b6c32a4b-7c9ff7000000266b-6a-60b64da046ad
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 43.B5.08163.65746B06; Tue,  1 Jun 2021 23:42:30 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210601144229epsmtip1868b828233b29d54338be1bf41cb1f68~EfGd5UBBn0031700317epsmtip1O;
 Tue,  1 Jun 2021 14:42:29 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] add boot partitions support and read test case
Date: Tue,  1 Jun 2021 20:07:47 +0530
Message-Id: <20210601143749.1669-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRmVeSWpSXmKPExsWy7bCmuu4C320JBgs2SFi83nmc2eLK/vOM
 FvsPfmO1mHToGqPFkoupFvNuKVvMetfOZnG8dweLxetJ/1kdOD1+nGtn8zi34zy7x6ZVnWwe
 T65tZvJ4v+8qm0ffllWMAWxRXDYpqTmZZalF+nYJXBkrDnWwFtxgqTh4bRJbA+Nl5i5GTg4J
 AROJqfv3MnUxcnEICexmlHj79hczhPOJUeL+0qWMEM5nRomF/z+xwrT0nDnNApHYxSix78tm
 qJZOJokve0CGcXKwCRhJzH77hhHEFhGQlPjddRpsITPIkm9zdUBsYQE3ieaPfWA1LAKqEg+O
 doDZvAI2EqdP9LFBbJOXWL3hANgCCYFD7BL7F52HSrhI7H47kR3CFpZ4dXwLlC0l8fndXqAa
 diC7WuJwEURrB6PEscsboFrtJf49mwa0iwPoHk2J9bv0IcKyElNPrWOCOJNPovf3EyaIOK/E
 jnkwtprEglvfoTbJSMz8cxsaKB4SiyZfA4sLCcRKnD3RzTSBUXYWwoYFjIyrGCVTC4pz01OL
 TQuM81LL9YoTc4tL89L1kvNzNzGCk4KW9w7GRw8+6B1iZOJgPMQowcGsJMLrnrc1QYg3JbGy
 KrUoP76oNCe1+BCjNAeLkjjvioeTE4QE0hNLUrNTUwtSi2CyTBycUg1Mr6XX/D6aYbEgVn9y
 xfGi+uztvCd35zsx1z3Rc1xyXfd5UcPDl5+fr+ny/FkWVD6jnOGLzPpNUjrP4p7v2bDRzHBZ
 +gPf7czWWt7/n/xnmK3TXcosMU3VdnmQf35X/42fmxWmlZyZ/c9DWfCssoDyvY9dzyPClwm+
 fWmSLChS/4yfte6R2clPLjkGvPXhKxP7Lcq+HAjcJC/EdzBuQ7DVgjQ2rYBpzDE78izeGnZG
 9M1bs1z/zMrjP204BdiPSq/IbT9Z4Muom3rTk+XtzJlT1UMcCo8WG1TufLMvjHGN0/IdDzpa
 bxiLVrmn6d6x9Fin/bHsXc/KhMkvfqpZzA69vfCeRale5TEvnXk2N6crsRRnJBpqMRcVJwIA
 K/ocW3kDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LZdlhJTjfMfVuCwYQ71havdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8aKQx2sBTdYKg5em8TWwHiZuYuRk0NC
 wESi58xpli5GLg4hgR2MEiunbmCBSMhI/Do1FapIWGLlv+fsEEXtTBK7Nu9hBEmwCRhJzH77
 BswWEZCU+N11mhmkiFngKKPE5fbJYJOEBdwkmj/2gRWxCKhKPDjaAWbzCthInD7RxwaxQV5i
 9YYDzBMYeRYwMqxilEwtKM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAgOMi2tHYx7Vn3QO8TI
 xMF4iFGCg1lJhNc9b2uCEG9KYmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KL
 YLJMHJxSDUzhneFca3v+iuufihRknHEzYGFLz7UFlX/1OpI+NqpWmDms/WOZpJUl0nqnKbPk
 SJ3awpJDx8259W7qan7PPTu57cri84rvn7H9c5vbzLvl67c1k04+q2BPSJKrjs8x3tD1QfXT
 m6zpiqVy5j+Xm2Y9Ehb9v3V52vkS+ayE6H/uzNNfte74fNKiOVZc+MEOPb8CSaOEq6+f+m1c
 cyCsy8hzgbVEBUPeqQ5P27UH97q9D2UXf7ghUDBS6NXjM4e81Fa6nzlXVyQhKbZT/J9C8aZG
 54e7Jx58y6oSd7LxyMsSmwfnPIsSg35u7VTkTsv45bEpcWKOtgoLj9yfMPlLFzhVJ+ReZ9i4
 eOKzc8kbziqxFGckGmoxFxUnAgBvGLGsoQIAAA==
X-CMS-MailID: 20210601144231epcas5p3b931fe9421737d104dc3c5be50c928f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210601144231epcas5p3b931fe9421737d104dc3c5be50c928f3
References: <CGME20210601144231epcas5p3b931fe9421737d104dc3c5be50c928f3@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-v2:
Boot partitions write and read offset corrections

This series adds the boot partition feature as well test case for
reading boot partition area.

Gollu Appalanaidu (2):
  hw/nvme: add support for boot partiotions
  tests/qtest/nvme-test: add boot partition read test

 hw/nvme/ctrl.c          | 207 ++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h          |   3 +
 hw/nvme/trace-events    |   7 ++
 include/block/nvme.h    |  75 ++++++++++++++-
 tests/qtest/nvme-test.c | 118 ++++++++++++++++++++++-
 5 files changed, 408 insertions(+), 2 deletions(-)

-- 
2.17.1


