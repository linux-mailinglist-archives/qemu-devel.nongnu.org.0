Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE92371A22
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:38:08 +0200 (CEST)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbaA-0003XG-PP
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldbXJ-0002cl-MA
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:35:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldbXI-0003AM-6s
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:35:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3873730wmh.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0g0wAwd+/mJrc/VhkZbP1ov02NMzgJ18GAZtY/UN7B0=;
 b=GXsr68OMJQC690IkoHDXHhvaDvediGPWsdIQMYP4Cvfl+aTMC5Vh2+jtYG2aKzSgFZ
 lydRsTqwbJKb+MbLod+JwYaDYFAoBdOMWsesnHpiGqH7Iq4ZwEhKonhkokWTIYqZHTqA
 sY4eGolCAg7MgvD/sXXHRGAzHnuSb1Kb3/FJUuWYQlmjBqRtJaOfkIHgVDB3CXyls4dL
 MGEIafPxyzDFCS/wUST9rWJVaIPovxKOoWsVYm1LTE1LzvgpOqRhz2CWiHNScYTgWSE+
 FD5DGba2WbCbLqcZDBa/csbNYlUe9Ti1HDWBfR0e0FFK/BgfwD6sxLFn+vMRIhWQ9jOA
 gy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0g0wAwd+/mJrc/VhkZbP1ov02NMzgJ18GAZtY/UN7B0=;
 b=IGT5zT1hA/nJcreMbMSfSsqHZ+xqyFh3CwDLMsUWHdOzsIUlZKvPP3FmcBxCqZE8ix
 6Jf9mGVxZ6C5AqJ7DO+eEPMng7NImqGmPlbZ7Gdl1K6HsNtjPE/8BGOwNxhNYq9jeS8F
 7C1yrVLwz6ptKjC+QiLGf/5I7RvSiqTyrMx7ZTS9GNrdUU3mRFzLbCgqQVoDFTbCbdwO
 WBNgeOgE5fxurWNQxMLjV5X4MkbJSmNuUYaoVOMeF/G2ehQrLlORqKxPH5H8wkIHI1Lp
 6LYVS9Fc0765Uk7q8XiIcXYt5eB3x69kEUQQurqIcQfhGDHXaUDfmfd+ydTDwkdZQ7VX
 MqWg==
X-Gm-Message-State: AOAM531xk7KxIWzPTXFNCEGvKyBblqWqHcHQeAHxaqzC5v0nFoqRzpeg
 Hy5dYZpr+aLBtuaq3br7EP4=
X-Google-Smtp-Source: ABdhPJxWAMeOTR0jtiSsCXMA8EkCHtRRXPptyws51cahbwkVT500ITpS2NZnSk5Kdjyv3Tt50ibAlQ==
X-Received: by 2002:a05:600c:22c9:: with SMTP id
 9mr22751335wmg.85.1620059706698; 
 Mon, 03 May 2021 09:35:06 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id o9sm11071080wmh.19.2021.05.03.09.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:35:05 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] hw/sparc/sun4m: Move each sun4m_hwdef definition
 in its class_init
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502185441.599980-1-f4bug@amsat.org>
 <20210502185441.599980-7-f4bug@amsat.org>
 <d29589e2-ae7b-0569-d422-e59642f2fdac@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <802d7eaf-1544-a729-af8e-2dbf9291f2d9@amsat.org>
Date: Mon, 3 May 2021 18:35:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d29589e2-ae7b-0569-d422-e59642f2fdac@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 6:27 PM, Richard Henderson wrote:
> On 5/2/21 11:54 AM, Philippe Mathieu-Daudé wrote:
>> +static void ss5_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
>> +
>> +    mc->desc = "Sun4m platform, SPARCstation 5";
>> +    mc->is_default = true;
>> +    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
>> +    smc->hwdef = &(const struct sun4m_hwdef) {
>>           .iommu_base   = 0x10000000,
>>           .iommu_pad_base = 0x10004000,
>>           .iommu_pad_len  = 0x0fffb000,
> 
> This is incorrect.  You're creating an anonymous object on the local
> stack frame and saving a pointer to it.
> 
> You need to use a static const function scope variable.

Doh... I guess I got very lucky while testing then...

Thanks, I'll update.

Phil.

