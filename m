Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DDD51EB97
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 06:31:05 +0200 (CEST)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnYZU-0000SH-GX
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 00:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnYWH-0006vw-7l
 for qemu-devel@nongnu.org; Sun, 08 May 2022 00:27:45 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnYWF-0000xc-Jp
 for qemu-devel@nongnu.org; Sun, 08 May 2022 00:27:44 -0400
Received: by mail-pl1-x635.google.com with SMTP id s14so11065244plk.8
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 21:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DoPrVKWCV4MysxmdCVED5Ye8mF+ueMF+Ee8GYRNcZfo=;
 b=rZdtUjaa27xHpNYoh9r4w8FvcvDpzd4gmnCKgGoBNWNxk+PhZNnjJLIVEDsssdfKeG
 yyOunW9qHzDc4A1SIFrvC22AqMGLsiQ6CFdLPGz9Qc8XQodHICBwwJfCiA37ZESpXPn6
 l5vjtSTtRGnaMl5aaJ1QDOhchNtTtyoRW952WrQuj2C+0EK0cph15JyjBXWhdcBJpTbY
 Vk+QyutDcPHJmqsbG86tI3cbu8IwBob4dLSO4x7xMH/60GbcoprfwnjKeZl6apg6rvlN
 Xvw/PMz/ck6TSv8rA/Kk/WY6u57vdS3V/BoA0SMSrXbiMVEWruNfL0d0xmTNmKlMhFoW
 3Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DoPrVKWCV4MysxmdCVED5Ye8mF+ueMF+Ee8GYRNcZfo=;
 b=8L5AKJEGSoDD3pVerekEmrJdjRyyW8HjvA3Qgt6kmFe0Yx5wd2mXBg214YAqaDD/Wr
 X5KfZgdiPWyreE8qt5uW73yimgAPOwbE5az68jiuLsohYka29R1UNbRJNczX8Qij9AzS
 7Hmf25jMC3z9IqSgvrOafVNufqNNvN/CI1JPA/Yggf2gOP/9wEgTnRBvMNCW4LC4B5Ce
 FMz9uSR7PecfNwAYIBc0ZSc83Dw6h0MzlphpnH2ZiwMV7KZ4QgObBNMlwxWC99S9q3XY
 sRPa+4XDxRFteNKHAKv0tvS6F1bPLTZ8k/6pNCcDUp5To5Mfbnze4Ld+BRVKRlJX4A4G
 xNXA==
X-Gm-Message-State: AOAM533CbURjlqkYqz3ZdthJupJqbxt1s8DXTNDMjKN4VHoJFNq+1G1h
 D+FqRuVny318x1ODiX2pY3yF4g==
X-Google-Smtp-Source: ABdhPJzIAXix9BQ30INKd7IXOjstqWKWnkujfCm/zERCww4G24U90kZdtbF+A1owKEXFYKhsbAnLLw==
X-Received: by 2002:a17:90a:cf89:b0:1d7:7055:f49c with SMTP id
 i9-20020a17090acf8900b001d77055f49cmr12288710pju.12.1651984062158; 
 Sat, 07 May 2022 21:27:42 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 i24-20020a635418000000b003c14af50622sm5798959pgb.58.2022.05.07.21.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 21:27:41 -0700 (PDT)
Message-ID: <461a810f-6ca0-98cc-4144-18062b165ad7@linaro.org>
Date: Sat, 7 May 2022 23:27:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 7/7] target/ppc: Implemented [pm]xvbf16ger2*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-8-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506121844.18969-8-lucas.araujo@eldorado.org.br>
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

On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xvbf16ger2:   VSX Vector bfloat16 GER (rank-2 update)
> xvbf16ger2nn: VSX Vector bfloat16 GER (rank-2 update) Negative multiply,
> Negative accumulate
> xvbf16ger2np: VSX Vector bfloat16 GER (rank-2 update) Negative multiply,
> Positive accumulate
> xvbf16ger2pn: VSX Vector bfloat16 GER (rank-2 update) Positive multiply,
> Negative accumulate
> xvbf16ger2pp: VSX Vector bfloat16 GER (rank-2 update) Positive multiply,
> Positive accumulate
> pmxvbf16ger2:   Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
> pmxvbf16ger2nn: Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
> Negative multiply, Negative accumulate
> pmxvbf16ger2np: Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
> Negative multiply, Positive accumulate
> pmxvbf16ger2pn: Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
> Positive multiply, Negative accumulate
> pmxvbf16ger2pp: Prefixed Masked VSX Vector bfloat16 GER (rank-2 update)
> Positive multiply, Positive accumulate
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
> There's a discrepancy between this implementation and mambo/the
> hardware where implementing it with float64_mul then float64r32_muladd
> sometimes results in an incorrect result after an underflow, but
> implementing with float32_mul then float32_muladd results in incorrect
> signal in some 0 or infinite results. I've not been able to solve this

I did suggest that the float64_mul needs to be done in round-to-odd.

Anyway, for this patch,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

