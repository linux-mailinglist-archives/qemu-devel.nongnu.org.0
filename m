Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF2D5377BD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 11:41:02 +0200 (CEST)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvbtU-0001ML-RJ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 05:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvbpX-00088S-1y
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:36:57 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvbpU-0004QO-GK
 for qemu-devel@nongnu.org; Mon, 30 May 2022 05:36:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A80921055A137
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 11:36:41 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 30 May
 2022 11:36:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0040700c047-1954-44a7-af91-5de6670c4479,
 F546FDD43062DFA02F07D69E2A3A1257FC48A684) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7a9467e7-b5ce-056d-b012-11541be1c0f1@kaod.org>
Date: Mon, 30 May 2022 11:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ppc: fix boot with sam460ex
Content-Language: en-US
To: <qemu-devel@nongnu.org>
References: <20220526224229.95183-1-mst@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220526224229.95183-1-mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5af65c27-6993-44c4-8cb3-e494d922bae1
X-Ovh-Tracer-Id: 10387834015775623959
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeffvdfgteekiedtteeffeetgeellefhvefhtdffteffvdehvdehleeuiedugefhnecuffhomhgrihhnpehqvghmuhdrohhrghdphhgrrhgufigrrhgvrdgtohhmrdgsrhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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


