Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ADE4BD12E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 21:08:26 +0100 (CET)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLsVN-0005TK-Ae
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 15:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nLsTm-0004fs-0T
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 15:06:46 -0500
Received: from [2a00:1450:4864:20::432] (port=38586
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nLsTk-0004a0-Hw
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 15:06:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id d27so23638189wrb.5
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 12:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2QQop7b4ZNe0XgkfToHQnUJqNAkpiJ9Qk+Jdf2e09tA=;
 b=jq72R03IeTYNdYXGzCFOs+Man7l21x6wGF9X6H8YRHspr91wCTOwaZabCBWs3uCsha
 nqiG5EXfbEHgCgW0ezV5YauqvfFGd1QfkGkoSHEUT5IHNS3Fl63/MhgTkB9rz1Yrmy1g
 /a4oHbz66uqbyga+4MzmtU1twP5Z/82+sLYIhFKHerTpj5tyKKR5LOWUzyaCDpyb4Vwn
 XojL2Hc6s5YaBKz9TYQn4PgslE8X09NWUuu5b99jbePVbdKpDwt/7QmqqmfcKVWWlPWz
 45Iu+vruXOeRLJ8oGYAe0h1tJgjP+HSID6Y8lpglFQ00XmbT3R2SrXjskzveovkG0pi8
 khtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2QQop7b4ZNe0XgkfToHQnUJqNAkpiJ9Qk+Jdf2e09tA=;
 b=Y/TF4PmaRcqEg6HzYwPMuIVaqwMs/CQRCO25qONnwuzfZZMewSoLQoiuUgFJVCU6HS
 59L1lU5WXqDHr4Ms5M2BvOJ3fAeg/JmR4q9Zhmo4/bcVt1e5Lp4sTv02q5tZoH9YuZkT
 DGzAlrgAsI/9+HmzsZQjAKjfxXEKu49+GnXNtgeXUoyxtE/Vc/cMBQQmkkRdWLtgZDXX
 fxZRPegLfNLorVd+UX8VcsGO0eUf1LZMwYzl1TSVP5JSwCNKxwj0gSrv7im2FWpDc0UB
 LJnyn6dC2ZC5NRDKmd05sHYU/q6eDuS5HCEsgb/lfDcQEsd3/k0Kx9zi4MEs81vXj3RH
 8mZw==
X-Gm-Message-State: AOAM530uJ4z3LS2vZW3CTfKsThStrn1UTQ10muTPbyUgWuGj0d+1pbC3
 Yf83/IoBfyXQa+Rkuc/LNZ0=
X-Google-Smtp-Source: ABdhPJyXTAJopzZHs6ZZlSWYew5mYcOxTERjWRqF5eXlYq/Iyg7tv5Yc6ppEU8XnVOX0ATqICJmwbQ==
X-Received: by 2002:adf:efcc:0:b0:1e7:cf03:b419 with SMTP id
 i12-20020adfefcc000000b001e7cf03b419mr13249284wrp.122.1645387602713; 
 Sun, 20 Feb 2022 12:06:42 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id z3sm6278170wmp.42.2022.02.20.12.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 12:06:42 -0800 (PST)
Message-ID: <b5009ed2-b53c-c985-6414-0804cd0db11b@gmail.com>
Date: Sun, 20 Feb 2022 21:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v3 3/6] hw/openrisc/openrisc_sim: Use IRQ splitter when
 connecting UART
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
References: <20220219064210.3145381-1-shorne@gmail.com>
 <20220219064210.3145381-4-shorne@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220219064210.3145381-4-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/2/22 07:42, Stafford Horne wrote:
> Currently the OpenRISC SMP configuration only supports 2 cores due to
> the UART IRQ routing being limited to 2 cores.  As was done in commit
> 1eeffbeb11 ("hw/openrisc/openrisc_sim: Use IRQ splitter when connecting
> IRQ to multiple CPUs") we can use a splitter to wire more than 2 CPUs.
> 
> This patch moves serial initialization out to it's own function and
> uses a splitter to connect multiple CPU irq lines to the UART.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>   hw/openrisc/openrisc_sim.c | 32 ++++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index d12b3e0c5e..5bfbac00f8 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -137,6 +137,28 @@ static void openrisc_sim_ompic_init(hwaddr base, int num_cpus,
>       sysbus_mmio_map(s, 0, base);
>   }
>   
> +static void openrisc_sim_serial_init(hwaddr base, int num_cpus,
> +                                     OpenRISCCPU *cpus[], int irq_pin)
> +{
> +    qemu_irq serial_irq;
> +    int i;
> +
> +    if (num_cpus > 1) {
> +        DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
> +        qdev_prop_set_uint32(splitter, "num-lines", num_cpus);
> +        qdev_realize_and_unref(splitter, NULL, &error_fatal);
> +        for (i = 0; i < num_cpus; i++) {
> +            qdev_connect_gpio_out(splitter, i, get_cpu_irq(cpus, i, irq_pin));
> +        }
> +        serial_irq = qdev_get_gpio_in(splitter, 0);
> +    } else {
> +        serial_irq = get_cpu_irq(cpus, 0, irq_pin);
> +    }

Up to here the code seems a generic helper:

   or1k_cpus_connect_device(OpenRISCCPU *cpus[],
                            unsigned num_cpus,
                            unsigned irq_pin);

> +    serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
> +                   serial_hd(0), DEVICE_NATIVE_ENDIAN);

This part specific to UART.

> +}

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

