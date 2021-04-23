Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9151369D29
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:09:49 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4vk-00078E-Rl
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4sR-0003KE-II
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:06:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4sP-0005zt-SR
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:06:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso2068657pjn.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GB+F6FVbHS21Cc3HPsM3TACNKNI5GG9BbAPGOzedOME=;
 b=QwJ21BuFezWn5FCCsGe3Hfdekay/Jn+XlFhoAbq77CDychrOyGz22MRmxnwB7Uzj8m
 +1r1ru26jDl7YdPw0gR7S1rmqZovMWwg8/8oodNnKqqpL5muXTRjYVLSqhuB/qLWb472
 dhm/VBdRepHRc40LZr7OmeQ8bdgePrwfGB10FSdr0i7Gsm2bpHVPPr1kRXBb2q176max
 S40BeZN2RX8XGVtSdsjAlZRbk2IHrCiHMdS37eKb6B8ZCy8PrsH1LQ4rZUAeX0DasPHT
 c7g5T3D9F+/SJJwcnWSilPoitQfIbLGIOaMdWjM2YEX2XllsUPutiPeNd5IHPs7HY5Hn
 mALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GB+F6FVbHS21Cc3HPsM3TACNKNI5GG9BbAPGOzedOME=;
 b=FZqBxwr5frinwx0BC9WwZENXayGZbnTpQ1pFpomEKfpend6yqDe1cwoazkhEWD23UW
 hGOng75x7gESMJoIhQh5RI4eDPbgMhIAPSu/Hvy2a5DelWiIeZcyzZwd1/w1F7WxavC7
 kh7ynKX25oj2yqW+hUhXv40fMamc6Iu0A3pVc4nbFEOO9dgIYtRhaPkyNEG8NIl9YPzL
 xavFO/XV/XpPS1WRkT0JVMAY5V/l88sbJQ0i0DHRGJ8mz1QLzlmpgWKzrIgyD+redRMW
 qH2ICFhPhnDgA65uEpGHFdJc+5MsbLlkW+ZqVlzvlOd8wsCbTJ3hvNK/ikHZNo5m8+Lb
 3org==
X-Gm-Message-State: AOAM533xWMi+RdfROlRdVxFrSI+kjQYIFK0uyC/4hO77cMCgUoZoN1QL
 A5DZEasr/a0mlIY+Y6R5y/vRlbywDRUYVQ==
X-Google-Smtp-Source: ABdhPJx8cELZPZ4l4Pv0AYL+g4mCkZVGB6DWG2c9paJ9MxtlcsRUOo/D2Y251goC2/VdLi+tY5MDfA==
X-Received: by 2002:a17:90a:950c:: with SMTP id
 t12mr8158958pjo.135.1619219180286; 
 Fri, 23 Apr 2021 16:06:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id c16sm5735374pgl.79.2021.04.23.16.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:06:20 -0700 (PDT)
Subject: Re: [PULL 10/24] bsd-user: style tweak: use C not C++ comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b54527b4-8b6f-17fa-8acd-a580c065b75b@linaro.org>
Date: Fri, 23 Apr 2021 16:06:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index b836b603af..3480db890d 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -71,7 +71,7 @@ struct image_info {
>   
>   struct sigqueue {
>       struct sigqueue *next;
> -    //target_siginfo_t info;
> +    /* target_siginfo_t info; */
>   };

Ack.

> @@ -193,9 +193,11 @@ extern int do_strace;
>   /* signal.c */
>   void process_pending_signals(CPUArchState *cpu_env);
>   void signal_init(void);
> -//int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
> -//void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
> -//void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
> +/*
> + * int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
> + * void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
> + * void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
> + */

These should probably be deleted with the #if 0 code that references them.


r~

