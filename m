Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2174482F3F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 10:11:29 +0100 (CET)
Received: from localhost ([::1]:60810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4JNH-0001mJ-Se
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 04:11:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4JKU-0008N5-Dj; Mon, 03 Jan 2022 04:08:34 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:57037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4JKS-0007lj-3q; Mon, 03 Jan 2022 04:08:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 92A45D52889E;
 Mon,  3 Jan 2022 10:08:29 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 10:08:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00672add0d4-c977-4037-9ff7-7f3262c01769,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2ee5ae64-3fec-9bf7-7c5d-010f90bdd379@kaod.org>
Date: Mon, 3 Jan 2022 10:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/17] pnv_phb4_pec.c: use pnv_pec_get_phb_id() in
 pnv_pec_dt_xscom()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-12-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-12-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6a30e3b5-9307-406f-9980-198381a4dc82
X-Ovh-Tracer-Id: 13622544450947484640
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 20:38, Daniel Henrique Barboza wrote:
> Relying on stack->phb to write the xscom DT of the PEC is something that
> we won't be able to do with user creatable pnv-phb4 devices.
> 
> Hopefully, this can be done by using pnv_pec_get_phb_id(), which is
> already used by pnv_pec_realize() to set the phb-id of the stack. Use
> the same idea in pnv_pec_dt_xscom() to write ibm,phb-index without the
> need to accessing stack->phb, since stack->phb is not granted to be !=
> NULL when user creatable phbs are introduced.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Couldn't we do that already without the previous change ?

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4_pec.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 4f6db26633..56ffd446ab 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -466,8 +466,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>                         pecc->compat_size)));
>   
>       for (i = 0; i < pec->num_stacks; i++) {
> -        PnvPhb4PecStack *stack = &pec->stacks[i];
> -        PnvPHB4 *phb = &stack->phb;
> +        int phb_id =  pnv_pec_get_phb_id(pec, i);
>           int stk_offset;
>   
>           name = g_strdup_printf("stack@%x", i);
> @@ -477,7 +476,7 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
>           _FDT((fdt_setprop(fdt, stk_offset, "compatible", pecc->stk_compat,
>                             pecc->stk_compat_size)));
>           _FDT((fdt_setprop_cell(fdt, stk_offset, "reg", i)));
> -        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb->phb_id)));
> +        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb_id)));
>       }
>   
>       return 0;
> 


