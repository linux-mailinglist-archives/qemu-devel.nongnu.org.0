Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC9E33738E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 14:16:42 +0100 (CET)
Received: from localhost ([::1]:38710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKLBB-0007Ep-El
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 08:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKL9F-0006aD-5O
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:14:41 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:44368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKL98-0005nM-6B
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:14:39 -0500
Received: by mail-oi1-x236.google.com with SMTP id w195so16423074oif.11
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+GzxaGsvtyqbhYzT0NfRBP474Uj3g8+T5Fyf4d8pVhc=;
 b=HGwyMipoDS64YkaDmQH+WDGN0dJ0KMqLF7yYkznP23tHsYodez9ucgDIUZxepRUtYg
 bnPJ/nhcHAh2Ph2Go+aILSaJJNeK+XyGf7n9dt2f1ITRAIRhe04I4djKFOU6IBVPHWAO
 QbefqOyOre+JhX79E2x7Z98UjjcK/o2kG6F/cokK6pEQVZu+SR7tngQ5CW54uCY9JmHn
 Huh7+VEY/YyojVaog2mXJSWeQzWRvH1XraKG0owT1psnPFQr8qK7cFEdS6Ht6brGl/0z
 bzT3cGrZnWf7fYJ4nUzNnCMR/N8ZrLqfDErtprj8LLEgizudWpCHrtaH8MQ6M+l6CzE7
 D4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+GzxaGsvtyqbhYzT0NfRBP474Uj3g8+T5Fyf4d8pVhc=;
 b=EtGU0p86YjVW4JArA51kyTOzZU5X4EcvZdMw6179Wev+eeWDdz9HNm0W02ffz47Utn
 yy5bUw99Ja9019/6raNgGqVDbLHWwdgAw5juzQaby6y5AMFS68C0IOgJHKYJa/P2rrKc
 +xlAjcNVRBvrUPLB9gEpZRedGtlqEzYsby03xjK/H8ZDqa1vWx0sdV9t0NeYyaLSfruq
 UXSQz4gfZ736P9/IYQMJ89/1TcYj0lno8BfV4ZW31wXOInTs5QWM2e3LAPoEPlpOoYcN
 omkI55gBgfsR76IzXhIjcxj7eYnn8BJfd0Rke0oC7VIlwE+ATYGxykA48JYfBJgfsYjU
 laLA==
X-Gm-Message-State: AOAM532sMIT9LSRiSnS4bo3LJWc7Jk6vtXVBM2Iz8zhj2jS9bUbu2B4V
 gkFo/UvNg2DTumiIuoetMxFxwoCyDBlkzSMC
X-Google-Smtp-Source: ABdhPJxxzcQ7BjgS2wSYzBFKuRFPLu8Yl6scVPRegsVzrPNzFB95xwnoO33GWvtCCkXbYAWxTeBoPQ==
X-Received: by 2002:aca:6204:: with SMTP id w4mr6359628oib.86.1615468472031;
 Thu, 11 Mar 2021 05:14:32 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n17sm559514oic.8.2021.03.11.05.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 05:14:31 -0800 (PST)
Subject: Re: [PATCH 4/4] hexagon: use env keyword argument to pass PYTHONPATH
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210310104937.253532-1-pbonzini@redhat.com>
 <20210310104937.253532-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a904d698-05fc-1efa-652a-c8a43a81f7fc@linaro.org>
Date: Thu, 11 Mar 2021 07:14:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310104937.253532-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 4:49 AM, Paolo Bonzini wrote:
> This feature is new in meson 0.57 and allows getting rid of the "env" wrapper.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/hexagon/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> index bb0b4fb621..aaeee11ac1 100644
> --- a/target/hexagon/meson.build
> +++ b/target/hexagon/meson.build
> @@ -156,7 +156,8 @@ dectree_generated = custom_target(
>       'dectree_generated.h.inc',
>       output: 'dectree_generated.h.inc',
>       depends: [iset_py],
> -    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],
> +    env: {'PYTHONPATH': meson.current_build_dir()},
> +    command: [python, files('dectree.py'), '@OUTPUT@'],
>   )
>   hexagon_ss.add(dectree_generated)
>   
> 

This also fixes the python command nit I mentioned vs patch 1.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

