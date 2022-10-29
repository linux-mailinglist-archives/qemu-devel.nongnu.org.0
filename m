Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C86124BE
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 19:53:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooq0S-0002rH-7e; Sat, 29 Oct 2022 13:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oopwH-00070S-De
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 13:48:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oopwF-0000Hm-QL
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 13:48:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 i5-20020a1c3b05000000b003cf47dcd316so8375014wma.4
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v6F+hDsplTmicY/Bls2CjWubdnvRMTMha3ByIT8zA6g=;
 b=oXRUJB7phQw0Nn81eer7o/N2TraF8xXawSBl+1xyRHdJRn2RKLSGcmUgjaNsl4JjcI
 ROe5hPxvBu14UYBoZYM9nXdafpA0o3Luvatk43zzvSEtwW7cLBi5XOpAvfg6LWGFUAbZ
 ueRWyLYkGFIUqceUwGIEy4ajQEYZQ7oZ/mT6/kY5ImmvWetRjuUMY/cOBhYuOqOKfuHs
 266hztrOaIdSOYC6NLlUBxVOYAKqxzB2+LC2pyb8pxUUUAgi7FhKN7jjofTtSgS5Nc9b
 OIijI6eDOgtZbGvVHGedfjCMmA0h058x/ZoMDI9uvG49OQ05shtAgu7lZR62pjFNAPSZ
 xksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v6F+hDsplTmicY/Bls2CjWubdnvRMTMha3ByIT8zA6g=;
 b=gpRNeVkYOicx9lxjXESkizFYW6RX3DQizFRl+vQ4AgANe7R0Ub88UI0DD/OTIC58kk
 +JCu1ftjXRF/v/3bTQeweck9zdDLCgS2+bK5/oInk1MyuUp+EOqqFYwc1irVXKTt/Ffq
 Z7JLhrjkGgITS4FFK9EfcGnckJv0ggu0smaGmAm9Qonuy605rDoEYxFqelrqwzbyF0i+
 lVm6clERNiJ1o66GOTMAMEY4pl+DM9r9yEh6CE4kGINzShHyRh21/h8H0JCRbvd18USo
 ct1E02Q+NWr5RfPzXfDmLEbib99FK5yNTHJZ70tMVLTzWK0tDvhDzzLdwcUc7wUx0P/H
 NuwA==
X-Gm-Message-State: ACrzQf1yFeDkAXr4E5aklle9UufwrSwtBne065vBoDiBS43/vwil0KLv
 w4YwSEBHemO4H6GbhB/i858ssg==
X-Google-Smtp-Source: AMsMyM7fzD8qKwDIbIipXXQx8WplS3AF3jwFkKUP57d9qL41fuPlwGy6knK9ed0Te5XU5Ws766/Lgg==
X-Received: by 2002:a05:600c:a09:b0:3b9:f70f:aa72 with SMTP id
 z9-20020a05600c0a0900b003b9f70faa72mr13117105wmp.97.1667065685472; 
 Sat, 29 Oct 2022 10:48:05 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i25-20020adfaad9000000b00225307f43fbsm2028733wrc.44.2022.10.29.10.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 10:48:04 -0700 (PDT)
Message-ID: <d0302871-6755-04f9-c82f-9389115c7628@linaro.org>
Date: Sat, 29 Oct 2022 19:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 2/3] target/mips: Cast offset field of Octeon BBIT to
 int16_t
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, f4bug@amsat.org
Cc: qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
 <20221029020030.13936-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221029020030.13936-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/10/22 04:00, Jiaxun Yang wrote:
> As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
> Manual" offset field is signed 16 bit value. However arg_BBIT.offset
> is unsigned. We need to cast it as signed to do address calculation.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/tcg/octeon_translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
> index 6a207d2e7e..e8f2277c51 100644
> --- a/target/mips/tcg/octeon_translate.c
> +++ b/target/mips/tcg/octeon_translate.c
> @@ -38,7 +38,7 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
>       }
>   
>       ctx->hflags |= MIPS_HFLAG_BC;
> -    ctx->btarget = ctx->base.pc_next + 4 + a->offset * 4;
> +    ctx->btarget = ctx->base.pc_next + 4 + (int16_t)a->offset * 4;
>       ctx->hflags |= MIPS_HFLAG_BDS32;
>   
>       tcg_temp_free(t0);

In target/mips/tcg/octeon.decode:

-BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
+BBIT         11 set:1 . 10 rs:5 ..... offset:s16 p=%bbit_p


