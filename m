Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A86B589024
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 18:27:41 +0200 (CEST)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJHDg-00032J-8F
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 12:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJHC1-0000UZ-39
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:25:57 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJHBy-000278-Rx
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:25:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2058211C79D55;
 Wed,  3 Aug 2022 18:25:53 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 18:25:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006bfdfe638-b98d-43c4-bfbe-922e197c3a00,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bb9fd231-9a71-2fd0-1688-934b66314f3b@kaod.org>
Date: Wed, 3 Aug 2022 18:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 03/10] ppc/pnv: set root port chassis and slot
 using Bus properties
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, Frederic Barrat <fbarrat@linux.ibm.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
 <20220803134459.2633902-4-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220803134459.2633902-4-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 934d67d7-97a2-4708-ab80-a7828eba4dd5
X-Ovh-Tracer-Id: 11642086515254791136
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On 8/3/22 15:44, Daniel Henrique Barboza wrote:
> For default root ports we have a way of accessing chassis and slot,
> before root_port_realize(), via pnv_phb_attach_root_port(). For the
> future user created root ports this won't be the case: we can't use
> this helper because we don't have access to the PHB phb-id/chip-id
> values.
> 
> In earlier patches we've added phb-id and chip-id to pnv-phb-root-bus
> objects. We're now able to use the bus to retrieve them. The bus is
> reachable for both user created and default devices, so we're changing
> all the code paths. This also allow us to validate these changes with
> the existing default devices.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index c47ed92462..826c0c144e 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -25,21 +25,19 @@
>    * QOM id. 'chip_id' is going to be used as PCIE chassis for the
>    * root port.
>    */
> -static void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
> +static void pnv_phb_attach_root_port(PCIHostState *pci)
>   {
>       PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
> -    g_autofree char *default_id = g_strdup_printf("%s[%d]",
> -                                                  TYPE_PNV_PHB_ROOT_PORT,
> -                                                  index);
>       const char *dev_id = DEVICE(root)->id;
> +    g_autofree char *default_id = NULL;
> +    int index;
> +
> +    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
> +    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
>   
>       object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
>                                 OBJECT(root));
>   
> -    /* Set unique chassis/slot values for the root port */
> -    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
> -    qdev_prop_set_uint16(DEVICE(root), "slot", index);
> -
>       pci_realize_and_unref(root, pci->bus, &error_fatal);
>   }
>   
> @@ -93,7 +91,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
> -    pnv_phb_attach_root_port(pci, phb->phb_id, phb->chip_id);
> +    pnv_phb_attach_root_port(pci);
>   }
>   
>   static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
> @@ -162,9 +160,18 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>       PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
> +    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
>       PCIDevice *pci = PCI_DEVICE(dev);
>       uint16_t device_id = 0;
>       Error *local_err = NULL;
> +    int chip_id, index;
> +
> +    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
> +    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
> +
> +    /* Set unique chassis/slot values for the root port */
> +    qdev_prop_set_uint8(dev, "chassis", chip_id);
> +    qdev_prop_set_uint16(dev, "slot", index);
>   
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {


