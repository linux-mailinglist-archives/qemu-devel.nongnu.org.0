Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D576534600
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:48:41 +0200 (CEST)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntyrv-0005eq-VS
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyqa-0004wa-PO
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:47:16 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:57243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyqZ-0007iP-5A
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:47:16 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mo6zF-1nVMCZ1Hxr-00pg5b; Wed, 25 May 2022 23:47:12 +0200
Message-ID: <b14511aa-1ffb-33cf-ac9e-970e0c3cc350@vivier.eu>
Date: Wed, 25 May 2022 23:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 12/17] target/m68k: Implement TRAPV
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-13-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KPzRgrHFPzsBihCzQfdFv/t/uRc7N/8keltKOyNrLDblZMjy2tm
 4dje0gjHz/tsGtMublUCYygq9bx5X8zSNBvQL5G/5jpp5nSCUz+Ts+JRncidzeWmqo5E/xs
 T46LSmacy7fcCgfc6yP/A548Hr6khF3YDZLUT5maLJMkeT1rbPH3aWJzMlwNBjhUJjo7mDK
 LWu4bCQEKDSDT3UpGLvMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ix+B6GgGi04=:9AxsJNEXvbNz5HMZHNlUA7
 xWTaC0hMzZC2S/UKlAFH6Bi6uvyZYx3r9zBdFkuEJw7IVQOVKHb1XPwb7dAJ9XhHS4kCJVQAC
 RcUkU3ZpPir2b5g0Nk2xJFxUo/pinVlCst56TnEpH4ntgIoQ6FpyN6yy/kOI47+3mI2jLCG9r
 Ckl904xhIrxGLHwQpoP/xf9idtD0S+hRqfZ4L1Yfe5toa13pQYYMDVjGdfYBRSlrdPaAkb9pK
 FJ4VMkNSva4+o8aXMzHlEbgaBPY/lHTgdcJG8SeyLCiDl7hjD+dmiZSEjr5u+sNYH/o4BKx/x
 HaAseSKNmFSBq79onzGzEInhZx9zH7BqSNi/4w6ny81N9oNS/lWAqbQSwoRYBetubnJyUlPNs
 3VROSHg9PNzOcbGdGnO1KDWteSQk0EDmYJNx9xMVXbg3k73LClkYWyXHDy9yZn1AIsBXxznhn
 9F3/yxYUmue+WlrDAd46jL20A8dnpt9iT2KhOKXEKto8PGtvoIvanZT4/DyIcBwoZdPczH9rF
 KTvypuibZ/TTM/5OwccrQifj7pU/y//CyIaOOq74mlnZy+NKy5YD9mMIJ3NVStEeS7vaZnsz5
 wuyKdTLZASESlXxvODX1LCSiHJ4PMaM1r8nBrsGwGk8WCCZEoY4qn7OKv/ADvxzV1uNw1SYG/
 ge51xHow4NPXHF0dg3A19RPxJ1zTq/uDCqLNW2TejuJwe/Y9OBP7TJ5rSL6FL+3ZbFQLMEp57
 oBVQo59BM/c1v1fKqzkAfS96CsYMfBPxP1H6jA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index bb5ed1b7b1..0cd7ef89e3 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -4911,6 +4911,14 @@ DISAS_INSN(trapcc)
>       do_trapcc(s, &c);
>   }
>   
> +DISAS_INSN(trapv)
> +{
> +    DisasCompare c;
> +
> +    gen_cc_cond(&c, s, 9); /* V set */
> +    do_trapcc(s, &c);
> +}
> +
>   static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
>   {
>       switch (reg) {
> @@ -6074,6 +6082,7 @@ void register_m68k_insns (CPUM68KState *env)
>       BASE(nop,       4e71, ffff);
>       INSN(rtd,       4e74, ffff, RTD);
>       BASE(rts,       4e75, ffff);
> +    INSN(trapv,     4e76, ffff, M68000);
>       INSN(rtr,       4e77, ffff, M68000);
>       BASE(jump,      4e80, ffc0);
>       BASE(jump,      4ec0, ffc0);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

