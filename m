Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCDD506044
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 01:35:51 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngauM-0001cP-62
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 19:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngasb-0000Fv-UQ
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:34:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngasZ-0000ly-0i
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:34:01 -0400
Received: by mail-pj1-x102c.google.com with SMTP id md4so14251263pjb.4
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 16:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ztbNfoFJSg6lixHbleD1xvXYBQtFL8u3ztV/rFmSWMg=;
 b=bQ8MlODrAjT3uIKGO/techzfYA3p0WKVnuwm+ETm25DrYkk3TnfmFlIALJc6wBbGjL
 8IU7nzPNfCSHRQCaqAz6npd5EzlsQCnwPrTBOauELqC/hhx0pYHx/Q3fBga/SUk7jQCK
 Ff0mCfErnttLBxX4IP6uS7jjHyrSYLghD3ROzmQqXVS+gczJwkgYZw7R44WX/LNFdva6
 GOpKOjDlsdntcmbxV3LMWdst8oVkA3qZVfxdA4qI9p5mLYFcJCCManvYrxKDgj2rB20L
 3F/zCMPz99mc2HTrY6cEWgWGoxA8Chqd/V/Z9D3rY6z43BwZNoUipqik3dCU3XYzhZzL
 j/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ztbNfoFJSg6lixHbleD1xvXYBQtFL8u3ztV/rFmSWMg=;
 b=kJbuujR2cyCL0oKL8SmjeYEkixzN+yzlUojpFpD+ABwX40t3LnfYeZRtVtVpv5f9Tb
 gaRkQekGJyiiG0xF/S4GBkC/p5gznOe9s0p6vWBr5SqdeO9GRssQ0ldOTQEPXomkkcjg
 8f5ELflya2bfIpNx/ExP7u+rsCb9hcudprktxc6CL33r+JohVi2ZH0KQZkyNRLQMC/B2
 /Ih2CZxyr8S/dMBHs7rxkrYNasvOc6PfIGKjMNa3x9x3SWGwxCy8M0VIVD3mIcjTYGvI
 mp9v6797u/FHzy1nMUDuCrWgIJIFU0jp/CtPsj/Q7TyuGfwhZeST1le2fQKusQKb9DzW
 RC4Q==
X-Gm-Message-State: AOAM532787GVZBPaz/MjozINiwcEJs1KBCS6AEUIFV5rzyLY9rK67mCl
 awHdMl9eLhgvhYfHJnCU8cs6uw==
X-Google-Smtp-Source: ABdhPJw3OYqWZX2rBJ1cgWnrdGAKfdSFn2mY7wIi/5tA3biSKCOiLg2RYL47Z92aPMSjUAn5UHj2kg==
X-Received: by 2002:a17:902:b489:b0:158:f23a:c78f with SMTP id
 y9-20020a170902b48900b00158f23ac78fmr10780037plr.65.1650324837293; 
 Mon, 18 Apr 2022 16:33:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a056a00198900b00508379f2121sm14054378pfl.52.2022.04.18.16.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 16:33:56 -0700 (PDT)
Message-ID: <09d9c016-fb7d-2728-32b5-3578374cdc70@linaro.org>
Date: Mon, 18 Apr 2022 16:33:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: danielhb413@gmail.com, groug@kaod.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 12:10, Leandro Lupori wrote:
> Add semihosting support for PPC64. This implementation is
> based on the standard for ARM semihosting version 2.0, as
> implemented by QEMU and documented in
> 
>      https://github.com/ARM-software/abi-aa/releases
> 
> The PPC64 specific differences are the following:
> 
> Semihosting Trap Instruction: sc 7
> Operation Number Register: r3
> Parameter Register: r4
> Return Register: r3
> Data block field size: 64 bits
> 
> Signed-off-by: Leandro Lupori<leandro.lupori@eldorado.org.br>
> ---
>   configs/devices/ppc64-softmmu/default.mak |  3 +++
>   qemu-options.hx                           | 18 ++++++++-----
>   semihosting/arm-compat-semi.c             | 33 +++++++++++++++++++++++
>   target/ppc/cpu.h                          |  3 ++-
>   target/ppc/excp_helper.c                  |  9 +++++++
>   target/ppc/translate.c                    | 14 ++++++++++
>   6 files changed, 72 insertions(+), 8 deletions(-)

Modulo whatever sc number yall settle on,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

