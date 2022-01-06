Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D3F486634
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:41:09 +0100 (CET)
Received: from localhost ([::1]:54130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Twy-0004QR-Ce
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:41:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tc3-0000or-Iq
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:19:33 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tc0-0002gL-J7
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:19:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C1F96211F2;
 Thu,  6 Jan 2022 14:19:23 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 15:19:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00523795cf3-87bc-43c3-bc4a-63cf9e3353f1,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3283f227-14fa-e3bf-1f64-4da8e8fabce8@kaod.org>
Date: Thu, 6 Jan 2022 15:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 18/18] pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-19-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-19-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4c5a0532-c6cb-4117-ae55-2ccc96ad51a5
X-Ovh-Tracer-Id: 18044516332387797984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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
> Similar to what was happening with pnv-phb3 buses,
> TYPE_PNV_PHB4_ROOT_BUS set to "pnv-phb4-root-bus" is a bit too long for
> a default root bus name. The usual default name for theses buses in QEMU
> are 'pcie', but we want to make a distinction between pnv-phb4 buses and
> other PCIE buses, at least as far as default name goes, because not all
> PCIE devices are attachable to a pnv-phb4 root-bus type.
> 
> Changing the default to 'pnv-phb4-root' allow us to have a shorter name
> while making this bus distinct, and the user can always set its own bus
> naming via the "id" attribute anyway.
> 
> This is the 'info qtree' output after this change, using a powernv9
> domain with 2 sockets and default settings enabled:
> 
> qemu-system-ppc64 -m 4G -machine powernv9,accel=tcg \
>       -smp 2,sockets=2,cores=1,threads=1
> 
>    dev: pnv-phb4, id ""
>      index = 5 (0x5)
>      chip-id = 1 (0x1)
>      version = 704374636546 (0xa400000002)
>      device-id = 1217 (0x4c1)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb4-root.11
>        type pnv-phb4-root
>        dev: pnv-phb4-root-port, id ""
> (...)
>    dev: pnv-phb4, id ""
>      index = 0 (0x0)
>      chip-id = 1 (0x1)
>      version = 704374636546 (0xa400000002)
>      device-id = 1217 (0x4c1)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb4-root.6
>        type pnv-phb4-root
>        dev: pnv-phb4-root-port, id ""
> (..)
>    dev: pnv-phb4, id ""
>      index = 5 (0x5)
>      chip-id = 0 (0x0)
>      version = 704374636546 (0xa400000002)
>      device-id = 1217 (0x4c1)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb4-root.5
>        type pnv-phb4-root
>        dev: pnv-phb4-root-port, id ""
> (...)
>    dev: pnv-phb4, id ""
>      index = 0 (0x0)
>      chip-id = 0 (0x0)
>      version = 704374636546 (0xa400000002)
>      device-id = 1217 (0x4c1)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: pnv-phb4-root.0
>        type pnv-phb4-root
>        dev: pnv-phb4-root-port, id ""
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   include/hw/pci-host/pnv_phb4.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 610580a88f..0aec495cbf 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -47,7 +47,7 @@ typedef struct PnvPhb4DMASpace {
>   /*
>    * PHB4 PCIe Root port
>    */
> -#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root-bus"
> +#define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
>   #define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
>   
>   typedef struct PnvPHB4RootPort {
> 


