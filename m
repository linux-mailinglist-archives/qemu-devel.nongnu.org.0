Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BD25235A2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:35:04 +0200 (CEST)
Received: from localhost ([::1]:47078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonQc-0002Ni-QA
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nonOj-0001Eb-W9
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:33:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nonOi-0007eL-Da
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:33:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id x88so2428137pjj.1
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4RkH/a6CCikhY5d5LToHYJ8OjOihYHk0SytHIAyIb8E=;
 b=B7CAd6WL7GHvTujmT4KAuclRjMI0zMr8JuwOYNQnEoFc54Zk8suvsju34wAFP5yvoS
 ibZFqZh6llIYzNPfeE6aGOb8vS8fxyWHgS1dvfYmbW23gXtF/NM48tUFo1PDJ4+KnTyg
 vf7xjK9+kvtBxheLu7eg7X2mKIAz2XmECdzdmebstFsy6csO1P70+TclrcK0ibFozGxD
 zRgcDHHxyUVORRsoseqHxsuf+jCYVjeohB+Fq/G2iOh9dZyhPcCzJBBezFiu/30CpTU6
 c+jrbHlN58Dr49NzsnE5cCVIaO9I56TlKgLrtRhOT6PP0HRWoSM3pYa5MF5YXmqddigm
 86RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4RkH/a6CCikhY5d5LToHYJ8OjOihYHk0SytHIAyIb8E=;
 b=m/HP74rOuPQkYdLRmYYKsyt9jC31Guz+iLCB6B9inz26Y2uKR0ZTpngTBQr/GJLu/+
 rGciWz7guou71K84rqn6S/GL80iaYBGUAhFHfJeQqgbzC8ec1ooWNrhCD0pRm4dCy9UN
 jxNEp17utyA6F83Sc/gJbD5M+1EgKUwtwYhCKOl6aAHF/WucWg3Xh7yi9vBG0p+6I4dM
 JT9kPTSTJVxE8fj5ayFYCmznWtHTOuyDHHgc/Bo4qVaZ5gnXUYvyD1z9QOEC/4WSgQ8X
 pm7pMMXm7o6rpDROkXQFYgQaifDXJ4pUSnhYCAl2zUlO4qRCTuUHP83ffcZ2diO0Y01q
 wRzg==
X-Gm-Message-State: AOAM5319mSuoKHSnUumFqeG+Oa3MYHmfQn4RBhzrh0rV7+j4hmGhxz34
 xjrylYcZiyqvCSOB9vHNh/YFOg==
X-Google-Smtp-Source: ABdhPJzzj4uBuG718lLHODu+Ec2OaRaHD6tSS/zlryD0y33d9ii6Ondw5QP15+c1ZsFbViuWSyauDg==
X-Received: by 2002:a17:902:d507:b0:15e:9045:c5dc with SMTP id
 b7-20020a170902d50700b0015e9045c5dcmr25921818plg.138.1652279582789; 
 Wed, 11 May 2022 07:33:02 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806c:42f5:cebe:3b5a:a8f:7ffc?
 ([2607:fb90:806c:42f5:cebe:3b5a:a8f:7ffc])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a170902b08500b0015e8d4eb1d6sm1972153plr.32.2022.05.11.07.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 07:33:02 -0700 (PDT)
Message-ID: <cf7c27e9-3bc9-888e-dbba-25c0bb583e09@linaro.org>
Date: Wed, 11 May 2022 07:32:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/openrisc: Do not reset delay slot flag on early tb
 exit
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20220511120541.2242797-1-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220511120541.2242797-1-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/11/22 05:05, Stafford Horne wrote:
> +static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
> +                                             const TranslationBlock *tb)
> +{
> +    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
> +
> +    cpu->env.pc = tb->pc;
> +}

If mips is a guide, you'd want to set dflag based on

   tb->flags & TB_FLAGS_DFLAG

as well.   But I think openrisc is more careful to keep dflag up-to-date.


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

