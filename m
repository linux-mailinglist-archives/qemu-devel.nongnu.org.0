Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A224359C66
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 12:55:04 +0200 (CEST)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUon0-0001Tw-UA
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 06:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lUomC-0000zq-RK
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:54:12 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:44515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lUom9-0007vk-0Q
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 06:54:12 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210409105359epoutp03fc62c83d92a2a610b0beb2a5631eb409~0Ky1AWJIT3242432424epoutp03P
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 10:53:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210409105359epoutp03fc62c83d92a2a610b0beb2a5631eb409~0Ky1AWJIT3242432424epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617965639;
 bh=Nr9GzAsnLm/AZYr5F+rbWFEF/62aFQLur39V9qWJ8eQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tuEk79Sp2/YXpc9G834yFOoHl8kehQtXpa5lCSMu9DH/hR89WSi9SAnDEdzUUPk5X
 myI0DLuhV3EfdmZ+Nd/2jdPrXr5jfF1djjKlM9sHztaoeUkbwRXe1xpwZw0aOMpqhz
 XfZhyDyOXTyPyAuEdPCjSTfqE3M7fZfqSATVtpxg=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210409105358epcas5p2443169b0f4dac67ab3bed4af0f05c3dd~0Ky0e40G10657906579epcas5p2I;
 Fri,  9 Apr 2021 10:53:58 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 22.1D.39068.64230706; Fri,  9 Apr 2021 19:53:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210409085110epcas5p3ffa5c8e29551822c0a28093af48540c4~0JHl6erB52243022430epcas5p37;
 Fri,  9 Apr 2021 08:51:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210409085110epsmtrp2c4d912eedc1931b13ee1ec0389820562~0JHl5zdvt2340523405epsmtrp2O;
 Fri,  9 Apr 2021 08:51:10 +0000 (GMT)
X-AuditID: b6c32a4a-625ff7000000989c-40-60703246e734
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 33.EB.08745.E7510706; Fri,  9 Apr 2021 17:51:10 +0900 (KST)
Received: from 2030045822 (unknown [107.99.42.33]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20210409085109epsmtip1f35ef60a43156701182bc8d1a841521c~0JHktwjJi2653626536epsmtip1T;
 Fri,  9 Apr 2021 08:51:08 +0000 (GMT)
Date: Fri, 9 Apr 2021 14:18:13 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/2] hw/block/nvme: store aiocb in compare
Message-ID: <20210409084813.GA6083@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210408193709.435939-1-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7bCmuq6bUUGCwcqDJhb7D35jtTjZuIfV
 YtKha4wWSy6mWsy7pWwx6107m8Xx3h0sDuwe53acZ/fYtKqTzePJtc1MHu/3XWXz6NuyijGA
 NYrLJiU1J7MstUjfLoEr49WdP6wFa7kretbaNDDu4Oxi5OSQEDCRmN/wlqmLkYtDSGA3o8Sr
 hudsEM4nRokPpxpYIJzPjBLL5x5gh2l58nM7O0RiF6PE6/+HmUESQgLPGSWmvw8EsVkEVCSm
 /r7LCGKzCRhJzH77BswWAYo//beXBcRmFtgBtG8VWFxYwE5ix8wOJhCbV0BPYsKCNYwQtqDE
 yZlPwOo5BSwkbs49B2aLCihLHNh2HOxuCYGf7BLXbh9igrjORWLr78MsELawxKvjW6CulpL4
 /G4v0G/sQHa1xOEiiNYORoljlzewQZTYS/x7No0R4rYMicu/7kDFZSWmnlrHBBHnk+j9/QRq
 Fa/EjnkwtprEglvfoVbJSMz8c5sVwvaQmLJ8FzR8uxklDn99wTqBUX4Wkt9mIdkHYVtJdH5o
 Yp3FyAFkS0ss/8cBYWpKrN+lv4CRdRWjZGpBcW56arFpgVFearlecWJucWleul5yfu4mRnAS
 0vLawfjwwQe9Q4xMHIyHGCU4mJVEeJub8xOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8+4weBAv
 JJCeWJKanZpakFoEk2Xi4JRqYPKTVbvCU7ive//PyqWfz5VxH11+XvV42YXYq5M2zspaI7ex
 029KHXcrp8f926W5D3/3dJjNSpDc2zuR+/D2jNdZl9jCOhLnKc1aVMe3O3nFyo1nvZ+ez/zw
 o161iLnJLEPpx/1PC/Tj0j7NuDY79jn393PTNM8YZvCcZF6VNf8Un4zKrfN3DEJ83NNilWL9
 N07yrv63tXXHwezPH410YtQuJVwquto3pXDhXo4bCSv+muz5qFub1a3Jb1iSqX/bb9PvrIOV
 pvUGz/+0ptgry2rdag45sX4qn+bLib3SNvx5oqsy2LPW3Ctk6RVIrmKIr5S1ijDY9m37l1f/
 eiOU9S5nrjj4RmT3movajG7NM5RYijMSDbWYi4oTAVMluJmxAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWy7bCSnG6daEGCwcVFnBb7D35jtTjZuIfV
 YtKha4wWSy6mWsy7pWwx6107m8Xx3h0sDuwe53acZ/fYtKqTzePJtc1MHu/3XWXz6NuyijGA
 NYrLJiU1J7MstUjfLoEr4825fsaC+xwVD5Y8YW5gbGHvYuTkkBAwkXjyczuQzcUhJLCDUWLi
 3FuMEAkZiV+npjJD2MISK/89hyp6yijxYm8HG0iCRUBFYurvu2ANbAJGErPfvgGzRYDiT//t
 ZQFpYAaZurH/MStIQljATmLHzA4mEJtXQE9iwoI1YA1CAuYS6y+fhYoLSpyc+YQFxGYWMJOY
 t/kh0BUcQLa0xPJ/HCBhTgELiZtzz4GViAooSxzYdpxpAqPgLCTds5B0z0LoXsDIvIpRMrWg
 ODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzgGtLR2MO5Z9UHvECMTB+MhRgkOZiUR3ubm/AQh
 3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamDY6HF5cppKd
 wfhj/s05xidX1VRbXDb8LjhFzUxgR+/hf8nX3iz67T1Rete9Q//myDe/eBwYLZXx9q7bhaWR
 G9SidxS0VIbaKYpMvMq6/ETJ4Vf8rw75avSdEgu9MWnCp5DvdavWFJ7eZ8voUHx+bkP3g+jT
 jPPF1m1y27/VftkdMY983oAK/uvPpF9Oq6r7ojxpX9zp3vtTmyyu+jJJffo8PUfn35FtmYI/
 npWoP9p6WKhLcIeYkP+j2Bq/s6fEniWLiL9LXC3AfaP63aX5otWsc3Pfl8mrfZpkfn+xX2ix
 R3bP49R8NfvgmodNchOqHzZe+xEYUHXbPJC9aZn0xPjqGJVXW+91Xys6bLnl1EclluKMREMt
 5qLiRADOL7i98AIAAA==
X-CMS-MailID: 20210409085110epcas5p3ffa5c8e29551822c0a28093af48540c4
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_65d0d_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210409085110epcas5p3ffa5c8e29551822c0a28093af48540c4
References: <20210408193709.435939-1-its@irrelevant.dk>
 <CGME20210409085110epcas5p3ffa5c8e29551822c0a28093af48540c4@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_65d0d_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Thu, Apr 08, 2021 at 09:37:08PM +0200, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>nvme_compare() fails to store the aiocb from the blk_aio_preadv() call.
>Fix this.
>
>Fixes: 0a384f923f51 ("hw/block/nvme: add compare command")
>Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 6b1f056a0ebc..94bc373260be 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -2837,7 +2837,8 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
>
>     block_acct_start(blk_get_stats(blk), &req->acct, data_len,
>                      BLOCK_ACCT_READ);
>-    blk_aio_preadv(blk, offset, &ctx->data.iov, 0, nvme_compare_data_cb, req);
>+    req->aiocb = blk_aio_preadv(blk, offset, &ctx->data.iov, 0,
>+                                nvme_compare_data_cb, req);
>
>     return NVME_NO_COMPLETE;
> }
>--

Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

>2.31.1
>
>

------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_65d0d_
Content-Type: text/plain; charset="utf-8"


------rgEYhHy71ys_9Aik3zA05GggeZdzMrLcIo7_3H64ey3n7nJd=_65d0d_--

