Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE265B336
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 15:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCLU1-0003LU-Gf; Mon, 02 Jan 2023 09:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCLTy-0003L3-Nu
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 09:08:06 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCLTw-0003wp-7l
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 09:08:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.170])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CE1272054B;
 Mon,  2 Jan 2023 14:08:00 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 15:08:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0047daa91a4-7661-4660-b80a-1a15cbe774d9,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4a7c4d8d-ce68-9aae-a1be-9ea33313bbde@kaod.org>
Date: Mon, 2 Jan 2023 15:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 09/11] hw/arm/aspeed_ast10x0: Map HACE peripheral
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-10-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-10-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 45e1f2e7-a116-4550-b896-0f863c17557a
X-Ovh-Tracer-Id: 16519203434175433604
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdgslhgvrghlsehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdgthhhinhdqth
 hinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpphgvthgvrhesphhjugdruggvvhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhpuggvlhesmhgvthgrrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
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

On 12/30/22 12:35, Philippe Mathieu-Daudé wrote:
> Since I don't have access to the datasheet, the relevant
> values were found in:
> https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
> 
> Before on Zephyr:
> 
>    uart:~$ hash test
>    sha256_test
>    tv[0]:hash_final error
>    sha384_test
>    tv[0]:hash_final error
>    sha512_test
>    tv[0]:hash_final error
>    [00:00:06.278,000] <err> hace_global: HACE poll timeout
>    [00:00:09.324,000] <err> hace_global: HACE poll timeout
>    [00:00:12.261,000] <err> hace_global: HACE poll timeout
> 
>    uart:~$ crypto aes256_cbc_vault
>    aes256_cbc vault key 1
>    [00:00:06.699,000] <inf> hace_global: aspeed_crypto_session_setup
>    [00:00:06.699,000] <inf> hace_global: data->cmd: 1c2098
>    [00:00:06.699,000] <inf> hace_global: crypto_data_src: 93340
>    [00:00:06.699,000] <inf> hace_global: crypto_data_dst: 93348
>    [00:00:06.699,000] <inf> hace_global: crypto_ctx_base: 93300
>    [00:00:06.699,000] <inf> hace_global: crypto_data_len: 80000040
>    [00:00:06.699,000] <inf> hace_global: crypto_cmd_reg:  11c2098
>    [00:00:09.743,000] <inf> hace_global: HACE_STS: 0
>    [00:00:09.743,000] <err> hace_global: HACE poll timeout
>    [00:00:09.743,000] <err> crypto: CBC mode ENCRYPT - Failed
>    [00:00:09.743,000] <inf> hace_global: aspeed_crypto_session_free
>    uart:~$
> 
> After:
> 
>    uart:~$ hash test
>    sha256_test
>    tv[0]:PASS
>    tv[1]:PASS
>    tv[2]:PASS
>    tv[3]:PASS
>    tv[4]:PASS
>    sha384_test
>    tv[0]:PASS
>    tv[1]:PASS
>    tv[2]:PASS
>    tv[3]:PASS
>    tv[4]:PASS
>    tv[5]:PASS
>    sha512_test
>    tv[0]:PASS
>    tv[1]:PASS
>    tv[2]:PASS
>    tv[3]:PASS
>    tv[4]:PASS
>    tv[5]:PASS
> 
>    uart:~$ crypto aes256_cbc_vault
>    aes256_cbc vault key 1
>    Was waiting for:
>    6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
>    ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
>    30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
>    f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10
> 
>     But got:
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

I think the HACE model only supports hash for now.


> 
>    [00:00:05.771,000] <inf> hace_global: aspeed_crypto_session_setup
>    [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2098
>    [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
>    [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
>    [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
>    [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
>    [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2098
>    [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
>    [00:00:05.772,000] <inf> crypto: Output length (encryption): 80
>    [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_free
>    [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_setup
>    [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2018
>    [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
>    [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
>    [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
>    [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
>    [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2018
>    [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
>    [00:00:05.772,000] <inf> crypto: Output length (decryption): 64
>    [00:00:05.772,000] <err> crypto: CBC mode DECRYPT - Mismatch between plaintext and decrypted cipher text
>    [00:00:05.774,000] <inf> hace_global: aspeed_crypto_session_free
>    uart:~$
> 
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed_ast10x0.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index e74e2660ce..7a7443a95b 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -29,6 +29,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
>       [ASPEED_DEV_SPI1]      = 0x7E630000,
>       [ASPEED_DEV_SPI2]      = 0x7E640000,
>       [ASPEED_DEV_UDC]       = 0x7E6A2000,
> +    [ASPEED_DEV_HACE]      = 0x7E6D0000,
>       [ASPEED_DEV_SCU]       = 0x7E6E2000,
>       [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
>       [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
> @@ -166,6 +167,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
>       snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
>       object_initialize_child(obj, "gpio", &s->gpio, typename);
>   
> +    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
> +    object_initialize_child(obj, "hace", &s->hace, typename);
> +
>       object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
>       object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
>                               TYPE_UNIMPLEMENTED_DEVICE);
> @@ -359,6 +363,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       }
>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
>   
> +    /* HACE */
> +    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(&s->sram),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
> +                    sc->memmap[ASPEED_DEV_HACE]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
>       /* Watch dog */
>       for (i = 0; i < sc->wdts_num; i++) {
>           AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);


