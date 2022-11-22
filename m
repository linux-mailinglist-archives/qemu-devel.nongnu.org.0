Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83965634388
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:22:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXtj-0000LJ-VA; Tue, 22 Nov 2022 13:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXti-0000L8-28
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:21:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXtg-0004DB-Fy
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:21:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id x5so21925316wrt.7
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=thGpytbZshDiB+G0/3nPM/CidKnk5VSPp/+m6TKgLnI=;
 b=OAMjnQq6ilQhSuEvLWgiYA/TE1MWveWghZeqfTBI6r3kC96e47fHs8rUnVeylkse4e
 +M+vQTdx/oeBzQyhDv1w4VHnCyzZ2geeM+SfgqwOxxGI0vkusx7FgeinfxCi03APi4Ns
 RVjlsbwZzjFSmRhn593mXZvYowNr3mqgE7Z4LOuiSUZV6UKRlSd8QJF2ocshdm4KmGO2
 N4uQ2BnVURYW56kR7zH/l4ROvplG/GiehtSWtylTxv2LkRc0WLxPrXoFQv78lC31SX9r
 4MUZnAlebeAqIROL0oRZdNmxhSa4XRTVACe4tZoDnOaTkexFuaKxKbWa+pxA9cpmx15b
 snUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thGpytbZshDiB+G0/3nPM/CidKnk5VSPp/+m6TKgLnI=;
 b=us6at7WHRj45GKnjhCzn+3ZWON9/GNXeFfBPF/ByGtfMpwNZxdWz1uIoj1XErmeB6E
 QpbWo02sGzK48D5gt5Abdh3NnIFjc/RjZDDKbBKNJN09bMn2KC/sH9SNQLpFhVScVF+o
 WbryQ1Jx1Yj2sEirqJPzplFr98+aJT/QIm8TBkVS8bVu+cjoWFUZy7rzykOpQ6Jj3wAq
 EjuTvpf/0HD/VIuCl01h+MwArr758CMgb1qZBMLZ0Y/Gxa83ft9ryMzYMPJxCZjIvAkm
 ZgCatEjVUcxoNcV6Z/q1vPugwZSvWQmy/epOPaaw5LJEPvqhH/Z+5vZbAgQnDbqn/aQl
 vGDw==
X-Gm-Message-State: ANoB5pnnh+JqYszZ8knyB/IGrVXKRuJv6NaiLoUpKQ1S8ju+uX0NL6fM
 1SRSq2rhNFVkuXxo9djAndURlg==
X-Google-Smtp-Source: AA0mqf4YbddHZcYbZQ2pKqw/mnvgw/k/C2m9QF0EdLWjM2VHDz+OEhE10gFqGn3gBU8noueMu3J2Mg==
X-Received: by 2002:a5d:674d:0:b0:22e:2ecc:663d with SMTP id
 l13-20020a5d674d000000b0022e2ecc663dmr15697728wrw.633.1669141286870; 
 Tue, 22 Nov 2022 10:21:26 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003b47ff307e1sm17452003wme.31.2022.11.22.10.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 10:21:25 -0800 (PST)
Message-ID: <7927a474-d542-c84d-5cb7-7ddd5d19d7f4@linaro.org>
Date: Tue, 22 Nov 2022 19:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 15/29] include/qemu/int128: Add vector type to
 Int128Alias
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 18/11/22 10:47, Richard Henderson wrote:
> Adding a vector type will make it easier to handle i386
> have_atomic16 via AVX.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/int128.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/qemu/int128.h b/include/qemu/int128.h
> index f62a46b48c..f29f90e6f4 100644
> --- a/include/qemu/int128.h
> +++ b/include/qemu/int128.h
> @@ -479,16 +479,16 @@ static inline void bswap128s(Int128 *s)
>   /*
>    * When compiler supports a 128-bit type, define a combination of
>    * a possible structure and the native types.  Ease parameter passing
> - * via use of the transparent union extension.
> + * via use of the transparent union extension.  Provide a vector type
> + * for use in atomicity on some hosts.
>    */
> -#ifdef CONFIG_INT128
>   typedef union {
>       Int128 s;
> +    uint64_t v __attribute__((vector_size(16)));
> +#ifdef CONFIG_INT128
>       __int128_t i;
>       __uint128_t u;
> -} Int128Alias __attribute__((transparent_union));
> -#else
> -typedef Int128 Int128Alias;
>   #endif /* CONFIG_INT128 */
> +} Int128Alias __attribute__((transparent_union));
>   
>   #endif /* INT128_H */

This triggers a warning with GCC:

include/qemu/int128.h:487:14: warning: alignment of field 'v' (128 bits) 
does not match the alignment of the first field in transparent union; 
transparent_union attribute ignored [-Wignored-attributes]
     uint64_t v __attribute__((vector_size(16)));
              ^
include/qemu/int128.h:486:12: note: alignment of first field is 64 bits
     Int128 s;
            ^
Meson:

Project version: 7.1.91
C compiler for the host machine: gcc-12 (gcc 12.2.0 "gcc-12 (Homebrew 
GCC 12.2.0) 12.2.0")
C linker for the host machine: gcc-12 ld64 819.6
Host machine cpu family: aarch64
Host machine cpu: arm64


