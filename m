Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81259361E45
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 12:54:28 +0200 (CEST)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXM7H-00064Y-LE
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 06:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXM6I-0005d0-8b
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 06:53:26 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:54318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXM6D-0003jp-51
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 06:53:26 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210416105314epoutp03c53f67a4914fe91d7a52fe9ee2115ade~2UTK9uLlg1170711707epoutp03j
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:53:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210416105314epoutp03c53f67a4914fe91d7a52fe9ee2115ade~2UTK9uLlg1170711707epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618570394;
 bh=FkAX3IOZTFAhEGWMl8ZXGo5DDtyvNp+iO8Rnjr7ou2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YS9kc84dRaVoB6aL1ExK0ZcTR5fYMiCkaEm4ot6VZWz7VFG7MQY3WEP9eJFxAPH98
 ydylgIN9Gbva1sM4UqET/wwGm/KIrubaIteBLqWmnk9UNyqyCrIiYIF7/l0tEz7Amk
 IxiVTURULiVLrzWewoCUxqGuMS5LaQgBbfBiWWEs=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210416105314epcas5p3550bb6d91d43bc184397ee4d5ad84625~2UTKpVi-U0435804358epcas5p35;
 Fri, 16 Apr 2021 10:53:14 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8A.3F.15682.99C69706; Fri, 16 Apr 2021 19:53:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210416105256epcas5p21ba81ec010fd980eb9e99e5ad92c35d5~2US51pGXJ2504425044epcas5p2S;
 Fri, 16 Apr 2021 10:52:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210416105256epsmtrp2d266ed1d403e8c8bd06d50e2ef5a52f5~2US50bxKm2903729037epsmtrp2N;
 Fri, 16 Apr 2021 10:52:56 +0000 (GMT)
X-AuditID: b6c32a49-8d5ff70000013d42-04-60796c99bf76
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 28.B1.08745.78C69706; Fri, 16 Apr 2021 19:52:55 +0900 (KST)
Received: from 2030045822 (unknown [107.99.42.33]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20210416105254epsmtip27ad389002bff0907d6a41865b0fb2074~2US4i-3vj2124121241epsmtip2c;
 Fri, 16 Apr 2021 10:52:54 +0000 (GMT)
Date: Fri, 16 Apr 2021 16:20:05 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/block/nvme: fix lbaf formats initialization
Message-ID: <20210416105005.GA26920@2030045822>
MIME-Version: 1.0
In-Reply-To: <YHlPUMYBcnl/Newj@apples.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+3Z2zo6r5edm+KZGsC6glHZnlWiE4MwMiwizYA49eWnOtaNp
 lrCMmFtZamW5QgosyTLNap6MMueNkhSvXcwy04xSs9bFSizdUfC/33t7nvf9+GhCWki603Ha
 JEavVWvklFhorfHyWp6vORS5ovuZn6K9qhkpqqp/kopcWydSFLYwioJXixSWYSOlaMjihIrP
 uf/ITbRytMlIKZu4ZpGyvNhEKfs67wiUXx51UGFkhNgvmtHEHWT0vv6R4thB6wtKV7QgtXGk
 gjSgJ65m5EQDXgM5X3pIMxLTUvwAwdWOPCEffEPwsjlTxAd2BCXXzwqnR2wl5xFfqERwy5hL
 8MEAgq6uDEeXEC+B/rd15CRTeBVcHBpEk+yKF0P/+EOHB4FzEHBZY5QZ0bQMB0Fnr/dkjwT7
 Qubn5yTPLvAkv8+h6TShc6LX6NCZhxfBY2uDYFIHsImG8hMcwa8XCAXGNhHPMvjUcHeK3cE+
 /HDCSzTBh6FGz49mIqhvK6P4lgAY/5Dn0CdwLBiqPkxdvADOPb0l4PNzIetvn4DPS4ArmOal
 cPnVrykrT8gf6yJ5VgLXW+/IS/EQgpZ2z2y00DLjNMsMO543gGkkg7RMvAqBPaBonObRC0or
 fS8jshjNZ3RsQgzDrtWt1DIpPqw6gU3WxvhEJSaUI8dH8g7mUHfPiI8NCWhkQ0ATclfJalNq
 pFQSrT6UxugTVfpkDcPakActlLtJuBU9KimOUScx+xlGx+inqwLayd0giEqVtyTNss4XWYtb
 Au8Rod3mY19LSp2xy97xxAj/d40e6eE37Vs2WipCLggGKt6vdw9X78muC9tcPqprPFVURgQP
 npbOlo+lBw+I969f0tS1zZ49fEDbemzr7urN/bfZdZKTdYvf+L8OZVN+BbyMvla2LiNm3oMo
 l5OakAyl27lTRq6h9l18MeGc3mYIdwsfzsF5a6/eSzpS/fGryrKvcPvRgKzg0t07rwypUE36
 kRv9QWlE3PI2VYTMfkAW7Rc6Bzf/TAk09ZbV+quH+rp/tO56O9fgXGq6kqOVfQuL/15VOxoS
 6RuiEmmD4pMvtf6uv7+s8HjgjjMvEoKupZWYKs1/5EI2Vr3Sm9Cz6v/DV+4KtwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSvG57TmWCwcMec4sr+88zWuw/+I3V
 YtKha4wWSy6mWsy7pWwx6107m8Xx3h0sFq8n/Wd14PD4ca6dzePcjvPsHptWdbJ5PLm2mcnj
 /b6rbAGsUVw2Kak5mWWpRfp2CVwZV+5cYym4KVWx9e8K9gbGqUJdjJwcEgImEofWTmfsYuTi
 EBLYwSjxZUM3E0RCRuLXqanMELawxMp/z9khip4ySuzsfM8GkmARUJV4ev8oK4jNJmAkMfvt
 G0YQW0RAReLpv70sIA3MAhMZJXb0/gFq4OAQFnCXuPZIC6SGV0BfouP1dVaIoW8ZJe49WcEI
 kRCUODnzCQuIzSxgJjFv80NmkF5mAWmJ5f84QMKcQLu6H7WDlYsKKEsc2HacaQKj4Cwk3bOQ
 dM9C6F7AyLyKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4GrS0djDuWfVB7xAjEwfj
 IUYJDmYlEV7jzooEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZ
 ODilGpgU1y29yRt8Wrv/a+Sy4K9dWle1Pb9Yrzg87aO8bobdHqEAA6M/j48c8X9j+Oq+ktWM
 h6sPX9s6QTezVP/Qt7VzprSYWaQfSHyUqHZf77p35nuB9feE5/ow+orXL7s4w+hawbPXF2Yr
 9fyylQy7y/1r+qybBwuUmK4KXTht7DbDT8Pz8uIDsaKu5Y1dljsU9SOqX2/Te37JfKtGZWqb
 hqJDSqiht/v8yvx/t1NPlXglc75ac8XVaG71e8+q9QvXhbw4Ole7ymk5R89eobgznFbP2d0m
 RtmX7EmdtGzplKuSk2zUp6b+PbtTa0XLrt9aP0/JfNevUZd96K02Rbk1uGGNXqSH9kd2wQWP
 pHXOX5dWYinOSDTUYi4qTgQA/AY9k/UCAAA=
X-CMS-MailID: 20210416105256epcas5p21ba81ec010fd980eb9e99e5ad92c35d5
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----9CMuN9iDGEr79_UZ9KBz13DO6G9EfLQokAV6LaKoO8yZ8pVk=_903e3_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210416072544epcas5p26bf011c82ad4b60693cfaac32bc9e36f
References: <20210416072234.25732-1-anaidu.gollu@samsung.com>
 <CGME20210416072544epcas5p26bf011c82ad4b60693cfaac32bc9e36f@epcas5p2.samsung.com>
 <20210416072234.25732-2-anaidu.gollu@samsung.com>
 <YHlPUMYBcnl/Newj@apples.localdomain>
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------9CMuN9iDGEr79_UZ9KBz13DO6G9EfLQokAV6LaKoO8yZ8pVk=_903e3_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Fri, Apr 16, 2021 at 10:48:16AM +0200, Klaus Jensen wrote:
>On Apr 16 12:52, Gollu Appalanaidu wrote:
>>Currently LBAF formats are being intialized based on metadata
>>size if and only if nvme-ns "ms" parameter is non-zero value.
>>Since FormatNVM command being supported device parameter "ms"
>>may not be the criteria to initialize the supported LBAFs.
>>
>>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>---
>>hw/block/nvme-ns.c | 48 ++++++++++++++++++----------------------------
>>1 file changed, 19 insertions(+), 29 deletions(-)
>>
>>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>>index 7bb618f182..573dbb5a9d 100644
>>--- a/hw/block/nvme-ns.c
>>+++ b/hw/block/nvme-ns.c
>>@@ -85,38 +85,28 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>>    ds = 31 - clz32(ns->blkconf.logical_block_size);
>>    ms = ns->params.ms;
>>
>>-    if (ns->params.ms) {
>>-        id_ns->mc = 0x3;
>>+    id_ns->mc = 0x3;
>>
>>-        if (ns->params.mset) {
>>-            id_ns->flbas |= 0x10;
>>-        }
>>+    if (ms && ns->params.mset) {
>>+        id_ns->flbas |= 0x10;
>>+    }
>>
>>-        id_ns->dpc = 0x1f;
>>-        id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
>>-
>>-        NvmeLBAF lbaf[16] = {
>>-            [0] = { .ds =  9           },
>>-            [1] = { .ds =  9, .ms =  8 },
>>-            [2] = { .ds =  9, .ms = 16 },
>>-            [3] = { .ds =  9, .ms = 64 },
>>-            [4] = { .ds = 12           },
>>-            [5] = { .ds = 12, .ms =  8 },
>>-            [6] = { .ds = 12, .ms = 16 },
>>-            [7] = { .ds = 12, .ms = 64 },
>>-        };
>>-
>>-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>>-        id_ns->nlbaf = 7;
>>-    } else {
>>-        NvmeLBAF lbaf[16] = {
>>-            [0] = { .ds =  9 },
>>-            [1] = { .ds = 12 },
>>-        };
>>+    id_ns->dpc = 0x1f;
>>+    id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
>
>While nvme_ns_check_constraints() will error out if pi is set and the 
>metadata bytes are insufficient, I don't think this should set bit 3 
>unless both metadata and pi is enabled. It's not against the spec, but 
>it's just slightly weird.

okay, will modify current "ms" and "pi" constraint check like this:
if (ns->params.ms < 8) {
        if (ns->params.pi || ns->params.pil || ns->params.mset) {
            error_setg(errp, "at least 8 bytes of metadata required to enable "
                    "protection information, protection information location and "
                    "metadata settings");
            return -1;
        }
}
and "mset" is set will set directly without checing "ms" in nvme_ns_init()
>
>>
>>-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>>-        id_ns->nlbaf = 1;
>>-    }
>>+    NvmeLBAF lbaf[16] = {
>>+        [0] = { .ds =  9           },
>>+        [1] = { .ds =  9, .ms =  8 },
>>+        [2] = { .ds =  9, .ms = 16 },
>>+        [3] = { .ds =  9, .ms = 64 },
>>+        [4] = { .ds = 12           },
>>+        [5] = { .ds = 12, .ms =  8 },
>>+        [6] = { .ds = 12, .ms = 16 },
>>+        [7] = { .ds = 12, .ms = 64 },
>>+    };
>>+
>>+    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
>>+    id_ns->nlbaf = 7;
>>
>>    for (i = 0; i <= id_ns->nlbaf; i++) {
>>        NvmeLBAF *lbaf = &id_ns->lbaf[i];
>>-- 
>>2.17.1
>>
>>
>



------9CMuN9iDGEr79_UZ9KBz13DO6G9EfLQokAV6LaKoO8yZ8pVk=_903e3_
Content-Type: text/plain; charset="utf-8"


------9CMuN9iDGEr79_UZ9KBz13DO6G9EfLQokAV6LaKoO8yZ8pVk=_903e3_--

