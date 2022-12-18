Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989A6504DF
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:56:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71d4-00082T-6y; Sun, 18 Dec 2022 16:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71cz-0007z4-VW
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:55:26 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71cw-000162-V3
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:55:24 -0500
Received: by mail-ej1-x62f.google.com with SMTP id tz12so17522744ejc.9
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gQAsn3ZOCdJ0wukywg3wvkm1clR5BI06sXUCBzj7Ce4=;
 b=BW9WV9REQGLW4ppfMh8VRdzMvP1rt0mxHePdSS6O9OPzkb6xu2NjlUfJrEahjyzg1p
 6q1K/R9SaQKibDep8mrdtPqiVEAskGYmPRnJg53lHYo+j/j+7mCgJr3aJ6vHPkBY8V7l
 CVI6YOE7I2d6CxL5KZBEDHciiQAqMz9YJAKLLRw16qBzTpeLe8U1OKPlQTZ498/ClN/b
 XQZKU8Nv/nucDA6rmNhRazXC9mHJKLos26RqgkOzYq1dOdJ8tz2H2psWFEFTC+PyMKhi
 mUestIWSf8D7f+hjtUxg0Ylc2kuMbWwQgN2u0lYnjDJP4c0hSDfu2toP4OskLpFJwzoS
 SaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gQAsn3ZOCdJ0wukywg3wvkm1clR5BI06sXUCBzj7Ce4=;
 b=5pv/eCbCF4nFiF+7JtTExZqr7TpwUCf9Lg8urlIPI0bj8HqNa34VpWY04BRTs7/n8g
 9S2462tFuSA/h1za9o1Q1whWjl81G7z5SeHUGvkC3OCFq24+X0+6kPNz/mTCkcKbgYJ1
 vZrmiqKI70aDhCCLISwbdJX0VReFIu930gRz3sg3MiKeotZmCTVkU38HnKbUTBga9z6B
 KQE/NvHXaPxz3kv/5tdkn40599olD66nOIU5ywvGBQbDNINuRMSK8wO2tlPB6FKNZY/O
 rlPX6KAPo06FIjw2cc2RD4xZ8R2p1BJqLuo3gjn62m8kkOeStlZ125hR7ZLgZQTyUmdb
 vXqA==
X-Gm-Message-State: ANoB5pn6MNxf8MAWgd4/dy1uw8fdsVnDqezQT0IgLuPg0N71aYR2Cj/+
 3e4LEl5IpYEuju90taIh8e0WeQ==
X-Google-Smtp-Source: AA0mqf5zu0xlirvdEL8VFcLEEeW2MUtyP0auY6iUUBCawNjcs/Ao31ajyun+ZXIHcPejFHAf4xONSA==
X-Received: by 2002:a17:907:1de3:b0:7c0:e5dd:6e5f with SMTP id
 og35-20020a1709071de300b007c0e5dd6e5fmr36922391ejc.4.1671400521313; 
 Sun, 18 Dec 2022 13:55:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 rs13-20020a170907036d00b0077a1dd3e7b7sm3590150ejb.102.2022.12.18.13.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:55:20 -0800 (PST)
Message-ID: <42ea0781-b963-8dff-6c1f-f5d342f38618@linaro.org>
Date: Sun, 18 Dec 2022 22:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 5/7] hw/arm: Add AXP-209 to Cubieboard
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-6-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211918.3592-6-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 22:19, Strahinja Jankovic wrote:
> SPL Boot for Cubieboard expects AXP-209 connected to I2C0 bus.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   hw/arm/cubieboard.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 5e3372a3c7..afc7980414 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -20,6 +20,7 @@
>   #include "hw/boards.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/arm/allwinner-a10.h"
> +#include "hw/i2c/i2c.h"
>   
>   static struct arm_boot_info cubieboard_binfo = {
>       .loader_start = AW_A10_SDRAM_BASE,
> @@ -34,6 +35,7 @@ static void cubieboard_init(MachineState *machine)
>       BlockBackend *blk;
>       BusState *bus;
>       DeviceState *carddev;
> +    I2CBus *i2c;
>   
>       /* BIOS is not supported by this board */
>       if (machine->firmware) {
> @@ -80,6 +82,10 @@ static void cubieboard_init(MachineState *machine)
>           exit(1);
>       }
>   
> +    /* Connect AXP 209 */
> +    i2c = (I2CBus *)qdev_get_child_bus(DEVICE(&a10->i2c0), "i2c");

Preferably using I2C_BUS() instead of the cast:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    i2c_slave_create_simple(i2c, "allwinner.axp209", 0x34);
> +
>       /* Retrieve SD bus */
>       di = drive_get(IF_SD, 0, 0);
>       blk = di ? blk_by_legacy_dinfo(di) : NULL;


