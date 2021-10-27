Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3DC43CC76
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:40:00 +0200 (CEST)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfk5v-0002Kk-FI
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfjKg-0003bb-Pb
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:51:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfjKf-0007Ma-4W
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:51:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s14so1404098wrb.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H7GsfMkg8IRGxj7TXrBzGH0Ev7Lu/SDUwf4jeLKRJJ8=;
 b=cTTRl7yS5Ym1h7DL45Be/w+u6npi1yjciNa9a/yHdCqzx+5m/CjR83rm8ivLGLiJaJ
 FfDIo4oLlXdxmpn8vM/WmEMOemJ+x3PTQBXf3Y7Zy3PTPwSP7mX3e90nIPXXXs+4hx1V
 skcu9t329yEvTwdpzYt95P79/5ROAm90X6eMCjEFWHkWJedoJ1cTo2x0JfZWJr8WwU2P
 fuCkf7N9DwJ1heeh1krO6Kyt2iRaqL21NRcnAxKClKDml4evmRySN9wRjul0XY34dypq
 EkdLBang6mhNjqarqi2hSExwoOzbGjcAt9HaRlK/ULgquyHUiQrY05BBGOE6b+MmkekD
 01kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H7GsfMkg8IRGxj7TXrBzGH0Ev7Lu/SDUwf4jeLKRJJ8=;
 b=59odg5yBI9n1m2Jzxo4I3yKvC0UILxipM2m8Dq9UBaUpsTqKkXtfAXURroE9M0jawi
 ZCprjY2eVaZT/Nl+a7hj9ryG1aL5ExNvd5cafMpZgNoIi1tu9ZPZfybu9zMd5tNuxbGF
 ulLadeD60FScnISRynf49EksyuMGZjjT8x16V2F82iXHANDlM8p8IEm0kVEVqtgwt9Ud
 cd1kyebEZq5KEcRb75oioJMnfb6fiVmsQLvYiZWmkfyNU/H9MUkilDG8+Cs4E9AFxjYt
 +3rTuqh63V+NSvcr2FzyWdYiMyGx4g67RC/kHCe3blgS+bpXnIihAYr3Y/eAimk7qSnh
 OCTg==
X-Gm-Message-State: AOAM532QPQPFLu/S9oRjWAqyN2HVcbC1SV3Rc1S0vG3aEk96P0wnvASV
 lwSZfSmxp7sEUMTjMfKKR14=
X-Google-Smtp-Source: ABdhPJxfF0/xqXn7kTH1nMqaPQIhdB9XDBnuzBrYur0LLBpfVHHY5/KpaSkEYKlJv7Dov7OYh8jNXQ==
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr39578040wrq.411.1635342666447; 
 Wed, 27 Oct 2021 06:51:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k8sm3717027wms.41.2021.10.27.06.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:51:05 -0700 (PDT)
Message-ID: <ce92f93b-c38f-8f27-47c4-30504e4e31a3@amsat.org>
Date: Wed, 27 Oct 2021 15:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 45/51] tcg/optimize: Use fold_xi_to_x for div
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-46-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026230943.1225890-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 01:09, Richard Henderson wrote:
> Recognize the identity function for division.
> 
> Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

