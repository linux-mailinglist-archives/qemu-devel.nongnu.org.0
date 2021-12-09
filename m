Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1234F46E3A4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 09:01:08 +0100 (CET)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvEMV-0002Dl-5e
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 03:01:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvEKI-0008Ut-Hp
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:58:50 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:37961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvEKF-0000WB-GE
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 02:58:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4A46420D45;
 Thu,  9 Dec 2021 07:58:46 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 9 Dec
 2021 08:58:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0022790bbb7-31cb-483b-b897-9ffff461b61c,
 8D04C9E66DC1FB38CABDD9E51B1330B7D999B631) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <42f21b1d-1f23-75df-b69b-534f821f1399@kaod.org>
Date: Thu, 9 Dec 2021 08:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] target/ppc: Set 601v exception model id
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211208123029.2052625-1-farosas@linux.ibm.com>
 <20211208123029.2052625-4-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211208123029.2052625-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 073d2cf4-574a-4889-9c7d-16d8156f9669
X-Ovh-Tracer-Id: 13201739359274568611
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeelgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.803,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 13:30, Fabiano Rosas wrote:
> The exception model id for 601v has been removed without mention
> why. I assume it was inadvertent and restore it here.
> 
> Fixes: b632a148b6 ("target-ppc: Use QOM method dispatch for MMU fault handling")
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/cpu_init.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 8100b89033..0e1682ddd9 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -4607,6 +4607,7 @@ POWERPC_FAMILY(601v)(ObjectClass *oc, void *data)
>                       (1ull << MSR_IR) |
>                       (1ull << MSR_DR);
>       pcc->mmu_model = POWERPC_MMU_601;
> +    pcc->excp_model = POWERPC_EXCP_601;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_601;
>       pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_HID0_LE;
> 


