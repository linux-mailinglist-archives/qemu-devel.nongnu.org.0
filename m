Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCE558EE22
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:20:39 +0200 (CEST)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmZZ-0001dL-TB
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oLlou-0002Iw-61; Wed, 10 Aug 2022 09:32:28 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:54593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oLlor-0006k1-RX; Wed, 10 Aug 2022 09:32:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3D9112465D;
 Wed, 10 Aug 2022 13:32:19 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 10 Aug
 2022 15:32:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0021b9d5c7e-cadc-491a-bb86-4e3e62b56095,
 043EABA4B22CD34FCE1B70F8CBB6C707CA017DB3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <ed0a9ad5-5260-6fbc-ee04-bfdc0b523955@kaod.org>
Date: Wed, 10 Aug 2022 15:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v3 07/11] ppc/pnv: add PHB4 helpers for user
 created pnv-phb
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <fbarrat@linux.ibm.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
 <20220810100536.473859-8-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220810100536.473859-8-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8bdee36a-0d87-4cfe-afde-9c0f2b8c77cb
X-Ovh-Tracer-Id: 12926175356700232672
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/22 12:05, Daniel Henrique Barboza wrote:
> The PHB4 backend relies on a link with the corresponding PEC element.
> This is trivial to do during machine_init() time for default devices,
> but not so much for user created ones.
> 
> pnv_phb4_get_pec() is a small variation of the function that was
> reverted by commit 9c10d86fee "ppc/pnv: Remove user-created PHB{3,4,5}
> devices". We'll use it to determine the appropriate PEC for a given user
> created pnv-phb that uses a PHB4 backend.
> 
> This is done during realize() time, in pnv_phb_user_device_init().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c | 40 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 887b25d49e..f9516fdc4a 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -50,6 +50,34 @@ static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
>       }
>   }
>   
> +static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
> +                                         Error **errp)
> +{
> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +    int chip_id = phb->chip_id;
> +    int index = phb->phb_id;
> +    int i, j;
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
> +        /*
> +         * For each PEC, check the amount of phbs it supports
> +         * and see if the given phb4 index matches an index.
> +         */
> +        PnvPhb4PecState *pec = &chip9->pecs[i];
> +
> +        for (j = 0; j < pec->num_phbs; j++) {
> +            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> +                return pec;
> +            }
> +        }
> +    }
> +    error_setg(errp,
> +               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
> +               chip_id, index);
> +
> +    return NULL;
> +}
> +
>   /*
>    * Attach a root port device.
>    *
> @@ -100,8 +128,16 @@ static void pnv_phb_user_device_init(PnvPHB *phb)
>   
>           parent = OBJECT(chip);
>       } else {
> -        /* phb4 support will be added later */
> -        return;
> +        Error *local_err = NULL;
> +
> +        phb->pec = pnv_phb4_get_pec(chip, PNV_PHB4(phb->backend), &local_err);
> +
> +        if (local_err) {
> +            error_propagate(&error_fatal, local_err);

That's weird. pnv_phb_user_device_init() should have an errp parameter I think.

C.

> +            return;
> +        }
> +
> +        parent = OBJECT(phb->pec);
>       }
>   
>       /*


