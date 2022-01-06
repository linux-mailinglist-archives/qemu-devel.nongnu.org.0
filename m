Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67668486131
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:56:35 +0100 (CET)
Received: from localhost ([::1]:39480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5NdS-0005eO-Ia
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NPN-0002us-BJ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:42:01 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:44903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NPL-0005o4-9W
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:42:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 40E0921E38;
 Thu,  6 Jan 2022 07:41:58 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 08:41:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0035fad2961-ed49-4805-a231-d12cee1bef20,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <acbc2437-33da-4073-4ac6-69043b29a4ae@kaod.org>
Date: Thu, 6 Jan 2022 08:41:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 10/18] pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-11-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-11-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8cb1f10b-d29b-468a-88d9-08e0803ddcdf
X-Ovh-Tracer-Id: 11332745515896572896
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefkedgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
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
> The TYPE_PNV_PHB3_ROOT_BUS name is used as the default bus name when
> the dev has no 'id'. However, pnv-phb3-root-bus is a bit too long to be
> used as a bus name.
> 
> Most common QEMU buses and PCI controllers are named based on their bus
> type (e.g. pSeries spapr-pci-host-bridge is called 'pci'). The most
> common name for a PCIE bus controller in QEMU is 'pcie'. Naming it
> 'pcie' would break the documented use of the pnv-phb3 device, since
> 'pcie.0' would now refer to the root bus instead of the first root port.
> 
> There's nothing particularly wrong with the 'root-bus' name used before,
> aside from the fact that 'root-bus' is being used for pnv-phb3 and
> pnv-phb4 created buses, which is not quite correct since these buses
> aren't implemented the same way in QEMU - you can't plug a
> pnv-phb4-root-port into a pnv-phb3 root bus, for example.
> 
> This patch renames it as 'pnv-phb3-root', which is a compromise between
> the existing and the previously used name. Creating 3 phbs without ID
> will result in an "info qtree" output similar to this:
> 
> bus: main-system-bus
>    type System
>    dev: pnv-phb3, id ""
>      index = 2 (0x2)
>      chip-id = 0 (0x0)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb3-root.2
>        type pnv-phb3-root
> (...)
>    dev: pnv-phb3, id ""
>      index = 1 (0x1)
>      chip-id = 0 (0x0)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb3-root.1
>        type pnv-phb3-root
> (...)
>    dev: pnv-phb3, id ""
>      index = 0 (0x0)
>      chip-id = 0 (0x0)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb3-root.0
>        type pnv-phb3-root
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   include/hw/pci-host/pnv_phb3.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index 2e423c3890..af6ec83cf6 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -105,7 +105,7 @@ struct PnvPBCQState {
>   /*
>    * PHB3 PCIe Root port
>    */
> -#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root-bus"
> +#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
>   
>   #define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
>   
> 


