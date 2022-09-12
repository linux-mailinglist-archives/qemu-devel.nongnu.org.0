Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C115B5AEA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:11:55 +0200 (CEST)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjE9-00023n-Fe
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXj4t-0006Of-JE
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 09:02:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXj4r-0003Yu-Ke
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 09:02:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b5so15224534wrr.5
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=eQTHpn84A0LjlKpt7dE5eXR16Q85SXXf8AUBnb7eBEU=;
 b=WcoLGYRs268N0ylZ68v9Pv2kD58FC+hgPQooA6LIjFbi/tNh0WoRfhxYZlWWRMULum
 RMxWUPp7/LBF+aVnymeIBviQFjL2gjEXJSjfMEb9Hn4wOpca12/s3chvu3d+ADwRYFCh
 pSYRz4dFMIUeMc/pYnoh01MfzSY++Z5vghBDP2RcMuB0l43x7NFxQUqOUbiMkCqI57wS
 9XfA/EdtcqojPSO+HO0jKrjBniaSAZKPI8XXDEsoAO+Amq+eAmRMm7nCiPtFGYMFpyFy
 eu6qGS1mleXMbGHAX5I3DA32Cf0tzNLOIpVAdTvue6VDT028wjvOc2Z9V+uAqzYWZp+i
 8lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eQTHpn84A0LjlKpt7dE5eXR16Q85SXXf8AUBnb7eBEU=;
 b=AR+vMiOyZbgeAf18Ir+RcpI8LQPU5ww/kI/INztp9zXomRDpWp9gUDn/YoXFEvawZv
 MSUAm6dc4xZWKI4/ZsrJGRax8fJ1DgebkDvzlw7XaWwzjBXZCn6NRWMKt2ivg+Gq4ZoQ
 sWvJkhE4j/qiKfV/iGRI5FDAmrjfUVE+PxeV6AOSQPu94XM86dwti9Ca7odIAaxbmBj6
 GAxo9hpDfqMX5cm6GZqWbBAL3IGT6i9nu7s5QxyWq4JDjjAbiEOM1Rq/Zp75LRcgIps3
 +dtUvbUAPX8/CYVij4k2lmRQ+wzHL7UcR7IBoe4cLPjyK//NaZGRsMQcQwC2upqdzEMK
 TFwg==
X-Gm-Message-State: ACgBeo2qkRD9pjbkOMMKDjErsgH8K104gHYaNfD7AZUtaqgf/ufiDwTM
 OpcbZdS5S+ZQtunqHk5aDXSM8g==
X-Google-Smtp-Source: AA6agR4IA6a58nTrh+KunqoJL1Nub/ULf9l/5LHpmfwp/5jR9058nRZKkqw2wvCGmnlNSJ9wJ/pr5A==
X-Received: by 2002:adf:f604:0:b0:228:6004:bb70 with SMTP id
 t4-20020adff604000000b002286004bb70mr14819530wrp.646.1662987735951; 
 Mon, 12 Sep 2022 06:02:15 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.69])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a5d684e000000b002287d99b455sm7301420wrw.15.2022.09.12.06.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 06:02:15 -0700 (PDT)
Message-ID: <c057bdc5-7f68-35c1-16fd-edd4aa37d023@linaro.org>
Date: Mon, 12 Sep 2022 14:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 20/37] target/i386: reimplement 0x0f 0x60-0x6f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-21-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-21-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> +static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> +{
> +    if (s->prefix & PREFIX_REPNZ) {
> +        entry->gen = NULL;

Are these lines really required with the p_00_66_f3 spec on the group entry?

> +    } else if (s->prefix & PREFIX_REPZ) {
> +        /* movdqu */
> +        entry->gen = gen_MOVDQ;
> +        entry->vex_class = 4;
> +        entry->vex_special = X86_VEX_SSEUnaligned;
> +    } else {
> +        /* MMX movq, movdqa */
> +        entry->gen = gen_MOVDQ;
> +        entry->vex_class = 1;
> +        entry->special = X86_SPECIAL_MMX;
> +    }

Also, you're overriding vex_class for both valid entries, so why does the group speicfy 
vex5?  Clearer to use X86_OP_ENTRY3 within this function and copy from static const data 
instead of overriding individual fields?


r~

