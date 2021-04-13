Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE86735E488
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:02:45 +0200 (CEST)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMR2-0007T2-Ut
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMOI-00063N-Us; Tue, 13 Apr 2021 12:59:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMOG-00062v-Oq; Tue, 13 Apr 2021 12:59:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x7so17141964wrw.10;
 Tue, 13 Apr 2021 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9wT8spic4/COFYq9REm81WEt576wS2+k8OYTy4X+org=;
 b=NuccolTneCghrWk6uKHqyDNUos90MeBDLMRGNT2uIC/ZWMXJvHEe4b0Sn+t3eV7jCl
 ByIS3utpGwMJqlfpS1RMi6NklkJH55NuSSuUDcTBtHBTFfZKvpSNroVqVje+uNToOf3d
 VUTe1oCE8XSf2LdCL7/na7uemwLFg4448v6lDc4rM5rfRTeRcQoQXYPDorTTrfjUHLRh
 cDzSRlGjF53bPKFE0jNC/ACeXn3sPTlguFylinLMHvctlbCI/07Q68X82Vr/LRsfF3SI
 1dWXHkgoIOPaAJJoh/t+oee3V5sdHrRpddv2+/7Yp8RsgMC99S2/ZwobuTKRzXP6o27w
 G+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9wT8spic4/COFYq9REm81WEt576wS2+k8OYTy4X+org=;
 b=M0ar8noXH8lYncJbIVSm2vfBEC2ykNL8kRNdKMiUGoUKfNDl16t1uxQEapQjkXFOau
 16McNQRW4Tk7eOJ0IuRmam7U7QubdJsnQ9UebRVVAgQRp88/OgMg+P6acK6/HXJxH0sl
 77kdpkt5YimdLNbBXDoO//Xxe3iazQRa8leQAoQHhrs/Ts0wUFiFcFCztjaajAikqIV5
 ULnh6cjwuitCNmk55TunZkt1tRz0GE2RoqbQ1H5LhVTRiq6FBVRiiioB9ymLOz3AwZ29
 ilcfVIoVuI7Xr/5ZCuA+CZkDOMy+RjoVYKEAjG11LfM8p7edKBQ8wApnVazOw8tBczFP
 Dcpw==
X-Gm-Message-State: AOAM530ZDe7avrZflfTeKFdde/Ju3OyDqggT+Ve1wY5b+vptoCr4/KIB
 uwrIU8mB0v18/nckmyBpEoM=
X-Google-Smtp-Source: ABdhPJwqqkqj4eAYGZv+3X8zgWo+ZJBAkF/dThduSkT7Zd5gBUcjBvckG7DxxCSCAkMmUT03PPqA0A==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr9393746wrh.122.1618333189757; 
 Tue, 13 Apr 2021 09:59:49 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g84sm2979078wmf.30.2021.04.13.09.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 09:59:49 -0700 (PDT)
Subject: Re: [PATCH 01/13] target/arm: Move constant expanders to translate.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <021cb1e1-60bb-3a36-e042-612ec447a066@amsat.org>
Date: Tue, 13 Apr 2021 18:59:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 6:07 PM, Peter Maydell wrote:
> Some of the constant expanders defined in translate.c are generically
> useful and will be used by the separate C files for VFP and Neon once
> they are created; move the expander definitions to translate.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.h | 24 ++++++++++++++++++++++++
>  target/arm/translate.c | 24 ------------------------
>  2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index 423b0e08df0..4c0b6e8fc42 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -116,6 +116,30 @@ extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
>  extern TCGv_i64 cpu_exclusive_addr;
>  extern TCGv_i64 cpu_exclusive_val;
>  
> +/*
> + * Constant expanders for the decoders.
> + */
> +
> +static inline int negate(DisasContext *s, int x)
> +{
> +    return -x;
> +}
> +
> +static inline int plus_2(DisasContext *s, int x)
> +{
> +    return x + 2;
> +}
> +
> +static inline int times_2(DisasContext *s, int x)
> +{
> +    return x * 2;
> +}
> +
> +static inline int times_4(DisasContext *s, int x)
> +{
> +    return x * 4;
> +}

Being static inlined, I wonder if these shouldn't belong
to "exec/translator.h" or another generic helper header
(because I ended using similar helpers in MIPS).

Can be done later tho, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

