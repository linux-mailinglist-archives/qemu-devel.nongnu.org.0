Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426764FB77
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:02:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6bUQ-0004NH-7Y; Sat, 17 Dec 2022 13:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6bUH-0004Mo-4b
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:00:44 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6bUE-00083w-Ep
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:00:40 -0500
Received: by mail-ej1-x636.google.com with SMTP id jo4so4110383ejb.7
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ndLWuqAvCr/hGakOhPr7FEj9ImjoVuc+iQuTEZusliI=;
 b=LVJXXUAE3fxvSktcLLgo/S768tk26LF3SxfofL4k4/QlHqkdy5cpoGkRXcBboVvbFD
 qSUFd+tAbtMO5TP3I0oQuyBJ+o2f6MPX3EiM2Hx0ZZiSUQ+xSwVikoqKBDHVYtfwlsd8
 xqi5hcPFf/UwLpz6EgDqhr2uMoRhTJ/rGceXhgGhugowKFK1Yk8pZMis+GmkTJSva7tY
 TEH1hfMO41k/7WDYFxbJ3ldhlCpAZUHpdwRds8A8RpOTM8VuS9p+8qecohuGpND1MrzM
 BRQ9oMymWPRqH9oDLU/pFnVJoZhYGBW+kIdkQRN8PF1gNObJwCo3IYRox11CaVmF4U9+
 gStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndLWuqAvCr/hGakOhPr7FEj9ImjoVuc+iQuTEZusliI=;
 b=Lj69dC4rqL3zj3DbSg77332DawyO0DJ5vNjv1hkTmNUor3dmVZxWDBXuPrRLRURTDZ
 K4JnRNlBds1kvqXtE2PkpQol75pojxNYGH6JQtkmdycSnw92zzQ46t/CW3V4pyEWj8MF
 znaHCRy9geFswx+U++udopBFNzRL93+haM3X7ksgGsMEfdkFfQLpWO3a0hOtfyY7s4aU
 wV6iztO58bU303SnKZ7g/mAPmnof0v0mrYAOFVDgVgQQ7spVIm1y50pqtAni1HHgQL3S
 gqPaXHYHW3/UWie6Pss0MqxztcgkUPy20zREG2f5gF8/YKQVVTHOUPZTK5JTZ9mGTtVR
 H4nQ==
X-Gm-Message-State: ANoB5pnmsHfNKFWV1OtJfV68EbGgrAC0aapGMFixdU56YaCNSnnGInlJ
 TeXb/NMyk3+FjCYlI+vF7sHvdgjrRYQI4QJg+DY=
X-Google-Smtp-Source: AA0mqf6YGT+U7xv4NsbHurOjK5ywmBrofBYwOxV17htJVQqhRlnzd22Do41Sk0Z1m+IMP+8TNvwbKw==
X-Received: by 2002:a17:907:1719:b0:7c0:f9ef:23a2 with SMTP id
 le25-20020a170907171900b007c0f9ef23a2mr51798333ejc.30.1671300032662; 
 Sat, 17 Dec 2022 10:00:32 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170906329500b0078d3f96d293sm2219532ejw.30.2022.12.17.10.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 10:00:31 -0800 (PST)
Message-ID: <0ba898f6-fcf5-e539-a6c6-ff665602fd9f@linaro.org>
Date: Sat, 17 Dec 2022 19:00:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/9] target/riscv/cpu: Restrict some sysemu-specific
 fields from CPUArchState
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20221217172907.8364-1-philmd@linaro.org>
 <20221217172907.8364-8-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221217172907.8364-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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

On 17/12/22 18:29, Philippe Mathieu-Daudé wrote:
> The 'hwaddr' type is only available / meaningful on system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/cpu.h | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 05fafebff7..71ea1bb411 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -370,7 +370,7 @@ struct CPUArchState {
>       uint64_t menvcfg;
>       target_ulong senvcfg;
>       uint64_t henvcfg;
> -#endif
> +
>       target_ulong cur_pmmask;
>       target_ulong cur_pmbase;
>   
> @@ -388,6 +388,7 @@ struct CPUArchState {
>       uint64_t kvm_timer_compare;
>       uint64_t kvm_timer_state;
>       uint64_t kvm_timer_frequency;
> +#endif
>   };

Sorry this patch is not complete, as various of these fields are
in use in common emulation code (so build fails on linux-user) :/

