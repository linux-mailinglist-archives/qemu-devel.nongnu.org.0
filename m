Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8BB51C51C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:28:15 +0200 (CEST)
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeKr-0002kj-Mn
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nme6i-00045d-QL
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:13:38 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nme6a-00041z-Pi
 for qemu-devel@nongnu.org; Thu, 05 May 2022 12:13:36 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 y14-20020a9d460e000000b00605ee347da1so3225057ote.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=I6n3VJvdfTm4d9e3vy/FY7iMCu6X3/0SYvIobjF8r9g=;
 b=YyHWQVQtFVidIXlpIYi9WP5i0ROeXqgN5sl+OGbAK5N6o4YvuXncjZMzsWNZ2nJehw
 bJnbL5a6Rp8cycaNScjXtySBJQHYQKMC7c9tmqjx8mKIcZMWsXTWBvhiVHqz5kv5WUdT
 +MByv5aWcUGJQgr5AnULRXzxK6+02NLYdywPNYefItmOzO3mPs9dfts2o6LsFmG+uYu4
 R8/GO5Z9Xi5H3Gq8xCD0w0t+bKUJB2d0TeIaZ10htVn8sd5DVvd7J9NsMToiM1H6YZO1
 QMXMhB8qCPeVZMgl1QN+Q0//LvsbeRL6OB1zUdCnGqAyA/eIQS21YxrJ6K5O6noX1Azt
 ayZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I6n3VJvdfTm4d9e3vy/FY7iMCu6X3/0SYvIobjF8r9g=;
 b=537JfgNt0C+L6HHcJPZIpBlyM5SdSt+6D8fTt+LljJq0zLa8DZbvTLozMfb8N1iY4g
 xYDZnySDTCIoiH5w1oZaCC1lOf2V1qtYxheq8ALQI+ksGzUaMOQFxFCBPedkvulBgmNv
 m7rKwBtjmBAFsvVwxVPdzfSJLdWw5KUvyj+sRrz5rfw/iex03F/eHTRcYM+s2binGVBq
 UM5Gqc6q4gczm38fXhPVBnafUu+IDAuNudU8YYcuiaZbNGM/K/3L/DdWFfaWI+Qtd6MC
 2lul4No2SzNahQ6Aw0FrJQ5/2ULfcYItf0gvGjwXjM3lVI3kD84Geb3cN6BA/7qpAuUO
 EUzQ==
X-Gm-Message-State: AOAM533aJYvq/At3Rkhm5oPIcqE80jyEK7ovenxw2YqtJy+GXxHicDdB
 PpFqIPh8aBCCi+HLD0x33NS/ug==
X-Google-Smtp-Source: ABdhPJw44mDiIrvsVSbMvg380n0JuSaS5yOKwKC32jlwyZvlZ/Ehharj4syyUjQflQHY3Dy7AjFT3A==
X-Received: by 2002:a9d:802:0:b0:605:f693:3980 with SMTP id
 2-20020a9d0802000000b00605f6933980mr9604416oty.257.1651767189638; 
 Thu, 05 May 2022 09:13:09 -0700 (PDT)
Received: from [172.0.0.47] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 w3-20020acadf03000000b003265922b72fsm762474oig.40.2022.05.05.09.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 09:13:09 -0700 (PDT)
Message-ID: <bc338b3d-06dd-6658-5601-0cc30d6689e2@linaro.org>
Date: Thu, 5 May 2022 11:13:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: fix s2mmu input size check
Content-Language: en-US
To: mkei@sfc.wide.ad.jp, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220505031234.20349-1-mkei@sfc.wide.ad.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505031234.20349-1-mkei@sfc.wide.ad.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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

On 5/4/22 22:12, mkei@sfc.wide.ad.jp wrote:
> From: Keisuke Iida <mkei@sfc.wide.ad.jp>
> 
> The maximum IPA size('inputsize') is constrained by the implemented PA size that is
> specified by ID_AA64MMFR0_EL1.PARange. Please reference Arm Architecture Reference
> Manual for A-profile architecture "Supported IPA size" on page D5-4788.
> 
> Signed-off-by: Keisuke Iida <mkei@sfc.wide.ad.jp>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5a244c3ed9..868e7a2c0b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11116,7 +11116,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>           }
>   
>           /* Inputsize checks.  */
> -        if (inputsize > outputsize &&
> +        if (inputsize > arm_pamax(cpu) &&


This is incorrect -- arm_pamax has already been taken into account in computing 
outputsize.  There are many more constraints than just this.

You need to have a look at the computation of ps and tsz in aa64_va_parameters, and then 
the computation of outputsize near the beginning of get_phys_addr_lpae, which takes 
arm_pamax into account by bounding ps against ID_AA64MMFR0.PARANGE, and pamax_map.

What problem are you encountering?


r~

