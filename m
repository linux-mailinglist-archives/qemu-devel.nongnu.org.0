Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733FC579393
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 08:55:44 +0200 (CEST)
Received: from localhost ([::1]:35856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDh8x-0001gY-Jc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 02:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDh5q-0007HU-KA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 02:52:31 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:46865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDh5p-0001Oc-7Y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 02:52:30 -0400
Received: by mail-io1-xd30.google.com with SMTP id l24so11063315ion.13
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 23:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ccqozl87fjEFpzOndbPtDxkxFnqILwgTIArD9tECylU=;
 b=SpgrgTIeYMueljkxWzfnhzM1+xgNSUSWWqkbcV7Qd4zCXISmElC3raSQctNLZBWa9P
 K6vQBwKWXDd6F6Jp98JPqtGDINW44/Y1srUKa7GSFdT5fbVTGU2avvV0e/qBeu0AwNSq
 KfCZGgek+1FmVRALnj/dsjNachy5nCEOWzi4icy1LTlDJNoGxxqDFmkH7dXhrRSQboBn
 Yn0lMiDeR1kjlBcp0lGEIHDG9Y3mV3WKiFkaHYp4ILMVGnroiMg3gUOh3XYNdtEtUQ8U
 gq7ehZ32YF8oGrsg1mxLaeJyyq7Tidy6rxygnhOvg22tBLI9pkEqH8gK//KjwfvqNzOU
 5nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ccqozl87fjEFpzOndbPtDxkxFnqILwgTIArD9tECylU=;
 b=JDRju3Ml+Fuok1wA5wpkz1j1n2fTerXGZqZx7diWa9UmiUvp/FUtyS2v++UQnAA8q0
 nfOLR2F9GTxoTget/AFr3lgRP8X0ez1lY7EM9jM9G4n8Gi2Si2R77ao4hJdAsVJeZfm9
 X3wITsOAaB2DP49XqRM9SkT/CL254RHQOyXuwZOnL4LPuR08GqQ5sdT0a3iP3S54i/0h
 PLOLvTCxOaGn3EbMTHldoKZJKnXiilBlmFNkdHoWknFG72lE6HGp7/WCizq+3WP2kEFk
 BV/Ps/BmiCHeyBDIsQMbylq3wWqeBOhVJ0R5cI/saGdjLNSLUb1rymesTBQm7jufFC5v
 /tmA==
X-Gm-Message-State: AJIora+BTgBB43nvgeEAEuSTQ/v17FUIm2ZMo9UBFwXA1o9ntNM0oEPB
 Jf+pcIhtvzAOJZpEdfNSLolE0A==
X-Google-Smtp-Source: AGRyM1tUkx0LuXew+OX2fZtPSWptlDoWRTQPazJcXO93ekgIjsjWr9vlwDJ8pC2bBa2jMA/t5SdR+Q==
X-Received: by 2002:a02:9044:0:b0:33f:3845:3ea0 with SMTP id
 y4-20020a029044000000b0033f38453ea0mr16326723jaf.176.1658213547859; 
 Mon, 18 Jul 2022 23:52:27 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05660208d000b0067be568081fsm5643078ioz.43.2022.07.18.23.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 23:52:27 -0700 (PDT)
Message-ID: <04aa029a-0415-e902-cd3d-399b358e0aa5@linaro.org>
Date: Tue, 19 Jul 2022 12:22:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/5] target/loongarch/cpu: Fix cpu_class_by_name
 function
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
 <20220715060740.1500628-2-yangxiaojuan@loongson.cn>
 <a36bbd80-f830-51bd-5aac-b430572259d3@linaro.org>
In-Reply-To: <a36bbd80-f830-51bd-5aac-b430572259d3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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

On 7/19/22 12:16, Richard Henderson wrote:
> On 7/15/22 11:37, Xiaojuan Yang wrote:
>> In loongarch_cpu_class_by_name(char *cpu_model) function,
>> the argument cpu_model already has the suffix '-loongarch-cpu',
>> so we should remove the LOONGARCH_CPU_TYPE_NAME(cpu_model) macro.
>> And add the assertion that 'cpu_model' resolves to a class of the
>> appropriate type.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This patch causes tests to fail, e.g.
> 
>    TEST    float_convd on loongarch64
> 
> qemu-loongarch64: unable to find CPU model 'la464'
> 
> make[1]: *** [/home/rth/qemu/src/tests/tcg/multiarch/Makefile.target:29: run-float_convd] 
> Error 1
> 
> 
> What caused you assume that all cpu models are already suffixed?

Mm.  I suppose the use over in hw/loongarch/loongson3.c.
I will make this function match target/alpha/cpu.c, which checks cpu_model as-is, and then 
tries again with the suffix.


r~

