Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDA67662C
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 13:21:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJCqy-000542-OA; Sat, 21 Jan 2023 07:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pJCqw-00053q-KH; Sat, 21 Jan 2023 07:20:10 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pJCqu-0002Ib-Vf; Sat, 21 Jan 2023 07:20:10 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-15eec491b40so9132982fac.12; 
 Sat, 21 Jan 2023 04:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vSGiRO4vBoie06KfxUhWUJl5JqUS+zDagEUd7GrvS5Q=;
 b=ipAxD8lUy1oqQ6TnNoHYn1UNAMGmtXfkOtXarFc8pvUf1qpQM3Zx1wf29Agqvqlzen
 rgIPlOXDrL7U21h8rygGXroGKH/35iboNO1K1RHVRC+XqH18U95Xw5gp3++6DQMBiaL8
 JTiOCZXybj/KUQAktF3RA+tiUo3/oJAASlSDr+JgQgb9b9EMnENc1IK1uP8oIsSie0Co
 EpkOixLjFFNNV6QeJotF7YkWHjETtIL1fnshqkaWerL9B5Qbwu+Q4/mr1mjZS303ocb4
 c7bDOGaT+Hejd+zXbb1k+50hg6Yw9fPi48d5ND8v7iU4ILLz6qq7W+eWHb+/79HuRGhT
 lb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSGiRO4vBoie06KfxUhWUJl5JqUS+zDagEUd7GrvS5Q=;
 b=p7uRj5zP/+z517WttP301eQxMGyefc9XpryjVJzXh+/Be7+vgyeORyamNTtiFzhuiX
 7EJIBjvy4PjWYy90o5wjUEn0MXTbpNtSrQxspAiAt/W6nxxmZnOeDBG/hn8eUHj3HlbU
 DeWfaXc2G8hm77Yy6eG/gzKRaisqC2Dbx8/GqJsxNOBZN0LWRm+J7mdvR1bdoiPpF1+j
 lXV8et3q3wpE8eVOgmjgwrHPODO1iqegvkl0LrYL4SbkaAFM376kTT92VbMRDxGawdTY
 18ApoRKl9qcDPG7+duehbV0OXTvimCrU4/3Drs7lq/7ejUiW2utMyMDX7FRo2dwHaR2Z
 b1Mw==
X-Gm-Message-State: AFqh2kokTxeKKt4idH4cLskeWrGPkTxEXxSxbJj8x/C0N4dqPlLkhDgl
 QyQa0kHjQH1DHPC6FWSVyuE=
X-Google-Smtp-Source: AMrXdXu4cPtSKjSv0xfDpQVSrQM+zVdlBFT/bV4XE/kVYbFEJAcA00htmLUrjItm2IGNLfY3t6eVBA==
X-Received: by 2002:a05:6870:6d06:b0:15e:c48d:f4d4 with SMTP id
 mw6-20020a0568706d0600b0015ec48df4d4mr9871697oab.43.1674303606941; 
 Sat, 21 Jan 2023 04:20:06 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a056871071200b0014f81d27ce3sm23273174oap.55.2023.01.21.04.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 04:20:06 -0800 (PST)
Message-ID: <55d7ba20-a9d6-1a65-ad9c-c67cca27f714@gmail.com>
Date: Sat, 21 Jan 2023 09:20:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] ppc/pegasos2: Improve readability of VIA south bridge
 creation
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: philmd@linaro.org
References: <20230118164512.1BCFB745706@zero.eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230118164512.1BCFB745706@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.092,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 1/18/23 13:45, BALATON Zoltan wrote:
> Slightly improve readability of creating the south bridge by changing
> type of a local variable to avoid some casts within function arguments
> which makes some lines shorter and easier to read.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> v2: Fixed typos in commit message
> 
>   hw/ppc/pegasos2.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index f46d4bf51d..1a13632ba6 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -102,7 +102,8 @@ static void pegasos2_init(MachineState *machine)
>       CPUPPCState *env;
>       MemoryRegion *rom = g_new(MemoryRegion, 1);
>       PCIBus *pci_bus;
> -    PCIDevice *dev, *via;
> +    Object *via;
> +    PCIDevice *dev;
>       I2CBus *i2c_bus;
>       const char *fwname = machine->firmware ?: PROM_FILENAME;
>       char *filename;
> @@ -159,19 +160,18 @@ static void pegasos2_init(MachineState *machine)
>       pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>   
>       /* VIA VT8231 South Bridge (multifunction PCI device) */
> -    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
> -                                          TYPE_VT8231_ISA);
> +    via = OBJECT(pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
> +                                                 true, TYPE_VT8231_ISA));
>       object_property_add_alias(OBJECT(machine), "rtc-time",
> -                              object_resolve_path_component(OBJECT(via),
> -                                                            "rtc"),
> +                              object_resolve_path_component(via, "rtc"),
>                                 "date");
>       qdev_connect_gpio_out(DEVICE(via), 0,
>                             qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>   
> -    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
> +    dev = PCI_DEVICE(object_resolve_path_component(via, "ide"));
>       pci_ide_create_devs(dev);
>   
> -    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
> +    dev = PCI_DEVICE(object_resolve_path_component(via, "pm"));
>       i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
>       spd_data = spd_data_generate(DDR, machine->ram_size);
>       smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);

