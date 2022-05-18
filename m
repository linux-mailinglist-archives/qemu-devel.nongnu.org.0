Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC1152C5CE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 23:58:26 +0200 (CEST)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrRgX-0006oN-2R
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 17:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nrRfa-00069i-TN
 for qemu-devel@nongnu.org; Wed, 18 May 2022 17:57:26 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:57785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nrRfZ-0003ib-9C
 for qemu-devel@nongnu.org; Wed, 18 May 2022 17:57:26 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M8hph-1nvaPB3zc1-004glo; Wed, 18 May 2022 23:57:21 +0200
Message-ID: <c3e2aea4-65a4-5a48-bf1a-609f41a35c9c@vivier.eu>
Date: Wed, 18 May 2022 23:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] target/m68k: Clear mach in m68k_cpu_disas_set_info
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430170225.326447-1-richard.henderson@linaro.org>
 <20220430170225.326447-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430170225.326447-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:N++eSQttwQqdA7miAGvrmdFonSbqbDyYSwoVztCshI3mc/+3Y03
 W7WKP2Y6oYTBxoc42KhFqCa7nQeU2mSYZ9Hm6Y81xFLf0Vy65FeyzBVpDOChDJpnFpp1sbr
 rK50tcnY5BBCtlm3l6k/9iYyh42BarT4wSKo4QRuw1XGPcQQHj7ZJLqTvZ6WMWn2mZ4GFSM
 NRNYO4iYsCEQI43tufRBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RygcWU5rTzI=:PE/+UYVvlDC3KABEwkij43
 K6RIlC/1grK+tNYmSXcf3n5CCVkEx5Waaf+aLSxJWOZHmikrk5zI2g9q7LlwzRZZ9ix+zyFNQ
 Lkovluv6gl2tK1NRpNF/ld51Hev16VREbPCazumESKOmvzHdd8y9TO5IB151G2S5BXLM/DAcK
 7iQKIYLv0TsC8rNcvBssInm0rac0GsUSHFMgvTqvXfqH6xjuS4jTLM5ZRE0n1ZaDuMM41z09S
 zFCbwgjSwk5oeRcj3mggHMOmM49zfKxokaFBcydI+pYwYT60+qDP93XMMbirgTCNGI1hyURPR
 QdG6MjvFMIu9KFvouBzCQLYx9PvM0BS6s+dGOnoXwOg82zxMhY3I4C8plS3WkLd6bawtKeU5m
 W91+W4ojfsuQZUWLp5whQgG19cKOxhzvxhndGknfvPW9+UeU1I8zFW7Tx86dyjoHl9isSUxNw
 dCPdiFt6e3k+0tc6hRgWfDY1HUQz2nxM+gFUVMWfv33a2YEE4mwUymY3kroqscgvS3C68hzq6
 JFwBZXlvCEG5jH51kzClHU1Z+z5OlrGakOZCmdrat60+pRuRnYmwqNwP1IsJU9RC5U3GOsA5k
 2mkOoEnNXZOX1WO/FIi0iyKDzIIxyLGMSKgW2pKqrL9cBZr/6j2AIsYnio7aWN5/wwms5HkS2
 f9Y5PVq6n9mCv2cmPyIss3wYrAm5ermatpxW5pfcUQThHg6XwKHaYSBJfiw+ljNcZLUGwshWl
 QgOpMgjZpyfkGU9/o3p/zYLlENbDEsVQ/VpF7g==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

