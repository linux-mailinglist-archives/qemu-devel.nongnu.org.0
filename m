Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F6486130
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:56:01 +0100 (CET)
Received: from localhost ([::1]:38078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Ncu-0004Ys-H7
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:56:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NNL-0001op-BX
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:39:58 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:53459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NNI-0005GS-QT
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:39:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D1C7E21BE2;
 Thu,  6 Jan 2022 07:39:43 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 08:39:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004af4b97cd-0266-4a52-b7ee-cad9ea0ae717,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f9c7daf8-84aa-37c9-92a2-18f2838d2533@kaod.org>
Date: Thu, 6 Jan 2022 08:39:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 02/18] pnv_phb4.c: add unique chassis and slot for
 pnv_phb4_root_port
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-3-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-3-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 748f2b5b-ff40-4cff-89cc-9e7a084de277
X-Ovh-Tracer-Id: 11294746391565863904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefkedgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> A similar situation as described previously with pnv_phb3_root_port
> devices also happens with pnv_phb4_root_ports.
> 
> The solution is the same: assign an unique chassis/slot combo for them.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb4.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 5ba26e250a..836b0c156c 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1338,8 +1338,23 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
>   static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> +    PCIDevice *pci = PCI_DEVICE(dev);
> +    PCIBus *bus = pci_get_bus(pci);
> +    PnvPHB4 *phb = NULL;
>       Error *local_err = NULL;
>   
> +    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> +                                          TYPE_PNV_PHB4);
> +
> +    if (!phb) {
> +        error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
> +        return;
> +    }
> +
> +    /* Set unique chassis/slot values for the root port */
> +    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
> +    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> +
>       rpc->parent_realize(dev, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> 


