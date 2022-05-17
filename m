Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A130B52AB70
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:03:05 +0200 (CEST)
Received: from localhost ([::1]:53838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2TD-0006gq-1p
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2GG-0007CI-Fh
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:49:36 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2GE-0007ng-Dp
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:49:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k16so10928383pff.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eTT7wigPPxVLsd6yG13Rcr4svIyviqBGvL6qfANJBE0=;
 b=WyE/MRQmRM3jOcw18I5/9g+jVE4GBLf4VKaFI00OLaJtmP9eBqSzM2ZhhX4NxrpF6L
 55/WHMXw1VvB6iua6R4EaKnUkJaIY442h3YZ9VI24TvkMjQelUGhOkVvGMSZCWxwwrkL
 T6SvVEq8Ma/+Cajbj04pe2kHfehA7GJDB+loHsROsDavGScGnVgBqevuLCqIrFlwmYhg
 JfjKFFZnPw8JsqIRwNMkRgnfBZa+8k0KyrrPCFN/ckYLIKkxM8imt/LdwjdgsHtzcPJL
 qDoXl9RbLMeOxigsYKRGElHZgxM0aA4et+6q128g0PiGiQxLSPmypB5npDE59pY4gmMw
 bpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eTT7wigPPxVLsd6yG13Rcr4svIyviqBGvL6qfANJBE0=;
 b=VJHadbOrgEu5rUrwfO4jXERsmP13NTtD1t0DJh+CXixEp58nJLOW+jqW0LwCTAQv2Y
 dw6w64zk+IXVa2P48mfItc0vja+ULOgHLnEuBTekdU/AmxykifQ326Sz8PUdl4yRvPQc
 lzxPKn5nHtHcPu4TYC4pgWjKhAisNzzTFBcCnbDPt8Yakk57Z3bGBQK1PNnihxfaf9qS
 bYlqbMI+vHaTbvtNCo1mD+RA8CVImCzj0ZS8u2Yn7fj+Wdj+lX2SXEiBAdwepnVm0wr/
 0bv250sNDNCeHAC7HzcfMv2L5g5m7lY8Rfu5nGwv8d840gFVMc05VQ3RtBC7ge/NGm0Q
 ut4g==
X-Gm-Message-State: AOAM5317LlNFKQJUVIN3fyK9sA2IWG5MZlxvEEeVaSM23uwsPs8UfOyN
 uim3tGdgjRY55GDPeYar/1GdiA==
X-Google-Smtp-Source: ABdhPJzpLVMd22kNQFUTmmEfWlMGxAKrcP35qmGus+eaGcM9twU+jNtlVs55/lNzHkJG8/b2jbJOpw==
X-Received: by 2002:a63:6989:0:b0:3c2:3c19:d661 with SMTP id
 e131-20020a636989000000b003c23c19d661mr20458025pgc.352.1652813372993; 
 Tue, 17 May 2022 11:49:32 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k189-20020a6384c6000000b003c574b4a95dsm8993593pgd.53.2022.05.17.11.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:49:31 -0700 (PDT)
Message-ID: <f6d33484-1a5c-9b1c-fa15-5ef557571601@linaro.org>
Date: Tue, 17 May 2022 11:49:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 04/10] target/ppc: Move mffsce to decodetree
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-5-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-5-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/17/22 09:47, Víctor Colombo wrote:
> -static void do_mffsc(int rt, uint64_t set_mask)
> +static void do_mffsc(int rt, TCGv_i64 t1, uint64_t set_mask,
> +                     uint64_t clear_mask, uint32_t fpscr_mask)
>   {
>       TCGv_i64 fpscr;
>   
> @@ -618,6 +619,12 @@ static void do_mffsc(int rt, uint64_t set_mask)
>       tcg_gen_andi_i64(fpscr, fpscr, set_mask);
>       set_fpr(rt, fpscr);
>   
> +    if (fpscr_mask) {
> +        tcg_gen_andi_i64(fpscr, fpscr, clear_mask);

The naming doesn't seem right for clear_mask.  I would expect clear_mask to contain the 
bits that we want to remove, and the computation to be

    fpscr &= ~clear_mask

> +        tcg_gen_or_i64(fpscr, fpscr, t1);

Can we get a better name than t1?  Also, I think perhaps NULL would be better for when we 
do not wish to include this.  I suppose tcg_constant_i64(0) is *probably* already in the 
constant hash table, but why look it up at all?

> +        gen_helper_store_fpscr(cpu_env, fpscr, tcg_constant_i32(fpscr_mask));

Given than everything in here is fpscr related, perhaps "store_mask" is a better name?

Also, this is the second time we're modifying the new do_mffsc function.  Does it actually 
make more sense to reverse the order of these patches so that MFFSCRN comes first, as that 
is the one that takes the most complex form of do_mffsc.

Alternately, does it really make sense to try to do everything in one function, with 4 
extra parameters that turn out to be very specific to single instructions?  E.g. the t1 
parameter would probably be better implemented with a deposit of the RN field, rather than 
separate ANDs and OR.


r~

