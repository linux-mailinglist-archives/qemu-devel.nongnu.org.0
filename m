Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4D482F29
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:59:10 +0100 (CET)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4JBN-0002QO-TE
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4J6V-0005SM-QO
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:54:08 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4J6R-0000lR-JY
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:54:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6E19B20D24;
 Mon,  3 Jan 2022 08:54:00 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 09:54:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003a09b7ee2-22db-41dc-932a-762cfed37332,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <998859f6-ea3e-704a-400d-4bc09a4c6d4e@kaod.org>
Date: Mon, 3 Jan 2022 09:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/17] pnv_phb4.c: check if root port exists in rc_config
 functions
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
 <20211228193806.1198496-8-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-8-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9f86ff27-1ac6-46b1-afca-b9757e21af88
X-Ovh-Tracer-Id: 13377942696241171363
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhhrvgguvghrihgtrdgsrghrrhgrthesfhhrrdhisghmrdgtohhm
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
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
Cc: Frederic Barrat <frederic.barrat@fr.ibm.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 20:37, Daniel Henrique Barboza wrote:
> pnv_phb4_rc_config_read() and pnv_phb4_rc_config_write() are asserting
> the existence of the root port. The root port is now optional, and there
> will be cases where a pnv-phb4 device won't have a root port attached.

May be we should enforce a stronger link between the two objects to avoid
creating an empty PHB device.

> Instead of asserting, check if the root port exists before read/writing
> into it> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index daa468b812..6bd907f91a 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -152,7 +152,9 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
>       }
>   
>       pdev = pci_find_device(pci->bus, 0, 0);
> -    assert(pdev);
> +    if (!pdev) {

We should log an error at least.

> +        return;
> +    }
>   
>       pci_host_config_write_common(pdev, off, PHB_RC_CONFIG_SIZE,
>                                    bswap32(val), 4);
> @@ -171,7 +173,9 @@ static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
>       }
>   
>       pdev = pci_find_device(pci->bus, 0, 0);
> -    assert(pdev);
> +    if (!pdev) {
> +        return 0x0;

         return ~0ull;

> +    }
>   
>       val = pci_host_config_read_common(pdev, off, PHB_RC_CONFIG_SIZE, 4);
>       return bswap32(val);
> 


