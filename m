Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEBA628F3E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:31:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouip1-0001MW-PG; Mon, 14 Nov 2022 18:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouig8-0006LY-4e
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:50 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouV0l-0007iL-Hz
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 03:40:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id v1so16736630wrt.11
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 00:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ak2u6iPYyyGsUX3po+0Xb46H7FHfYDGvM9I35aDqK4E=;
 b=SMMiRH2El5oVSEpmMPzj/vK5eq1FLH9ZeTrPXIurNCrUjcCVtNfb/ICux+89RjJMJ5
 83KKZdqwi0Kyld5aZFNFqsV/Iyn5gAO8bae6fSq8leLYlYgQeolVy0wq2t8e0tyzTV1Y
 wmJG4MwLdHvpqhqxIJb/lmSSX1BoFJw+4cJkd34O+GIZ8OVCqu7qnsjm12jC2k34t+tb
 2fyWNjh/idalEpEk4I0pzDKGTldHiS0PV2moH+L0uLJiroGbc3+t9ZNw2vy1NNyM3NWR
 SLmi0EYshoJz5rMG7AxUKKj8+7D1gnhHhHsG/ifsMi0LUrm7johdzm+ls72GA9tofvB3
 DnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ak2u6iPYyyGsUX3po+0Xb46H7FHfYDGvM9I35aDqK4E=;
 b=jMnr4blxqjpxbq51TLvC4Gb/Ktf9VxtZtkUMy9ms+Ser0Y/rQvpt7IFZWXICga7HCp
 J4LMPRmgcXP+Wpn4ZXNPPrlWkLlq2gpo5RLv8IUTb63iWb4d5gfPSNafHeenPJ2rGXmm
 2piAejbosG9Uuw5vmWyPwKJn3oDFZ0fljuQbdBETaPs48Lu9GvEorXFq61ZCICgIugFS
 aAGMwyBU19Zt3na+cy9YtH6DWXWoTX7fQbIx/66joJnXgzGsNkwjrHVxZ5kW9jFiBGEt
 Q+jZckf1oW0N5EP+2Gq0cZWdIZeoLBV35MJOaxFsTS3BNN9oJC3ZZ+T7NG8iX2KqgjLY
 eALQ==
X-Gm-Message-State: ANoB5pkAWEno2QN2NT/fZ3KWGnr5kr27WxdkAQ5wDqN40CErbFprcg6H
 yQVHDapB4LOr3qRbooiV+QQ5sA==
X-Google-Smtp-Source: AA0mqf4nGkgjGubMBfUyzbv3RMR//maUMSa7xB3R1Or0HXXLfAInNVDkKlEytPxDo+rFqQbY6vYqYw==
X-Received: by 2002:a5d:63d1:0:b0:236:71f9:95db with SMTP id
 c17-20020a5d63d1000000b0023671f995dbmr6742142wrw.551.1668415209764; 
 Mon, 14 Nov 2022 00:40:09 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adff5c5000000b0022e344a63c7sm8910139wrp.92.2022.11.14.00.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 00:40:09 -0800 (PST)
Message-ID: <48729f3f-80eb-8c7b-7bbb-7cd6bfa65a3e@linaro.org>
Date: Mon, 14 Nov 2022 09:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] hw/intc: sifive_plic: Renumber the S irqs for numa support
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/11/22 13:19, Frédéric Pétrot wrote:
> Commit 40244040 changed the way the S irqs are numbered. This breaks when

40244040a7 in case?

> using numa configuration, e.g.:
> ./qemu-system-riscv64 -nographic -machine virt,dumpdtb=numa-tree.dtb \
>                        -m 2G -smp cpus=16 \
> 		      -object memory-backend-ram,id=mem0,size=512M \
> 		      -object memory-backend-ram,id=mem1,size=512M \
> 		      -object memory-backend-ram,id=mem2,size=512M \
> 		      -object memory-backend-ram,id=mem3,size=512M \
> 		      -numa node,cpus=0-3,memdev=mem0,nodeid=0 \
> 		      -numa node,cpus=4-7,memdev=mem1,nodeid=1 \
> 		      -numa node,cpus=8-11,memdev=mem2,nodeid=2 \
> 		      -numa node,cpus=12-15,memdev=mem3,nodeid=3
> leads to:
> Unexpected error in object_property_find_err() at ../qom/object.c:1304:
> qemu-system-riscv64: Property 'riscv.sifive.plic.unnamed-gpio-out[8]' not
> found
> 
> This patch makes the nubering of the S irqs identical to what it was before.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> ---
>   hw/intc/sifive_plic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index c2dfacf028..89d2122742 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -480,7 +480,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
>           }
>           if (plic->addr_config[i].mode == PLICMode_S) {
> -            qdev_connect_gpio_out(dev, cpu_num,
> +            qdev_connect_gpio_out(dev, cpu_num - plic->hartid_base,
>                                     qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
>           }
>       }

Oops.

Eventually we could unify the style:

-- >8 --
@@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, char 
*hart_config,
          CPUState *cpu = qemu_get_cpu(cpu_num);

          if (plic->addr_config[i].mode == PLICMode_M) {
-            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + 
cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts,
                                    qdev_get_gpio_in(DEVICE(cpu), 
IRQ_M_EXT));
          }
          if (plic->addr_config[i].mode == PLICMode_S) {
-            qdev_connect_gpio_out(dev, cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base,
                                    qdev_get_gpio_in(DEVICE(cpu), 
IRQ_S_EXT));
          }
      }
---

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


