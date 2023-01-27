Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95CD67EAA9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 17:19:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLRR9-0004a5-8i; Fri, 27 Jan 2023 11:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pLRR7-0004Zh-2d
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 11:18:45 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pLRR5-0006KW-Cm
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 11:18:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 08AFB2A004;
 Fri, 27 Jan 2023 16:18:42 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 27 Jan
 2023 17:18:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004e3c5c8cc-5065-4c62-b1e9-e45aba03fbad,
 4F8A7C4722844CB30BAFF044D0CF817181D4FB1A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f40b52b7-9bf8-a243-ca09-bbc09739ad07@kaod.org>
Date: Fri, 27 Jan 2023 17:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/4] ppc/pnv/pci: Update PHB5 version register
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230127122848.550083-1-fbarrat@linux.ibm.com>
 <20230127122848.550083-4-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230127122848.550083-4-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: cc601688-f8b1-4382-829d-840660f9f0ce
X-Ovh-Tracer-Id: 17969643992266345440
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteeghedugeeiffekfedtlefftdejleefgeegteelgfdujeeggfefieevuedtffehnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehfsggrrhhrrghtsehlihhnuhigrdhisghmrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/23 13:28, Frederic Barrat wrote:
> Update register value per its P10 DD2 definition.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Indeed :

   mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power10_v2.0");


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   include/hw/pci-host/pnv_phb4.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 761525686e..28d61b96c7 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -214,7 +214,7 @@ struct PnvPhb4PecClass {
>   #define PNV_PHB5(obj) \
>       OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
>   
> -#define PNV_PHB5_VERSION           0x000000a500000001ull
> +#define PNV_PHB5_VERSION           0x000000a500000002ull
>   
>   #define TYPE_PNV_PHB5_PEC "pnv-phb5-pec"
>   #define PNV_PHB5_PEC(obj) \


