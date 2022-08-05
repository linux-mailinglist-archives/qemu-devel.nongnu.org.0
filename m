Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F80B58AEE2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:29:50 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK18v-000583-CZ
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oK170-0002wH-L1; Fri, 05 Aug 2022 13:27:50 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:34726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oK16y-0003so-Tr; Fri, 05 Aug 2022 13:27:50 -0400
Received: by mail-vs1-xe35.google.com with SMTP id j2so3127307vsp.1;
 Fri, 05 Aug 2022 10:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=IlzaQSCrQ7ouzyeoPAuYqGil6oEY5ejLsMN+vfpchuE=;
 b=QRFtFDX7UmJxl947J0Z8b62inssjoRh+6p8Bus2A0xupgMMLZKriADI5KuOuJv70/8
 10vyXFFmwOIvU11pd5yOmPokbD4nv49pI38pfeXJ5X4n0tRt38KyPHYUGxJGqLsanSB1
 GUylXewCUpSPSuqiIxXXQTCHDyVM7OphHRdds5MCnrD/CB87idN9bRCqpHzCWxp689mO
 +coIBZpOiplNxctE+HyEE0rbP61o1AO+TkxFcSqYdvexNy1MZOPfSdg0mJZuzkmQ5Hxt
 18/eGPnWWXY743Y2WaSpeOAg37S0Zk6UREEoWLuHsNVf2sFBawrTEJ8FexkKIzmn6/j0
 qmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=IlzaQSCrQ7ouzyeoPAuYqGil6oEY5ejLsMN+vfpchuE=;
 b=IYCJT0fO/6gB7lljpY8dPKfkTAaOkJ7dc7nQIWbchCYDvHggIqxUFwR8erKKWChynW
 yj1wf1ddJaw5HR7A2NTdDgRtCMNExhheKL3MfMVr4SyBN4baJXeWyKIYT5LNTEQ6aT8V
 HF60X3RPgtLestKEK7kPLxzGH+tzIep28gx951RvkINShi9a4qpLYXgeLpgtBcWHQLBH
 OyhNQktzt9qNDEmdatoeqYMyTmAOFyThhHvhQatdxpvjjaeJWw+307/HwHiP/7T8sA4G
 /HXQBHjjnE3wy0Jc3bvIB5+SLviEeYPsdUOfEiEgSrFS3peL7IsmeXERymS0WUdKdLbA
 HapQ==
X-Gm-Message-State: ACgBeo0FpxgQrtO1pLC4Gsho18Mpt45cQ1vwAsIczJmwK/Kg7Go5IAqt
 Vo6YkKmv+3fZVjcpRlkDQ7s=
X-Google-Smtp-Source: AA6agR4/e7qaUbXlcc4Yy9ej4E2OosAGfJFxHpBWJMZCnL10LfhKb1bBPP40mZvb42/UFRISc1f7Dg==
X-Received: by 2002:a05:6102:2363:b0:388:70ac:cc01 with SMTP id
 o3-20020a056102236300b0038870accc01mr3527436vsa.79.1659720467624; 
 Fri, 05 Aug 2022 10:27:47 -0700 (PDT)
Received: from [192.168.10.102] ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 w185-20020a1fdfc2000000b003774da8fd03sm3532207vkg.27.2022.08.05.10.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:27:47 -0700 (PDT)
Message-ID: <cab08bf1-a1b9-0a73-e72a-390b795df74c@gmail.com>
Date: Fri, 5 Aug 2022 14:27:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/2] Floating-point OE/UE exception bug
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

On 8/5/22 11:15, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Changes in v2:
>      - Completely reworked the solution:
>          * Created re_bias in FloatFmt, it is 3/4 of the total exponent
>            range of a FP type
>          * Added rebias bools that dictates if the result should have
>            its exponent add/subtract the re_bias value if an
>            overflow/underflow occurs.
>          * ppc_store_fpscr sets/unsets rebias if OE/UE is set/unset
> 
> The PowerISA defines that if an overflow exception happen with FPSCR.OE
> set, the exponent of the intermediate result is subtracted 1536 in
> double precision operations and is added 1536 in an underflow exception,
> currently this behavior is not QEMU's behavior, this patch series fixes
> that.
> 
> Currently there's no test in this patch series as there's no way to
> disable MSR.FE0 and MSR.FE1 in linux user, so any overflow/underflow
> exception with OE/UE set causes a trapping exception.
> 
> Lucas Mateus Castro (alqotel) (2):
>    fpu: Add rebias bool, value and operation
>    target/ppc: Bugfix FP when OE/UE are set
> 
>   fpu/softfloat-parts.c.inc     | 21 +++++++++++++++++++--
>   fpu/softfloat.c               |  2 ++
>   include/fpu/softfloat-types.h |  4 ++++
>   target/ppc/cpu.c              |  2 ++
>   target/ppc/fpu_helper.c       |  2 --
>   5 files changed, 27 insertions(+), 4 deletions(-)
> 

