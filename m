Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05384018B7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:18:01 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNAlM-0001DU-BB
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNAjE-0008OZ-Sk; Mon, 06 Sep 2021 05:15:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNAjC-0006rX-8X; Mon, 06 Sep 2021 05:15:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id i6so8798832wrv.2;
 Mon, 06 Sep 2021 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m7tujPF+VCPzG4gf6ygetdRhx3AyTRQK9iDnLDNtNq0=;
 b=N/kWNEAKLzUwliIu96WWdZenUGLJC1ldF5B4l2ZL/z9biE2rWNV/HIc6xbFN4RE4tg
 TdoFjmPgPvQgtdKyT0q3Rn2fFW5DipD42axcq7MrLeQfj3fzm5vwOfqe1j285kJLDmOH
 e9QnM/xi8vQD8BoIXKvzpzJBjXz5VqKwpQWK+oR7Mqe0n8VekyXhvudZpB9ws0J9BQRJ
 aLj96BFx6PRm8WgN2OgJXjnxL+WoMOcLTSc9qaqUpuEv7fwNmrwAM1RQsDNMmqAHw+LO
 3t5S26QJD70KHC5aNw9jnykf/BL0mrHcPRfl4tRepPDsq+l6awYeBx6O9/TT2mWztFrp
 EK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m7tujPF+VCPzG4gf6ygetdRhx3AyTRQK9iDnLDNtNq0=;
 b=TAJWIc2BMH/zU8xflnrIez4prak7WkPQ1nYmWBknNZu6rMrypcLmqE1stS5A2vWNOR
 ZDPfB5E8vsPi7G3qmOReYLUSzwOEZL9W522c7jgRtqZ9Fkqe5gwv9peJLmAgD80FH/yg
 XGb9/BPx5+r0/7ZWMZpi92vZmyMLzbkDX4MBC3Yx2Y6AUXOHTrpM5QDruDgmnDoq5IHh
 vxGWFwoo6IP7z/EwEkFyuJOUx+fG/QSeHa2ldK0lFi6DyOH/gacI7ulogHCOjWUIA4di
 YyaVc/QzuYLcwJI5QlVEI8tu17ld/mGXX133WAOvEOGImm61okuosCMWRX30dQ+kHGcO
 +DFQ==
X-Gm-Message-State: AOAM530OsLdT9yMUPL4z7WmGXO/bYTwa+mqX6vQsQv0oYWW4SWwjCYkd
 WGtgdCiV8rQ3mlc5khPaLu8=
X-Google-Smtp-Source: ABdhPJykEoyHzslAfKnZBFiNzx1M35AX+oR0nPGhmDmvL33mVYl2vR+jPXnMmHbe5ooIQDYA82mJ/w==
X-Received: by 2002:adf:914e:: with SMTP id j72mr12135691wrj.428.1630919743926; 
 Mon, 06 Sep 2021 02:15:43 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n1sm7059049wrp.49.2021.09.06.02.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 02:15:43 -0700 (PDT)
Subject: Re: [PATCH v3] hw/arm/aspeed: Add Fuji machine type
To: pdel@fb.com
References: <20210905185535.3108281-1-pdel@fb.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df253697-2a94-0806-3004-ac0131ff5992@amsat.org>
Date: Mon, 6 Sep 2021 11:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905185535.3108281-1-pdel@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.832,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 patrick@stwcx.xyz, qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/21 8:55 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> This adds a new machine type "fuji-bmc" based on the following device tree:
> 
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts

Sorry for being picky, but 'master' is a branch, not a (fixed) tag.
Since there is no tag released with this file, please point to the
commit introducing the file:

https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts

> Most of the i2c devices are not there, they're added here:
> 
> https://github.com/facebook/openbmc/blob/helium/meta-facebook/meta-fuji/recipes-utils/openbmc-utils/files/setup_i2c.sh

Similarly:

https://github.com/facebook/openbmc/blob/fb2ed12002fb/meta-facebook/meta-fuji/recipes-utils/openbmc-utils/files/setup_i2c.sh

(note the nice fb*fb SHA-1 :P)

> I tested this by building a Fuji image from Facebook's OpenBMC repo,
> booting, and ssh'ing from host-to-guest.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 7a9459340c..cc2d721ac7 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -159,6 +159,10 @@ struct AspeedMachineState {
>  #define RAINIER_BMC_HW_STRAP1 0x00000000
>  #define RAINIER_BMC_HW_STRAP2 0x00000000
>  
> +/* Fuji hardware value */
> +#define FUJI_BMC_HW_STRAP1    0x00000000
> +#define FUJI_BMC_HW_STRAP2    0x00000000
> +
>  /*
>   * The max ram region is for firmwares that scan the address space
>   * with load/store to guess how much RAM the SoC has.
> @@ -772,6 +776,90 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>      aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
>  }
>  
> +static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr, I2CBus **channels) {

Per https://wiki.qemu.org/Contribute/SubmitAPatch#Use_the_QEMU_coding_style

   static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
                                    I2CBus **channels)
   {

> +    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
> +    for (int i = 0; i < 8; i++) {
> +        channels[i] = pca954x_i2c_get_bus(mux, i);
> +    }
> +}
> +
> +#define TYPE_LM75 TYPE_TMP105
> +#define TYPE_TMP75 TYPE_TMP105
> +#define TYPE_TMP422 "tmp422"
> +
> +static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    I2CBus *i2c[144] = {};
> +
> +    for (int i = 0; i < 16; i++) {
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }
> +    I2CBus *i2c180 = i2c[2];
> +    I2CBus *i2c480 = i2c[8];
> +    I2CBus *i2c600 = i2c[11];
> +
> +    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
> +    get_pca9548_channels(i2c480, 0x70, &i2c[24]);

QEMU style:

       /*

> +    // NOTE: The device tree skips [32, 40) in the alias numbering, so we do
> +    // the same here.

        */

> +    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
> +    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
> +    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
> +    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
> +    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
> +    for (int i = 0; i < 8; i++) {
> +        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
> +    }
> +
> +    i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> +    i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
> +
> +    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
> +    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
> +
> +    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
> +    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
> +    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
> +    i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
> +
> +    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
> +    i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
> +
> +    i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> +    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
> +    i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
> +    i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
> +
> +    i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
> +    i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
> +
> +    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
> +    i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
> +    i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> +    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
> +
> +    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
> +    i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
> +    i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> +    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
> +    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
> +
> +    for (int i = 0; i < 8; i++) {
> +        aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
> +        i2c_slave_create_simple(i2c[82 + i * 8], TYPE_TMP75, 0x48);
> +        i2c_slave_create_simple(i2c[83 + i * 8], TYPE_TMP75, 0x4b);
> +        i2c_slave_create_simple(i2c[84 + i * 8], TYPE_TMP75, 0x4a);
> +    }
> +}
> +
>  static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>  {
>      return ASPEED_MACHINE(obj)->mmio_exec;
> @@ -1070,6 +1158,26 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>  
> +static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc = "Facebook Fuji BMC (Cortex-A7)";
> +    amc->soc_name = "ast2600-a3";
> +    amc->hw_strap1 = FUJI_BMC_HW_STRAP1;
> +    amc->hw_strap2 = FUJI_BMC_HW_STRAP2;
> +    amc->fmc_model = "mx66l1g45g";
> +    amc->spi_model = "mx66l1g45g";
> +    amc->num_cs = 2;
> +    amc->macs_mask = ASPEED_MAC3_ON;
> +    amc->i2c_init = fuji_bmc_i2c_init;
> +    amc->uart_default = ASPEED_DEV_UART1;
> +    mc->default_ram_size = 2 * GiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);

Matter of taste:

       mc->default_cpus = mc->min_cpus = mc->max_cpus
                        = aspeed_soc_num_cpus(amc->soc_name);

> +};
> +
>  static const TypeInfo aspeed_machine_types[] = {
>      {
>          .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1119,6 +1227,10 @@ static const TypeInfo aspeed_machine_types[] = {
>          .name          = MACHINE_TYPE_NAME("rainier-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_rainier_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("fuji-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_fuji_class_init,
>      }, {
>          .name          = TYPE_ASPEED_MACHINE,
>          .parent        = TYPE_MACHINE,
> 

