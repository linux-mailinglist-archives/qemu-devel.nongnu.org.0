Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906593C6BB6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 09:49:55 +0200 (CEST)
Received: from localhost ([::1]:60378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3DAw-0000iX-MQ
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 03:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1m3D9Q-0007oo-Ag; Tue, 13 Jul 2021 03:48:24 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1m3D9M-0002jK-I8; Tue, 13 Jul 2021 03:48:20 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h4so20876493pgp.5;
 Tue, 13 Jul 2021 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=JchWDQn8hAq686/79NInUizMlp8B2d1fC53Lfwh3/WE=;
 b=Mq2Q06trerugpduswcygmB56Yo9wy0b0k2Rcr2rMoiNS97CEpTKCjWOrXyDTdhG+lA
 80K7NXzZX8IjiwC0bHL5+Pjr8+29Af7LAVuE4QODCkATca0kKhq28sVrwoRVkaC9+CzE
 4Paw2ulAI8kFTUbO759oMNFWuyBfQffHysHbqSv/Cc9zulXQNUTOP7J7mFxVSCwADUuu
 8M64q+X9zydwcHsN1OGS4t3Y2lKhX7+zi/eSGijnM4PfAnRkje/ebSKFKbKsbVLOEq3z
 lbb0ObEx/H1HjVCCE1bGMRCOeIqb2lt1Hfs1EMcYvGdQMvRvVlIvVhQWN+LNKwhBipm7
 545w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=JchWDQn8hAq686/79NInUizMlp8B2d1fC53Lfwh3/WE=;
 b=KGcnLs75tTUS2oi2KfXn0dHNdIo897zWOXPNwNbvk1kkh0H+aXVtpnC91Y/Ijm/uUM
 /tSwJEhAMBRRwap4eFwjR4l18sj3/5uIrRK2PqdhLsFYuEnO4bg0715wai9KvQwH4p1g
 hG3BZD116WOhGHX3zby35Q8L1Qp96l7wEwpR9c3qc65hbkCh67Mb6EP/lBrDnc5usXEA
 v9bN14tT6O3KWS5kQ6TrTjcoLK+/qTpsl9H0Umnq5vclESgr1+6ZcM07A/Udwl7gLplD
 74dvc84boPArmwL9/Z1Y3W7p69LGrp7wT0+2gCNnBPmDG05n2F0OOvkgolugSnCZYs/q
 E9SA==
X-Gm-Message-State: AOAM532Lymyqxbq9z5Oox010NKZmpZqUzmElZFABH68SDIjgE1U6RFrM
 ZmGExCM/hHim0+BLDB/icxc=
X-Google-Smtp-Source: ABdhPJxqy3yRrmfWXMlDaKThfoIzSbrqHZNAO9fJnR/CQpBLeBuHC2i5mVCrT29bJnnIMTdhRMKTIQ==
X-Received: by 2002:a65:6a01:: with SMTP id m1mr3140048pgu.201.1626162494876; 
 Tue, 13 Jul 2021 00:48:14 -0700 (PDT)
Received: from [10.0.20.43] ([103.217.166.124])
 by smtp.googlemail.com with ESMTPSA id w14sm22104309pgo.75.2021.07.13.00.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 00:48:14 -0700 (PDT)
Message-ID: <92f6c1442cb2397a02b288fbcdf0cb7a760a86c6.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] hw: aspeed_gpio: Clarify GPIO controller name
From: Rashmica Gupta <rashmica.g@gmail.com>
To: Joel Stanley <joel@jms.id.au>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Date: Tue, 13 Jul 2021 17:48:09 +1000
In-Reply-To: <20210713065854.134634-4-joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-4-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=rashmica.g@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-07-13 at 16:28 +0930, Joel Stanley wrote:
> There are two GPIO controllers in the ast2600; one is 3.3V and the
> other
> is 1.8V.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Thanks for picking this up.
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  hw/gpio/aspeed_gpio.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index dc721aec5da7..dfa6d6cb40a9 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -164,12 +164,12 @@
>  #define GPIO_YZAAAB_DIRECTION      (0x1E4 >> 2)
>  #define GPIO_AC_DATA_VALUE         (0x1E8 >> 2)
>  #define GPIO_AC_DIRECTION          (0x1EC >> 2)
> -#define GPIO_3_6V_MEM_SIZE         0x1F0
> -#define GPIO_3_6V_REG_ARRAY_SIZE   (GPIO_3_6V_MEM_SIZE >> 2)
> +#define GPIO_3_3V_MEM_SIZE         0x1F0
> +#define GPIO_3_3V_REG_ARRAY_SIZE   (GPIO_3_3V_MEM_SIZE >> 2)
>  
>  /* AST2600 only - 1.8V gpios */
>  /*
> - * The AST2600 two copies of the GPIO controller: the same 3.6V
> gpios as the
> + * The AST2600 two copies of the GPIO controller: the same 3.3V
> gpios as the
>   * AST2400 (memory offsets 0x0-0x198) and a second controller with
> 1.8V gpios
>   * (memory offsets 0x800-0x9D4).
>   */
> @@ -380,7 +380,7 @@ static uint32_t
> update_value_control_source(GPIOSets *regs, uint32_t old_value,
>      return new_value;
>  }
>  
> -static const AspeedGPIOReg
> aspeed_3_6v_gpios[GPIO_3_6V_REG_ARRAY_SIZE] = {
> +static const AspeedGPIOReg
> aspeed_3_3v_gpios[GPIO_3_3V_REG_ARRAY_SIZE] = {
>      /* Set ABCD */
>      [GPIO_ABCD_DATA_VALUE] =     { 0, gpio_reg_data_value },
>      [GPIO_ABCD_DIRECTION] =      { 0, gpio_reg_direction },
> @@ -800,7 +800,7 @@ static const GPIOSetProperties
> ast2500_set_props[] = {
>      [7] = {0x000000ff,  0x000000ff,  {"AC"} },
>  };
>  
> -static GPIOSetProperties ast2600_3_6v_set_props[] = {
> +static GPIOSetProperties ast2600_3_3v_set_props[] = {
>      [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
>      [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
>      [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
> @@ -927,7 +927,7 @@ static void
> aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
>      agc->nr_gpio_pins = 216;
>      agc->nr_gpio_sets = 7;
>      agc->gap = 196;
> -    agc->reg_table = aspeed_3_6v_gpios;
> +    agc->reg_table = aspeed_3_3v_gpios;
>  }
>  
>  static void aspeed_gpio_2500_class_init(ObjectClass *klass, void
> *data)
> @@ -938,17 +938,17 @@ static void
> aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
>      agc->nr_gpio_pins = 228;
>      agc->nr_gpio_sets = 8;
>      agc->gap = 220;
> -    agc->reg_table = aspeed_3_6v_gpios;
> +    agc->reg_table = aspeed_3_3v_gpios;
>  }
>  
> -static void aspeed_gpio_ast2600_3_6v_class_init(ObjectClass *klass,
> void *data)
> +static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass,
> void *data)
>  {
>      AspeedGPIOClass *agc = ASPEED_GPIO_CLASS(klass);
>  
> -    agc->props = ast2600_3_6v_set_props;
> +    agc->props = ast2600_3_3v_set_props;
>      agc->nr_gpio_pins = 208;
>      agc->nr_gpio_sets = 7;
> -    agc->reg_table = aspeed_3_6v_gpios;
> +    agc->reg_table = aspeed_3_3v_gpios;
>  }
>  
>  static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass,
> void *data)
> @@ -984,10 +984,10 @@ static const TypeInfo aspeed_gpio_ast2500_info
> = {
>      .instance_init  = aspeed_gpio_init,
>  };
>  
> -static const TypeInfo aspeed_gpio_ast2600_3_6v_info = {
> +static const TypeInfo aspeed_gpio_ast2600_3_3v_info = {
>      .name           = TYPE_ASPEED_GPIO "-ast2600",
>      .parent         = TYPE_ASPEED_GPIO,
> -    .class_init     = aspeed_gpio_ast2600_3_6v_class_init,
> +    .class_init     = aspeed_gpio_ast2600_3_3v_class_init,
>      .instance_init  = aspeed_gpio_init,
>  };
>  
> @@ -1003,7 +1003,7 @@ static void aspeed_gpio_register_types(void)
>      type_register_static(&aspeed_gpio_info);
>      type_register_static(&aspeed_gpio_ast2400_info);
>      type_register_static(&aspeed_gpio_ast2500_info);
> -    type_register_static(&aspeed_gpio_ast2600_3_6v_info);
> +    type_register_static(&aspeed_gpio_ast2600_3_3v_info);
>      type_register_static(&aspeed_gpio_ast2600_1_8v_info);
>  }
>  



