Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5C633F23C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:06:51 +0100 (CET)
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWp0-00062H-5K
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lMSjj-0003js-RI
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:45:07 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:26644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lMSji-0002f2-1v
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:45:07 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210317094502epoutp04c18f4426537b95b914e158dc00450804~tGBEHHkwI2939429394epoutp04z
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:45:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210317094502epoutp04c18f4426537b95b914e158dc00450804~tGBEHHkwI2939429394epoutp04z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1615974302;
 bh=pKLbBdetAKtFKcLganp3qPYfAYm6FTiiN+Ia+Mqeigc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z3MwaEyhDDwqsV6yh0H/Kw0s1XOgfYS8b9LP7Sj4daM/RbY3E3Ju6CqaM3gm4tuM2
 6ETL/XR/rCOLd8BDXj84+WiLpguVqonubUxOJI5H6CeVmMsJa0wRbsocF9aL23stiJ
 VQR/ZbnbK/NIYGypkk0tJFWyvGa0tgRTWWS3sEs8=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210317094501epcas5p26a86ec1d59091f8a487cac4758580723~tGBDaaJKY0946609466epcas5p28;
 Wed, 17 Mar 2021 09:45:01 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.4A.50652.D9FC1506; Wed, 17 Mar 2021 18:45:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210317093452epcas5p1be6015c3cec5c7c8a82c779f511d8bd0~tF4Lfa4-O1374413744epcas5p18;
 Wed, 17 Mar 2021 09:34:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210317093452epsmtrp2a9253ba9068d700499f658e510feae62~tF4LehiWL0325403254epsmtrp2O;
 Wed, 17 Mar 2021 09:34:52 +0000 (GMT)
X-AuditID: b6c32a4a-6b3ff7000000c5dc-42-6051cf9d01a6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BF.D1.13470.C3DC1506; Wed, 17 Mar 2021 18:34:52 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210317093450epsmtip2f6de6eaa75012dfac657eedbc3ae3b55~tF4J7vsbr3109231092epsmtip2N;
 Wed, 17 Mar 2021 09:34:50 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: align reserved fields declarations
Date: Wed, 17 Mar 2021 15:00:06 +0530
Message-Id: <20210317093006.31404-2-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317093006.31404-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOIsWRmVeSWpSXmKPExsWy7bCmlu7c84EJBrf3m1i83nmc2eLK/vOM
 FvsPfmO1ONm4h9Vi0qFrjBZLLqZazLulbDHrXTubxfHeHSwWryf9Z3Xg8vhxrp3N49yO8+we
 m1Z1snk8ubaZyeP9vqtsHn1bVjEGsEVx2aSk5mSWpRbp2yVwZcxq7mIpeMFScWqOTAPjeeYu
 Rk4OCQETiZVn25m6GLk4hAR2M0qc+7+XBcL5xCjR/H8NlPONUeLs54OMMC1vly1jhUjsZZR4
 9Po/O4TTySQxZ+8fdpAqNgEjidlv34B1iAhISvzuOs0MUsQscJFR4uSzpWwgCWEBN4mVTUeZ
 QGwWAVWJt2/mgsV5BWwlVsw9wAaxTl5i9YYDYNdyCthJvLxzjQUifo9d4v1tKNtF4ufEbVD1
 whKvjm9hh7ClJD6/2wsUZweyqyUOF4GcICHQwShx7PIGqHJ7iX/PpgHdyQF0m6bE+l36EGFZ
 iamn1oFdxizAJ9H7+wkTRJxXYsc8GFtNYsGt71CbZCRm/rnNCmF7SDT134OGyURGiZ6OP2wT
 GOVmIaxYwMi4ilEytaA4Nz212LTAKC+1XK84Mbe4NC9dLzk/dxMjOG1oee1gfPjgg94hRiYO
 xkOMEhzMSiK8pnkBCUK8KYmVValF+fFFpTmpxYcYpTlYlMR5dxg8iBcSSE8sSc1OTS1ILYLJ
 MnFwSjUw8T96synhWc4u30M8Qr+u+32TumHp13Mmeb3X0abC7Xc4r+n+bllSuPAOz6JjnQl9
 O60lvq9T7rTXV5MVbrm1Xf7wpK//D/Z2aFtcdt6zXE9qogNnLMvK8GyuYxL2wYLPNu1V33/0
 0+/XHJp9HIweYVVtz8Jmn1phMHn5SZ+oh317q0Kd8895fV8atX6766fadO/k1AKRQ1NPi6qf
 snFLv6d4u/5kz79tK/PONArcV7NQ3hC+RDyna45B3yyDDCHJxLJoveAsM1NF3fIUtesf94c6
 Tmy4lbNxY/j0DQsOJ8xKbVtdmsK/49H6teutrUSUjT+arTlRYBKe5f1z6ZPvdToSthsvFEtu
 svn9v9BUiaU4I9FQi7moOBEAKxJqlYoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFLMWRmVeSWpSXmKPExsWy7bCSvK7N2cAEgyf9LBavdx5ntriy/zyj
 xf6D31gtTjbuYbWYdOgao8WSi6kW824pW8x6185mcbx3B1DppP+sDlweP861s3mc23Ge3WPT
 qk42jyfXNjN5vN93lc2jb8sqxgC2KC6blNSczLLUIn27BK6MWc1dLAUvWCpOzZFpYDzP3MXI
 ySEhYCLxdtky1i5GLg4hgd2MEtemTWaBSMhI/Do1FapIWGLlv+fsEEXtTBIzrt9gAkmwCRhJ
 zH77hhHEFhGQlPjddZoZpIhZ4C6jxKo5+8C6hQXcJFY2HQVrYBFQlXj7Zi4biM0rYCuxYu4B
 NogN8hKrNxwAq+cUsJN4eeca2BVCQDVHuzcxTWDkW8DIsIpRMrWgODc9t9iwwDAvtVyvODG3
 uDQvXS85P3cTIzg4tTR3MG5f9UHvECMTB+MhRgkOZiURXtO8gAQh3pTEyqrUovz4otKc1OJD
 jNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamGy0NGRDd3w/EWM5WaTnxHwXvvYcneY7
 25e8MhMxlz942WSGtOYfD5HAp0qqIYZqj29sEhNuXVHktdWBvV27t3zxPJ6yt+75kmGR/LsK
 uy1qrqTpeHzSzv7JMi1y7kTRyeo3k05qb4vRYJicpbxy+pFFD4S+ftdILdObvkaopYnP/YVj
 3Is2+evGigHcF/hlJQNa91Q+Pjs3cdYuXmEeTZd6reOP3ZyOvnJLnbPC7/CL/EbnfXpvCqq3
 imj9/n/pbPv7lULLVy73mypufyru3gzt25K2++weH9y+tDRqd/SPpMMmrUf1Bc3Zv3sIzj4b
 qDnvUF1siZHU9d+tf/8we2aW7J11OOTdKvPLvvwqSizFGYmGWsxFxYkAb6g8Rr0CAAA=
X-CMS-MailID: 20210317093452epcas5p1be6015c3cec5c7c8a82c779f511d8bd0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210317093452epcas5p1be6015c3cec5c7c8a82c779f511d8bd0
References: <20210317093006.31404-1-anaidu.gollu@samsung.com>
 <CGME20210317093452epcas5p1be6015c3cec5c7c8a82c779f511d8bd0@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Mar 2021 10:04:51 -0400
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
 k.jensen@samsung.com, Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 mreitz@redhat.com, its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Align the Reserved fields declaration in NvmeBar

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 include/block/nvme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index fc65cfcb01..e5bd00bb85 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -7,7 +7,7 @@ typedef struct QEMU_PACKED NvmeBar {
     uint32_t    intms;
     uint32_t    intmc;
     uint32_t    cc;
-    uint32_t    rsvd1;
+    uint8_t     rsvd24[4];
     uint32_t    csts;
     uint32_t    nssrc;
     uint32_t    aqa;
-- 
2.17.1


