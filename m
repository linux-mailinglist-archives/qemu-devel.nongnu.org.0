Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8038F888
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:09:54 +0200 (CEST)
Received: from localhost ([::1]:44750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llNS5-0005fX-CO
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1llNPA-000882-3T
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:06:55 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:32691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1llNP4-00029W-Lr
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:06:51 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210525030644epoutp014eb76e3550e77cb192bbbfd322f19e51~CMF-vnQJ01513915139epoutp01S
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:06:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210525030644epoutp014eb76e3550e77cb192bbbfd322f19e51~CMF-vnQJ01513915139epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621912004;
 bh=ZGJ85q4/TS6siVHEnSopfY2Xdte4hgjbSWBUbyQh3Qg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YM8Dwm2llH6DNDmhg495R5pi1Q9usXbgix6QEzy/71SFrrVhQiloDgiUQ3gYZPthJ
 QfgpmdNWQKZMgEO3J/gaOSfO+mhiNqVMGCvWsMls//Pz8bakZdfvGEVYjMwM+MdErx
 a0zSCusD47XSIIZ4n3wEWTIkCRDZxkygHfdkKeL4=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210525030644epcas5p3be91e2daa699bf2a3ac118fe90797b5b~CMF-cGsVe0765707657epcas5p3d;
 Tue, 25 May 2021 03:06:44 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 02.83.09697.3C96CA06; Tue, 25 May 2021 12:06:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210524123810epcas5p2421ab84c5e4ff80dad3f660b57a0edf5~CAPooJhmU1345313453epcas5p2-;
 Mon, 24 May 2021 12:38:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210524123810epsmtrp1aace271f5f9ac4b28bddce625545ebc9~CAPonasNf1633816338epsmtrp1x;
 Mon, 24 May 2021 12:38:10 +0000 (GMT)
X-AuditID: b6c32a4a-639ff700000025e1-f8-60ac69c32a9f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.2C.08163.23E9BA06; Mon, 24 May 2021 21:38:10 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210524123808epsmtip181dfb3d0a486ba754dc70a07f1c8af2d~CAPnYG0wq2787627876epsmtip1P;
 Mon, 24 May 2021 12:38:08 +0000 (GMT)
Date: Mon, 24 May 2021 18:03:56 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme/ctrl: fix functions style
Message-ID: <20210524123355.GA12134@2030045822>
MIME-Version: 1.0
In-Reply-To: <YKddr8UDZhPzK0Yr@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7bCmlu6RzDUJBtu4La7sP89osf/gN1aL
 SYeuMVosuZhqMe+WssWsd+1sFsd7d7BYvJ70n9WBw+PHuXY2j3M7zrN7bFrVyebx5NpmJo/3
 +66yBbBGcdmkpOZklqUW6dslcGWc2DyZreA0f8W0g94NjCt5uhg5OSQETCSabj5g62Lk4hAS
 2M0o0XD6PjuE84lR4tGHrywQzmdGiZ7Zz1hgWo5sfMwEYgsJ7GKUmD4lBqLoFaPE54tLmEES
 LAKqEo2zT4MVsQkYScx++4YRxBYRUJF4+m8v2FRmgYmMEjt6/7CBJIQFzCQmPmsCa+AV0JdY
 8WUaC4QtKHFy5hMwmxNo0PMDF1hBbFEBZYkD244zgQySEGjlkHgy8yUbxHkuEj2vDrFD2MIS
 r45vgbKlJF72twHZ7EB2tcThIojWDkaJY5c3QLXaS/x7Ng3sUGaBDInV8w5DfSwrMfXUOiaI
 OJ9E7+8nTBBxXokd82BsNYkFt75DrZKRmPnnNiuE7SHx/sEqaADvZJSYtPIu6wRG+VlIfpuF
 ZB+EbSXR+aGJdRYjB5AtLbH8HweEqSmxfpf+AkbWVYySqQXFuempxaYFRnmp5XrFibnFpXnp
 esn5uZsYwelIy2sH48MHH/QOMTJxMB5ilOBgVhLh/du3MkGINyWxsiq1KD++qDQntfgQozQH
 i5I474qHkxOEBNITS1KzU1MLUotgskwcnFINTKsXb12+sKbj0fLvNSsM5jDrxq1+/jnj+Iq5
 iXsXMqj+S1PdmiR4Lf5uvt1fm/9hgYuVxVcLLzh6aMK3o4UKaYd4ljzQ8/A6tWt+qv6Xq3wf
 /qXcNJ+fk2H+emPRvd8XDv49I8J0Mdk7u/DSy6WuVgckLKPZTONyb3XlexZ/KPTJ3algPcXq
 Q8STt3tPq53/pjTDc9nuq2kvTTR+Bs1mUJrAd/xBpEfOLfF5qj9FP8nOz6hWy/yi2sJ4v77w
 y60XPydXTJi73eHIu0oG66zypik7E+dulNkWrWWYJ3ZGz/1WTWhU6J/9LvvLnUpVXh+Pv8uv
 O0P0iknmu8tzun3nLhSd37ZrQ96ulWYLbs9VmLNDiaU4I9FQi7moOBEAW6COqrYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSnK7RvNUJBo2NrBZX9p9ntNh/8Bur
 xaRD1xgtllxMtZh3S9li1rt2NovjvTtYLF5P+s/qwOHx41w7m8e5HefZPTat6mTzeHJtM5PH
 +31X2QJYo7hsUlJzMstSi/TtErgy5mz+zl7wl6diz5+vjA2MXzm7GDk5JARMJI5sfMzUxcjF
 ISSwg1FiSf9kJoiEjMSvU1OZIWxhiZX/nrNDFL1glFhw4wlYEYuAqkTj7NNgNpuAkcTst28Y
 QWwRARWJp//2soA0MAtMZJTY0fuHDSQhLGAmMfFZE1gDr4C+xIov01ggpu5klFhz4hIzREJQ
 4uTMJywgNjNQw7zND4HiHEC2tMTyfxwgYU6gZc8PXGAFsUUFlCUObDvONIFRcBaS7llIumch
 dC9gZF7FKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcD1paOxj3rPqgd4iRiYPxEKME
 B7OSCO/fvpUJQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBK
 NTAd0Vqxu/NdRt2nQK8fjsqKldv1djRNWPV20ulQ7QU7tpSKBodV3WuwfrBv3bPLNxabqom8
 5Gr5yTQreopB0Nal86tSF/h3ZCx+EHXq3V+blKmP9y3y3XzuYKPc1lcsfrMZNx4I8Y8719Tu
 c/2Y+XG/qqi/vLYL5798aRp1ef7DlbPO2q1i3Kc94zuPYMXGbRrPtX9c0zWbc5D/ltmyxNMK
 h3jVFspX++/ZHb9N86rC2fdO3dyBR8N4Lycc3PFi+t+8J17vDRN5H8zUb2Z7luX4acfxDi/N
 7vb7K+ranu47KbFao7/L2E3v/Z5SjalLoo2OWGxKbn43z2iDdWHPv6DbjziseSa5+hbd3LtO
 VKRORImlOCPRUIu5qDgRAH6e3Hv2AgAA
X-CMS-MailID: 20210524123810epcas5p2421ab84c5e4ff80dad3f660b57a0edf5
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----bUxwuCCDCMHmmogRYL-gh-gjXt6gU8i4.RAtra32WMoi9E65=_daa0a_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210521061352epcas5p145b3a19453f7ff9d625bb9ae447b649c
References: <CGME20210521061352epcas5p145b3a19453f7ff9d625bb9ae447b649c@epcas5p1.samsung.com>
 <20210521060842.25516-1-anaidu.gollu@samsung.com>
 <YKddr8UDZhPzK0Yr@apples.localdomain>
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
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------bUxwuCCDCMHmmogRYL-gh-gjXt6gU8i4.RAtra32WMoi9E65=_daa0a_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Fri, May 21, 2021 at 09:13:51AM +0200, Klaus Jensen wrote:
>On May 21 11:38, Gollu Appalanaidu wrote:
>>Identify command related functions style fix.
>>
>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>---
>>hw/nvme/ctrl.c | 6 +++---
>>1 file changed, 3 insertions(+), 3 deletions(-)
>>
>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>index 0bcaf7192f..40a7efcea9 100644
>>--- a/hw/nvme/ctrl.c
>>+++ b/hw/nvme/ctrl.c
>>@@ -4291,7 +4291,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
>>}
>>
>>static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
>>-        bool active)
>>+                                     bool active)
>>{
>>    NvmeNamespace *ns;
>>    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
>>@@ -4326,7 +4326,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
>>}
>>
>>static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
>>-        bool active)
>>+                                     bool active)
>>{
>>    NvmeNamespace *ns;
>>    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
>>@@ -4373,7 +4373,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
>>}
>>
>>static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
>>-        bool active)
>>+                                         bool active)
>>{
>>    NvmeNamespace *ns;
>>    NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
>>-- 
>>2.17.1
>>
>>
>
>Thanks, applied to nvme-next.
>
>Please just use 'hw/nvme:' in the commit title, we don't need to 
>specify the sub-subsystem ;)

Sure Klaus, Thanks :)


------bUxwuCCDCMHmmogRYL-gh-gjXt6gU8i4.RAtra32WMoi9E65=_daa0a_
Content-Type: text/plain; charset="utf-8"


------bUxwuCCDCMHmmogRYL-gh-gjXt6gU8i4.RAtra32WMoi9E65=_daa0a_--

