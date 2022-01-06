Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F7048612D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 08:54:01 +0100 (CET)
Received: from localhost ([::1]:33746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Naz-0001bX-02
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 02:54:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NOM-000268-PY
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:40:58 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:60233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5NOK-0005iO-Lu
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:40:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2021A2113F;
 Thu,  6 Jan 2022 07:40:55 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 08:40:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0049dc3367e-1446-49cc-a981-f69fecd29243,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <61085b7c-ae9b-07a7-a1d4-6c6397fac63f@kaod.org>
Date: Thu, 6 Jan 2022 08:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 05/18] pnv_phb4.c: check if root port exists in
 rc_config functions
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-6-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-6-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 126d1f1c-85ea-4482-9787-fa6eb20ff0d8
X-Ovh-Tracer-Id: 11315012589529828320
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefkedgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 1/5/22 22:23, Daniel Henrique Barboza wrote:
> pnv_phb4_rc_config_read() and pnv_phb4_rc_config_write() are asserting
> the existence of the root port. The root port is now optional, and there
> will be cases where a pnv-phb4 device won't have a root port attached.
> 
> Instead of asserting, check if the root port exists before read/writing
> into it.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 14827f8464..83dedc878a 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -152,7 +152,10 @@ static void pnv_phb4_rc_config_write(PnvPHB4 *phb, unsigned off,
>       }
>   
>       pdev = pci_find_device(pci->bus, 0, 0);
> -    assert(pdev);
> +    if (!pdev) {
> +        phb_error(phb, "rc_config_write device not found\n");
> +        return;
> +    }
>   
>       pci_host_config_write_common(pdev, off, PHB_RC_CONFIG_SIZE,
>                                    bswap32(val), 4);
> @@ -171,7 +174,10 @@ static uint64_t pnv_phb4_rc_config_read(PnvPHB4 *phb, unsigned off,
>       }
>   
>       pdev = pci_find_device(pci->bus, 0, 0);
> -    assert(pdev);
> +    if (!pdev) {
> +        phb_error(phb, "rc_config_read device not found\n");
> +        return ~0ull;
> +    }
>   
>       val = pci_host_config_read_common(pdev, off, PHB_RC_CONFIG_SIZE, 4);
>       return bswap32(val);
> 


