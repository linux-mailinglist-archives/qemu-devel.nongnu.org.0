Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CC63C6DA1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:38:38 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Es8-0004ap-UU
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1m3Emi-00051P-VH
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:33:00 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:57355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1m3Emg-0002Dw-5k
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:33:00 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210713093248epoutp02a327f725bc5a856290ee9460470a2145~RT_D7NAEt2872328723epoutp02H
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:32:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210713093248epoutp02a327f725bc5a856290ee9460470a2145~RT_D7NAEt2872328723epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1626168768;
 bh=1XKmIfOXwRt4P4VGzZUtnGCPDG/dAydZ9yuByRI/UcY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kb1zr2KYODJ2VU1CuyhNir2opzKM+bx6UZBaFFWoVgOFnn2wtDesfV50M0OPzq9EB
 SKIbUlnHjKM+gb++MVsJTSuy/i8hCd4BbRm7pjbk6N/w4BEajNOWhp8ml5R/rHQ3gi
 JHall64lmji8n1ozc+NqbWHx5nQLaIYvPkipScfM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210713093247epcas5p1a69d2f6b386f3686ab81e4cce627c335~RT_Dlik6i0333003330epcas5p1R;
 Tue, 13 Jul 2021 09:32:47 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.40.192]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4GPFmF3fzNz4x9Pt; Tue, 13 Jul
 2021 09:32:45 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C7.E2.09595.BBD5DE06; Tue, 13 Jul 2021 18:32:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210713093226epcas5p48dda40b1c0b3c76a9cced6b8889dde1d~RT9vrPTCR1928819288epcas5p4O;
 Tue, 13 Jul 2021 09:32:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210713093226epsmtrp13bc5a6af21b86c8be3a3ac2e9ece401d~RT9vqkMkK2109321093epsmtrp1B;
 Tue, 13 Jul 2021 09:32:26 +0000 (GMT)
X-AuditID: b6c32a4a-eebff7000000257b-4b-60ed5dbb879a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BF.12.08289.AAD5DE06; Tue, 13 Jul 2021 18:32:26 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210713093225epsmtip1722af5a5e36d4dcd1ad5333e64669ea7~RT9ulc7tN1260012600epsmtip1b;
 Tue, 13 Jul 2021 09:32:25 +0000 (GMT)
Date: Tue, 13 Jul 2021 14:58:43 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: fix mmio read
Message-ID: <20210713092843.GA13103@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210713054359.831878-1-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmlu7u2LcJBrc7tCz2H/zGanGycQ+r
 xaRD1xgt5px5wGIx6107m8Xx3h0sDmwe53acZ/fYtKqTzePOtT1sHk+ubWby6NuyijGANSrH
 JiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoBCWFssSc
 UqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgaFRgV5xYm5xaV66XnJ+rpWhgYGRKVBlQk5G
 +8nTzAVdghV3m98yNjDu4u1i5OSQEDCRuHN2JVsXIxeHkMBuRonnl2ZDOZ8YJaatncYEUiUk
 8Bkoc1wSpuP+67PMEEW7GCVaVtyD6njFKLGq4wUbSBWLgKrE+T2trCA2m4CRxOy3bxhBbBEB
 FYmn//aygNjMAkuAGh4JgNjCAtoSW24cA+vlFdCXePF7NwuELShxcuYTMJtTwELixOypYHNE
 BZQlDmw7zgSyWELgL7vE1df9LBDnuUj8n9PJBGELS7w6voUdwpaSeNnfBmSzA9nVEoeLIFo7
 GCWOXd7ABlFiL/Hv2TRGiNsyJV5tX8YIEZeVmHpqHRNEnE+i9/cTqPG8EjvmwdhqEgtufYda
 JSMx889toN85gGwPiZuz+SHh080ocb3/CdMERvlZSF6bhWQdhG0l0fmhiXUWUDuzgLTE8n8c
 EKamxPpd+gsYWVcxSqYWFOempxabFhjlpZYjx/cmRnAK1fLawfjwwQe9Q4xMHIyHGCU4mJVE
 eJcavU0Q4k1JrKxKLcqPLyrNSS0+xGgKjKqJzFKiyfnAJJ5XEm9oamRmZmBpYGpsYWaoJM67
 lP1QgpBAemJJanZqakFqEUwfEwenVAMTb94uhY6rM/q+fLoVVCJvWRn0Mn951q0pO3MWTW5l
 Wb6HuyamP8g58c+Fmd9ntUh8Ulz8e1KfqrZ359SMC0eXzZlVf38WX6np+QLZqyLWD/X75c+s
 PL/isFKzJI9PnMaFq80iMrua+BcpL5uowPzGc16XzYJZO97FTJDNe8ulwKL3vsTEbzajZrhb
 Ru76+bsPOId8ns9v7OilvuT5Cft9V8qWlPa+1rTT3NzhO5vj4qu0BYp3GmUfxUrlnvr+jK9H
 h/uxYoRLwvWY4Blfz7c37v/hsKGzTuF1eWnKoS6Jtgv7A/xZNul+ZX8uVFO01iivP4GlxrBj
 k3+eJ/dPv6od1Qpqyz0tA7MPt5R+slFiKc5INNRiLipOBAC57vYiKgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFLMWRmVeSWpSXmKPExsWy7bCSnO6q2LcJBjdeiFrsP/iN1eJk4x5W
 i0mHrjFazDnzgMVi1rt2NovjvTtYHNg8zu04z+6xaVUnm8eda3vYPJ5c28zk0bdlFWMAaxSX
 TUpqTmZZapG+XQJXRseLK6wFO/kq9j94ytTA2MzdxcjJISFgInH/9VnmLkYuDiGBHYwS+z89
 ZoFIyEj8OjWVGcIWllj57zk7RNELRokTl36CJVgEVCXO72llBbHZBIwkZr99wwhiiwioSDz9
 t5cFpIFZYAmjRMeF12ANwgLaEltuHGMDsXkF9CVe/N4Ntk1IwFxi/dJVzBBxQYmTM5+AxZkF
 zCTmbX4IFOcAsqUllv/jAAlzClhInJg9FWyXqICyxIFtx5kmMArOQtI9C0n3LITuBYzMqxgl
 UwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgoNfS2sH455VH/QOMTJxMB5ilOBgVhLhXWr0
 NkGINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGptW6Z1TS
 Vvbs5Sl8JriF34hxOdfLD/IHPHa8mL3cMkGginlHb8cm0avdvDvfRRblvFo0ceOjzRvPrCts
 //8/sqeztt5x7YGdE6YvnfDoy0Qp8YodvZ7Lux6u9pr259zxrTOWfkmMduRuVBdOY7nD38e9
 enLbRotWBzaj1xOmufKV75/50t7vG/N7R3YTkYLgu+kHPn5RFz7i5Lrl3/fGiX+O6kW/z3m1
 YJPVez9bL7H1kuxe7nN/ed/56Sbs3WHB3hJevFq3VmlGzB67tJm3ZvDcFpiXdNUpNE2G9Ulj
 XfsKru1fzOU3ZS6POdPDOp9/989t8zc+Wzrp0Mdkvrt1KbpxGd93TlIMM18xZYLKqzwlluKM
 REMt5qLiRADoUOTu7QIAAA==
X-CMS-MailID: 20210713093226epcas5p48dda40b1c0b3c76a9cced6b8889dde1d
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----w8WoUW9U98ZABCqmfkPgex-0FNLw1A5xJ_YAV6t3erFR02af=_1145c3_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210713093226epcas5p48dda40b1c0b3c76a9cced6b8889dde1d
References: <20210713054359.831878-1-its@irrelevant.dk>
 <CGME20210713093226epcas5p48dda40b1c0b3c76a9cced6b8889dde1d@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------w8WoUW9U98ZABCqmfkPgex-0FNLw1A5xJ_YAV6t3erFR02af=_1145c3_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Tue, Jul 13, 2021 at 07:43:59AM +0200, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>The new PMR test unearthed a long-standing issue with MMIO reads on
>big-endian hosts.
>
>Fix by using the ldn_he_p helper instead of memcpy.
>
>Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>Reported-by: Peter Maydell <peter.maydell@linaro.org>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/nvme/ctrl.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 2f0524e12a36..dd81c3b19c7e 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -5951,7 +5951,6 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
> {
>     NvmeCtrl *n = (NvmeCtrl *)opaque;
>     uint8_t *ptr = (uint8_t *)&n->bar;
>-    uint64_t val = 0;
>
>     trace_pci_nvme_mmio_read(addr, size);
>
>@@ -5977,14 +5976,15 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
>             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
>             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
>         }
>-        memcpy(&val, ptr + addr, size);
>-    } else {
>-        NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
>-                       "MMIO read beyond last register,"
>-                       " offset=0x%"PRIx64", returning 0", addr);
>+
>+        return ldn_he_p(ptr + addr, size);
>     }
>
>-    return val;
>+    NVME_GUEST_ERR(pci_nvme_ub_mmiord_invalid_ofs,
>+                   "MMIO read beyond last register,"
>+                   " offset=0x%"PRIx64", returning 0", addr);
>+
>+    return 0;
> }
>
> static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
>-- 
>2.32.0
>
>
LGTM.

Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>


------w8WoUW9U98ZABCqmfkPgex-0FNLw1A5xJ_YAV6t3erFR02af=_1145c3_
Content-Type: text/plain; charset="utf-8"


------w8WoUW9U98ZABCqmfkPgex-0FNLw1A5xJ_YAV6t3erFR02af=_1145c3_--

