Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D688B454CE7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 19:15:42 +0100 (CET)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnPTB-00027P-MM
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 13:15:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnPRU-0000F9-Nj
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:13:56 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:44221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnPRS-0005aP-JF
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:13:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B07212169B;
 Wed, 17 Nov 2021 18:13:52 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 19:13:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b66bee95-853a-49b9-9036-46be2f862f66,
 E0AE69C6E5AA65AEB70FB41CD49354A0C9868CD0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <8c4d392a-ea39-537c-0510-92fe1b1bf607@kaod.org>
Date: Wed, 17 Nov 2021 19:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] pmu: fix pmu vmstate subsection list
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, <qemu-devel@nongnu.org>
References: <20211116150837.169291-1-lvivier@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211116150837.169291-1-lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7209b03b-8770-4538-a033-e367055c55f3
X-Ovh-Tracer-Id: 5071053182186261472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmrghrkhdrtggrvhgvqdgrhihlrghnugesihhlrghnuggvrdgtohdruhhk
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 16:08, Laurent Vivier wrote:
> The subsection is not closed by a NULL marker so this can trigger
> a segfault when the pmu vmstate is saved.
> 
> This can be easily shown with:
> 
>    $ ./qemu-system-ppc64  -dump-vmstate vmstate.json
>    Segmentation fault (core dumped)
> 
> Fixes: d811d61fbc6c ("mac_newworld: add PMU device")
> Cc: mark.cave-ayland@ilande.co.uk
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Queued for 6.2

Thanks,

C.


> ---
>   hw/misc/macio/pmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 4ad4f50e08c3..eb39c64694aa 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -718,6 +718,7 @@ static const VMStateDescription vmstate_pmu = {
>       },
>       .subsections = (const VMStateDescription * []) {
>           &vmstate_pmu_adb,
> +        NULL
>       }
>   };
>   
> 


