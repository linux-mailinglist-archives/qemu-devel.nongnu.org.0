Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC3699651
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:50:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeeY-0004We-P7; Thu, 16 Feb 2023 08:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSeeK-00046Y-1M
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:50:12 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSeeG-0002gF-NO
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:50:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.174])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 27B8C20B2C;
 Thu, 16 Feb 2023 13:50:03 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 16 Feb
 2023 14:50:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0055998b8ad-dfee-4c31-a215-d884ac20c00c,
 6472B0FD1AC4FAE7C483658EB00F62ED22160684) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <69176363-525b-9909-2c01-e2f61d4c233d@kaod.org>
Date: Thu, 16 Feb 2023 14:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3] Adding new machine Yosemitev2 in QEMU
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1b176618-7322-49c2-aac2-73dfffe9f9d8
X-Ovh-Tracer-Id: 3785838440758086438
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteeghedugeeiffekfedtlefftdejleefgeegteelgfdujeeggfefieevuedtffehnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpkhgrrhhthhhikhgvhigrnhduhedtleesghhmrghilhdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/16/23 14:33, Karthikeyan Pasupathi wrote:
> This patch support Yosemitev2 in QEMU environment.
> and introduced EEPROM BMC FRU data support "add fbyv2_bmc_fruid data"
> along with the machine support.
> 
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed.c        | 31 +++++++++++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.c | 23 +++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.h |  3 +++
>   3 files changed, 57 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 27dda58338..3f992fea46 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -521,6 +521,15 @@ static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
>                        TYPE_TMP105, 0x4d);
>   }
>   
> +static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x51, 128 * KiB);
> +    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 128 * KiB,
> +                          yosemitev2_bmc_fruid, yosemitev2_bmc_fruid_len);
> +}
> +
>   static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1174,6 +1183,24 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Facebook YosemiteV2 BMC (ARM1176)";
> +    amc->soc_name  = "ast2500-a1";
> +    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
> +    amc->hw_strap2 = 0;
> +    amc->fmc_model = "n25q256a";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 2;
> +    amc->i2c_init  = yosemitev2_bmc_i2c_init;
> +    mc->default_ram_size       = 512 * MiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>   static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1562,6 +1589,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("ast2600-evb"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_ast2600_evb_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("yosemitev2-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_yosemitev2_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
> diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> index 04463acc9d..7006794654 100644
> --- a/hw/arm/aspeed_eeprom.c
> +++ b/hw/arm/aspeed_eeprom.c
> @@ -77,6 +77,29 @@ const uint8_t fby35_bmc_fruid[] = {
>       0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
>   };
>   
> +/* Yosemite V2 BMC FRU */
> +const uint8_t yosemitev2_bmc_fruid[] = {
> +    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
> +    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
> +    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
> +    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
> +    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
> +    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x2e, 0x30, 0x20, 0x45, 0x56, 0x54,
> +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
> +    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
> +};
> +
>   const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
>   const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
>   const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
> +
> +const size_t yosemitev2_bmc_fruid_len = sizeof(yosemitev2_bmc_fruid);
> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> index a0f848fa6e..edf18e9685 100644
> --- a/hw/arm/aspeed_eeprom.h
> +++ b/hw/arm/aspeed_eeprom.h
> @@ -16,4 +16,7 @@ extern const size_t fby35_nic_fruid_len;
>   extern const size_t fby35_bb_fruid_len;
>   extern const size_t fby35_bmc_fruid_len;
>   
> +extern const uint8_t yosemitev2_bmc_fruid[];
> +extern const size_t yosemitev2_bmc_fruid_len;
> +
>   #endif


