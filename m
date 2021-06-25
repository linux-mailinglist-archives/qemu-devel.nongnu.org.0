Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983293B3F6C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:37:51 +0200 (CEST)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhLS-0002Fl-Mh
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lwhK6-0001Aj-Hx; Fri, 25 Jun 2021 04:36:26 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lwhK3-0006Rc-Kp; Fri, 25 Jun 2021 04:36:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F2EEEB087E27;
 Fri, 25 Jun 2021 10:36:11 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Fri, 25 Jun
 2021 10:36:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003e1ad01ad-dec2-4dbb-b288-210b8e091b7b,
 DBCB69B7246CE000B0FCA0F5B8457C792B3268C0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 92.184.105.220
Subject: Re: [PATCH] arm/aspeed: rainier: Add i2c eeproms and muxes
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210625050643.161042-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bca2e943-4fa1-ea16-439f-40d8681cfeef@kaod.org>
Date: Fri, 25 Jun 2021 10:36:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625050643.161042-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e26e4cf5-5f9e-4b7f-b488-9b1bf85803e7
X-Ovh-Tracer-Id: 10771202935205497638
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeegjedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Patrick Venture <venture@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 7:06 AM, Joel Stanley wrote:
> These are the devices documented by the Rainier device tree. With this
> we can see the guest discovering the multiplexers and probing the eeprom
> devices:
> 
>  i2c i2c-2: Added multiplexed i2c bus 16
>  i2c i2c-2: Added multiplexed i2c bus 17
>  i2c i2c-2: Added multiplexed i2c bus 18
>  i2c i2c-2: Added multiplexed i2c bus 19
>  i2c-mux-gpio i2cmux: 4 port mux on 1e78a180.i2c-bus adapter
>  at24 20-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
>  i2c i2c-4: Added multiplexed i2c bus 20
>  at24 21-0051: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
>  i2c i2c-4: Added multiplexed i2c bus 21
>  at24 22-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C. 


> ---
>  hw/arm/aspeed.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1301e8fdffb2..7ed22294c6eb 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -677,6 +677,10 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
>  static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> +    I2CSlave *i2c_mux;
> +
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51,
> +                          g_malloc0(32 * 1024));
>  
>      /* The rainier expects a TMP275 but a TMP105 is compatible */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
> @@ -685,11 +689,25 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                       0x49);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
>                       0x4a);
> +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
> +                                      "pca9546", 0x70);
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 1), 0x51,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 2), 0x52,
> +                          g_malloc0(64 * 1024));
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
>                       0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
>                       0x49);
> +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5),
> +                                      "pca9546", 0x70);
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 1), 0x51,
> +                          g_malloc0(64 * 1024));
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
>                       0x48);
> @@ -697,6 +715,16 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                       0x4a);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
>                       0x4b);
> +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6),
> +                                      "pca9546", 0x70);
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 1), 0x51,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 2), 0x50,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 3), 0x51,
> +                          g_malloc0(64 * 1024));
>  
>      /* Bus 7: TODO dps310@76 */
>      /* Bus 7: TODO max31785@52 */
> @@ -704,11 +732,19 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>      /* Bus 7: TODO si7021-a20@20 */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
>                       0x48);
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51,
> +                          g_malloc0(64 * 1024));
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
>                       0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
>                       0x4a);
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51,
> +                          g_malloc0(64 * 1024));
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552", 0x61);
>      /* Bus 8: ucd90320@11 */
>      /* Bus 8: ucd90320@b */
> @@ -716,14 +752,34 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4d);
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50,
> +                          g_malloc0(128 * 1024));
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4d);
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50,
> +                          g_malloc0(128 * 1024));
>  
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
>                       0x48);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
>                       0x49);
> +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
> +                                      "pca9546", 0x70);
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
> +                          g_malloc0(64 * 1024));
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 1), 0x51,
> +                          g_malloc0(64 * 1024));
> +
> +
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50,
> +                          g_malloc0(64 * 1024));
> +
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50,
> +                          g_malloc0(64 * 1024));
> +
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50,
> +                          g_malloc0(64 * 1024));
>  }
>  
>  static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
> 


