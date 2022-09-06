Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915875AEE16
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:52:19 +0200 (CEST)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZw2-0001Y0-M6
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZqZ-0004Vz-Ok
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:46:39 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZqX-0006fS-BI
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:46:39 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f24so11561261plr.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=QC7PacVf34A9Q6Is3SHlruvlPC+NcERAyBNOjllNCu4=;
 b=OX7h3Buf5FL1N8CB3kLD69/d0AGbi390VX7RGzPVHBmE0gMS2muV7IqZxAd9sJC/aL
 UJuIJYm4QMR1AJHHNtaA/SRwtgJ3O7AEDCdgPfDwCoxgE3qFKHc5iDH4tug19J1tIy0N
 2+GE3g03aTNGhnW787yZwQzM6fiYLfrXu+L9p+dPAwsvTQFiuSD+Q9onDm7/Hwt4LCxr
 JxomrKX/aL5K7r1HMedT2wyqc4WgGCHrzo+Gucjjxz+azxdRUefsyRIy/6RRIMfr+/os
 2Bh7PW/k0RihQmO5w8WQPdmbwitKbtG+wYPNC3CcPlUH+5R23ZhY5tudNsrSsDurkfqV
 drgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=QC7PacVf34A9Q6Is3SHlruvlPC+NcERAyBNOjllNCu4=;
 b=Y1WKcgWmNyFM0JT6MOsRIUweqrn/XRn99NT9J6uAfJ0/WgAxqXw4tbBoZvbL93v0+0
 HfVjNQITNzaVAtmqvS3jM7aYxXjqnXc2lFrS7qkRdz0QWDdIagrEhtbqoEAL3XkccXGC
 WuqYRsPZXuzvTomGZC0t/M/0Qr2ev7CDHBBjlpNt0a0xBMXpCQuT5jUy8b4gpuoxeVE0
 4r8vYpnmYTtTSWxi0zDYoiXNW+2l2WzXejhJiNMLRDUDQx7uK4H47w3RYyXOcAbSF4Bi
 RII0O7DyrRsbPcJ8ZLRnx4N6eMY4KwHIX4HpcgmUVWdxWRa1ZcIXQ2IyOWB0SomWOwnc
 wXIw==
X-Gm-Message-State: ACgBeo0yt4beoCT1LcVBoNRmsOR+Gc4LPfJ1H4ytfw3h/EDefxd6n09Q
 C4fVIJDRe6D87Q9BfYovSpg=
X-Google-Smtp-Source: AA6agR4v6TvvUY3YNWUrFS46OzhW343mL8nwod8mzkjR0W1b2jko0EmSa0VAhTUvoSXok2pseAf81g==
X-Received: by 2002:a17:90b:4c8c:b0:200:5fa3:9766 with SMTP id
 my12-20020a17090b4c8c00b002005fa39766mr11561155pjb.129.1662475585710; 
 Tue, 06 Sep 2022 07:46:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gd16-20020a17090b0fd000b002008d0df002sm2437838pjb.50.2022.09.06.07.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:46:25 -0700 (PDT)
Message-ID: <f8985dc3-1c96-32c9-c450-2eec6ebd07b1@amsat.org>
Date: Tue, 6 Sep 2022 16:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 04/23] target/i386: Remove cur_eip, next_eip arguments
 to gen_interrupt
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-5-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:09, Richard Henderson wrote:
> All callers pass s->base.pc_next and s->pc, which we can just
> as well compute within the function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 58e74c3162..0210382f77 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -2602,13 +2602,12 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
>   
>   /* an interrupt is different from an exception because of the
>      privilege checks */
> -static void gen_interrupt(DisasContext *s, int intno,
> -                          target_ulong cur_eip, target_ulong next_eip)
> +static void gen_interrupt(DisasContext *s, int intno)
>   {
>       gen_update_cc_op(s);
> -    gen_jmp_im(s, cur_eip);
> -    gen_helper_raise_interrupt(cpu_env, tcg_const_i32(intno),
> -                               tcg_const_i32(next_eip - cur_eip));
> +    gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +    gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
> +                               tcg_constant_i32(s->pc - s->base.pc_next));

Maybe note the switch to tcg_constant() in the description?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

