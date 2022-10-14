Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534285FEC8F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 12:30:15 +0200 (CEST)
Received: from localhost ([::1]:49498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojHxG-0001kM-CA
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 06:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojHsY-0006fW-1h; Fri, 14 Oct 2022 06:25:26 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojHsS-0007JG-EE; Fri, 14 Oct 2022 06:25:20 -0400
Received: by mail-oi1-x22c.google.com with SMTP id o64so4539586oib.12;
 Fri, 14 Oct 2022 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sRqCPZuuXbrfTo5MQKOPiuW8Sjikg8odNWOn66mm52E=;
 b=T0VBe1GmBneR5ugGW0R1uqTWVDup6Cg3M2HI2W7o+mS7XePTiHtEkLxhF5MzyEd4k7
 40tsd2P9GG5EmrApneRnIfZZyYku2BMa5hngEGN8AN0ATDVYhhB+7xvWeBMy6owEXeC9
 mWJprvgnHwAxL3fdlu/0zerDsJEWwSgNlyCmtojG44BjqTRVNp9q0NytZpWk6LHFDoyn
 uBqVbuNVeuQOgHVI1rmO6r4oNkF8+Uw4EGNUCV1nHGlONWIhab0wFDSD0A7q3xAmL8oa
 1SPXhvRwsrWN45gLJtYYpIMuUgk8UJiEvkmX+DgUr48D2nFGmBx1V01ibEsNr1cBlUMk
 4zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRqCPZuuXbrfTo5MQKOPiuW8Sjikg8odNWOn66mm52E=;
 b=Pqw5XRv9lcLPDLNRl4Z9OKTBsersb3dryoEkNh20mTo/v84iPH3H2Q3LZhCScMF6sH
 /na4z7MQiL1MpoaqcDhCLWUu5j6QKx3MFo4lc9LKF2R+UAcvMTXm2+hbPW/WckGGzOfC
 oKQe0nnoW1vWaeyPM4Lk3PQL23oSDTn2QsYFYdrB0AIqgRb/2QBHNGzsJk1J7lv22vw1
 NuwphcSf4sm9DX66DchKAPIsNtKfuOy/SOcKn+guXtw9y03PVuzlpTfYy2t2UkxNeQwr
 Xw+3IGGd4vtPck9MiYGc+r41LctKiVSbQf0bi0mG+9T8t1JZudZ+PZ05c2Is4FtDzB8A
 GVPg==
X-Gm-Message-State: ACrzQf2G1Xy6+3eRMJPufokm+Dd3d4GyaRCyfE8IEnICRk+UxYPXol/G
 +GMD3IQbmhqu/mKxGnYg4DU=
X-Google-Smtp-Source: AMsMyM4WbApli8I916Gm2M1d/ZaEba+mQYDLGj1ZzMB2BQyGQSaeSU+sMtYwHr0vG8VAMeVMI1HObA==
X-Received: by 2002:a05:6808:3093:b0:354:250f:f31c with SMTP id
 bl19-20020a056808309300b00354250ff31cmr2030049oib.79.1665743112814; 
 Fri, 14 Oct 2022 03:25:12 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 r64-20020acac143000000b00350a8b0637asm882887oif.47.2022.10.14.03.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 03:25:12 -0700 (PDT)
Message-ID: <a9e1f48a-f192-1c1e-aee9-674bdab935ea@gmail.com>
Date: Fri, 14 Oct 2022 07:25:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] target/ppc: Fix xvcmp* clearing FI bit
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20221005121551.27957-1-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221005121551.27957-1-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 10/5/22 09:15, Víctor Colombo wrote:
> Vector instructions in general are not supposed to change the FI bit.
> However, xvcmp* instructions are calling gen_helper_float_check_status,
> which is leading to a cleared FI flag where it should be kept
> unchanged.
> As helper_float_check_status only affects inexact, overflow and
> underflow, and the xvcmp* instructions don't change these flags, this
> issue can be fixed by removing the call to helper_float_check_status.
> By doing this, the FI bit in FPSCR will be preserved as expected.
> 
> Fixes: 00084a25adf ("target/ppc: introduce separate VSX_CMP macro for xvcmp* instructions")
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---
>   target/ppc/translate/vsx-impl.c.inc | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index 7acdbceec4..e6e5c45ffd 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -810,7 +810,6 @@ static void gen_##name(DisasContext *ctx)                                     \
>           gen_helper_##name(ignored, cpu_env, xt, xa, xb);                      \
>           tcg_temp_free_i32(ignored);                                           \
>       }                                                                         \
> -    gen_helper_float_check_status(cpu_env);                                   \
>       tcg_temp_free_ptr(xt);                                                    \
>       tcg_temp_free_ptr(xa);                                                    \
>       tcg_temp_free_ptr(xb);                                                    \

