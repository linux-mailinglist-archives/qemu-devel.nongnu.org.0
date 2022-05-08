Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7B51EB96
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 06:28:21 +0200 (CEST)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnYWq-0006Dt-R4
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 00:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnYU1-0004Rn-9S
 for qemu-devel@nongnu.org; Sun, 08 May 2022 00:25:25 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnYTw-0000TJ-4H
 for qemu-devel@nongnu.org; Sun, 08 May 2022 00:25:24 -0400
Received: by mail-pl1-x635.google.com with SMTP id i1so11043138plg.7
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 21:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+lEl5LGIrWZk95Mnv12/JdWkcAjDATOOArcvnB21c/w=;
 b=Owi5WdDe7KTQGunmjvRci1Qbf5wm1fPzayFCgJkqmY95t3YdpBK9I5tCwJBc921ZKi
 BBCpQWVaZXAWg0pV1YLJwQBZT7v4Paozw2EfDA8R5cmlQVIpdFA03XweYnz5m/EGnAle
 Vm2M+onB8J3+/BV5zV3ZdWAO8Ew6LDm5H3q30bAZ14qHEaGjlJ/DW+98AOGGqGCqArdU
 cCi8BBb5A/xhGETBv+JTpvWTcGaRjoNgNjH4aHSF4tfSjueRpx/eLuxSfolupcjLrXq2
 2w2pJeD2/CZd5q7jk/szsReyJ35IZAJNBVWh7fhZn6JVgQfQpSME3WLurZk6/cJcCZS4
 Ue/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+lEl5LGIrWZk95Mnv12/JdWkcAjDATOOArcvnB21c/w=;
 b=tBZROavDAt1zITzZg/GHZKDJFx2M7k1rQTqGipCCmDntcO2/cJvk7Yg5JGeHb4EdC/
 Uj5df+Q5q8rvJFqv9jFNn5OmOcMRjfeiWtMJXB8G1ngTo1TsliL77Ac/GU/e5CTv+/sy
 y1oBp2WlKLsVfXTJ00eRbkxk6Go3Hh22uEXG3Vz4qx8/YOa0grrREGIMA9Kv1IMGTsdJ
 D2UTCYCpR4mTP6f6GXJRdkzlkBH7x8EISNtLc9wYBUucng1leECDCLcvH65xmdtFLOM7
 883msxvKbGv1wAiPHoswwBeYiIyNCMuBpGyWSbL5T44Ti1PFaOwzaivENg/e3OE8L4mO
 S1dg==
X-Gm-Message-State: AOAM532cPeoymaT9NITDVXyQtlR3sM0dGg9AuZ+QNNdPepgiF4zdGm+H
 nDnQ3RoKrBwKM6I6BhEwtJxL2Q==
X-Google-Smtp-Source: ABdhPJw1jLaIFkabOaRRhTIm/DTDMmi9vi/Oc1XegZlKJNwRGO48jC4cmAVfzHgIV2xPq8NdS4XyRA==
X-Received: by 2002:a17:902:e74d:b0:15e:94f7:611e with SMTP id
 p13-20020a170902e74d00b0015e94f7611emr10662634plf.37.1651983916479; 
 Sat, 07 May 2022 21:25:16 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 q13-20020a170902dacd00b0015e8d4eb214sm4441098plx.94.2022.05.07.21.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 21:25:15 -0700 (PDT)
Message-ID: <2856c808-89a2-cee7-af36-f1da3238b405@linaro.org>
Date: Sat, 7 May 2022 23:25:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 6/7] target/ppc: Implemented pmxvf*ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-7-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506121844.18969-7-lucas.araujo@eldorado.org.br>
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
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> pmxvf16ger2:   Prefixed Masked VSX Vector 16-bit Floating-Point GER
> (rank-2 update)
> pmxvf16ger2nn: Prefixed Masked VSX Vector 16-bit Floating-Point GER
> (rank-2 update) Negative multiply, Negative accumulate
> pmxvf16ger2np: Prefixed Masked VSX Vector 16-bit Floating-Point GER
> (rank-2 update) Negative multiply, Positive accumulate
> pmxvf16ger2pn: Prefixed Masked VSX Vector 16-bit Floating-Point GER
> (rank-2 update) Positive multiply, Negative accumulate
> pmxvf16ger2pp: Prefixed Masked VSX Vector 16-bit Floating-Point GER
> (rank-2 update) Positive multiply, Positive accumulate
> pmxvf32ger:    Prefixed Masked VSX Vector 32-bit Floating-Point GER
> (rank-1 update)
> pmxvf32gernn:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
> (rank-1 update) Negative multiply, Negative accumulate
> pmxvf32gernp:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
> (rank-1 update) Negative multiply, Positive accumulate
> pmxvf32gerpn:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
> (rank-1 update) Positive multiply, Negative accumulate
> pmxvf32gerpp:  Prefixed Masked VSX Vector 32-bit Floating-Point GER
> (rank-1 update) Positive multiply, Positive accumulate
> pmxvf64ger:    Prefixed Masked VSX Vector 64-bit Floating-Point GER
> (rank-1 update)
> pmxvf64gernn:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
> (rank-1 update) Negative multiply, Negative accumulate
> pmxvf64gernp:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
> (rank-1 update) Negative multiply, Positive accumulate
> pmxvf64gerpn:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
> (rank-1 update) Positive multiply, Negative accumulate
> pmxvf64gerpp:  Prefixed Masked VSX Vector 64-bit Floating-Point GER
> (rank-1 update) Positive multiply, Positive accumulate
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn64.decode            | 38 +++++++++++++++++++++++++++++
>   target/ppc/translate/vsx-impl.c.inc | 18 ++++++++++++++
>   2 files changed, 56 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

