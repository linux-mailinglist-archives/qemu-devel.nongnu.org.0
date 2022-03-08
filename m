Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB04D117F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:03:40 +0100 (CET)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUol-0003Ic-T2
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nRUnT-0001OT-ED
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:02:19 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:57813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nRUnR-00046M-7Y
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:02:19 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 08B55236A5;
 Tue,  8 Mar 2022 08:02:07 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 09:02:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0040d039b1d-7864-4a31-bdc7-5e06a849632c,
 03E3C14593CA27F822F61C3AD678835CDD198C87) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9b7c2154-fed8-8e70-2d7e-12ae3c865622@kaod.org>
Date: Tue, 8 Mar 2022 09:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/block: m25p80: Add support for w25q01jvq
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20220304180920.1780992-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220304180920.1780992-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 867a5726-1bfe-4129-939d-6533b62d1815
X-Ovh-Tracer-Id: 972214572833147753
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudduhedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddujedmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdegleduueeivedvudeiffekieffffeiheefveevueeghfekffeftdeugeeifeeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohephhhrvghithiisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Potin Lai <potin.lai@quantatw.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 19:09, Patrick Williams wrote:
> The w25q01jvq is a 128MB part.  Support is being added to the kernel[1]
> and the two have been tested together.
> 
> 1. https://lore.kernel.org/lkml/20220222092222.23108-1-potin.lai@quantatw.com/
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Cc: Potin Lai <potin.lai@quantatw.com>
> ---
>   hw/block/m25p80.c | 1 +
>   1 file changed, 1 insertion(+)

If that's ok with the maintainers, I am going to take this patch through
the aspeed machine queue since the new 'bletchley-bmc' machine depends
on it :

   http://patchwork.ozlabs.org/project/qemu-devel/patch/20220305000656.1944589-2-patrick@stwcx.xyz/

I should send the PR today.

Thanks,

C.

> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index c6bf3c6bfa..7d3d8b12e0 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -340,6 +340,7 @@ static const FlashPartInfo known_devices[] = {
>       { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
>       { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
>       { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
> +    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
>   };
>   
>   typedef enum {


