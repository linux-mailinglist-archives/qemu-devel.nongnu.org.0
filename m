Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA84C563A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 14:53:18 +0100 (CET)
Received: from localhost ([::1]:42864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNxVc-0007HW-OD
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 08:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nNxSb-0006Kc-Q6
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 08:50:13 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:48571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nNxSN-0005BC-NN
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 08:50:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 77C6F2120D;
 Sat, 26 Feb 2022 13:49:49 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 26 Feb
 2022 14:49:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005070fd622-6076-40d0-b79a-bc22e7f2a4d2,
 882F242BC20BD566007BF8BE0B3E715095E9813A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d8042dac-2a16-1b69-e334-58bae188d88e@kaod.org>
Date: Sat, 26 Feb 2022 14:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/pnv: fix default PHB4 QOM hierarchy
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220218202804.413157-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220218202804.413157-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 00bed33c-4722-429d-9cd4-75c24c331c40
X-Ovh-Tracer-Id: 3457920092525333472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrleeigdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 2/18/22 21:28, Daniel Henrique Barboza wrote:
> Commit 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
> changed phb4_pec code to create the default PHB4 objects in
> pnv_pec_default_phb_realize(). In this process the stacks[] PEC array was
> removed and each PHB4 object is tied together with its PEC via the
> phb->pec pointer.
> 
> This change also broke the previous QOM hierarchy - the PHB4 objects are
> being created and not being parented to their respective chips. This can
> be verified by 'info pic' in a powernv9 domain with default settings.
> pnv_chip_power9_pic_print_info() will fail to find the PHBs because
> object_child_foreach_recursive() won't find any.
> 
> The solution is to set the parent chip and the parent bus, in the same
> way done for user created PHB4 devices, for all PHB4 devices.
> 
> Fixes: 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


What about the pnv-phb3/4-root-port devices ? Should we attached
them also to the QOM hierarchy ?

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c | 36 ++++++++++++++++--------------------
>   1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index e91249ef64..846e7d0c3e 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1568,40 +1568,36 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB4 *phb = PNV_PHB4(dev);
> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>       XiveSource *xsrc = &phb->xsrc;
> +    BusState *s;
>       Error *local_err = NULL;
>       int nr_irqs;
>       char name[32];
>   
> -    /* User created PHB */
> -    if (!phb->pec) {
> -        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> -        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
> -        BusState *s;
> -
> -        if (!chip) {
> -            error_setg(errp, "invalid chip id: %d", phb->chip_id);
> -            return;
> -        }
> +    if (!chip) {
> +        error_setg(errp, "invalid chip id: %d", phb->chip_id);
> +        return;
> +    }
>   
> +    /* User created PHBs need to be assigned to a PEC */
> +    if (!phb->pec) {
>           phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
>           if (local_err) {
>               error_propagate(errp, local_err);
>               return;
>           }
> +    }
>   
> -        /*
> -         * Reparent user created devices to the chip to build
> -         * correctly the device tree.
> -         */
> -        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
> +    /* Reparent the PHB to the chip to build the device tree */
> +    pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
>   
> -        s = qdev_get_parent_bus(DEVICE(chip));
> -        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> +    s = qdev_get_parent_bus(DEVICE(chip));
> +    if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
> +        error_propagate(errp, local_err);
> +        return;
>       }
>   
>       /* Set the "big_phb" flag */


