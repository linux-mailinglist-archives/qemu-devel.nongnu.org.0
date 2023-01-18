Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D18671C1C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:33:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7co-0002sl-58; Wed, 18 Jan 2023 07:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pI7cm-0002sK-4U
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:33:04 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pI7ck-00050d-C9
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:33:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.141])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B737C1FF96;
 Wed, 18 Jan 2023 12:32:56 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 18 Jan
 2023 13:32:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003b38c8658-8d60-4391-8ea4-6e57eaf5177a,
 B02C0E203F6A6AD140F658F33EDEBE178EEACDD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bab1aa07-a8d5-29bb-ac0c-a949f243260f@kaod.org>
Date: Wed, 18 Jan 2023 13:32:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <hskinnemoen@google.com>, <kfting@nuvoton.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <philmd@linaro.org>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-4-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230118024214.14413-4-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e04ea7f2-459d-4b0c-9c32-1ae27c209153
X-Ovh-Tracer-Id: 16643052426165390127
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrsehpjhgurdguvghvpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmoh
 ehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
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

On 1/18/23 03:42, Peter Delevoryas wrote:
> Allows users to specify binary data to initialize an EEPROM, allowing users to
> emulate data programmed at manufacturing time.
> 
> - Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
> - Added at24c_eeprom_init_rom helper function to initialize attributes
> - If -drive property is provided, it overrides init_rom data
> 
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
>   include/hw/nvram/eeprom_at24c.h | 16 ++++++++++++++
>   2 files changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 98857e3626b9..f8d751fa278d 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -50,6 +50,9 @@ struct EEPROMState {
>       uint8_t *mem;
>   
>       BlockBackend *blk;
> +
> +    const uint8_t *init_rom;
> +    uint32_t init_rom_size;
>   };
>   
>   static
> @@ -131,19 +134,38 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>   
>   I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
>   {
> -    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
> -    DeviceState *dev = DEVICE(i2c_dev);
> +    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
> +}
> +
> +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> +                                const uint8_t *init_rom, uint32_t init_rom_size)
> +{
> +    EEPROMState *s;
> +
> +    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
> +
> +    qdev_prop_set_uint8(DEVICE(s), "address", address);
> +    qdev_prop_set_uint32(DEVICE(s), "rom-size", rom_size);
>   
> -    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +    /* TODO: Model init_rom with QOM properties. */
> +    s->init_rom = init_rom;
> +    s->init_rom_size = init_rom_size;
>   
> -    return i2c_dev;
> +    i2c_slave_realize_and_unref(I2C_SLAVE(s), bus, &error_abort);
> +
> +    return I2C_SLAVE(s);
>   }
>   
>   static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>   {
>       EEPROMState *ee = AT24C_EE(dev);
>   
> +    if (ee->init_rom_size > ee->rsize) {
> +        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
> +                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
> +        return;
> +    }
> +
>       if (ee->blk) {
>           int64_t len = blk_getlength(ee->blk);
>   
> @@ -163,6 +185,7 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>       }
>   
>       ee->mem = g_malloc0(ee->rsize);
> +
>   }
>   
>   static
> @@ -176,6 +199,10 @@ void at24c_eeprom_reset(DeviceState *state)
>   
>       memset(ee->mem, 0, ee->rsize);
>   
> +    if (ee->init_rom) {
> +        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
> +    }
> +
>       if (ee->blk) {
>           int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
>   
> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> index 196db309d451..acb9857b2add 100644
> --- a/include/hw/nvram/eeprom_at24c.h
> +++ b/include/hw/nvram/eeprom_at24c.h
> @@ -20,4 +20,20 @@
>    */
>   I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
>   
> +
> +/*
> + * Create and realize an AT24C EEPROM device on the heap with initial data.
> + * @bus: I2C bus to put it on
> + * @address: I2C address of the EEPROM slave when put on a bus
> + * @rom_size: size of the EEPROM
> + * @init_rom: Array of bytes to initialize EEPROM memory with
> + * @init_rom_size: Size of @init_rom, must be less than or equal to @rom_size
> + *
> + * Create the device state structure, initialize it, put it on the specified
> + * @bus, and drop the reference to it (the device is realized). Copies the data
> + * from @init_rom to the beginning of the EEPROM memory buffer.
> + */
> +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> +                                const uint8_t *init_rom, uint32_t init_rom_size);
> +
>   #endif


