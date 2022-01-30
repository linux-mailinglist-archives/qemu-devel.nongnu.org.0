Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A24A39C3
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 22:16:38 +0100 (CET)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHYr-0006qW-G1
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 16:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHWa-00069Q-NC
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:14:16 -0500
Received: from [2607:f8b0:4864:20::1032] (port=55039
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHWZ-00079P-1c
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:14:16 -0500
Received: by mail-pj1-x1032.google.com with SMTP id r59so11894076pjg.4
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 13:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RnKs9nt2nGx32ePFAu9wwBmlkwtcSVdzSSSYL+utjvQ=;
 b=KOdgEEphSuwehdJv1CJ8snq8kyT0j5JtcgntjK5TDMUPHnJ8mOdezP577nQT5y1aTe
 H6sbIAUYw0GCNIvkOdTVW0OixikLXMV9R+Vnb8m2VCYR4haitOcDhziM4z1zW879eKVn
 eREuioaxh7sVttnHVcPUjykTOZoTWesYjUOg2YKpf4sCFpkAbrWLdCUyMM16epszfjsU
 I+Sx0wT9+b0RMAYqVBlwvoHGwYVy2MZO/3RvzeVZkEaojSjyxTbD54y5VaDQF1lBZdik
 QHzJqZ6MN2DwIdtvFXTMoo3HEqh6mb7ocpmfTLeJNeFkPgCf0y6Yuq7fOIK4193zrCOB
 LLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RnKs9nt2nGx32ePFAu9wwBmlkwtcSVdzSSSYL+utjvQ=;
 b=tX9fQOF978Ahr69APV4Z3O8yzBeHCVVu4Qijs9B5itmw4NGJkxSwrFw5yRgswsrRWo
 7EB9xVYS4aAO3lPoDhROQVb3Tor3clDnTPWIUmPEEIsRS2AIwGT0W1Y8w7h1TNgg9Zu7
 G40NeCajRlNOB3p24QWzGdLyCHM7TUkHf5CG6TKXv6qQ5RjHiWKaxp7HGiFAkgy+Q51w
 Se2Wtzf2HPvyGtrbCwOjBP8sYe7vUkIkSW+lZbngOnpWnPzsn77Q3mvAnKwUAufhbVl+
 ktGA5cmz8bIdNLMeoZReUCyA7cWpDRoDoKsPV9DrAeQ1VvUMy5J5aTiZXnxfe4ifVEue
 SQTg==
X-Gm-Message-State: AOAM530hieuCsAwK4btWBe5blTiOxd6/Qcpb5GVwRRIqxAG+xBwSpFrK
 G8q/y2bzeBBlEXeo4N96AzuzNQ==
X-Google-Smtp-Source: ABdhPJwCmt2tRMJ39xbyRdlfTGRS3UYSWB/8rVPmPlt5IDSuWSdkUkusqkEGo0L44E4RCpYgWcrfHA==
X-Received: by 2002:a17:90b:f07:: with SMTP id
 br7mr21027137pjb.89.1643577249126; 
 Sun, 30 Jan 2022 13:14:09 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id l2sm16119668pfc.183.2022.01.30.13.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 13:14:08 -0800 (PST)
Message-ID: <81e3c56e-373e-59ad-b51c-e061e851b5cd@linaro.org>
Date: Mon, 31 Jan 2022 08:14:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 35/40] bsd-user/signal.c: implement do_sigreturn
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220128232805.86191-1-imp@bsdimp.com>
 <20220128232805.86191-36-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128232805.86191-36-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 10:28, Warner Losh wrote:
> +static int reset_signal_mask(target_ucontext_t *ucontext)
> +{
> +    int i;
> +    sigset_t blocked;
> +    target_sigset_t target_set;
> +    TaskState *ts = (TaskState *)thread_cpu->opaque;
> +
> +    for (i = 0; i < TARGET_NSIG_WORDS; i++)
> +        if (__get_user(target_set.__bits[i],
> +                    &ucontext->uc_sigmask.__bits[i])) {
> +            return -TARGET_EFAULT;
> +        }

Nit: missing braces for the loop.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

