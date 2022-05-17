Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901452A47B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:14:15 +0200 (CEST)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxxm-000517-3c
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nqxqV-0004vY-3U
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:06:43 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nqxqT-0003z3-7v
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:06:42 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1McHM2-1nKvLN0qVw-00cgjR; Tue, 17 May 2022 16:06:37 +0200
Message-ID: <4fd55674-87ae-5e19-f43b-04ba102e4300@vivier.eu>
Date: Tue, 17 May 2022 16:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220430170225.326447-1-richard.henderson@linaro.org>
 <20220430170225.326447-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 1/2] target/m68k: Clear mach in m68k_cpu_disas_set_info
In-Reply-To: <20220430170225.326447-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xtejrOtYFDBN9Zi/lFghBrFTmK7CAsf6lJ7y92eesM7HxuIdPXs
 a5CRFc06DugRSAgTiznnzf5mehfUgp30/yvXQFBC1yJ+CVo8Ef6/+IpWd9YvCK8QQlamx80
 P0dFuhuGUX+UKwGIGcXlOCOCzT9uU20z1gAy0B6PI/Rlsahauih8cuFk7btBS9KxwuzCF7t
 BhuZpLuW4pm+WC2RHqPSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:26hLGAHbUv0=:dYz+/MZRQGGWxEaXnCeEjJ
 /4jcPIwZA67/mdPJLuN070KSzyOjFfD5UWftdAY4XvsqyB7+TjdHI4lrg3KXUQiZKWzX8/yGf
 eeHQI+vZ89FSCD0jNyZFRD6T5fVv5lCADO7eOMJ6dRJhYvy8DqQhO7njH4cLz6kwTjtto2k7m
 XO6EPRVIokld8gemkLR+5L+ryPiIIvCLI74ygyB4P0+rm5VOWgU4/aZp+2Ojpy0+h+l9icH66
 z6DLOXbGNZ64GKusgasiCQnGVx3nmVowS8KqNMmuZ2kXO11snp0DKb7TSSWSG4w6c6YB1cukK
 Lixk3N0GyCKf2cm3fwXDKPqHEPrnQ7ZHFAvDfIdXeKFTUiag4ssFSXls1/5hF1P6Wtj3NQrsC
 7w8w8nWZHMd84knngAeES2Xkli6/7bQwWTeUDNRU6bI1etpFjiSLY21xRMWjoQcb2tLwsG18K
 c10pe5F4o8q+1iatM+MKaxOJyJmHPFb+abgYqpXdBJ06hHL4MP6TkwENUGSxeIc8PooOX3wFn
 Re9UqSmT+d0lODqlcGyT6ZqncQJFEksvsQbeLVsH+IWjgenT4nmWvXg+EbwUOWEH3AIpoA0JQ
 bgBEsH4Ty5SaXI2EG/Hml5RwC3WsjkfTXpfWjOgAuwp/BAUG2KDdiGrptLTQm7hnQ2dd+gZM5
 5DKNHv42BrCbTVIAo1+TQYbXNmkRBZQsK7/flAttdiiT8JW0mnbFlX92pfKe4UC1Dnn+Y2fL2
 GMclmo/r2FVtYqr9WH3eaTWycnw9fM4AQ2FKHA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 30/04/2022 à 19:02, Richard Henderson a écrit :
> Zero selects all cpu features in disas/m68k.c,
> which is really what we want -- not limited to 68040.

But what happens when an instruction has to be decoded differently between 680x0 and coldfire?

for instance in disas/m68k.c, we have:

{"addil", 6,    one(0003200),   one(0177700), "#l$s", m68000up },
{"addil", 6,    one(0003200),   one(0177700), "#lDs", mcfisa_a },

{"addl", 6, one(0003200),   one(0177700), "#l$s", m68000up },
{"addl", 6, one(0003200),   one(0177700), "#lDs", mcfisa_a },

{"andil", 6,    one(0001200),   one(0177700), "#l$s", m68000up },
{"andil", 6,    one(0001200),   one(0177700), "#lDs", mcfisa_a },

{"andl", 6, one(0001200),   one(0177700), "#l$s", m68000up },
{"andl", 6, one(0001200),   one(0177700), "#lDs", mcfisa_a },

{"bchg", 4, one(0004100),   one(0177700), "#b$s", m68000up },
{"bchg", 4, one(0004100),   one(0177700), "#bqs", mcfisa_a },

{"bclr", 4, one(0004200),   one(0177700), "#b$s", m68000up },
{"bclr", 4, one(0004200),   one(0177700), "#bqs", mcfisa_a },

{"bset", 2, one(0000700),   one(0170700), "Dd$s", m68000up | mcfisa_a },
{"bset", 2, one(0000700),   one(0170700), "Ddvs", mcfisa_a },
{"bset", 4, one(0004300),   one(0177700), "#b$s", m68000up },
{"bset", 4, one(0004300),   one(0177700), "#bqs", mcfisa_a },

{"btst", 4, one(0004000),   one(0177700), "#b@s", m68000up },
{"btst", 4, one(0004000),   one(0177700), "#bqs", mcfisa_a },

{"cmpib", 4,    one(0006000),   one(0177700), "#b@s", m68000up },
{"cmpib", 4,    one(0006000),   one(0177700), "#bDs", mcfisa_b },
{"cmpiw", 4,    one(0006100),   one(0177700), "#w@s", m68000up },
{"cmpiw", 4,    one(0006100),   one(0177700), "#wDs", mcfisa_b },
{"cmpil", 6,    one(0006200),   one(0177700), "#l@s", m68000up },
{"cmpil", 6,    one(0006200),   one(0177700), "#lDs", mcfisa_a },

...

Thanks,
Laurent

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/cpu.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index c7aeb7da9c..5671067923 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -75,12 +75,8 @@ static void m68k_cpu_reset(DeviceState *dev)
>   
>   static void m68k_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>   {
> -    M68kCPU *cpu = M68K_CPU(s);
> -    CPUM68KState *env = &cpu->env;
>       info->print_insn = print_insn_m68k;
> -    if (m68k_feature(env, M68K_FEATURE_M68000)) {
> -        info->mach = bfd_mach_m68040;
> -    }
> +    info->mach = 0;
>   }
>   
>   /* CPU models */


