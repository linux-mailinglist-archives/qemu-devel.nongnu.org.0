Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F975AD94B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:53:11 +0200 (CEST)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVHDa-0006Nz-W9
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVH2M-0005pB-RR; Mon, 05 Sep 2022 14:41:34 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVH2K-0005Hv-4h; Mon, 05 Sep 2022 14:41:34 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-127a0d798bdso2691933fac.4; 
 Mon, 05 Sep 2022 11:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=7pC4Xku1zl28seQIDPa60QxYCpHpzbykSM58ssBfnM0=;
 b=bYDxU9sm42fRuzlCS2HaP0+I3co1UDRkMSJWZKQS1VkBLhm7ZP52e2xoQn9JS3hF5H
 TIGP12xBRGc58UZ5aDZoIdy74xYqen8H+Q+bxRlc28flPHLg2BrVaJfV63w166vR9qnZ
 2uef8R+APhSJAHdSx34reLDfhjlBbd4e3KmXKriHt2LMGX60K6bj/elrl4mIi8c59YX2
 AYrwYJC/B+BnmBnWwBzeGkWZEb0fBxq3yGI+JQvB/3iyoBWDp5La3G4PceBv7Nht01A/
 TdzruKnmqh7Qzb48yPMNmBW8NtQ4F9scj/NZ19UeSrRBJnAVzMElMig2jLmpAbIWsa3M
 JxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7pC4Xku1zl28seQIDPa60QxYCpHpzbykSM58ssBfnM0=;
 b=NriwgkBfwalmwE6YFyLEamXNbSGl92UXpy6eLkEfR8koafBVUSiD3hSvAtdmDimTGm
 zpsmVrg/pS5Bft0Gbq7bO6g741osEA2EIxFgtUN1WeGkXZBJYXf9WiH//TxgPk7MumDI
 MY0tfl8RsPFPP/GiQ3363dtAuMUTW19GZH8XgOWd5vrA4XNTRBD4/CNxnJv+KI6f7k5Z
 oY0xl32/DilFkhYaXwhWLVT62046aJZIMjjjn48u6CQ4cyHfWKMqQUpLyCMkC6+N8N2O
 y6e+aokrD1RGV2zlPfpgfQBJbtU3jK8Q9iIWFDJc1FsGNSPbs4atUPvtKRxeX21uZthD
 J4bQ==
X-Gm-Message-State: ACgBeo3SsKzXPdiLmey9+TYQbN79EHy6dt4rnEHP3aM9gEm42SA9ep2I
 VUCH8m0BeAhMa/lRWa4p//Y=
X-Google-Smtp-Source: AA6agR6cEVvdi6lgPp9TS39orSBYghUzqzNaeojkDVwTwG18hFY3T01zrw5czBrqCq5RfRYB66WVkw==
X-Received: by 2002:a05:6871:6a2:b0:127:a28a:cf9d with SMTP id
 l34-20020a05687106a200b00127a28acf9dmr1054135oao.86.1662403290578; 
 Mon, 05 Sep 2022 11:41:30 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o2-20020a544782000000b0034290c4ed01sm4401702oic.41.2022.09.05.11.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:41:30 -0700 (PDT)
Message-ID: <2e2cdbcc-bebd-bf58-57e3-39ef7e28a2ae@gmail.com>
Date: Mon, 5 Sep 2022 15:41:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 18/19] target/ppc: Clear fpstatus flags on VSX_CMP
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-19-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-19-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.716,
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



On 9/1/22 10:17, Víctor Colombo wrote:
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

What I mentioned in patch 10 also applies to all patches from 11 to 18
it seems. All changes made in patches 09-18 are based on the explanation
gave in patch 08.

The problem with this is that it'll be annoying if/when something goes
wrong. Let's say that the change made in patch 15 caused a side-effect.
Bisect will point it to patch 15, which doesn't have an explanation of
why you made the change, and then one will need to trace it back to the
mailing list to understand it. It's not a given that one will look at
all the recent changes and understand that the logic used in patch 08
are also being used in the subsequent patches.

I don't mind if you just copy/paste the commit message from patch 08 and
just change the instruction name being fixed. What's important is to
provide some context for each individual change.


Thanks,


Daniel


>   target/ppc/fpu_helper.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 5f7f52ab5b..fd3a966371 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2639,6 +2639,8 @@ uint32_t helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                     \
>       int all_true = 1;                                                     \
>       int all_false = 1;                                                    \
>                                                                             \
> +    helper_reset_fpstatus(env);                                           \
> +                                                                          \
>       for (i = 0; i < nels; i++) {                                          \
>           if (unlikely(tp##_is_any_nan(xa->fld) ||                          \
>                        tp##_is_any_nan(xb->fld))) {                         \

