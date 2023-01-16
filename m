Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D321066BC95
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 12:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHNRU-0004hp-Dw; Mon, 16 Jan 2023 06:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pHNRR-0004gJ-39; Mon, 16 Jan 2023 06:14:17 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pHNRO-0005R7-Bj; Mon, 16 Jan 2023 06:14:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 83277217A7;
 Mon, 16 Jan 2023 11:13:36 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 16 Jan
 2023 12:13:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001c9009280-f149-47d5-a70c-ddaa69851e32,
 9562F276D9C9043C19838F7BDA7B87DE9C964FD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3413fbee-f200-2b4b-4132-1bac82d1fdbd@kaod.org>
Date: Mon, 16 Jan 2023 12:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/6] hw/nvram/eeprom_at24c: Add header w/ init helper
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <patrick@stwcx.xyz>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <hskinnemoen@google.com>, <kfting@nuvoton.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-2-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230114170151.87833-2-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f584dca1-1c10-41bb-9a1c-26291dd66cd6
X-Ovh-Tracer-Id: 3557843709873654575
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedgvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrsehpjhgurdguvghvpdhprghtrhhitghksehsthiftgigrdighiiipdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmoh
 ehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
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

On 1/14/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Please add some short commit log explaining how the helper could be useful.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/nvram/eeprom_at24c.c         | 10 ++++++++++
>   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 include/hw/nvram/eeprom_at24c.h
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 2d4d8b952f38..0c27eae2b354 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -12,6 +12,7 @@
>   #include "qapi/error.h"
>   #include "qemu/module.h"
>   #include "hw/i2c/i2c.h"
> +#include "hw/nvram/eeprom_at24c.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-properties-system.h"
>   #include "sysemu/block-backend.h"
> @@ -128,6 +129,15 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>       return 0;
>   }
>   
> +void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", address);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +}
> +
>   static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>   {
>       EEPROMState *ee = AT24C_EE(dev);
> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> new file mode 100644
> index 000000000000..9d9cf212757c
> --- /dev/null
> +++ b/include/hw/nvram/eeprom_at24c.h
> @@ -0,0 +1,10 @@
> +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> +
> +#ifndef EEPROM_AT24C_H
> +#define EEPROM_AT24C_H
> +
> +#include "hw/i2c/i2c.h"
> +
> +void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> +
> +#endif


