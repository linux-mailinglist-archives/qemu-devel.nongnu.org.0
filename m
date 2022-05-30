Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676825377C4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 11:43:41 +0200 (CEST)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvbw4-0003kz-0j
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 05:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvbqa-0000K6-Sk
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:38:00 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvbqY-0004b7-4R
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:38:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.174])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EB66B1055A41C;
 Mon, 30 May 2022 11:37:54 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 30 May
 2022 11:37:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004bb88b765-2301-420d-a777-38a0d2b78db9,
 F546FDD43062DFA02F07D69E2A3A1257FC48A684) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <397f565c-590b-bcf2-a647-a1e9a0de1218@kaod.org>
Date: Mon, 30 May 2022 11:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ppc: fix boot with sam460ex
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>
CC: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-ppc@nongnu.org>
References: <20220526224229.95183-1-mst@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220526224229.95183-1-mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 342ab5e7-99fb-4b97-acd3-abb3f659e50f
X-Ovh-Tracer-Id: 10408381689401281504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdduffdtteffgffggeehteeuleeiheekffdvveeuffegffdtheeiveduheeviedunecuffhomhgrihhnpehqvghmuhdrohhrghdphhgrrhgufigrrhgvrdgtohhmrdgsrhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ resend with a reply-all ]

On 5/27/22 00:43, Michael S. Tsirkin wrote:
> Recent changes to pcie_host corrected size of its internal region to
> match what it expects - only the low 28 bits are ever decoded. Previous
> code just ignored bit 29 (if size was 1 << 29) in the address which does
> not make much sense.  We are now asserting on size > 1 << 28 instead,
> but it so happened that ppc actually allows guest to configure as large
> a size as it wants to, and current firmware set it to 1 << 29.
> 
> With just qemu-system-ppc -M sam460ex this triggers an assert which
> seems to happen when the guest (board firmware?) writes a value to
> CFGMSK reg:
> 
> (gdb) bt
> 
> This is done in the board firmware here:
> 
> https://git.qemu.org/?p=u-boot-sam460ex.git;a=blob;f=arch/powerpc/cpu/ppc4xx/4xx_pcie.c;h=13348be93dccc74c13ea043d6635a7f8ece4b5f0;hb=HEAD
> 
> when trying to map config space.
> 
> Note that what firmware does matches
> https://www.hardware.com.br/comunidade/switch-cisco/1128380/
> 
> So it's not clear what the proper fix should be.
> 
> However, allowing guest to trigger an assert in qemu is not good practice anyway.
> 
> For now let's just force the mask to 256MB on guest write, this way
> anything outside the expected address range is ignored.
> 
> Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX")
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Affected system is orphan so I guess I will merge the patch unless
> someone objects.

Fine with me.

Acked-by: Cédric Le Goater <clg@kaod.org>


On the orphan status,

MAINTAINERS file says the sam460ex machine is maintained. I understand that
these files :

   hw/ppc/ppc440_uc.c
   hw/ppc/ppc440.h
   hw/ppc/ppc440_pcix.c
   hw/ppc/ppc4xx_devs.c
   include/hw/ppc/ppc4xx.h

and these

   include/hw/i2c/ppc4xx_i2c.h
   hw/i2c/ppc4xx_i2c.c
   hw/intc/ppc-uic.c
   include/hw/intc/ppc-uic.h

should be under the same entry since sam460ex depends on it.

The ppc440 support is a bit of a mess to be honest. We have two 440
machines bamboo and sam460ex which have a lot in common a part from
the PCI host bridge.

Thanks,

C.

> 
>   hw/ppc/ppc440_uc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 993e3ba955..a1ecf6dd1c 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
>       case PEGPL_CFGMSK:
>           s->cfg_mask = val;
>           size = ~(val & 0xfffffffe) + 1;
> +        /*
> +         * Firmware sets this register to E0000001. Why we are not sure,
> +         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
> +         * ignored.
> +         */
> +        if (size > PCIE_MMCFG_SIZE_MAX) {
> +            size = PCIE_MMCFG_SIZE_MAX;
> +        }
>           pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
>           break;
>       case PEGPL_MSGBAH:


