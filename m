Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB239CB9B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 01:02:13 +0200 (CEST)
Received: from localhost ([::1]:41152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpfIy-0007tQ-Co
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 19:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpfHy-0007B0-Tl
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 19:01:10 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpfHw-0002yr-EP
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 19:01:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id c12so10256193pfl.3
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OhbSNhffCGQYgRp4RK5haYU+KMDTXxY2DX8+JZ961YY=;
 b=W71PXARQS3HV0qb2WybHZUSuqE+ih5tCBl63af8DI+Qjz4RTa3+C48hI5CEJr40EgS
 pYEJ+0r9HQrWYumutq14oO5SW4gr3rdwBmr0gXZaeSAPrdW25QV4nyU+CJa9CmBYanL/
 rlikzH+q3Gf6L4rna2padU1+CSzmLi/K+r9y9OIopxHQ2FZlb5CUd6SwGTFp5wAdugVl
 sxKbaa8CxdaVHTwMxx6fc/M235LQZju2wV/WT3WqcLvkjx81m122QkC5hv19GXOVwPV7
 1fEHK0EZ30Zv50ADeJqbPEyasQUT8MkVL1hGOkfSynjKgaZ7BMdjepWCJ5qgbGdvXfK0
 KUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OhbSNhffCGQYgRp4RK5haYU+KMDTXxY2DX8+JZ961YY=;
 b=T8waPGV4B60oT2jDlt3oKBA4AimEWh28dnhRbi6Lg8tt24GL27VzxKYt/bXBB29ZRg
 2ebzqDIRyXxf9aCi9JPdeDUsfQ1+deMiEZMNg9kV77s2Zqb4sayOvSfFUBnipQxGmKAg
 jdJvzDVwK8ZlmxMfQNWPSVVTx1F0zzeeNcaSCHocM7iZq5eWrCA/zzzz3UR7PE8YFxAE
 fyT70jIFh6Aal0028fHFzMcy2C+Kc7ZjOz5TZBkqsH46gbe13L94xhYO65sCTLXeYDOx
 JARJ0Y4FVbWPp0zisruIQwW+0IfvAUbOoqhdsSkeckcgaUAqG0S228RyUPGWrvcckqEd
 a+jw==
X-Gm-Message-State: AOAM533dTc8c7VYqDnYkOrwmCVHXH0axS9Z3CQnatAxG8Ikbscv11Zc9
 YkCn0Y/E9bqUuyn+U9JXypMvYw==
X-Google-Smtp-Source: ABdhPJzmhE2toW6u8C/g3Cuy8OL+XIaNRHS5GG8ex4DoZLed7dAEH/VeXl2qMV/ypyUjF23+OaxlHw==
X-Received: by 2002:a62:e21a:0:b029:2ea:26c5:2ec3 with SMTP id
 a26-20020a62e21a0000b02902ea26c52ec3mr10769592pfi.8.1622934066659; 
 Sat, 05 Jun 2021 16:01:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t17sm7518640pji.9.2021.06.05.16.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 16:01:06 -0700 (PDT)
Subject: Re: [PATCH v16 98/99] configure: allow the overriding of
 default-config in the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-99-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee423fff-69bd-5edf-a444-b5f5e6ec868b@linaro.org>
Date: Sat, 5 Jun 2021 16:01:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-99-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
> +++ b/configs/aarch64-softmmu/64bit-only.mak
> @@ -0,0 +1,10 @@
> +#
> +# A version of the config that only supports 64bits and their devices.
> +# This doesn't quite eliminate all 32 bit devices as some boards like
> +# "virt" support both.

It's not really 64bit-only then is it?
What is this attempting to show that virt-only (with sbsa) doesn't?


> +++ b/configs/aarch64-softmmu/virt-only.mak
> @@ -0,0 +1,8 @@
> +#
> +# A version of the config that only supports virtual machines. This is
> +# intended to be combined with options like --disable-tcg for a
> +# minimal build supporting only machines we can virtualise with a
> +# hypervisor.
> +#
> +
> +CONFIG_ARM_VIRT=y

I would have included SBSA here.  That's a virtual machine as well, just not 
named "virt".  It would also make a useful build configuration, imo, suitable 
for --disable-tcg --enable-kvm.


r~

