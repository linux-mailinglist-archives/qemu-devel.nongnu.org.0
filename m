Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DCC5365FB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:29:48 +0200 (CEST)
Received: from localhost ([::1]:33236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucqR-0002aW-3F
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nucBQ-0000jE-BP
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:47:24 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nucBO-0004ZJ-Md
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:47:23 -0400
Received: by mail-pl1-x631.google.com with SMTP id q18so4453292pln.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=R8F9eZX/LWYeuS5LdyUXesARcGKfNDdemj10zI/Wka4=;
 b=dDz3u0VDmxnmGSq/kDc7+0gINJZppp8B2ZWCMnrsUICRvZ03wZhYAtKliWqWmqe8sA
 PNoK46yAQbLL5Lb3JWGUglnfG+SoL92nSwgNCqouP0+G/CFyHL6W0NRfBDjG51xIhEG5
 bNHAnM8fhvovp9zPY+OenXnLRmpnC3LA4nt5qeIupEFq4m5NRMGPRBroD/QRUgUMlNxx
 1maUQGR/hCtPHRlsgMS47r+ClWmzalIe7M7l4GEd7smEuyOI6yjxuaLOlv7fpp0biJqG
 UndFpcj2tA0HdWyF3egu/o4hed6Ow4e2CZl8w9YDVIhngTYM+SGLRnTPRYIkBwgOmqz1
 H37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R8F9eZX/LWYeuS5LdyUXesARcGKfNDdemj10zI/Wka4=;
 b=sKrxJbwcEnoniaSgIgYnmXNkAkcuTZZQUOFcLfotTTWAa8t4SOB9ySsFWAaJ9MvIK9
 lwqzwpUeBLcs0PnTqA7Qgid3ym7TVRudEYBv2B9+vMrQLVX5R80Tv9MmPley/yQgKyOC
 bjgoCKG3gLBZKonBxwtoGqjqo7uaSUGWrKg5WCE2+1YNA01OLIRVmfEjrZnyHQBCfHDb
 JvITTWCK+mucubhTQQ45AOvWFmCvkuVJkzjv9/mOuaCWc401j5phqN71wPRyi79zZOyO
 PRr+A7e6UVSSVQdGxvI+m2eHF93SG29nkGSOxdhBcMeTRgSRb+6BFVg1tOPkv3InV9Q3
 wAwQ==
X-Gm-Message-State: AOAM533BpVDYenyHAeJTqgv3x1c70LDDX1RY9YM44ftyh5imlz9/HZyz
 k/EIURGhnIoiSlONfsl0Svu2Qw==
X-Google-Smtp-Source: ABdhPJyNi7sAPTbeplzz5TgJILy6mg4gtyTVMes63/+lYCXJnATIxBmMw0xTvsbiCUIeDlid6ae2hw==
X-Received: by 2002:a17:90b:1d8f:b0:1e0:37a5:17e3 with SMTP id
 pf15-20020a17090b1d8f00b001e037a517e3mr8895195pjb.246.1653666441263; 
 Fri, 27 May 2022 08:47:21 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a170903248b00b001624b1e1a7bsm3783353plw.250.2022.05.27.08.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 08:47:20 -0700 (PDT)
Message-ID: <5dea16f7-f926-4031-1fd2-2e448345eb4b@linaro.org>
Date: Fri, 27 May 2022 08:47:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 10/17] target/m68k: Implement TRAPcc
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-11-richard.henderson@linaro.org>
 <ce53c8b1-b3fc-1cd4-7c65-58d970df5733@vivier.eu>
 <6e1fc8f9-b422-ab6a-191f-cc36e404355a@linaro.org>
 <c8c71525-f517-dbcc-11b1-461569b3392f@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c8c71525-f517-dbcc-11b1-461569b3392f@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 5/25/22 17:15, Laurent Vivier wrote:
> Le 26/05/2022 à 00:26, Richard Henderson a écrit :
>> On 5/25/22 14:40, Laurent Vivier wrote:
>>>> +DISAS_INSN(trapcc)
>>>> +{
>>>> +    DisasCompare c;
>>>> +
>>>> +    /* Consume and discard the immediate operand. */
>>>> +    switch (extract32(insn, 0, 3)) {
>>>> +    case 2: /* trapcc.w */
>>>> +        (void)read_im16(env, s);
>>>> +        break;
>>>> +    case 3: /* trapcc.l */
>>>> +        (void)read_im32(env, s);
>>>> +        break;
>>>
>>> Do we really need to read the data or do we only need to increment s->pc (as the data 
>>> are only here to be available for the trap handler)?
>>
>> We need to read the data to (1) trigger sigsegv when this insn crosses a page and (2) 
>> passing to tcg plugins.
>>
> 
> For (1) I was wondering if the real CPU is actually doing it.
> 
> Nothing is said about it in the instruction definition.

Surely the cpu reads cachelines at a time, so of course it would.

r~

