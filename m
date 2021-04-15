Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA2361736
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 03:36:22 +0200 (CEST)
Received: from localhost ([::1]:47334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXDPB-0008FI-FL
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 21:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXDOB-0007ec-Jg
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 21:35:19 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:31246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXDO4-00072y-QA
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 21:35:19 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210416013506epoutp04c05d08e3683f183ebb8f2b00ecefefc0~2Mr3LMqUQ2439524395epoutp04f
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 01:35:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210416013506epoutp04c05d08e3683f183ebb8f2b00ecefefc0~2Mr3LMqUQ2439524395epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618536906;
 bh=YtQ5w/PjmXOCabZgkIuIGNReHPA3ZlK3hKBa3YzoI6A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WVIaiWGPVAj2lWr09Kznb6S5zEGFRyapvjo0RnRPWyJHBkqLAESVYWs1KCCHMYq77
 b9WBYL3pMHhAJFG2k18s5usN/pKFRBsW5ceDQKYcL/IbDrvFv6xhK88v9ChppJZpod
 BA0ly8GvHOZIsp8PrqvHJNCOmRIJhZOImaRW7yEA=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210416013506epcas5p2df5ecd685c074504c637d79093ce3e61~2Mr20G1bs1641516415epcas5p2q;
 Fri, 16 Apr 2021 01:35:06 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9B.6C.41008.AC9E8706; Fri, 16 Apr 2021 10:35:06 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210415183259epcas5p1151e041ae111985e0dd94b11ff872105~2G7TjTDo03052230522epcas5p1g;
 Thu, 15 Apr 2021 18:32:59 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210415183259epsmtrp12850c4e7c458c09e77d4b4434ccbc0a7~2G7TigeUC2263322633epsmtrp1D;
 Thu, 15 Apr 2021 18:32:59 +0000 (GMT)
X-AuditID: b6c32a4b-64bff7000001a030-3e-6078e9ca237d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 92.23.08745.BD688706; Fri, 16 Apr 2021 03:32:59 +0900 (KST)
Received: from 2030045822 (unknown [107.99.42.33]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210415183258epsmtip1fb7bee90fd2074713ad7d29ba81f8dbb~2G7SFFYfW2555725557epsmtip1m;
 Thu, 15 Apr 2021 18:32:58 +0000 (GMT)
Date: Fri, 16 Apr 2021 00:00:08 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2] hw/block/nvme: align with existing style
Message-ID: <20210415183008.GA8777@2030045822>
MIME-Version: 1.0
In-Reply-To: <YHh1evjljdZesw5I@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7bCmuu6plxUJBp+XCVjMX3ufxeLK/vOM
 FvsPfmO1mHToGqPFkoupFvNuKVv0LvvNbjHrXTubxfHeHSwWryf9Z3Xg8vhxrp3N49yO8+we
 m1Z1snk8ubaZyeP9vqtsAaxRXDYpqTmZZalF+nYJXBkHmpsZC/p4KhrnXWFtYJzG1cXIySEh
 YCLxfM50li5GLg4hgd2MEpNbXrFBOJ8YJZb8nc8K4XxmlJjX/YC5i5EDrGXbd0eQbiGBXYwS
 V6ZlQdQ8Z5Ro/L2ZCaSGRUBVYuPFQJAaNgEjidlv3zCC2CICKhJP/+0F28Ys8J1R4uCtW2AJ
 YQEHiTX9fcwgNq+AnsSEE1vYIGxBiZMzn7CA2JxAg2ZefcMEYosKKEsc2HacCWSQhMBSDomW
 H4dYIP5xkdj3v4sZwhaWeHV8CzuELSXxsr8NyGYHsqslDhdBtHYwShy7vIENosRe4t+zaWD3
 MAtkSDQdOcMEEZeVmHpqHRNEnE+i9/cTqDivxI55MLaaxIJb36FWyUjM/HObFcL2kGheOJUR
 EkBvGCVe/pvHNoFRfhaS32Yh2QdhW0l0fmhihbDlJZq3zmaeBQxTZgFpieX/OCBMTYn1u/QX
 MLKtYpRMLSjOTU8tNi0wzkst1ytOzC0uzUvXS87P3cQITl1a3jsYHz34oHeIkYmD8RCjBAez
 kgivcWdFghBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeHQYP4oUE0hNLUrNTUwtSi2CyTBycUg1M
 Pf9WBLPsDl8+q65gxb2niS8UZq9csXqKhfK0RWbbNYRTTnh2bT3nr+KUL/c6yL9AfUXYg5TI
 axuFb9w0UZ0tvLvr+44J/t0H2b5/Oj2X3VLSNlltsYbv6oVG/08zmujzrWKKrCm0zS0LijR3
 4Hv4c6ZZoE/EqoYk5iUn6pcvSf+rfOOcl4eUf3tI+ooIK6Pc1lhrM+5mfoEzl1SWdNru22Cr
 WLf0Jpckx+O9U1uiHOOljnPFvVCJ38z5aPN+x81HtIXZRTTTOxa4VKguZBJntmCzVg899Dp2
 Vdu/BdZsu/T/PuJP+i0VrhNreOVMSpltxBeLyyWNJX+lLPPnitzSZe9aPS3HJ69n3i/3ZUos
 xRmJhlrMRcWJADuMNfDMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42LZdlhJTvd2W0WCweo92hbz195nsbiy/zyj
 xf6D31gtJh26xmix5GKqxbxbyha9y36zW8x6185mcbx3B4vF60n/WR24PH6ca2fzOLfjPLvH
 plWdbB5Prm1m8ni/7ypbAGsUl01Kak5mWWqRvl0CV8bVT00sBfM5K3a/Xc7awHiEvYuRg0NC
 wERi23fHLkYuDiGBHYwSZ9vesnYxcgLFZSR+nZrKDGELS6z895wdougpo8S6xufMIM0sAqoS
 Gy8GgtSwCRhJzH77hhHEFhFQkXj6by8LSD2zwHdGiYO3boElhAUcJNb094EN5RXQk5hwYgsb
 xNA3jBL7Tk1ghEgISpyc+YQFxGYWMJOYt/kh2DJmAWmJ5f84IMLyEs1bZ4PN4QRaPPPqGyYQ
 W1RAWeLAtuNMExiFZiGZNAvJpFkIk2YhmbSAkWUVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpe
 cn7uJkZwPGlp7WDcs+qD3iFGJg7GQ4wSHMxKIrxuU0oShHhTEiurUovy44tKc1KLDzFKc7Ao
 ifNe6DoZLySQnliSmp2aWpBaBJNl4uCUamDSvF3dyqnHV9KzKSczq5x5tf8Fa97gZ5X976da
 9SyXLFO743Hu36ZmY5HPVo9Y1zJoiM7Idkso5j3zSyuu5NJNvsDM+Ffay+/9ckuKk/3l87rH
 tS9T1lSTe7GJ2ozi8zsniBaKuW2IvnO1uagubOP75cenmnMfKiw98bi1S/G19/vri5ZHr86w
 epNv/aT8avj69XWN6xttuw4f4n75cW6EXxtP9717Bg+DZPtvcql8/5p2Mo7nidQaLaN1y7x3
 ml8vuWq1b6rtu6fypae/WBldNP1w7nPQe/3JPKt+ua8N9OZcW37g+LmVZxZyWgeYf3/PuC3w
 4OUpe7NucTNtK9nj1npP6/5+pzV7NO+lSTxUYinOSDTUYi4qTgQArJ+GihYDAAA=
X-CMS-MailID: 20210415183259epcas5p1151e041ae111985e0dd94b11ff872105
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_8ae58_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210415120417epcas5p31ddb152cbe94fa5bebe386de5e33f69e
References: <CGME20210415120417epcas5p31ddb152cbe94fa5bebe386de5e33f69e@epcas5p3.samsung.com>
 <20210415120048.5484-1-anaidu.gollu@samsung.com>
 <a1ce0889-c80c-2d59-e65a-3eed8bfdd3e9@redhat.com>
 <YHh1evjljdZesw5I@apples.localdomain>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
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
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, kbusch@kernel.org, mreitz@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_8ae58_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Thu, Apr 15, 2021 at 07:18:50PM +0200, Klaus Jensen wrote:
>On Apr 15 15:13, Philippe Mathieu-Daudé wrote:
>>On 4/15/21 2:00 PM, Gollu Appalanaidu wrote:
>>>Make uniform hexadecimal numbers format.
>>>
>>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>>---
>>>-v2: Address review comments (Klaus)
>>>use lower case hexa format for the code and in comments
>>>use the same format as used in Spec. ("FFFFFFFFh")
>>
>>^ This comment is relevant to the commit message.
>>
>>Also it would be nice if the subsystem could describe somewhere
>>what is its style. Not sure where... The file header is probably
>>the simplest place.
>>
>>Something like:
>>
>>"While QEMU coding style prefers lowercase hexadecimal in constants,
>>the NVMe subsystem use the format from the NVMe specifications in
>>the comments: no '0x' prefix, uppercase, 'h' hexadecimal suffix."
>>
>
>+1 for that suggestion.
>

Sure, will add it and send v3.

>>> hw/block/nvme-ns.c   |  2 +-
>>> hw/block/nvme.c      | 40 ++++++++++++++++++++--------------------
>>> include/block/nvme.h | 10 +++++-----
>>> 3 files changed, 26 insertions(+), 26 deletions(-)
>>
>>



------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_8ae58_
Content-Type: text/plain; charset="utf-8"


------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_8ae58_--

