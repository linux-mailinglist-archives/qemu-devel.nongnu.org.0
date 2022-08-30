Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9A5A6379
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:36:44 +0200 (CEST)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0Tz-0001Lt-R5
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0N9-0003ym-BY; Tue, 30 Aug 2022 08:29:39 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0N7-0002D9-8i; Tue, 30 Aug 2022 08:29:38 -0400
Received: by mail-pg1-x536.google.com with SMTP id 202so10530567pgc.8;
 Tue, 30 Aug 2022 05:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=xnvS/CYfuTz1/ilpxt5qGgQ0++4Q2pQvCLjkghcnA6Q=;
 b=JI8Rkx6fcj1PkCxKlBnF3UNgcpWzSBbscXnBpsGtFo6q5xDLnw0raZ+fp4ZRXVhzRr
 Tg/VUy9bEljJ+Tqxlm4CBvBvJ0gaFdzCoRahgoscZm+u6ws+EWobpISq8k0CzEAe6vrj
 ROfvOiwbBB2XA9va79zJ/R4NzmUgUOuBfOwOV0uPiwPqmtYEN4Nk6Mvc251F6iCFQrFX
 qBx3ZEmKRoyM6pj2b3EDj0E8+Wt+CcFnUWJCtKzQVxtp67gAGPgx2P9PSkQex11pMHQk
 glxgdi1LRs1clTuIWc3NmUjgQpEtVg1h7oBzMd+RExPI6QuBSvBFt8DI3zszyPftzpG0
 +xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=xnvS/CYfuTz1/ilpxt5qGgQ0++4Q2pQvCLjkghcnA6Q=;
 b=tVFrosVTH3Tb5G5m/yHRfio+sPMbzHcDlUhlBA55djk0Iv4jA9aeBQ//8vtIxfkqOH
 zyZDpefZ42pI67fNRypF22IfTepfJ7rrRIVVvTYdD120p9D3JYFdUPuvJyaWj4TMDoxW
 hA/mXlLTI7UDKRM9DxrKQWe3shjLgTgQl8PhRrxFknNHIw5miJy0BJxCW1/WCoy3YIkx
 7SiYubPfq8TZ/Jw1EQontdaZRgsRVSjxYAc7eGt+9AGPGhmavQnH5WjvJvWfsJwhrC5K
 jRtVoKadeI5yMclNlfPbh59Q4VI8gDaZYTdFrgc/gTZN4rJD7l+0sg07T/mlgm9DQNIm
 P9nQ==
X-Gm-Message-State: ACgBeo0dvzZubBTOAE57mW2iN8vaLKSXLRX56hYZQtZnphIh2c+hydan
 VFe7Cp+1zwSOxOmvOcm3VZ4=
X-Google-Smtp-Source: AA6agR7rsuwbB3cVn5ZGkd8ZjUl7cSuuflDW3RXBWn4+gBpChUJTiJM8yfp31+qBr/N3wtjs/1UgCQ==
X-Received: by 2002:a62:1d86:0:b0:52d:9df0:2151 with SMTP id
 d128-20020a621d86000000b0052d9df02151mr20836611pfd.33.1661862575591; 
 Tue, 30 Aug 2022 05:29:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a170902d2d200b00174dccaf31esm3932928plc.122.2022.08.30.05.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:29:35 -0700 (PDT)
Message-ID: <315989e7-a295-fa73-c686-066a2090aca8@amsat.org>
Date: Tue, 30 Aug 2022 14:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] target/arm: Make boards pass base address to
 armv7m_load_kernel()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
 <20220823160417.3858216-3-peter.maydell@linaro.org>
In-Reply-To: <20220823160417.3858216-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 23/8/22 18:04, Peter Maydell wrote:
> Currently armv7m_load_kernel() takes the size of the block of memory
> where it should load the initial guest image, but assumes that it
> should always load it at address 0.  This happens to be true of all
> our M-profile boards at the moment, but it isn't guaranteed to always
> be so: M-profile CPUs can be configured (via init-svtor and
> init-nsvtor, which match equivalent hardware configuration signals)
> to have the initial vector table at any address, not just zero.  (For
> instance the Teeny board has the boot ROM at address 0x0200_0000.)
> 
> Add a base address argument to armv7m_load_kernel(), so that
> callers now pass in both base address and size. All the current
> callers pass 0, so this is not a behaviour change.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> I thought about having armv7m_load_kernel() be "clever" and ask the
> CPU what init-svtor/init-nsvtor were set to, but that seems like it
> might have unanticipated consequences.  "Just pass the base address"
> is simpler and is how A-profile does it (though for A-profile it's
> the loader_start field in struct arm_boot_info rather than an
> extra argument).
> ---
>   include/hw/arm/boot.h     | 5 ++++-
>   hw/arm/armv7m.c           | 5 +++--
>   hw/arm/aspeed.c           | 1 +
>   hw/arm/microbit.c         | 2 +-
>   hw/arm/mps2-tz.c          | 2 +-
>   hw/arm/mps2.c             | 2 +-
>   hw/arm/msf2-som.c         | 2 +-
>   hw/arm/musca.c            | 3 ++-
>   hw/arm/netduino2.c        | 2 +-
>   hw/arm/netduinoplus2.c    | 2 +-
>   hw/arm/stellaris.c        | 2 +-
>   hw/arm/stm32vldiscovery.c | 2 +-
>   12 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
> index c7ebae156ec..f18cc3064ff 100644
> --- a/include/hw/arm/boot.h
> +++ b/include/hw/arm/boot.h
> @@ -25,13 +25,16 @@ typedef enum {
>    * armv7m_load_kernel:
>    * @cpu: CPU
>    * @kernel_filename: file to load
> + * @mem_base: base address to load image at (should be where the
> + *            CPU expects to find its vector table on reset)
>    * @mem_size: mem_size: maximum image size to load
>    *
>    * Load the guest image for an ARMv7M system. This must be called by
>    * any ARMv7M board. (This is necessary to ensure that the CPU resets
>    * correctly on system reset, as well as for kernel loading.)
>    */
> -void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
> +void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename,
> +                        hwaddr mem_base, int mem_size);
>   
>   /* arm_boot.c */
>   struct arm_boot_info {
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index fa4c2c735da..50a9507c0bd 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -568,7 +568,8 @@ static void armv7m_reset(void *opaque)
>       cpu_reset(CPU(cpu));
>   }
>   
> -void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
> +void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename,
> +                        hwaddr mem_base, int mem_size)
>   {
>       ssize_t image_size;
>       uint64_t entry;
> @@ -588,7 +589,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
>                                    &entry, NULL, NULL,
>                                    NULL, 0, EM_ARM, 1, 0, as);
>           if (image_size < 0) {
> -            image_size = load_image_targphys_as(kernel_filename, 0,
> +            image_size = load_image_targphys_as(kernel_filename, mem_base,
>                                                   mem_size, as);
>           }
>           if (image_size < 0) {
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index b3bbe06f8fa..bc3ecdb6199 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1430,6 +1430,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu),
>                          machine->kernel_filename,
> +                       0,
>                          AST1030_INTERNAL_FLASH_SIZE);
>   }
>   
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> index e9494334ce7..50df3620882 100644
> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -57,7 +57,7 @@ static void microbit_init(MachineState *machine)
>                                           mr, -1);
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       s->nrf51.flash_size);
> +                       0, s->nrf51.flash_size);
>   }
>   
>   static void microbit_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 4017392bf5a..394192b9b20 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -1197,7 +1197,7 @@ static void mps2tz_common_init(MachineState *machine)
>       }
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       boot_ram_size(mms));
> +                       0, boot_ram_size(mms));
>   }
>   
>   static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index bb76fa68890..a86a994dbac 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -450,7 +450,7 @@ static void mps2_common_init(MachineState *machine)
>                                     mmc->fpga_type == FPGA_AN511 ? 47 : 13));
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       0x400000);
> +                       0, 0x400000);
>   }
>   
>   static void mps2_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index d9f881690e0..a6df473ec90 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -98,7 +98,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       soc->envm_size);
> +                       0, soc->envm_size);
>   }
>   
>   static void emcraft_sf2_machine_init(MachineClass *mc)
> diff --git a/hw/arm/musca.c b/hw/arm/musca.c
> index 7a83f7dda7d..6eeee57c9dd 100644
> --- a/hw/arm/musca.c
> +++ b/hw/arm/musca.c
> @@ -597,7 +597,8 @@ static void musca_init(MachineState *machine)
>                                                        "cfg_sec_resp", 0));
>       }
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x2000000);
> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +                       0, 0x2000000);
>   }
>   
>   static void musca_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 3365da11bf7..83753d53a3f 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -49,7 +49,7 @@ static void netduino2_init(MachineState *machine)
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> -                       FLASH_SIZE);
> +                       0, FLASH_SIZE);
>   }
>   
>   static void netduino2_machine_init(MachineClass *mc)
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index 76cea8e4891..515c0816054 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -50,7 +50,7 @@ static void netduinoplus2_init(MachineState *machine)
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu),
>                          machine->kernel_filename,
> -                       FLASH_SIZE);
> +                       0, FLASH_SIZE);
>   }
>   
>   static void netduinoplus2_machine_init(MachineClass *mc)
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 12c673c9172..a9e96c37f89 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1302,7 +1302,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>       create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
>       create_unimplemented_device("flash-control", 0x400fd000, 0x1000);
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, flash_size);
> +    armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, 0, flash_size);
>   }
>   
>   /* FIXME: Figure out how to generate these from stellaris_boards.  */
> diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
> index 04036da3ee0..67675e952fc 100644
> --- a/hw/arm/stm32vldiscovery.c
> +++ b/hw/arm/stm32vldiscovery.c
> @@ -53,7 +53,7 @@ static void stm32vldiscovery_init(MachineState *machine)
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu),
>                          machine->kernel_filename,
> -                       FLASH_SIZE);
> +                       0, FLASH_SIZE);
>   }
>   
>   static void stm32vldiscovery_machine_init(MachineClass *mc)


