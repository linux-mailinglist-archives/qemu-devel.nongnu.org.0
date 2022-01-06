Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1BD48611C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:47:41 +0100 (CET)
Received: from localhost ([::1]:54192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5NUq-0003zv-AB
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NO0-0001wK-Lj
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:40:38 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:39125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NNu-0005bO-TK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:40:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 93117210EB;
 Thu,  6 Jan 2022 07:40:28 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 08:40:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005b13afd2d-7a8b-464a-8d15-ec3fc69a93f2,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6840fc48-7a7b-86a7-f7d6-799b5cc933a5@kaod.org>
Date: Thu, 6 Jan 2022 08:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 04/18] pnv_phb4.c: make pnv-phb4-root-port user
 creatable
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cf62a910-74c0-408a-8864-ee38dc5d85bd
X-Ovh-Tracer-Id: 11307412768202656736
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefkedgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/5/22 22:23, Daniel Henrique Barboza wrote:
> We want to create only the absolutely minimal amount of devices when
> running with -nodefaults. The root port is something that the machine
> can boot up without. But, to do that, we need to provide a way for the
> user to add them by hand.
> 
> This patch makes pnv-phb4-root-port user creatable and then uses the
> pnv_phb_attach_root_port() helper to add a pnv_phb4_root_port only when
> running with default settings.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c         | 18 +++++++-----------
>   include/hw/pci-host/pnv_phb4.h |  2 --
>   2 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 836b0c156c..14827f8464 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -22,6 +22,7 @@
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "sysemu/sysemu.h"
>   #include "trace.h"
>   
>   #define phb_error(phb, fmt, ...)                                        \
> @@ -1159,12 +1160,6 @@ static void pnv_phb4_instance_init(Object *obj)
>   
>       /* XIVE interrupt source object */
>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
> -
> -    /* Root Port */
> -    object_initialize_child(obj, "root", &phb->root, TYPE_PNV_PHB4_ROOT_PORT);
> -
> -    qdev_prop_set_int32(DEVICE(&phb->root), "addr", PCI_DEVFN(0, 0));
> -    qdev_prop_set_bit(DEVICE(&phb->root), "multifunction", false);
>   }
>   
>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
> @@ -1208,10 +1203,11 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   
> -    /* Add a single Root port */
> -    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
> -    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
> -    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
> +    /* Add a single Root port if running with defaults */
> +    if (defaults_enabled()) {
> +        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
> +                                 TYPE_PNV_PHB4_ROOT_PORT);
> +    }
>   
>       /* Setup XIVE Source */
>       if (phb->big_phb) {
> @@ -1369,7 +1365,7 @@ static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
>   
>       dc->desc     = "IBM PHB4 PCIE Root Port";
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   
>       device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
>                                       &rpc->parent_realize);
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 4a19338db3..ea63df9676 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -78,8 +78,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
>   struct PnvPHB4 {
>       PCIExpressHost parent_obj;
>   
> -    PnvPHB4RootPort root;
> -
>       uint32_t chip_id;
>       uint32_t phb_id;
>   
> 


