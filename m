Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127146A17C9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:17:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTFt-0004OW-2o; Fri, 24 Feb 2023 03:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVTFj-0004O4-9D
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:16:28 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVTFg-0000c1-Jx
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:16:26 -0500
Received: by mail-wr1-x435.google.com with SMTP id q16so2689392wrw.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2lGqNBp7xZ+oXVfzWaX23klPyfRe0TsdRFDo3jBgXdE=;
 b=w3YFqD+bwOcjKK79QxzOhYQf/QG+PobqwxXVZ/Tn3+AwWglEnsWiuPqjQC4YBTMwPI
 2//s+dD0sowmrsR2MTo0qc0mlA8jXPsDsZ7Rz19/5bvA0my7rhaiRpt1SxEyJU51dzgf
 JqR2oLmVhSvk8YqVd0L8/u0IswykRyxL6t5i9Mb2Jj+IafKkvw6u/r08N7fvRMz/mdw8
 mcaJpc2c9A26H2Ml1frmOhNXoIIw/DB1cKCm00jy2RPXCyoMB5HmDjNwJVSarhAHacNs
 1jfR1s4hCNczT6wYIg/PcuImduNd0/JGvkoPt+cSMG5ia+1oVC5uCr9hTA55GzfAneCy
 Q22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2lGqNBp7xZ+oXVfzWaX23klPyfRe0TsdRFDo3jBgXdE=;
 b=00Sub/uVsqBvabUZyBtf0kImbHDkjQYsaz2vENjltUkxixmzqnUmNE7wdo4w/5yCBx
 942UeN16JDyxlakMuPu5XvoNrjivqz5vU01HYc6DwpMhKBXzvpc111HGtUNL/9X6IwvJ
 97hfKqP86u+3uBW2ksLAPIxcBY58n4erDKM92G0KFiK9TCN2UGs0NLO8q0/Ezh/W4Cch
 BVLwhYHIRTqebhItAwsL+HeiK3Cq3N7PGyOpVi8IrFogkuBM1Ayc1eFoiC46rgJnJNYz
 KptiTu4icC7EUTFjtxmBgU66NKIAZAHPplcFIKO6GawoxlHl4dm7VZYeBOCztgiMcNJp
 y1Yw==
X-Gm-Message-State: AO0yUKUm6SqcDOZL66dNY8/TIO6lB062nxTQHOzjPmyfHmznKHsHH9wF
 vG57hbHi1etI+Bd0/mN8B2UJ/w==
X-Google-Smtp-Source: AK7set+zg45fKwaosrqudo8SDrfKLHcYq00CD76HsiMXolq5mU/ohtCpfPGU94a0xWRG8X0ZOpxRqQ==
X-Received: by 2002:adf:e7c9:0:b0:2c7:1dc4:5c4e with SMTP id
 e9-20020adfe7c9000000b002c71dc45c4emr1051399wrn.32.1677226582786; 
 Fri, 24 Feb 2023 00:16:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b003e0015c8618sm2029658wmb.6.2023.02.24.00.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:16:22 -0800 (PST)
Message-ID: <1da14ae6-c03a-e87f-27b5-5851516e111c@linaro.org>
Date: Fri, 24 Feb 2023 09:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL v2 00/36] Testing, docs, semihosting and plugin updates
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson
 <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230202160109.2061994-1-alex.bennee@linaro.org>
 <01d13cc2-f346-71a7-d941-2d1a0dc42514@linaro.org>
 <0d17e82c-4226-84fb-9301-644935d326e4@linaro.org>
 <b72ffae1-f640-cacb-ef47-b3593edb1bab@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b72ffae1-f640-cacb-ef47-b3593edb1bab@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 24/2/23 05:51, Akihiko Odaki wrote:
> On 2023/02/23 21:59, Philippe Mathieu-Daudé wrote:
>> On 3/2/23 18:38, Philippe Mathieu-Daudé wrote:
>>> On 2/2/23 17:01, Alex Bennée wrote:
>>
>>>> ----------------------------------------------------------------
>>>> Testing, docs, semihosting and plugin updates
>>
>>>> ----------------------------------------------------------------
>>> FTR I'm now seeing this warning on Darwin/Aarch64:
>>>
>>> C compiler for the host machine: clang (clang 14.0.0 "Apple clang 
>>> version 14.0.0 (clang-1400.0.29.202)")
>>> C linker for the host machine: clang ld64 820.1
>>> Host machine cpu family: aarch64
>>> Host machine cpu: aarch64
>>> ...
>>> [1/3253] Linking target tests/plugin/libbb.dylib
>>> ld: warning: -undefined dynamic_lookup may not work with chained fixups
>>> [2/3253] Linking target tests/plugin/libinsn.dylib
>>> ld: warning: -undefined dynamic_lookup may not work with chained fixups
>>> [3/3253] Linking target tests/plugin/libmem.dylib
>>> ld: warning: -undefined dynamic_lookup may not work with chained fixups
>>> [4/3253] Linking target tests/plugin/libsyscall.dylib
>>> ld: warning: -undefined dynamic_lookup may not work with chained fixups
>>
>> Googling, someone suggest to use --linkopt=-Wl,-no_fixup_chains:
>> https://github.com/bazelbuild/bazel/issues/16413#issuecomment-1270603343
>>
>> This doesn't show up on GitLab which uses:
>>
>> C compiler for the host machine: cc (clang 13.1.6 "Apple clang version 
>> 13.1.6 (clang-1316.0.21.2.5)")
>> C linker for the host machine: cc ld64 764
>> Host machine cpu family: aarch64
>> Host machine cpu: aarch64
>>
>> I guess I'll just ignore these warnings.
> 
> I think this problem is tracked at:
> https://gitlab.com/qemu-project/qemu/-/issues/1244
> 
> It is caused by linker flags Meson adds. For Meson, it is tracked at:
> https://github.com/mesonbuild/meson/issues/10894

Indeed. Thank you Akihiko :)

