Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704CB418735
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 09:42:16 +0200 (CEST)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUOne-0008Hg-T5
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 03:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUOly-0006kt-RL; Sun, 26 Sep 2021 03:40:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUOlw-0006hN-Ad; Sun, 26 Sep 2021 03:40:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id t18so41304600wrb.0;
 Sun, 26 Sep 2021 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vKBSsGq86648uNl3aXu67IsPV7G5vN61Gzyxh2X9cOE=;
 b=fCIk1uAJDpfcGhNLApDD7VRxlZkmz3J0lb4k7iO7MCvYpVhFUzKk/oejQpMzCiytaN
 o1LZQlv4Ckac7TqZYO6CoBS/jIDhztz4jo1quZ006awyvApDEtalz9TOjT+vKCOWsN7i
 KDiGxp7FuqxUvM7YaCYD77367jzPCO79KR+s0H55xi36EhXSkXLBra//LMbxz/HTUslI
 TCwsQDx/X7Fn3+v8vU9m/ht5t+02McwkuPR05RGkYopkqGFsazTruCsTtsXeWlSMu+2Q
 NM+hIrhbNP9nTytBO8zYOAMxMLl0PGVq9ecmgmXik3R5Oyrdlyk4VcTrOs2VH+WMtD1l
 NkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vKBSsGq86648uNl3aXu67IsPV7G5vN61Gzyxh2X9cOE=;
 b=oVmcVjEzpRbir90nggKhpfjR3uHXUTORsfq1vLbwj2ZXNofcvCYi1OdESTmfYlIdjo
 fLjStVg/GnGiJnTbs8DgBSzTiBzzWZjB7rhzWHwUoc3UxW3zkesi2zEJg5SRdS1EpgGk
 tedrFHnvjP39P4hJBBnonB9uRy3sak6D84EllzBX9k0Ufi564dBdfdFDefVYKIty1bO6
 yV4RGRmlpUaOyi0dTdXYreC1oMGX4rma19LCcjCnGB0ehUY5dAgwI7O52YRS6TC/FkfP
 I6tKfGWarWHs6NP713pk13TqxZfsnG4+C47R1Jj/gOD9OzWFVb6rDeW1uTLaPHvZXgqp
 M1Bw==
X-Gm-Message-State: AOAM5312vVeXb+7cmHFeXl35H8Pznw7AeWFuC+rDnZVx87hIS+53UyQ9
 oMEx+FuhH+g37DEJHz99o5g=
X-Google-Smtp-Source: ABdhPJwrSNklCgNUORS5UJIe3a8VDaQVFVeNzKIl1rzFeo7p9cmlzICprdUSfr6sibTjApWBQ7PtbA==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr9761455wmj.151.1632642025423; 
 Sun, 26 Sep 2021 00:40:25 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id t6sm16745533wmj.12.2021.09.26.00.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 00:40:24 -0700 (PDT)
Message-ID: <fa80416b-6382-e865-89a3-9289afdd75c8@amsat.org>
Date: Sun, 26 Sep 2021 09:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/arm: sabrelite: Connect SPI flash CS line to GPIO3_19
Content-Language: en-US
To: Xuzhou Cheng <xchengl.cn@gmail.com>, qemu-devel@nongnu.org
References: <20210926025651.29456-1-xchengl.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210926025651.29456-1-xchengl.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xuzhou.cheng@windriver.com,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 bmeng.cn@gmail.com, groeck7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/21 04:56, Xuzhou Cheng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> The Linux spi-imx driver does not work on QEMU. The reason is that the
> state of m25p80 loops in STATE_READING_DATA state after receiving
> RDSR command, the new command is ignored. Before sending a new command,
> CS line should be pulled high to make the state of m25p80 back to IDLE.
> 
> Currently the SPI flash CS line is connected to the SPI controller, but
> on the real board, it's connected to GPIO3_19.

Maybe worth mentioning this matches the board dts:

arch/arm/boot/dts/imx6qdl-sabrelite.dtsi:

310 &ecspi1 {
311     cs-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
312     pinctrl-names = "default";
313     pinctrl-0 = <&pinctrl_ecspi1>;
314     status = "okay";
315
316     flash: m25p80@0 {
317         compatible = "sst,sst25vf016b", "jedec,spi-nor";
318         spi-max-frequency = <20000000>;
319         reg = <0>;
320     };
321 };

> Should connect the SSI_GPIO_CS to GPIO3_19 when adding a spi-nor to
> spi1 on sabrelite machine.
> 
> Verified this patch on Linux v5.14.
> 
> Logs:
>   # echo "01234567899876543210" > test
>   # mtd_debug erase /dev/mtd0 0x0 0x1000
>   Erased 4096 bytes from address 0x00000000 in flash
>   # mtd_debug write /dev/mtdblock0 0x0 20 test
>   Copied 20 bytes from test to address 0x00000000 in flash
>   # mtd_debug read /dev/mtdblock0 0x0 20 test_out
>   Copied 20 bytes from address 0x00000000 in flash to test_out
>   # cat test_out
>   01234567899876543210#
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> ---
>  hw/arm/sabrelite.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
> index 29fc777b61..553608e583 100644
> --- a/hw/arm/sabrelite.c
> +++ b/hw/arm/sabrelite.c
> @@ -87,7 +87,7 @@ static void sabrelite_init(MachineState *machine)
>                  qdev_realize_and_unref(flash_dev, BUS(spi_bus), &error_fatal);
>  
>                  cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
> -                sysbus_connect_irq(SYS_BUS_DEVICE(spi_dev), 1, cs_line);
> +                qdev_connect_gpio_out(DEVICE(&s->gpio[2]), 19, cs_line);
>              }
>          }
>      }
> 

Thank for using an oscilloscope to verify, it reminded me
some SDcard debugging 4 years ago =)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

