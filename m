Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4543C9E86
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 14:22:49 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m40O7-0001q8-VD
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 08:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1m40NG-00010Z-TY
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 08:21:54 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.kalghatgi@samsung.com>)
 id 1m40ND-0005gg-0H
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 08:21:54 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210715122139epoutp0486d7a948c633b1f69353083fa6ccea7a~R9kEVHNg60520005200epoutp04E
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 12:21:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210715122139epoutp0486d7a948c633b1f69353083fa6ccea7a~R9kEVHNg60520005200epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1626351699;
 bh=YE84KnwuU+6+M/ndi7XOsgIDkjw0eyMyvHqpQPR2cxs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BiFEJEbXNm3rCDXxnR7lUsn05pfNxZfDl3aEFlIMpfnTefOE4ip0dPWAvsqNFzSnh
 yBzf9yrfFNXXA907zqIzgDePd04w0oyvJuci6CXmSuYqVVD53cp8bgLGW2G7ILZkD4
 WLEc7xKY65q+mHoqqS6ZfNnMHOGD+MzrkjJZVPW8=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210715122138epcas5p2825fd7ec75444a7e2043c8ab6033fedb~R9kDLCVtE1986219862epcas5p29;
 Thu, 15 Jul 2021 12:21:38 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.40.194]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4GQYQ81nm2z4x9Pt; Thu, 15 Jul
 2021 12:21:36 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 68.88.09595.05820F06; Thu, 15 Jul 2021 21:21:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210715120305epcas5p33e93af93ad8f089addabe8406bd1a43d~R9T26NiMm2412824128epcas5p30;
 Thu, 15 Jul 2021 12:03:05 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210715120305epsmtrp163970adc5eb4b40996ad1f22984ad1dd~R9T24Ijsx0969609696epsmtrp1p;
 Thu, 15 Jul 2021 12:03:05 +0000 (GMT)
X-AuditID: b6c32a4a-ed5ff7000000257b-f7-60f028502354
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B2.E8.08289.9F320F06; Thu, 15 Jul 2021 21:03:05 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210715120303epsmtip1e61b184275706f1f10b7f629ebbc5fe7~R9T0sTmNz2460924609epsmtip1k;
 Thu, 15 Jul 2021 12:03:03 +0000 (GMT)
Date: Thu, 15 Jul 2021 17:31:58 +0530
From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC PATCH 1/2] hw/nvme: add mi device
Message-ID: <20210715120158.GA8970@test-zns>
MIME-Version: 1.0
In-Reply-To: <20210709155842.GA291156@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIJsWRmVeSWpSXmKPExsWy7bCmlm6AxocEgwePOSzefn3AZnFl/3lG
 i/0Hv7FaPL7zmd1i6Xx9i5ONe1gtJh26xmix5GKqxZTG2+wWa14oW8y7pWxxZcoiZotZ79rZ
 LI737mCxeD3pP6vFzeanbA4CHj/OtbN5nNtxnt1j06pONo8TO1+weDy5tpnJ4/2+q2wefVtW
 MQawR+XYZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gCd
 rqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMDQq0CtOzC0uzUvXS87PtTI0MDAy
 BapMyMn4uHcJc0Eve8X7H8fYGhhb2LoYOTgkBEwkZq6z7GLk4hAS2M0ocezHFCYI5xOjxP6F
 O9ggnM+MEt0PjjDCdNz55A8R38UIZJ+BKnrGKLHm+S+WLkZODhYBVYmVbfPYQRrYBIwkvrfa
 goRFBJQl7s6fyQpiMwtcY5L49CMGxBYWMJaY27+YHcTmFdCR2Dl/PwuELShxcuYTMJtTwEni
 dAfI1ZwcokBzDmw7DnaphMAJDolbN08zgyQkBFwkvu//yQJhC0u8Or6FHcKWknjZ38YO0dDM
 KLHvyxUWCGcCo8SU+e+YIKrsJS7u+csEcV6GxOHfD6GmykpMPbUOKs4n0fv7CVQ9r8SOeTC2
 qsTjCwfZIGxpidkrP0HFPSR6t75jhQTRTkaJ5bO/sk5glJ+F5L1ZSPZB2FYSnR+aWGcBQ48Z
 aNbyfxwQpqbE+l36CxhZVzFKphYU56anFpsWGOWlliPH+CZGcNrW8trB+PDBB71DjEwcjIcY
 JTiYlUR4lxq9TRDiTUmsrEotyo8vKs1JLT7EaAqMrYnMUqLJ+cDMkVcSb2hqZGZmYGlgamxh
 ZqgkzruU/VCCkEB6YklqdmpqQWoRTB8TB6dUA9PWc02n5P9Oudd58nmy7pEvH7edf1D1mXMG
 e9yiYsPG03fZI+onpQrnT0g55rvk5July9xeVPUVn9rZkBn/zENlV5XckpfKoveyZux6FOOW
 c/jx6k8WZ3TO5gmpcL+Xjo0P7Er5Ht71VUIifW7vB52J8w03nknlOaz2cmXmWff/q43ENrs8
 fPQhWGLXTusd55oLLrLw5F89E9DFrej/vcH6Ubz8ZxE3xlsMJr9bb7lYr7DIlVoa18f/Kvec
 b7u6jtABoSUvN+cKvDI/V+F5a6Hus30fGROWT7/qol2f0qjAsma3lFVQ5IbNLNdVqx/MPd+g
 svH+w007/ugePvr710eni6Kzyg8kin99sjNs2SxLJZbijERDLeai4kQAAD0rzmQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSnO5P5Q8JBkt/Gli8/fqAzeLK/vOM
 FvsPfmO1eHznM7vF0vn6Ficb97BaTDp0jdFiycVUiymNt9kt1rxQtph3S9niypRFzBaz3rWz
 WRzv3cFi8XrSf1aLm81P2RwEPH6ca2fzOLfjPLvHplWdbB4ndr5g8XhybTOTx/t9V9k8+ras
 Ygxgj+KySUnNySxLLdK3S+DK+Dejg6VgP0vFxVUrWBsYLzB3MXJwSAiYSNz55N/FyMUhJLCD
 UWLxiwagOCdQXFpi38PrLBC2sMTKf8/ZIYqeMEp0dTxiA0mwCKhKrGybxw4yiE3ASOJ7qy1I
 WERAWeLu/JmsIPXMAjeYJBYduww2VFjAWGJu/2J2EJtXQEdi5/z9LBBDdzJK9D68D5UQlDg5
 8wnYZmYBM4l5mx+CXcoMdNHyfxwgYU4BJ4nTHS1gN4gCLTuw7TjTBEbBWUi6ZyHpnoXQvYCR
 eRWjZGpBcW56brFhgVFearlecWJucWleul5yfu4mRnCsaWntYNyz6oPeIUYmDsZDjBIczEoi
 vEuN3iYI8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwORc
 FdKtnb8raKfoieeXfky5cHTR0ZxcKeeknwkPG11Msha5zH/E+ejUljYDm5jV7+b25nuf2bJh
 7SJzneBr1xg/rX8cNjdWq/yqYnU3G89biyPnpjr7+Yrf+LTZfKnFu5PRKz1TXNO215l0fTRP
 Vi+M6T0l9VbHt/TBPXUtPv0mgU18Auoc2bWpWw4GxxzyZGutqtl53Z5fhO1uPl9Rhxm3ctPU
 zeceXDtTnT/J94W8ovgie/UwAfm9zxbM/5lfvUJzdlfTg4m67YtzvFxsThw10wzMr9697Vpg
 OZdt1BZh/fQaoUslV4pnO4SEi74NrWjYuDY9+5Tr78MBjxY3Rr7Lcpj9u2d+cIjy+spMJZbi
 jERDLeai4kQAqGUVbCQDAAA=
X-CMS-MailID: 20210715120305epcas5p33e93af93ad8f089addabe8406bd1a43d
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----lELRu-2e2yn0sCX.oThSrAc35GykH4i.I2Qb2Vr4qO5Up.VP=_90d5b_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26
References: <CGME20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26@epcas5p1.samsung.com>
 <20210709135545.GA11148@test-zns>
 <20210709155842.GA291156@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=p.kalghatgi@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: fam@euphon.net, kwolf@redhat.com, jg123.choi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, linux-nvme@lists.infrared.org, mreitz@redhat.com,
 u.kishore@samsung.com, stefanha@redhat.com, its@irrelevant.dk,
 javier.gonz@samsung.com, prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------lELRu-2e2yn0sCX.oThSrAc35GykH4i.I2Qb2Vr4qO5Up.VP=_90d5b_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Fri, Jul 09, 2021 at 08:58:42AM -0700, Keith Busch wrote:
>On Fri, Jul 09, 2021 at 07:25:45PM +0530, Padmakar Kalghatgi wrote:
>> The following commands are tested with nvme-cli by hooking
>> to the cid of the vsock as shown above and use the socket
>> send/recieve commands to issue the commands and get the response.
>
>Why sockets? Shouldn't mi targets use smbus for that?
>
vsock mimcs the sideband communication, hence we used it.
However, we are working on the smbus/i2c implementation 
for nvme-mi in qemu/nvme-cli, we will send the patch in few days.


------lELRu-2e2yn0sCX.oThSrAc35GykH4i.I2Qb2Vr4qO5Up.VP=_90d5b_
Content-Type: text/plain; charset="utf-8"


------lELRu-2e2yn0sCX.oThSrAc35GykH4i.I2Qb2Vr4qO5Up.VP=_90d5b_--

