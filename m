Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A301313B01
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:34:45 +0100 (CET)
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AQt-0006Kg-Qb
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l93f8-0004o7-FL
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:21:03 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l93eu-00006z-HZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 05:20:53 -0500
Received: by mail-wm1-x32e.google.com with SMTP id y134so4377501wmd.3
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 02:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uF+I/tX5hgnwasUpl5DEoqtAW0b1jzfibilSYfWxhIw=;
 b=ChOHf+WEF+BK1D639KPNpU8ThCsLsSO1sDQ1b3TgjgIxvPPRWh74Bmzh+hGcvrcyTh
 O1/NgWm8lM8fjDOEfmx2csI7sDkJGWW2P/MB1r7z03GFyRgRN+4Iv6duMFS/FcoAkBmC
 1tYK6m3ITBfdKeQ5dowQdFOTaH7YtcAGE3rl9mSCqLYfhgds6dBTaBDJM0C/0O7YBGhU
 8o9KLj8i+0sep8f+BlgR3+SzVe+N4YMZ8IsaPc640LhsA2JsRYZA4TroG6/inwgIKB5G
 2dyrfdd1Dby5PBCL8u0SxB01DgWzMKprNt7hTp5WAagcUWCCNiMKFV4lt5wlxtNJTUg3
 d17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uF+I/tX5hgnwasUpl5DEoqtAW0b1jzfibilSYfWxhIw=;
 b=hLwB5iecLf2c5jYnFKlAcFQzNmSBqUWb0ph2251mbakJ5esaQ0DW0d6qKQsPWpjiPA
 gfLn1+t+dGw8ifrcUiejkNHmSJOEuQq3p6wCVpzLwXDKpzMbdklwFc65VTA6Uj8H3oHT
 xlZ6OtClHEoUGE1gibUVBRYYzAJuIfzNaq/t+KyEAjptz8iNTqUN6YxkP3epZQPubr0n
 drEGE4JNDkM0Pw4Ew4Jcana4xgFOkftcVSO7M0Dgk9AKbA8RXBuYV8ynanHMeMzETGYm
 2gKndznZjnRfQQSr1Odk2pwkN91JkkDdsSRk622WQTsASJ15IHlY2jqTAm3i1PFTqrAt
 xOHQ==
X-Gm-Message-State: AOAM5306OZWVDyX05LIgvGml62ee37+X9/XC9XbTzw91JT8XF0MzCrka
 fv2pNJPjhMWklTN9+PHVOEw=
X-Google-Smtp-Source: ABdhPJwaJjdkcJEfofbqKgfvdE454FLphwEp5hoWfJ74mvbnHY3QZOWm+Vig3I4xrUmAjmQeOpAhjg==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr14141073wmi.148.1612779641836; 
 Mon, 08 Feb 2021 02:20:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b2sm8085522wrv.73.2021.02.08.02.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 02:20:40 -0800 (PST)
Subject: Re: [PATCH v2] travis-ci: Disable C++ on Aarch64 container
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210206200537.2249362-1-f4bug@amsat.org>
 <29f38036-9acd-abf4-1a75-5a4ac54273a6@redhat.com>
 <4304f273-2320-e302-f8ca-b72fb69061b5@amsat.org>
 <1733be99-4b43-09f8-0dd0-250d118e31c2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <efe712a6-3e41-5efc-9891-99e692c8f8d6@amsat.org>
Date: Mon, 8 Feb 2021 11:20:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1733be99-4b43-09f8-0dd0-250d118e31c2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 11:09 AM, Thomas Huth wrote:
> On 08/02/2021 10.16, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 2/8/21 6:54 AM, Thomas Huth wrote:
>>> On 06/02/2021 21.05, Philippe Mathieu-Daudé wrote:
>>>> Travis-CI seems to have enforced memory limit on containers,
>>>> and the 'GCC check-tcg' job started to fail [*]:
>>>>
>>>>     [2041/3679] Compiling C++ object
>>>> libcommon.fa.p/disas_nanomips.cpp.o
>>>>     FAILED: libcommon.fa.p/disas_nanomips.cpp.o
>>>>     {standard input}: Assembler messages:
>>>>     {standard input}:577781: Warning: end of file not at end of a line;
>>>> newline inserted
>>>>     {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
>>>>     {standard input}: Error: open CFI at the end of file; missing
>>>> .cfi_endproc directive
>>>>     c++: fatal error: Killed signal terminated program cc1plus
>>>>     compilation terminated.
>>>
>>> If disabling C++ "fixes" the issue, ok ...
>>> Otherwise, we should maybe rather limit the amount of parallel jobs
>>> there instead? (i.e. compiling with "make -j1" in the worst case?)
>>
>> I exhausted my Travis-CI credits (frankly I don't plan to pay for it
>> with my own money).
> 
> Yeah, same for me.
> 
>> I'm happy with any patch (directly removing this job if it is not cared
>> of?) as long it silences the failure reports we get on IRC on each
>> merge.
> 
> Ok, I wanted to send a PR with my other Travis->Gitlab patches today or
> tomorrow anyway, so I could also throw in your patch here to try to
> silence these failures (unless Alex wants to take this patch through his
> tree within the next days anyway)... then let's see whether disabling
> C++ is enough, and if not, we can still try my suggestion instead.

FYI there is a v3 (20210207121239.2288530-1-f4bug@amsat.org) fixing
how AArch64 is written:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg780124.html

OTOH we don't have any job explicitly disabling C++, right? (Not
sure we want one, just wondering).

Thanks,

Phil.

