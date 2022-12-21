Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2967B65355E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:37:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p830w-0001Yw-9I; Wed, 21 Dec 2022 12:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p830n-0001XD-FQ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:36:13 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p830i-0007Ml-T0
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 12:36:13 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DD26D204D0;
 Wed, 21 Dec 2022 17:36:03 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 21 Dec
 2022 18:36:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0023497609f-44f6-4d9a-9e7d-d534c54df56d,
 78B451B26E434E63100236457A08FF51A4610C03) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
Date: Wed, 21 Dec 2022 18:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] m25p80: Add the is25wp256 SFPD table
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Alistair Francis
 <alistair@alistair23.me>
CC: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>, Michael Walle
 <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@linaro.org>
References: <20221221122213.1458540-1-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221221122213.1458540-1-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 612bef8b-8b04-416d-ab7f-141f8adbf665
X-Ovh-Tracer-Id: 4900760823282764652
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -90
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeekgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdluddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpkhifohhlfhesrhgvughhrghtrdgtohhmpdhhrhgvihhtiiesrhgvughhrghtrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhmihgthhgrvghlseifrghllhgvrdgttgdpthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdfovfetjfhosh
 htpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/21/22 13:22, Guenter Roeck wrote:
> Generated from hardware using the following command and then padding
> with 0xff to fill out a power-of-2:
> 	xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 
> Cc: Michael Walle <michael@walle.cc>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C.


> ---
>   hw/block/m25p80.c      |  3 ++-
>   hw/block/m25p80_sfdp.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   hw/block/m25p80_sfdp.h |  2 ++
>   3 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 02adc87527..802d2eb021 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -221,7 +221,8 @@ static const FlashPartInfo known_devices[] = {
>       { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
>       { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
>       { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
> -    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K),
> +      .sfdp_read = m25p80_sfdp_is25wp256 },
>   
>       /* Macronix */
>       { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index 77615fa29e..b33811a4f5 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -330,3 +330,43 @@ static const uint8_t sfdp_w25q01jvq[] = {
>       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>   };
>   define_sfdp_read(w25q01jvq);
> +
> +/*
> + * Integrated Silicon Solution (ISSI)
> + */
> +
> +static const uint8_t sfdp_is25wp256[] = {
> +    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x01, 0xff,
> +    0x00, 0x06, 0x01, 0x10, 0x30, 0x00, 0x00, 0xff,
> +    0x9d, 0x05, 0x01, 0x03, 0x80, 0x00, 0x00, 0x02,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xe5, 0x20, 0xf9, 0xff, 0xff, 0xff, 0xff, 0x0f,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x80, 0xbb,
> +    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
> +    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0xff, 0x23, 0x4a, 0xc9, 0x00,
> +    0x82, 0xd8, 0x11, 0xce, 0xcc, 0xcd, 0x68, 0x46,
> +    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xae, 0xd5, 0x5c,
> +    0x4a, 0x42, 0x2c, 0xff, 0xf0, 0x30, 0xfa, 0xa9,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0x50, 0x19, 0x50, 0x16, 0x9f, 0xf9, 0xc0, 0x64,
> +    0x8f, 0xef, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(is25wp256);
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index df7adfb5ce..011a880f66 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -26,4 +26,6 @@ uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
>   
>   uint8_t m25p80_sfdp_w25q01jvq(uint32_t addr);
>   
> +uint8_t m25p80_sfdp_is25wp256(uint32_t addr);
> +
>   #endif


