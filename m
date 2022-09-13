Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A12E5B7351
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 17:10:25 +0200 (CEST)
Received: from localhost ([::1]:40778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY7YN-0002JL-Ru
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 11:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oY7O4-0002Xk-Ku
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:59:44 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:48175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oY7O2-000443-Tx
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:59:44 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N4R0a-1pHjSv3Wpa-011TQl; Tue, 13 Sep 2022 16:59:39 +0200
Message-ID: <9cecac63-ed92-de1d-71da-bb0e25e1b020@vivier.eu>
Date: Tue, 13 Sep 2022 16:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/2] target/m68k: Fix MACSR to CCR
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, Thomas Huth <huth@tuxfamily.org>
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <20220913142818.7802-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220913142818.7802-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YQ4MkC0Mo1Ulc00APKCTKTVsr6OBMj+Dcjaiy5QU1RydvoQ+mxp
 16lw4JN5KO+KUX71tGTTgNzEG2MJrBKtBsJ/1YEC3if2MmhVCMA8mOH4AlOHap6uZqhEKIB
 K7w7aaEs6jDH4buwwVYhtXn13x1WM4orE9tw9jFWb2aa60WVZc71pPG9LyyNsAsQzgWwazZ
 CdwPtkaGjj3mXgw0AZzNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ocZNnrI0aGY=:vNHlNclb459qIOr9YGpX36
 XB00kcnT1rEDVQPMy/SFniP28NWcvnXugtVZRdIWGHfY8tpKi0gXRfXUHSD5eRRyovCcfwvWN
 rz+zbyJKBg7tsPb0SI/Xt8BmD8GMYGAycoLMXiBpe2q8MkLx88i3WkGsZoxJNhtdir6xmUyNI
 kpNUE2lwhwYB+03EOfWYf5Hqz7D0dsa8kewEejw9loXa5VCf15mzSw2bytXojaCTkYGj18rYR
 QDogG/n8DRBEel5JwRc+rL/KmI48emJhbRIjlqwvZozU1WihbPB65UyyvyOwjI8j8YuFRLtK+
 Ene8zLYYX0QSFjyyRE/ClMDBEXTq2de6cwOQpVQBur1Tj27zZOnsHsv0FBfolaW8OnY+fDRr3
 V8bM9daPDNkXQpabeq7SVcbPFk7/+O6+ZKFIEKND3CFhklbrSckWcAgldP2y1cfs7uZdwkA92
 ehpuY16wiVBe4AvfGIcuWntJ1l4qhVYX1lHeHlj0ruqH4o2C1+8N4vmDpAlwdmRL0gr959zhZ
 4NE5sAAOrRWRJaXa503aR5q7xt4tg8k/AFtQCh0X68gzm1mk0WepefdiBufaoLvIFOXJiXx2+
 RIhBMrRYuSF7lIQgH+hotNZ2GmCnuMBeR6VhiPcTr8jI1Xt7JPwWk1AxZDTLMMb0W2NUj+L/6
 U+k/R3wdU3ok4YtnwPd6NSlG2tadu4Ybht6e5zYcSlQ+JGDeeh4j3OgY4k0oQDjeC37JCWRWU
 Cg82cSwZ8hU2u7AX7e6KZPJkDXLgwrBJBW8/lFt0kaKX6Ri9CHNENPyxrUczfNtRxWilCNwIh
 QrlJ74f
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.628,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 13/09/2022 à 16:28, Richard Henderson a écrit :
> First, we were writing to the entire SR register, instead
> of only the flags portion.  Second, we were not clearing C
> as per the documentation (X was cleared via the 0xf mask).
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 5098f7e570..87044382c3 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -5892,8 +5892,10 @@ DISAS_INSN(from_mext)
>   DISAS_INSN(macsr_to_ccr)
>   {
>       TCGv tmp = tcg_temp_new();
> -    tcg_gen_andi_i32(tmp, QREG_MACSR, 0xf);
> -    gen_helper_set_sr(cpu_env, tmp);
> +
> +    /* Note that X and C are always cleared. */
> +    tcg_gen_andi_i32(tmp, QREG_MACSR, CCF_N | CCF_Z | CCF_V);
> +    gen_helper_set_ccr(cpu_env, tmp);
>       tcg_temp_free(tmp);
>       set_cc_op(s, CC_OP_FLAGS);
>   }

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

