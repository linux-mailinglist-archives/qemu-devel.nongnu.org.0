Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9137AFF8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:11:48 +0200 (CEST)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgYjL-0007dP-3W
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgYiG-0006db-M3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:10:40 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:41799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgYiE-0001a4-O8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:10:40 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 e7-20020a4ad2470000b02902088d0512ceso1629562oos.8
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XiwRmd44CX7fE0kPLO8T0UUgg/JAieQXeSKiJSpVhaE=;
 b=M1XSrN4BeVsZ71TZcSfp2AGVooE4NKdGXxhJUlm1l+x7IORGvzJlS2WPiNrHW5IXPo
 TczU5wDkoZXubsnXGa7Me27RMv/wDvqUKQ0YhCQ4ewM9k/YQPP/wsKQSHVJgv9QZr3Rs
 bqUoe2wx/V1ZzmtNITEURbZtWV96HUp+j8GRPtJHpDQU/fJ6z4+M8O+7LUDztXAQPh0H
 pm539UA/zAqTHxeWn7Y2E0plaTaL8NpUu18RvTnWgIu/X+OjllMV/bGmsDTjcLS40K8r
 D0X3cmC21LbodCzcyH2V81Gt4EpZLAdD3mIlZrPe/kNgRmLyYQT4jNIKXx9EP9gRc6q7
 XLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XiwRmd44CX7fE0kPLO8T0UUgg/JAieQXeSKiJSpVhaE=;
 b=pIBH8rV3wlHUOK3t3SLUugf1KMIukQqPl86zyyabevhfPm4xDuoVmoo1kJnjjnoOKA
 LUmiJxq6yViB3BwcIlLGAkmi8fRNIjVS201/rJ39NLcP4R89izy0PBOL8JXMEdbtAAa5
 jsjRvfA6q0xKVJZ0vqCWlEoT9XY4I6wBnsRwfeCQWdMsmknNWmJqdIiVrJAeIWZ7Tnl8
 j2NvT6k+docqFG5zsQ7rUVOLTt4VQyCmb4oBvt0B6ZhVRiiMsOyN9rvNuaTc87PJIWD2
 Ma4rN1PXmEyhgs/TVLf1rvye/iLa1lOIMSzLVPSGmPBGwDlIgV1qJHU8R5aZYdJWgnTh
 6pKw==
X-Gm-Message-State: AOAM530fXom4t88ylIhQTVttfQm6MU7S+jNrv/CPD9TapmZamZLnvNee
 xhCh5WVKHujO6/dGdRSDSP26oQ==
X-Google-Smtp-Source: ABdhPJwb/rauYPiwtFdEBJmzlb3ZKsLOqf4tl87uUuEuBb34K/5NtheGQBACDHaIXFyEJ1y8N3/Udg==
X-Received: by 2002:a4a:a702:: with SMTP id g2mr15699568oom.86.1620763837389; 
 Tue, 11 May 2021 13:10:37 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id z6sm2508601oiz.39.2021.05.11.13.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 13:10:36 -0700 (PDT)
Subject: Re: [PATCH 03/72] qemu/host-utils: Add wrappers for carry builtins
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-4-richard.henderson@linaro.org>
 <87k0o6yc74.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90dc8203-522a-d3d2-15b8-ad95fd654f93@linaro.org>
Date: Tue, 11 May 2021 15:10:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87k0o6yc74.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 7:57 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> These builtins came in clang 3.8, but are not present in gcc through
>> version 11.  Even in clang the optimization is not ideal except for
>> x86_64, but no worse than the hand-coding that we currently do.
> 
> Given this statement....

I think you mis-read the "except for x86_64" part?

Anyway, these are simply bugs to be filed against clang, so that hopefully 
clang-12 will do a good job with the builtin.  And as I said, while the 
generated code is not ideal, it's no worse.

>> +static inline uint64_t uadd64_carry(uint64_t x, uint64_t y, bool *pcarry)
>> +{
>> +#if __has_builtin(__builtin_addcll)
>> +    unsigned long long c = *pcarry;
>> +    x = __builtin_addcll(x, y, c, &c);
> 
> what happens when unsigned long long isn't the same as uint64_t? Doesn't
> C99 only specify a minimum?

If you only look at C99, sure.  But looking at the set of supported hosts, 
unsigned long long is always a 64-bit type.

>> +    *pcarry = c & 1;
> 
> Why do we need to clamp it here? Shouldn't the compiler automatically do
> that due to the bool?

This produces a single AND insn, instead of CMP + SETcc.


r~

