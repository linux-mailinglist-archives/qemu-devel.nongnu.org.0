Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339864C55A7
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 12:27:07 +0100 (CET)
Received: from localhost ([::1]:55426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNvE9-0000RZ-PL
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 06:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nNvBS-0007p4-5N
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:24:18 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nNvBP-0006Dt-I5
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 06:24:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 475D9240BC;
 Sat, 26 Feb 2022 11:24:05 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 26 Feb
 2022 12:24:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001a79eb028-6a41-4398-907c-4fde60b0a7db,
 2A98B411F0F8CA515632B1CEEE89F8CF0244EE06) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <26f8cf8c-ab48-649d-6ecb-c5e14c12d0b2@kaod.org>
Date: Sat, 26 Feb 2022 12:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/22] hw/ppc/pnv: Determine ns16550's IRQ number from
 QOM property
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, <qemu-devel@nongnu.org>
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-6-shentey@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220222193446.156717-6-shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f9bf807d-cdac-404f-9fa7-d11ce110e404
X-Ovh-Tracer-Id: 996702893037554653
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrleeigddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 2/22/22 20:34, Bernhard Beschow wrote:
> Determine the IRQ number in the same way as for isa-ipmi-bt. This resolves
> the last usage of ISADevice::isairq[] which allows it to be removed.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

I can take this patch in the ppc stream if you prefer. Anyhow,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ppc/pnv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 837146a2fb..1e9f6b0690 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -380,9 +380,12 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
>           cpu_to_be32(io_base),
>           cpu_to_be32(8)
>       };
> +    uint32_t irq;
>       char *name;
>       int node;
>   
> +    irq = object_property_get_int(OBJECT(d), "irq", &error_fatal);
> +
>       name = g_strdup_printf("%s@i%x", qdev_fw_name(DEVICE(d)), io_base);
>       node = fdt_add_subnode(fdt, lpc_off, name);
>       _FDT(node);
> @@ -394,7 +397,7 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
>   
>       _FDT((fdt_setprop_cell(fdt, node, "clock-frequency", 1843200)));
>       _FDT((fdt_setprop_cell(fdt, node, "current-speed", 115200)));
> -    _FDT((fdt_setprop_cell(fdt, node, "interrupts", d->isairq[0])));
> +    _FDT((fdt_setprop_cell(fdt, node, "interrupts", irq)));
>       _FDT((fdt_setprop_cell(fdt, node, "interrupt-parent",
>                              fdt_get_phandle(fdt, lpc_off))));
>   


