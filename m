Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD49698367
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMap-0005yg-TH; Wed, 15 Feb 2023 13:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSMao-0005xp-69
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:33:22 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSMam-0002Z0-BT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:33:21 -0500
Received: by mail-wr1-x434.google.com with SMTP id l2so3478352wry.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vukHDYMuVzcxhN9LaNCwsJbu2CjLu0oX5CmfwGheoPI=;
 b=Y/IlkNKTvZumPUWdLVqEDj3OysopnpHEnKXbaqFC12RFOw3Vjl0PefIK0YyeVjw4FT
 QbwpK83qNzXTOJlywbHgNIg4xU0LEdiJVBx877DLeXUnP8ZiGUgE77bilBdrVbjY6skS
 3WUdmnHKkNVwGRF/Fek7EUPhAv3pzZwpa60iIXK+ONSJw6gDZ4U8CiX0STPQIVKV2fs8
 012NTe/B7L4td5EORfCZvdjLzBHzu8GyF/lM066F+7yIcFLrMpDWOxFlYKzSJOwGhID6
 5q0mh3tWUshglhyCZJ0Pi8Fm53TzbkrcpzsLQiYepG+A7joDv/bnMAlEYrS0TpQO0gzx
 9zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vukHDYMuVzcxhN9LaNCwsJbu2CjLu0oX5CmfwGheoPI=;
 b=szAC8KnX4cjDgMyZajRChaSRpsaUwCBA5Cm76GGpE13fR06l4ESKZg8gpkuQbReyZB
 hnK+tliukps+jE7YT6KnwrN2X9U6Mzs4InH+bJix4C0+SD1mtpQgE75X3lNN75bW3rlp
 C+HAxdtf/bbbC8JzRkAtyR6ECO8htLJ4HyM0qG+hlkE3EDcTc6/0LfzhiD3YAu8dH6nS
 Nbe9ungB0JdXGgeEC1gBTV8ej/+KIw0dLnPfdStuN5dkVP5M9TPPd7DPaoPD0D2b7HbT
 JpRt9x0gRIvKss78ByI8P0BdLzmfGUYc9qbFH9rYRVc1EtMD1uJrUJ6TOCIm5zSFSkxx
 s91g==
X-Gm-Message-State: AO0yUKXmyr/4rBgg2+r8buYzVANX3n0t+o2ndAG9ELDs/3ghRYyZxzWr
 chtPVLR8+LUcZsi36TWA1OaljA==
X-Google-Smtp-Source: AK7set9SRUQ7HEwA8UmQgIMgE9NwTSOPxxY/mNjLiE3l9L5y/hkFiJKdnytEV5PDR3Me9OfoFyxzvg==
X-Received: by 2002:a05:6000:10c8:b0:2c5:4ecd:a905 with SMTP id
 b8-20020a05600010c800b002c54ecda905mr2350279wrx.56.1676485998632; 
 Wed, 15 Feb 2023 10:33:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h12-20020adff4cc000000b002be505ab59asm16399374wrp.97.2023.02.15.10.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:33:18 -0800 (PST)
Message-ID: <05b8264f-c22c-2187-5980-672361fa579b@linaro.org>
Date: Wed, 15 Feb 2023 19:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 3/3] target/mips: implement CP0.Config7.WII bit support
Content-Language: en-US
To: Marcin Nowakowski <marcin.nowakowski@fungible.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
 <20230215084754.3816747-4-marcin.nowakowski@fungible.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215084754.3816747-4-marcin.nowakowski@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

Hi Marcin,

On 15/2/23 09:47, Marcin Nowakowski wrote:
> Some older cores use CP0.Config7.WII bit to indicate that a disabled
> interrupt should wake up a sleeping CPU.
> Enable this bit by default for M14Kc, which supports that. There are
> potentially other cores that support this feature, but I do not have a
> complete list.

Also the P5600 (MIPS-MD01025-2B-P5600-Software-TRM-01.60.pdf,
"MIPS32® P5600 Multiprocessing System Software UM, Revision 01.60).

> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
> ---
>   target/mips/cpu-defs.c.inc | 1 +
>   target/mips/cpu.c          | 6 ++++--
>   target/mips/cpu.h          | 1 +
>   3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index 480e60aeec..57856e2e72 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -354,6 +354,7 @@ const mips_def_t mips_defs[] =
>                          (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA),
>           .CP0_Config2 = MIPS_CONFIG2,
>           .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP0C3_VInt),

Per the P5600 doc on Config5.M:

   Configuration continuation bit. Even though the Config6 and Config7
   registers are used in the P5600 Multiprocessing System, they are both
   defined as implementation-specific registers. As such, this bit is
   zero and is not used to indicate the presence of Config6.

Still I suppose we need to set at least Config4.M:

   +        .CP0_Config4 = MIPS_CONFIG4,
   +        .CP0_Config4_rw_bitmask = 0,

I'm not sure about:

   +        .CP0_Config5 = MIPS_CONFIG5,
   +        .CP0_Config5_rw_bitmask = 0,

> +        .CP0_Config7 = 0x1 << CP0C7_WII,
>           .CP0_LLAddr_rw_bitmask = 0,
>           .CP0_LLAddr_shift = 4,
>           .SYNCI_Step = 32,

Could you also set CP0C7_WII to the P5600 definition?

> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 7a565466cb..7ba359696f 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -144,12 +144,14 @@ static bool mips_cpu_has_work(CPUState *cs)
>       /*
>        * Prior to MIPS Release 6 it is implementation dependent if non-enabled
>        * interrupts wake-up the CPU, however most of the implementations only
> -     * check for interrupts that can be taken.
> +     * check for interrupts that can be taken. For pre-release 6 CPUs,
> +     * check for CP0 Config7 'Wait IE ignore' bit.
>        */
>       if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
>           cpu_mips_hw_interrupts_pending(env)) {
>           if (cpu_mips_hw_interrupts_enabled(env) ||
> -            (env->insn_flags & ISA_MIPS_R6)) {
> +            (env->insn_flags & ISA_MIPS_R6) ||
> +            (env->CP0_Config7 & (1 << CP0C7_WII))) {
>               has_work = true;
>           }
>       }
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 0a085643a3..abee7a99d7 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -980,6 +980,7 @@ typedef struct CPUArchState {
>   #define CP0C6_DATAPREF        0
>       int32_t CP0_Config7;
>       int64_t CP0_Config7_rw_bitmask;
> +#define CP0C7_WII          31
>   #define CP0C7_NAPCGEN       2
>   #define CP0C7_UNIMUEN       1
>   #define CP0C7_VFPUCGEN      0


