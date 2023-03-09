Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1E6B23F4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:19:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFEC-0003qe-Bi; Thu, 09 Mar 2023 07:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1paFE9-0003kn-By
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:18:33 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1paFE0-0004nj-Kv
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:18:32 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMY9X-1pt9193cmd-00JcoA; Thu, 09 Mar 2023 13:18:13 +0100
Message-ID: <c2edd53e-8d41-d4dc-aca1-c99926ef7123@vivier.eu>
Date: Thu, 9 Mar 2023 13:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 25/67] target/m68k: Remove `NB_MMU_MODES` define
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
 <20230307175848.2508955-26-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230307175848.2508955-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F22az0aF42Mv2oLKXSZMXzJ2dB+fGTlJkmwlHaP4BBcUQ1OfoFA
 wHJffyslacUfj8jEIfiHM8geNbrsSiGh8RcRZHP5MFZUqETHcg+5tof253SvsAikDfu1G91
 9UTnfiTjSwBjDRJF8NdEO5ObRHv7rIxPSzz5jfaLgp/SV8az/PQjUzA7NFP7wO8PLnOYXWp
 9pEEaTjhkaCJFydW9pr+w==
UI-OutboundReport: notjunk:1;M01:P0:o8+ryAfZIwA=;JgVtiYPsWzCYCYReDnAIl8HmgUl
 O08Zky+fGGATcvZZ0+Abl/AOlDIV21pCp1rCrJdWErczdLa+1YU+bz5Z5B16jMr/WyeTtOYqh
 lK94pLNbq+bZYiMwJyqFWGm2/R4odOiyb1+2c6c4AiHR/LkJ543Na1KY5Q/if6qCtKm93WFZn
 wh71ajawt72x2xjNQLakTlSKYL0gfiRYzeherR8bQwbGxmfHuOWaNutNW/L5kEJ2Rwdmf04/m
 0DJsTSW+Z5accpI0UyGyoBzlxXvQ+U/vYoKRvbnUiNRtb3a7uXpqfCKiLd8za4TLGlMNAtzXI
 Hb2psBK4kEnDD4oRtpJngUO/6vhk4pNnjfdIPOJFTfXiN7/wW7GIlLFI0JW3qVq5ZBbZQzhCm
 CkPsQD3pIX4FuQ9s0z2biOGTb2Rn2iUFN4IsrzUNAZfSXJU2WroZ81MYQZoBMoxwEZ/iwIqIC
 d9vBd0wH2YGhTi1OTfDiuQTGtZo0q/VcwOKQ73g+KbQVBxAucWKznpiZxB89GvA7rg/GZoY/s
 Ntq6oAMd10fOajSvRWwDc/VN26lwCUl+ftNY7RtSf8801evM/XVZ0JYNLtYMk4g9vWQHCLpHc
 DHMEklTfBWRskTxcf6DFBFgfWRzVHcGw2FR2hlzbyiypwNApGUayrsRmH1RshPj4vAF/ha3yJ
 wLe60CCdGndP3TSUFNbLCRm1rzNV+h/Gla0rmh8J6w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 07/03/2023 à 18:58, Richard Henderson a écrit :
> From: Anton Johansson via <qemu-devel@nongnu.org>

The author field seems broken.

Thanks,
Laurent

> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230306175230.7110-11-anjo@rev.ng>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/cpu-param.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/m68k/cpu-param.h b/target/m68k/cpu-param.h
> index 44a8d193f0..39dcbcece8 100644
> --- a/target/m68k/cpu-param.h
> +++ b/target/m68k/cpu-param.h
> @@ -17,6 +17,5 @@
>   #define TARGET_PAGE_BITS 12
>   #define TARGET_PHYS_ADDR_SPACE_BITS 32
>   #define TARGET_VIRT_ADDR_SPACE_BITS 32
> -#define NB_MMU_MODES 2
>   
>   #endif


