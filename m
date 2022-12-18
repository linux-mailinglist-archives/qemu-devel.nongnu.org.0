Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B2B6504D5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71Mh-0004Hb-Fk; Sun, 18 Dec 2022 16:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71Mf-0004HT-Ac
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:38:33 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71Md-0006ek-Lo
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:38:32 -0500
Received: by mail-ej1-x62f.google.com with SMTP id m18so17521848eji.5
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pN2l4VeG4ULKFhtOeMuRZ+5opRdi430lZdndqTBzGbA=;
 b=MZgcMm0TSwZ7m/9K4jm6eF+tZpHhcUr8kWXofs0S16H0X+CsJumsZJrYQvKlRVC5qc
 LtWkqUxaTiyk5/cbkqmogxKVcqUMuxtPZqHy6/XweKJ7KfypTtrbCWkTxYztOqoBHM97
 h5z3XOXaZ4oLuhKlppNQkNQAdZ/oXY5S5KGClz03fi1gpfZTNnn17/5wV++d4FucKY7U
 +KK0gO/VypfKQ0ka6aQiZLmZPa9DKPTU/4I6XyGmZxFfpoF11fWLKnj8+JalZKVdKKb2
 U/Mc2prJEIHyWX/BhuogbogAazOycwaRPCWQ22KAOOsZH2Hmbd/qKNI+/LjGNCZaZIR1
 2YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pN2l4VeG4ULKFhtOeMuRZ+5opRdi430lZdndqTBzGbA=;
 b=0ABkSBGv5DOrQ/NtY85n9UeQgENLNLDY0sWvWF2k6JiGfKKNIyuOo5NHkiippGm4cb
 A159ntyig2Q0/U3aXJBmG0Tv4J+ry+YF0dS0+8izY8aY67wO87j842VzdRSebLdo/Vym
 /rvsqpbvkfOIzil2cjl/ubH5hwodujFAJ9yoKGYUpfuapHJjc49nkh5F2rGI8ItOlmQN
 w3XiXokxI9UEYxYOEWztBKPAfy8BXxdZbv7HavFECIx8M443IrHfH2VdXYacrBHcfitR
 NsmdShelts8YZLRRrAF1czg8LIViezle3+xTqDj0yIVWZcx8iY8MLQUiWgSXagiUSYsM
 /SOA==
X-Gm-Message-State: ANoB5plMrdCbap2z0FRrMDKASidtUZHy+UIwpKT8kt50iX4+/2H292Yd
 QoRtE0LxAR52THUdW06snPYhCa+NshN+hNnjTAg=
X-Google-Smtp-Source: AA0mqf68eBTx4KoCRHaqjcROcXihDGTWfYUVW3B6uAGLqlHbnh0025n9BHqSEfnqxK6RVM4m0Ur8kw==
X-Received: by 2002:a17:906:e54:b0:7c1:23f7:623a with SMTP id
 q20-20020a1709060e5400b007c123f7623amr31396490eji.66.1671399510268; 
 Sun, 18 Dec 2022 13:38:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a17090690c200b007c0b9500129sm3570696ejw.68.2022.12.18.13.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:38:29 -0800 (PST)
Message-ID: <d1533a80-15e5-4e1c-cfa5-485a6ea593d0@linaro.org>
Date: Sun, 18 Dec 2022 22:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 09/27] tcg: Simplify calls to temp_sync vs mem_coherent
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213212541.1820840-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/12/22 22:25, Richard Henderson wrote:
> The first thing that temp_sync does is check mem_coherent,
> so there's no need for the caller to do so.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


