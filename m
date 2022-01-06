Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D093486117
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:44:56 +0100 (CET)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5NSA-0003U6-Lw
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:44:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NMj-0001TZ-4Y
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:39:17 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NMg-0005ES-Ek
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:39:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.149])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A7B7721C27;
 Thu,  6 Jan 2022 07:39:11 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 08:39:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00419173caf-02b5-4df9-9730-6baf938888ef,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8d411a90-64b8-abf3-22ce-3adb8b880276@kaod.org>
Date: Thu, 6 Jan 2022 08:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 01/18] pnv_phb3.c: add unique chassis and slot for
 pnv_phb3_root_port
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 691e07d9-f342-41d7-9d73-d8c186ebf4d1
X-Ovh-Tracer-Id: 11285739192242047968
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefkedgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> When creating a pnv_phb3_root_port using the command line, the first
> root port is created successfully, but the second fails with the
> following error:
> 
> qemu-system-ppc64: -device pnv-phb3-root-port,bus=phb3-root.0,id=pcie.3:
> Can't add chassis slot, error -16
> 
> This error comes from the realize() function of its parent type,
> rp_realize() from TYPE_PCIE_ROOT_PORT. pcie_chassis_add_slot() fails
> with -EBUSY if there's an existing PCIESlot that has the same
> chassis/slot value, regardless of being in a different bus.
> 
> One way to prevent this error is simply set chassis and slot values in
> the command line. However, since phb3 root buses only supports a single
> root port, we can just get an unique chassis/slot value by checking
> which root bus the pnv_phb3_root_port is going to be attached, get the
> equivalent phb3 device and use its chip-id and index values, which are
> guaranteed to be unique.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb3.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index c78084cce7..3467bbb5d9 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1142,8 +1142,24 @@ static const TypeInfo pnv_phb3_root_bus_info = {
>   static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>   {
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> +    PCIDevice *pci = PCI_DEVICE(dev);
> +    PCIBus *bus = pci_get_bus(pci);
> +    PnvPHB3 *phb = NULL;
>       Error *local_err = NULL;
>   
> +    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> +                                          TYPE_PNV_PHB3);
> +
> +    if (!phb) {
> +        error_setg(errp,
> +"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
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


