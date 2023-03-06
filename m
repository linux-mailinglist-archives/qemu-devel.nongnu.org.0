Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D269C6AC208
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:00:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBMm-00062u-5r; Mon, 06 Mar 2023 08:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBMe-00061E-6D
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:58:56 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBMb-0005rx-DN
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:58:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p16so5685022wmq.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DI/zPSw4eGAzbKJLM/vMwuzwC9Q1kazbtQU4gdQXV5U=;
 b=k8QOzAgJyn6fMGxyWKOSjbiANdSu4qnoj6pdvEnwY19U48DlPqpz33abL4dy0nuQLr
 l+/Y0ugaWKrE+Algxxz+6UXdtzLsu3i9Qeal+LvY273XEaIKhT0GkW8FH1NwcznZKesz
 /AbrtLSh9l1+o+XNHMDvAwoabLCB7QKPpW7vlSnU45pO/QjsXzc49X+bAYOLdLIzTYk7
 WvMg/UeivAJhysQzbnO3/Ddx+f6wTRNxZqL+ByIJgUJV+cjFLT3lFcBKALPmyuoEs7cb
 JEqG3PLVimB3gYz3PyeZsEGrI0v673jfgJaRqF1Cteowm0+0z6FRr/wWjm20eV8RoY3k
 nlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DI/zPSw4eGAzbKJLM/vMwuzwC9Q1kazbtQU4gdQXV5U=;
 b=nYqooDV35KHyPDaKCy4K3cioDEqs4wS8OC82azuF5IqXmIY1VEqwkNY8jMk7UssB4f
 ippLmLr6MKdsTyXk6uIhzRN3rncQVB4D/3zLGfKc97ouZCfCl0cRgza2GZZom2db1k5q
 gyAb7wAkRZJP+Tmboquk8pH3ssN2eWMuujfmlK7eujtFtqpKNo8ucYGQkMnEGmaNLfae
 yvfMWR6RThVFY0Our3tfxym19qOS8jCpGOc7bH9l2fNTPTMG1/YCQXR6fJPye7Q+Fytx
 vHi5EfGekAeUEgRnvZ8fDpOo8WPGsXbpWq9FjVk77IHfSWhA6XbzI4nWtk6uYkKT1kzn
 21vg==
X-Gm-Message-State: AO0yUKWEkSqIh+3G/k/wjqjmp2FEsyIdIzK8UzbBOUOr9Rrr1OGz1/NX
 TcuFk/Sbnn12iVB4xpxaC+RbnA==
X-Google-Smtp-Source: AK7set8QyC4kzb8WnYIzTaf93izTWoz2oVqH7a/sWM3L9UTqWZqJHYuuY567++8TMouuw8LFEDoCPw==
X-Received: by 2002:a05:600c:a05:b0:3dc:42d2:aee4 with SMTP id
 z5-20020a05600c0a0500b003dc42d2aee4mr8493877wmp.25.1678111130560; 
 Mon, 06 Mar 2023 05:58:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d42-20020a05600c4c2a00b003e6efc0f91csm9996133wmp.42.2023.03.06.05.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:58:50 -0800 (PST)
Message-ID: <b00e91f9-a5b6-b389-85e9-7d1c886a2906@linaro.org>
Date: Mon, 6 Mar 2023 14:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 04/70] target/arm: Consistently use ARMFPRounding during
 translation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/2/23 06:41, Richard Henderson wrote:
> In preparation for extracting new helpers, ensure that
> the rounding mode is represented as ARMFPRounding and
> not FloatRoundMode.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c | 16 ++++++++--------
>   target/arm/translate-sve.c | 18 +++++++++---------
>   target/arm/translate-vfp.c |  6 +++---
>   3 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


