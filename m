Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7492D6966E1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwJ6-00032Y-9c; Tue, 14 Feb 2023 09:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pRwJ2-00030J-AB
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:29:16 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pRwJ0-0003av-9W
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:29:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CFFEB21481;
 Tue, 14 Feb 2023 14:29:01 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 14 Feb
 2023 15:29:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003636d9eb8-edb8-40e1-983c-72f22050070b,
 D27BB99F68B8EC7888E3647E3ED2C6CF660736DE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9a5b9e5a-ed67-e2b3-ddda-56220e40c00a@kaod.org>
Date: Tue, 14 Feb 2023 15:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH qemu 2/2] aspeed/fuji : correct the eeprom size
Content-Language: en-US
To: ~ssinprem <ssinprem@celestica.com>, <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, <srikanth@celestica.com>,
 <kgengan@celestica.com>, Peter Delevoryas <peter@pjd.dev>
References: <167636845806.2107.2382940753543768501-2@git.sr.ht>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <167636845806.2107.2382940753543768501-2@git.sr.ht>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e29f88ae-c70e-48c4-bbc6-6fe0abf32fc9
X-Ovh-Tracer-Id: 11145564655661058854
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeifedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehsshhinhhprhgvmhestggvlhgvshhtihgtrgdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsthgrsghlvgesnhhonhhgnhhurdhorhhgpdhsrhhikhgrnhhthhestggvlhgvshhtihgtrgdrtghomhdpkhhgvghnghgrnhestggvlhgvshhtihgtrgdrtghomhdpphgvthgvrhesphhjugdruggvvhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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

Hello,

Adding Peter since he contributed the fuji machine,

On 2/14/23 10:06, ~ssinprem wrote:
> From: Sittisak Sinprem <ssinprem@celestca.com>
> 
> Device 24C64 the size is 64 kilobits
> Device 24C02 the size is 2 kilobits

Could you please specify the size in bytes ?

You will need to add a Signed-off-by tag.

Thanks,

C.

> ---
>   hw/arm/aspeed.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 55f114ef72..8e6a1579e4 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -846,42 +846,42 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
>       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
>   
> -    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
> -    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
> +    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB / 8);
> +    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB / 8);
> +    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB / 8);
>   
>       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
>       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
>       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
>       i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
>   
> -    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
> +    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB / 8);
>       i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
>   
>       i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> -    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB / 8);
>       i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
>       i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
>   
>       i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
>       i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
>   
> -    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
> +    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB / 8);
>       i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
>       i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> -    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB / 8);
> +    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB / 8);
> +    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB / 8);
> +    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB / 8);
>   
> -    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
> +    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB / 8);
>       i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
>       i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> -    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
> +    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB / 8);
> +    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB / 8);
> +    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB / 8);
> +    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB / 8);
> +    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB / 8);
>   
>       for (int i = 0; i < 8; i++) {
>           aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);


