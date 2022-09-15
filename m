Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F5F5B9512
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 09:14:01 +0200 (CEST)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYj4S-0004p9-8I
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 03:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYihk-0001Zi-9Y
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 02:50:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYihh-0001cS-J1
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 02:50:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id b5so29223042wrr.5
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 23:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=e3l/ZEqoqBzXGG133tbfmfBnmH5P9wX3c7DIMmftILg=;
 b=uYuofHP9jNIMgjvoRHcoE5+bHZhf6JahAp+VyxaOSeMwAcSTD66/lgtu5dszqxOkkK
 2TvBhj7ROMhuWhehOVkDL/5ybPPfa1ZzWGMVk0M8y1VOzGIOMupYa1urbAo/S/2S3Jag
 TZLXRj9uUNBakuDhoPz+S1LI1hWQn3YV7i49qbgmtce6XnwJ1XuWPBwBPf9uq7MbRtbm
 WZhXvqKFNJBsBzVvH2otnJlUSEbsS9Go5AoleRW8yALleYTxjG9mieMuyDJQKNFmUciG
 H/GSmlDt/1hyVYuUO4v639GW/XkF4DaWBNeF5f3q2PquuleWI8V61M/rLtKthKvuCfY/
 E2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=e3l/ZEqoqBzXGG133tbfmfBnmH5P9wX3c7DIMmftILg=;
 b=QuklHmHkRhW1aGGZgiDy80W1McyXXHxdbmP222NKBoGvQmHebmRUObb8ypY8CLB8re
 qXdoEMiRYkuumRVWuzBzf3EfKzb/4nz7GnLpLMMQfYxFTv1ZNEGeLrFGlBGs4i9V1i+Q
 L8kKg6hOoicbvm55Vf87F9Q3qdo6mZCypql0I/QeXAt6PIlMLP4xT3OrpASpVNBQXz6i
 irdy+a6HoargLs6B0XYWMKFCVyed6F7FuaDR+vmmqCtIz3mvcI4APWicuSQLFMJNOVBh
 gox22Ta0fFDqeCKQjFsoI55UwMNh9NUwmlxgHQ8PLkgcgDOL71dfpM+gsEXBdAZ/rtIZ
 dOmQ==
X-Gm-Message-State: ACgBeo3HL0n4/qKzBuSGvmPtR/aXFbflCSysrF4uo6jSlPIsQ33kQ2um
 ZDDvIK5es6798k3I0p0+Ytb/YQ==
X-Google-Smtp-Source: AA6agR590rnI/DRhgoNCfx8sDxo1wnOdbTjNjsd6ePj3JYQEYuuVTnlXm/j2zbQ+s2TJVg1Hs0ei+A==
X-Received: by 2002:a5d:5504:0:b0:228:b90c:e5e0 with SMTP id
 b4-20020a5d5504000000b00228b90ce5e0mr23331830wrv.624.1663224627964; 
 Wed, 14 Sep 2022 23:50:27 -0700 (PDT)
Received: from [192.168.85.227] ([185.122.134.1])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfbb11000000b0022762b0e2a2sm1592159wrg.6.2022.09.14.23.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 23:50:27 -0700 (PDT)
Message-ID: <c76793ce-8b6c-c34c-b808-48cdce96bb3b@linaro.org>
Date: Thu, 15 Sep 2022 07:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 28/37] target/i386: reimplement 0x0f 0x38, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-29-pbonzini@redhat.com>
 <ca5cdbf4-81c3-78ef-c395-b9ccc3cd20f1@linaro.org>
 <CABgObfaLms4s-YhbGhOmCQ_S0UWSggHvVEFDXPZsXcX16Lv3aA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfaLms4s-YhbGhOmCQ_S0UWSggHvVEFDXPZsXcX16Lv3aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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

On 9/14/22 18:04, Paolo Bonzini wrote:
>>> +void glue(helper_vpgatherdd, SUFFIX)(CPUX86State *env,
>>> +        Reg *d, Reg *v, Reg *s, target_ulong a0, unsigned scale)
>>> +{
>>> +    int i;
>>> +    for (i = 0; i < (2 << SHIFT); i++) {
>>> +        if (v->L(i) >> 31) {
>>> +            target_ulong addr = a0
>>> +                + ((target_ulong)(int32_t)s->L(i) << scale);
>>> +            d->L(i) = cpu_ldl_data_ra(env, addr, GETPC());
>>> +        }
>>> +        v->L(i) = 0;
>>> +    }
>>> +}
>>
>> Better to not modify registers until all potential #GP are raised.
> 
> This is actually intentional: elements of v are zeroes whenever an
> element is read successfully, so that values are not reread when the
> instruction restarts. The manual says "If a fault is triggered by an
> element and delivered, all elements closer to the LSB of the
> destination zmm will be completed".

Ooo, I had never noticed that.


r~


