Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8D36D9F7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:57:15 +0200 (CEST)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblco-0000Ic-SV
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblb1-0007SA-Jp
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:55:25 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lblat-00012m-C9
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:55:21 -0400
Received: by mail-pg1-x534.google.com with SMTP id t22so9651840pgu.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dMkvDjMYr05gqkWj7xCDSFD2+V68r814jBCNIHlXJ1k=;
 b=K/rPThOtTaoiWgPuUiLl2OkBm4RTQ1tNqziMwsx5f4EgZdhBbIiZPEHdtcBFmLZK0N
 dxTK/iH9jC81oU7tja5yPCQXU9qiHUm8uqMyi4k+iW5/BkbXk5qHdK507QbHq2rjEMKh
 Zk/XiAoO2AM6/3f60GDN3lcBaxUh1y5oKmSCVw5d/Xpyf15p41GYFY/A2i4SJCaBrHEr
 z6OPJTkZsRPYNs5ifHK70qCJ3/w4L5y3Y+1GrwWBbbz3q5IfZlN+98svkF/uIAowJw6w
 ycmfBmWo9UYD/jgUCxoVQPTpsvKG2VGvUDtmxTWM+SkY5/lboWwsjUq3t8tL8D/IjnuW
 tkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dMkvDjMYr05gqkWj7xCDSFD2+V68r814jBCNIHlXJ1k=;
 b=Sb993xTKvKtLed6H0m8PN3PGpV26TdGbbkEndyS1zMdpz9dtnB5lo7wU7WSMPWvNpD
 Ouj8uJdecv74gwJYmfkLiM1wszaZLn4EWRRXwYnJYCEZQpudd8ZJHEyWbFV7ny5WzMZ/
 SvHkGh6V5K0A8BeAyrSTH2WXBhwEOd3mY9db8Oy+ks6r0nElKuhXEzs0hL8jBeV4YH6e
 4WLfcFkkIzmuv+AUN3uv11EtizL0s6IlGHrkLTKoOfplmlAKKbnGctC0UMGSyWnhj7Yx
 q9t50zNjBL4JTH8RgBz0301CVXK3X+dNw6c3HEGIGA1YflTLin+oNc7sbAsLyXu8uHaC
 +bAg==
X-Gm-Message-State: AOAM530F7+chUg35PCJzPvTdo5tOP+kIAmhXAy7HajA1w+lhbOrnDLvo
 a0U5bRoduxq1j5qkbgAjaWB7OA==
X-Google-Smtp-Source: ABdhPJy5jdiQ9PidnLzVyKzWb/02VsvaGq/BWGEugGj2X9yJvjwS7GFTTGuEKq3dy+EfRlpHSq/KBw==
X-Received: by 2002:a63:4a44:: with SMTP id j4mr27082160pgl.283.1619621713647; 
 Wed, 28 Apr 2021 07:55:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id a129sm67334pfa.36.2021.04.28.07.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:55:13 -0700 (PDT)
Subject: Re: [PATCH v2 02/15] target/ppc: Add cia field to DisasContext
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-3-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b41040a-57b6-7350-d879-3e5c25314b58@linaro.org>
Date: Wed, 28 Apr 2021 07:55:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427171649.364699-3-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 10:16 AM, Luis Pires wrote:
> From: Richard Henderson<richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/ppc/translate.c | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)

When a patch passes through your hands, it should contain your S-o-b.


r~

