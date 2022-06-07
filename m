Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572D5401B5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:47:10 +0200 (CEST)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyaU9-0007dy-4E
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaSb-0006Yt-IQ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:45:33 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaSZ-0006dv-7n
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:45:32 -0400
Received: by mail-pj1-x102e.google.com with SMTP id a10so15820965pju.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NYP6EcGuYyM5Kx6C24nF/gjKPhCAJ+oZI03GFIBNpwA=;
 b=WKqRxD9SYbRwm/ksYVMtdGY05WMMzCQzXfnOoGufUDd8zWVuE7QX0NHsY3Cz660sD5
 iYOGYf0AxAxrixykk9GMjvRyJusTewihHnbcAz1dTT1qfvQ4/KGBteiap6O/pxHfjaf/
 4Ln+jHKj0iqf7+RFCoGwH5EmZXuP4j2s3HTgbh2gJr5LWQVFw/wZUl0AKOK+VhUYc8r5
 gW5iyoE1jOJMluLH7suhGpaWd43sguz5BXOw7fnSOGR1EWBoGfcjJdzEB3lCK2XSRLPC
 kPJYjfmfmpsNsFl+dmWPgrXVPiM2kmXoipFqyeMv5SEirLaFsBgKPSN55XkqYMu+dbzy
 fYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NYP6EcGuYyM5Kx6C24nF/gjKPhCAJ+oZI03GFIBNpwA=;
 b=37r0LJHL7Nfsj+i5lbIzepKCeuwnnx+TXxrevXVgjnuPyo38FeA3uilUv8+GaGOWuK
 jZNUfZcR1X/OqpYlK7e5cwV297wc5p2Wmb4hOoxzXOuA4ZdjicUZsE/iIRuwyRJcz7EY
 rxhL3VUs3FoY+g13HasfbTnPml5rU2m1CvdIPVp2SllEsxYNFklDAzChBaxivTUT7oLu
 8850dwkO2T1j9sOKWLfCzWrGSI/20uTxOhmrwciI/qF64ahJz1m0/8hjJTyu0vr9D8/Q
 TqeAfeCy1VRZa1mXMy0bcCV0rljrkP1k4AOxqlmweJfR+zl7vFTras6P84APuF50ht+0
 jk9Q==
X-Gm-Message-State: AOAM533BOZnBjGQyLLbp50t2/NhFVbjG7j3VgzvQRrqRwcXEepqsHdx7
 guInJX2UkBIkwCm7OKQ/hpkMoA==
X-Google-Smtp-Source: ABdhPJwn2hWIY196BkRBPnDxIS3QdH5AVqP2u3qACoY5CK74tbH2s68sj7SEsJHVJmNf8f2rYwI8PQ==
X-Received: by 2002:a17:902:ed53:b0:166:3e43:7522 with SMTP id
 y19-20020a170902ed5300b001663e437522mr28701095plb.170.1654613129210; 
 Tue, 07 Jun 2022 07:45:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm14666078pjb.37.2022.06.07.07.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 07:45:28 -0700 (PDT)
Message-ID: <dd67c361-9721-17c9-0d6f-0118a7a9ab0e@linaro.org>
Date: Tue, 7 Jun 2022 07:45:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 37/71] target/arm: Add cpu properties for SME
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-38-richard.henderson@linaro.org>
 <CAFEAcA-JFvMM3yY=q=nBbrs_Y47056NLgtQTqdYqTKmgLZfWYA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-JFvMM3yY=q=nBbrs_Y47056NLgtQTqdYqTKmgLZfWYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 6/7/22 02:47, Peter Maydell wrote:
>> +void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>> +{
>> +    uint32_t vq_map = cpu->sme_vq.map;
>> +    uint32_t vq_init = cpu->sme_vq.init;
>> +    uint32_t vq_supported = cpu->sme_vq.supported;
>> +    uint32_t vq;
>> +
>> +    if (vq_map == 0) {
>> +        if (!cpu_isar_feature(aa64_sme, cpu)) {
>> +            cpu->isar.id_aa64smfr0 = 0;
>> +            return;
>> +        }
>> +
>> +        /* TODO: KVM will require limitations via SMCR_EL2. */
>> +        vq_map = vq_supported & ~vq_init;
> 
> Do we currently forbid setting these properties entirely for KVM
> (or just not provide them) ?

I do not provide them.

> These new properties should be documented in
> docs/system/arm/cpu-features.rst, similar to the SVE ones.

Oops, yes.


r~

