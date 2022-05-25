Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A4534317
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 20:37:45 +0200 (CEST)
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntvtA-0002J7-Ao
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 14:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntvrJ-0001N1-HO
 for qemu-devel@nongnu.org; Wed, 25 May 2022 14:35:49 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntvrG-00041W-Au
 for qemu-devel@nongnu.org; Wed, 25 May 2022 14:35:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id q18so19298270pln.12
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fqMfvaNrGFXhAYRs0q/MprE5PxALdisd+UrJ3i/TB4Q=;
 b=KU4F8q6shT3JzjSzW7VoMO/LyTJQ7ff2Sq+MUwa5n6IjmVNdS8jvYvqYaNri0Tc1hu
 fnjNvt374wqAce5nyCpQVYzF7Nkqn7/fr8UfBbyeWGynJXusnqzxyswtArYRjQYe6/dv
 snzlXvmwMp7kxbaa59y9pidn+C4O21oqUuzK/Zlg4naEqQLV5KxbRC8wzPYVGkMMQOZQ
 gRTb+MZyohq1hGrKs3idnOovt/A+YEScKUSC44LiDNE0KihGL4ojKd1GumO5VUQBkI/E
 pHvuyBISDxfuaxdOSzlJ7n1iMQAdIfXlzNaH28zrMi0TQ4fTvY7UjcZEje4ADGPZzd+p
 rKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fqMfvaNrGFXhAYRs0q/MprE5PxALdisd+UrJ3i/TB4Q=;
 b=zAWEScQ2cB5xIFo/jxZTHW+lln3HogyhIAYXlOhaxJjy9MQ54+q9iSlIejhvDVpiL4
 Ylms1PmxTMOY4TkufTRrEapnkSYG7jL8ak6AzUSorLEck9ebKhe7ZcB3Sx9x2QdWWYV1
 FhmkhD37CDykSM2RllgXyE4kn7o7mBnqH2icqvnUxRHrp0xmRGX6za99jCaWEFTes7Wu
 xvEoPRMsp/Z8yZ19BDQNvivvLSY9h3OCwzElLFoB7prJfNI/VqgZYPF4zslJfj+91Pfp
 MbYZW5VCqbfMviLRqWDlgcpYhXAyC84IgMXa9xWtbK35UTvECvUZb+fPbkenlZY2lRgb
 13Sw==
X-Gm-Message-State: AOAM532vgdL0AQEPszXNKhYfehyhalbByeKYiVNto2qNNa/8pGGTOWKJ
 TViVMqdLdpa4lGOdcS9hWvd3Eg==
X-Google-Smtp-Source: ABdhPJwIjoChbEJGA38JWjFypYJOrPwFtDnHVF9hoiJ53+c2HAr76n3jMjGlcZh4EA4BNKtXya5/GA==
X-Received: by 2002:a17:903:240a:b0:14e:dad4:5ce4 with SMTP id
 e10-20020a170903240a00b0014edad45ce4mr34834388plo.125.1653503743633; 
 Wed, 25 May 2022 11:35:43 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a170902761500b0015e8d4eb2a9sm9816527pll.243.2022.05.25.11.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 11:35:43 -0700 (PDT)
Message-ID: <bcd6d672-f14d-8f52-dc47-2cfafbf09f23@linaro.org>
Date: Wed, 25 May 2022 11:35:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/1] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 qemu-block@nongnu.org
References: <20220525124909.867787-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525124909.867787-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 5/25/22 05:49, Stefan Hajnoczi wrote:
> The following changes since commit 0cac736e73723850a99e5142e35d14d8f8efb232:
> 
>    Merge tag 'pull-riscv-to-apply-20220525' of github.com:alistair23/qemu into staging (2022-05-24 15:55:12 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to 29320530cf6684646b3a642fdbb5bc77ee8039de:
> 
>    docs: Correct the default thread-pool-size (2022-05-25 11:01:38 +0100)
> 
> ----------------------------------------------------------------
> Pull request
> 
> A small documentation fix.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Liu Yiding (1):
>    docs: Correct the default thread-pool-size
> 
>   docs/tools/virtiofsd.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 


