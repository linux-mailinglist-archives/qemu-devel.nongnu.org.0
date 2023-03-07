Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158756ADB88
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUJf-0006RL-IM; Tue, 07 Mar 2023 05:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZUJc-0006Qp-WF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:13:05 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZUJb-0001mf-9B
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:13:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1705E211A6;
 Tue,  7 Mar 2023 10:12:51 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 7 Mar
 2023 11:12:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0038016aaf0-ce34-45fa-a87b-22cfefe40537,
 D586700EEA543FC8D630564B717DAE7078976E4F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f6be2cb3-b4bd-7e53-647c-1d6922f2eb5c@kaod.org>
Date: Tue, 7 Mar 2023 11:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] Added TMP421 type sensor's support in yosemitev2
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230307095239.3583613-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230307095239.3583613-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d2fe0abe-98a7-4600-95ff-ffdb1e029365
X-Ovh-Tracer-Id: 1018376469284424486
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteeghedugeeiffekfedtlefftdejleefgeegteelgfdujeeggfefieevuedtffehnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhkrghrthhhihhkvgihrghnudehtdelsehgmhgrihhlrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 3/7/23 10:52, Karthikeyan Pasupathi wrote:
> Added TMP421 type support in yosemite v2 platform.
> 
> Tested: Tested and verified in yosemite V2 platform.
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 86601cb1a5..7b5e603bc4 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -524,6 +524,11 @@ static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
>       at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x51, 128 * KiB);
>       at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 128 * KiB,
>                             yosemitev2_bmc_fruid, yosemitev2_bmc_fruid_len);
> +    /* TMP421 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "tmp421", 0x1f);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp421", 0x4e);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp421", 0x4f);
> +
>   }
>   
>   static void romulus_bmc_i2c_init(AspeedMachineState *bmc)


