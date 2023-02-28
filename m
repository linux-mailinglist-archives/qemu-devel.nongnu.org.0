Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3746A523A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 05:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWrLH-0003MA-Un; Mon, 27 Feb 2023 23:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pWrLG-0003Le-2B
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 23:11:54 -0500
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pWrLE-0002je-Dq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 23:11:53 -0500
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230228041151usoutp02e0c740c24ec01311a258867fab19439e~H4as4OzeW0127701277usoutp02g;
 Tue, 28 Feb 2023 04:11:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230228041151usoutp02e0c740c24ec01311a258867fab19439e~H4as4OzeW0127701277usoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1677557511;
 bh=PKxD93/IuiUE+sbmSGa2zSz/D7rEohQ/JXFUvo2QpDg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=fyc+9yEH8KCUh2LFdjt8a3mGIuB8mz9vbJqkf8WjhSG2NVIYNV3kIQt2udfJ9XIvC
 ajDd2/aInxSpET4FLlYS3f9Yhy7hNAxWXxckfqHUkn+fiL2QvinYu2FMhhuJ7P8b7I
 AAcvornCIOFJZSVG8HRwIpjHkDUU3214W/yVjLas=
Received: from ussmges3new.samsung.com (u112.gpu85.samsung.co.kr
 [203.254.195.112]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230228041151uscas1p2a2833b5057a7fb9f5dd2639cfac00b18~H4asor2k81075010750uscas1p2G;
 Tue, 28 Feb 2023 04:11:51 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges3new.samsung.com (USCPEMTA) with SMTP id EB.C2.12196.70F7DF36; Mon,
 27 Feb 2023 23:11:51 -0500 (EST)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230228041151uscas1p18d7918f0111d9186a6740c93293a7bc4~H4asZe60C2101521015uscas1p1Q;
 Tue, 28 Feb 2023 04:11:51 +0000 (GMT)
X-AuditID: cbfec370-83dfe70000012fa4-e0-63fd7f07e0c5
Received: from SSI-EX1.ssi.samsung.com ( [105.128.2.146]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 33.E8.17110.60F7DF36; Mon,
 27 Feb 2023 23:11:51 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX1.ssi.samsung.com (105.128.2.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Mon, 27 Feb 2023 20:11:50 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Mon,
 27 Feb 2023 20:11:50 -0800
From: Fan Ni <fan.ni@samsung.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Michael Tsirkin
 <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v4 04/10] hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
Thread-Topic: [PATCH v4 04/10] hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
Thread-Index: AQHZSyrIdxXSteWDYEODI634hJSBfw==
Date: Tue, 28 Feb 2023 04:11:50 +0000
Message-ID: <20230228041150.GD1339780@bgt-140510-bm03>
In-Reply-To: <20230206172816.8201-5-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C0E8FBACAC5C8D4CBF42A4A7CFFBC57A@ssi.samsung.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djX87rs9X+TDe5cEbVonryY0eLFn+dM
 FvufPmexWLXwGpvF+VmnWCwObzzDZPH/1ytWizUrhC2O9+5gceD02DnrLrtHy5G3rB6L97xk
 8ti0qpPN4861PWweT65tZvJ4v+8qm8fnTXIBHFFcNimpOZllqUX6dglcGR2H/7MVtElWzL+7
 j6mB8Y1wFyMHh4SAicSy1ypdjFwcQgIrGSWe7mxnhnBamSRWzD7B2MXICVZ04EY7E0RiLaPE
 6+l3mEESQgKfGCVaZ2ZCJJYxStzbsQ4swSagKLGvazsbiC0iYCTx7sYkRpAiZoEvTBJT725k
 AUkIC/hI/Lw6mQWiyF9i7aLT7BC2nsSlJe/ZQO5jEVCVOLs6BSTMK2AmcfDTCxaQMKeAg8Sj
 M7YgYUYBMYnvp9YwgdjMAuISt57MZ4I4WlBi0ew9zBC2mMS/XQ/ZIGxFifvfX7JD1OtJ3Jg6
 hQ3CtpO4ePodC4StLbFs4WtmiLWCEidnPmGB6JWUOLjiBgvIKxIC/zkk5hx8xQwJRheJe1MT
 IWqkJf7eXcYEEU6WWPWRCyKcIzF/yRaoMdYSC/+sZ5rAqDILydWzkFw0C8lFs5BcNAvJRQsY
 WVcxipcWF+empxYb56WW6xUn5haX5qXrJefnbmIEJrLT/w4X7GC8deuj3iFGJg7GQ4wSHMxK
 IrwLb/9JFuJNSaysSi3Kjy8qzUktPsQozcGiJM5raHsyWUggPbEkNTs1tSC1CCbLxMEp1cDU
 /e1n1LyfH+41XT47xW+Cg0p1SaW2i8CFHcF979OuyZvaOD1ILnQ5n8F0+ujM3dcqIw7IbXw6
 TXpZi2Cgw3T+sDphma7sL/kLS8/cfLHjedhrq9fGj3oqfY5eOhrtGzDro7vjkVVTvnxzXP//
 Z8tfH597k2Ltl65s61ez55522f+9vEnngn0ysik57fvYjlYXXlzWr+aoUfFido3uxP+Sd2wS
 f+z5PT90+nqr5wrZG+7M95L+GsbWfTBhM1fgAnFOozC+Jc7irW46OtwM22WUdDIXb5p//dzP
 qRJlzxuLJp03OJnYpON4t8OD7dKut1YWFU9ib5vf9puZvv1x9XHuzN3iF+frz2ZrFC17lBqt
 xFKckWioxVxUnAgAU+3jztMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+85tR+vEaa72aVBsZYrWsjQ7ZEUF0uliGEGhUjbcSSWdsqPd
 CBrZ1ajMW7ZmZorotPJCqDC2mkU1F5rRGrUh1cJ7apqmmNY6BPvv977v8zzf98JLouLPWACZ
 qs7iNGplmpzwxVK1SP4a0bnfSWF5LozJKagATO9MD8KYv/VgjKHcTjAdOivGtDXYEGZuuh9n
 6qr9mJfXW7BtPmyrziViLzwfwtkKYx/CNhquEqzTbiRYt70JYYdN7wl2rHFZLBnvu1nFpaWe
 4DRrtx71TbnSNkdkXvI/VeYyIVow6JcLfEhIR8CnjstILvAlxXQtgBcHC3Gh+AGgsWuKEIoq
 AJ3mWtRjIWgZNOU2Ex6W0Ovhd0c+8IhQehyBjpFJzDPwo/fCqfcFmCCKgaX2D7jACthVOfzX
 TJIYHQjf1Ko8bYqOhM9+9P6Ti+lseMfyCPNIfOht8Itti6cN6CVw0lqHeBilpfCjuwwRNqBh
 pbEDFXgx7Ps6iwssg92TfSJBr4COokJC4K3wbft3TOBQWFU+gApfWARf33FjgtcfPqt2YHkA
 6rye03lF6byidF5ROq+o+wA3AGk2z6cnn+LXq7mTCl6ZzmerkxVJGemN4O8VtM+2JbSATx9H
 FRaAkMACIInKJVT5p5kkMaVSnj7DaTISNdlpHG8BS0lMLqX64m8liulkZRZ3nOMyOc3/KUL6
 BGiRa+uMcYf0e/EoYkzrDIacdVH39IVdq8e0YadN1LmgTaz/9VBmYUq0U+XXQ1iMkpGDKyf2
 rCqRj/7auaDgrLlEFFU87JZezIg8EhLBSJvdPdTDcUlU+8Pw25H6/ZJwlw0sb9hwSPJ7w5Fu
 s8jWnzMapK/kAxwrZoNYe2niPdnJesuDikCCmSj+EOuydpZKe/FjioiykcdDyua4JwMGauoB
 d7Ml+tU7VUf3vPqY5xQ1E5pTbAqsebExrvmGGd1fGFJD1ASbgpvm+Fmn6/COzhnZRvGZs9tj
 rM778UUJm92t+87jNbqJkPA22wGbfr7KsGx38k9Z06vYzvG702o5xqco14WgGl75BxjcYf50
 AwAA
X-CMS-MailID: 20230228041151uscas1p18d7918f0111d9186a6740c93293a7bc4
CMS-TYPE: 301P
X-CMS-RootMailID: 20230228041151uscas1p18d7918f0111d9186a6740c93293a7bc4
References: <20230206172816.8201-1-Jonathan.Cameron@huawei.com>
 <20230206172816.8201-5-Jonathan.Cameron@huawei.com>
 <CGME20230228041151uscas1p18d7918f0111d9186a6740c93293a7bc4@uscas1p1.samsung.com>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=fan.ni@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 06, 2023 at 05:28:10PM +0000, Jonathan Cameron wrote:
> From: Gregory Price <gourry.memverge@gmail.com>
>=20
> Remove usage of magic numbers when accessing capacity fields and replace
> with CXL_CAPACITY_MULTIPLIER, matching the kernel definition.
>=20
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20

Reviewed-by: Fan Ni <fan.ni@samsung.com>

> ---
> v2:
> Change to 256 * MiB and include qemu/units.h (Philippe Mathieu-Daud=E9)
> ---
>  hw/cxl/cxl-mailbox-utils.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index bc1bb18844..3f67b665f5 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -12,8 +12,11 @@
>  #include "hw/pci/pci.h"
>  #include "qemu/cutils.h"
>  #include "qemu/log.h"
> +#include "qemu/units.h"
>  #include "qemu/uuid.h"
> =20
> +#define CXL_CAPACITY_MULTIPLIER   (256 * MiB)
> +
>  /*
>   * How to add a new command, example. The command set FOO, with cmd BAR.
>   *  1. Add the command set and cmd to the enum.
> @@ -138,7 +141,7 @@ static ret_code cmd_firmware_update_get_info(struct c=
xl_cmd *cmd,
>      } QEMU_PACKED *fw_info;
>      QEMU_BUILD_BUG_ON(sizeof(*fw_info) !=3D 0x50);
> =20
> -    if (cxl_dstate->pmem_size < (256 << 20)) {
> +    if (cxl_dstate->pmem_size < CXL_CAPACITY_MULTIPLIER) {
>          return CXL_MBOX_INTERNAL_ERROR;
>      }
> =20
> @@ -283,7 +286,7 @@ static ret_code cmd_identify_memory_device(struct cxl=
_cmd *cmd,
>      CXLType3Class *cvc =3D CXL_TYPE3_GET_CLASS(ct3d);
>      uint64_t size =3D cxl_dstate->pmem_size;
> =20
> -    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> +    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
>          return CXL_MBOX_INTERNAL_ERROR;
>      }
> =20
> @@ -293,8 +296,8 @@ static ret_code cmd_identify_memory_device(struct cxl=
_cmd *cmd,
>      /* PMEM only */
>      snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
> =20
> -    id->total_capacity =3D size / (256 << 20);
> -    id->persistent_capacity =3D size / (256 << 20);
> +    id->total_capacity =3D size / CXL_CAPACITY_MULTIPLIER;
> +    id->persistent_capacity =3D size / CXL_CAPACITY_MULTIPLIER;
>      id->lsa_size =3D cvc->get_lsa_size(ct3d);
> =20
>      *len =3D sizeof(*id);
> @@ -314,14 +317,14 @@ static ret_code cmd_ccls_get_partition_info(struct =
cxl_cmd *cmd,
>      QEMU_BUILD_BUG_ON(sizeof(*part_info) !=3D 0x20);
>      uint64_t size =3D cxl_dstate->pmem_size;
> =20
> -    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
> +    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
>          return CXL_MBOX_INTERNAL_ERROR;
>      }
> =20
>      /* PMEM only */
>      part_info->active_vmem =3D 0;
>      part_info->next_vmem =3D 0;
> -    part_info->active_pmem =3D size / (256 << 20);
> +    part_info->active_pmem =3D size / CXL_CAPACITY_MULTIPLIER;
>      part_info->next_pmem =3D 0;
> =20
>      *len =3D sizeof(*part_info);
> --=20
> 2.37.2
>=20
> =

