Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A073401D6F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:14:39 +0200 (CEST)
Received: from localhost ([::1]:54460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGKU-00039w-Eq
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohit.kap@samsung.com>)
 id 1mNGJM-0002Kw-VL
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:13:28 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:24212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mohit.kap@samsung.com>)
 id 1mNGJI-0002ii-GV
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:13:28 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210906151311epoutp02ce43a3f02d72093a80965d4fc38ae29b~iRF97zh9E1833618336epoutp02d
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 15:13:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210906151311epoutp02ce43a3f02d72093a80965d4fc38ae29b~iRF97zh9E1833618336epoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1630941191;
 bh=L/Dk2aecmW1XBEG797niwF/HDZT9ptt+wA3hKdLdDBA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dDPCxkD/jiwwOdIMApQLVM1D6j3MBQ6T9T9BGtR7/TF+x1QKtM0t4bmQn5b734xXg
 Vkyq/2KiTo72hjztHRsu9li7TSpmBDIwUmPzx3aKgtA1XdBKw3csid1oFUNzf3NwWY
 nyTX2IRl51ZCw2bsSoY+P5wugiw8GrZcd0QxuCkI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210906151310epcas5p21a0e6d6a6edc1a2838839ab2794916e5~iRF80Dfa90586205862epcas5p2D;
 Mon,  6 Sep 2021 15:13:10 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4H3BjX0hKJz4x9Pr; Mon,  6 Sep
 2021 15:13:04 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F9.83.38346.00036316; Tue,  7 Sep 2021 00:13:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210906151053epcas5p184a694196a6e1816061872b50682e3f0~iRD9Jxlm73253532535epcas5p1K;
 Mon,  6 Sep 2021 15:10:53 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210906151053epsmtrp2e838d6e8e896d464aeb27726b5e05cc3~iRD8yJH3j1102111021epsmtrp2l;
 Mon,  6 Sep 2021 15:10:53 +0000 (GMT)
X-AuditID: b6c32a4b-23bff700000095ca-2b-61363000a03e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 5F.3A.08750.D7F26316; Tue,  7 Sep 2021 00:10:53 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210906151051epsmtip12d91ccfda35df8836435cb203cf04801~iRD6wlBFw0309703097epsmtip1G;
 Mon,  6 Sep 2021 15:10:50 +0000 (GMT)
Date: Mon, 6 Sep 2021 19:48:54 +0530
From: Mohit Kapoor <mohit.kap@samsung.com>
To: kbusch@kernel.org, fam@euphon.net, its@irrelevant.dk, kwolf@redhat.com,
 linux-nvme@lists.infradead.org, mreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [RFC PATCH : v3 2/2] Implementation of nvme-mi plugin in nvme-cli
Message-ID: <20210906141854.GD22632@test.sa.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <1627981486-3369-1-git-send-email-mohit.kap@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xbVRj33NveXnB3uZTizhC0KVsmmNJ2a+tlvEzGWBNQwRkXmRm7gWth
 Lb1NW3DOMWEYJ0RIx0vW8doDZFAZg0lwbhCKkTEDjPAwyAIIJermVkaVyECx7fX13+/7fb/f
 +b7vfOfgqPBbLBjPNlgYk4HWSzB/XvdA+AvSp+RqWj5b+DRVO0dRD3+bx6iJvlFA9fWv8qnF
 e24BNVR4k0+VO6YAdXmMoRqalwRU/fdh1HdrCwJqovIiStkencGowdIeHvWgfJNPTRctYS+T
 mt9HzmCakZ5RgaaztRjTdF3+QOOc6kI0rt5JTFN2vRWkCNJ0MVkMncmYxIwhg83MNmhjJUkH
 0/elq9RyhVQRRb0kERvoHCZWkpCcIk3M1ntal4jzaH2uh0qhzWaJLC7GxOZaGHEWa7bEShhj
 pt6oNEaa6RxzrkEbaWAsexVy+W6VR3hUl1XwSTHfOM0/XuS6hxSAVV4JwHFIKmHnpqgE+OFC
 8isAz8+zJcDfg1cArB5pQ7jADeDi6X7Uq/IarBf6UC5xA8Aa+xLGBYUIbCmrBV4Vj9wBL87N
 +DBGRkDbwKbPLSK/BrBuMM1rQMkWAMuvVvO8iUAyBRZVuHw9EaQGNsyd8tIEGQCHzjl9tB+5
 H64PE146yHN85VC3ry4k7+LwXNEXgOsuAVrnm/gcDoT3B68LOBwM3Y9uYdzI70NbO8F5Pwaw
 sWwY4zTxcOzmH4hXg5JZ0F5j4uhQWHWnHfFilNwKS9edCMcTsKfeiXBHhsHmX/UcvR2udFT8
 3YEG/tzSJuCuZxLAisFxvhU8b/vfZLb/qtl8FfbC4uXTfI5+Fn72J87BcHj1hqwR8FvBdsZo
 ztEyZpVxj4F5999lZ7A5ncD3qiOSesDC/HKkAyA4cACIoxIRcXjfblpIZNLvnWBMbLopV8+Y
 HUDlWdRZNDgog/V8C4MlXaGMkivVarUyao9aIdlGSO+H0EJSS1sYHcMYGdM/PgT3Cy5AYsC4
 zBaUmBdaG/1OiqwgPC403rW467yqQDwynC+Y1lkKX02dWE+8PaB8e6Omub/qw/G6ZEsjMvmj
 MGTiOefJlqbYLTPsldWoW2PPvKm+5HxjI/+nb1YOtlSJlprE+LXSmKp0Wjqkmq39MlBXF2Zt
 yAvLf1B9osOxmFw6E+dONWzkJUb0XoqP+3zW8tGpyt5o/7ekd65UV4CAjuMn3aa05Sf140mp
 9jWX5dMEELDNUdx9d+1wzoH+0aOvszzZQ3vnWZFVJaIPNV8LjsbYQ1uedB1BHmfaZa9IXwt5
 XCnv7Wp78ZeFBkpLsLfhMV2QM2PHD3n2qfYjkcTWncek+4d3aSU8cxatiEBNZvovIILWgF4E
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSnG6tvlmiwckWZYs59y0s3n59wGZx
 Zf95Rov9B7+xWjy+85nd4mTjHlaLSYeuMVosuZhqMX/ZU3aLebeULa7/fMRucWXKImaLWe/a
 2SyO9+5gsXg96T+rxc3mp2wOAh4/zrWzeZzbcZ7dY9OqTjaPzUvqPZ5c28zk8X7fVTaPvi2r
 GAPYo7hsUlJzMstSi/TtErgynm2ex1zQzVzxYfdKxgbGQ0xdjJwcEgImEhMW7mfuYuTiEBLY
 wShx+eM8doiEpMT8nTOYIWxhiZX/nrNDFP1nlHh6Zz8jSIJFQEVi0f3bYDabgJbErMP/wSaJ
 CBxhlNi3ZB0LiMMssIJR4tTOO6wgVcICfhIfN+8Bsjk4eAU8JObfr4OYepVRYumLA2A1vAKC
 EidnPmEBsZkFzCTmbX7IDFLPLCAtsfwfB4jJKeAq8fssL0iFKNANU05uY5vAKDgLSfMsJM2z
 EJoXMDKvYpRMLSjOTc8tNiwwykst1ytOzC0uzUvXS87P3cQIjjYtrR2Me1Z90DvEyMTBeIhR
 goNZSYQ32tkoUYg3JbGyKrUoP76oNCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5O
 qQamxaFPpnOnXSoSny4mxLpL+NgUPasjZxYUOHR1aj1+Hv+5wuDpRo5J1x7sDpzqfI9Pzv0d
 01I+9WsTun13vZkmVP/V6uOc5qMByftU1eLC2MIu3Wx369jhfi/06YorP+M/vvY/9+lr2HFl
 z5WLGeJ36R43PnG+m99/ftA/R+0uW8ePPfcX+vAs27tH1S5duSg+p2ZBSe6i44qnLFfPC/N+
 KZB6m1/CaMr9PauOP/RT85k14+PR27UX27ddcU4179u7Qq9nb52tY0bIqsTf+1wbmmolvghv
 rp3Sf2mKpK9kgPrsX/7hrvnTOJcousV41O3jSHLRjTzO+Cu1v/hNXmz29PTKF1wnjU+ev2J1
 eYOYEktxRqKhFnNRcSIAfpTsqSUDAAA=
X-CMS-MailID: 20210906151053epcas5p184a694196a6e1816061872b50682e3f0
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----U8CIXdF52oAoGeRkYVEVeH2qRGPDUYqN5.u0c97gxHEcYtzV=_57908_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210803094723epcas5p323efa7e40e3d843ff8b91507c48edd17
References: <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
 <CGME20210803094723epcas5p323efa7e40e3d843ff8b91507c48edd17@epcas5p3.samsung.com>
 <1627981486-3369-1-git-send-email-mohit.kap@samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=mohit.kap@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: arun.kka@samsung.com, k.jensen@samsung.com, d.palani@samsung.com,
 u.kishore@samsung.com, p.kalghatgi@samsung.com, javier.gonz@samsung.com,
 prakash.v@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------U8CIXdF52oAoGeRkYVEVeH2qRGPDUYqN5.u0c97gxHEcYtzV=_57908_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Tue, Aug 03, 2021 at 02:34:46PM +0530, Mohit Kapoor wrote:
>From: mohit kapoor <mohit.kap@samsung.com>
>
>Subject: [RFC PATCH : v3 2/2] Implementation of nvme-mi plugin in nvme-cli

Hello All,
Request to kindly provide your valuable feedback for the patches shared
for nvme-mi over QEMU and nvme-cli.
Looking forward for any suggestions and improvements.

Regards,
Mohit Kapoor


------U8CIXdF52oAoGeRkYVEVeH2qRGPDUYqN5.u0c97gxHEcYtzV=_57908_
Content-Type: text/plain; charset="utf-8"


------U8CIXdF52oAoGeRkYVEVeH2qRGPDUYqN5.u0c97gxHEcYtzV=_57908_--

