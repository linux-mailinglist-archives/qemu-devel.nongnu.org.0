Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0898482F04
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:29:28 +0100 (CET)
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Iid-0002aM-Ot
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4IhW-00010a-7X
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:28:18 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:50481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4IhU-0006FH-4c
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:28:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E9203208E9;
 Mon,  3 Jan 2022 08:28:10 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 09:28:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002306cacb2-9eb6-4005-81d3-3f14200c7ff7,
 2FB4A63B976BE1634B5E5BEF676EDDCED9FE10A5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <49139a66-ea8b-b599-d7c4-e40597e558f3@kaod.org>
Date: Mon, 3 Jan 2022 09:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/17] pnv_phb3.h: change TYPE_PNV_PHB3_ROOT_BUS name
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-4-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-4-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d08c7440-3e20-451a-9b85-b3ec8eb8d03a
X-Ovh-Tracer-Id: 12941656479209655264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/28/21 20:37, Daniel Henrique Barboza wrote:
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
> This patch renames it as 'phb3-root', which is a compromise between the
> existing and the previously used name. Creating 3 phbs without ID will
> result in an "info qtree" output similar to this:
> 
> bus: main-system-bus
>    type System
>    dev: pnv-phb3, id ""
>      index = 2 (0x2)
>      chip-id = 0 (0x0)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: phb3-root.2
>        type phb3-root
>    dev: pnv-phb3, id ""
>      index = 1 (0x1)
>      chip-id = 0 (0x0)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: phb3-root.1
>        type phb3-root
>    dev: pnv-phb3, id ""
>      index = 0 (0x0)
>      chip-id = 0 (0x0)
>      x-config-reg-migration-enabled = true
>      bypass-iommu = false
>      bus: phb3-root.0
>        type phb3-root
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   include/hw/pci-host/pnv_phb3.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index 2e423c3890..658ee40e13 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -105,7 +105,7 @@ struct PnvPBCQState {
>   /*
>    * PHB3 PCIe Root port
>    */
> -#define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root-bus"
> +#define TYPE_PNV_PHB3_ROOT_BUS "phb3-root"

hmm, what about "pnv-phb3-root" ? I like the 'pnv' prefix to identify
the machine.


Thanks,

C.



>   
>   #define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
>   
> 


