Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339F46BB003
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 13:14:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcQ15-0007kM-Lo; Wed, 15 Mar 2023 08:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcQ0k-0007gl-18
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:13:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcQ0i-0001uC-4a
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:13:41 -0400
Received: by mail-wm1-x333.google.com with SMTP id m35so2866159wms.4
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 05:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678882418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GO2muvAkQF711zvZCjj+JVcDtDId91mTV/Scq9Ftpw0=;
 b=cft0iRIqzVavE9gUD4+TBFlxV7iEWBvXw4L2NlD6GXi3ezQT7O9qE9CbdZqQDM0yFu
 1i53aTxSuO/IJrVFhi2FhE7c+YFWBYqRa5xtDuh683ATfqK4P0d7MoI/ZGmhq2y6JReW
 R+KGugdjXeu99eyXfPKnMLSB8BYCTpypV5fsYgWU28J8DuirTTHQnphG0hW9UdyosSnP
 Sh7VnUgJrVr4OfwRlClH34ULdygSIW4dd+aJl4pdjfM/9urkIcKTcTke6JbERwIClHm8
 dtY4iitzHJBbgWxkDCst94nOB9DJqG8O+ZrswWsEQSxAMncEtkBTrALBTOgD9AlxWOCp
 3THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678882418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GO2muvAkQF711zvZCjj+JVcDtDId91mTV/Scq9Ftpw0=;
 b=zVjwuzTXjbYZFX7KdJdzCSmNafaTrr/0LIur0oCUd6byLfltBjxOHSIgnPni3De36e
 3V75VmQLKoEPddbcOAofvgQtnNGnclELlI+bknbPYsZ5uWrDhqYja6q7v+9Au6NcTzxk
 fFntsRSz926lRYCF98I2NcqbhygAJvXzWH3ay/i9RvxOsxbbLvtEL/PNugBNp4a6XoDL
 68t4xgFgJwP7b98WPVoejOtYPEzKtqMkCi7SXlLOs/vbZphHXw+iuEyzO8hNHU+9WBDw
 vWyFnm2+uPfo9aAAcOA6KJwhmkYSuZsU7wGr3ENfkJaPCmRo4JSkDqeUNuwPokxUpLiq
 Ot/Q==
X-Gm-Message-State: AO0yUKWRR/lZGmZXM41t+l+mIPMUFgH/WJ6/QDlu2vhylLmG/Sq/bpGw
 JyP8EKXCj4r/ji0HYw/LF6MJSw==
X-Google-Smtp-Source: AK7set/bzHh1icKCKlBartiHa0kEh1PYytBKHsqf1tNdnMIJpLHleOGor6d7HM1lrcNUkMBKy1rWDg==
X-Received: by 2002:a05:600c:4753:b0:3dd:1c46:b92 with SMTP id
 w19-20020a05600c475300b003dd1c460b92mr19489774wmo.16.1678882418367; 
 Wed, 15 Mar 2023 05:13:38 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003ed2eb5c2dcsm1815821wmq.43.2023.03.15.05.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 05:13:37 -0700 (PDT)
Message-ID: <36dae49c-34c9-0850-82ef-4a098b3e6d5d@linaro.org>
Date: Wed, 15 Mar 2023 13:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] Use f-strings in python scripts
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Marco Liebel <quic_mliebel@quicinc.com>, qemu-devel@nongnu.org,
 Taylor Simpson <tsimpson@quicinc.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230313172535.2409370-1-quic_mliebel@quicinc.com>
 <c05ddbd3-8f26-5492-3961-7f3d564373d7@linaro.org>
 <ZBGo8WNlnRZUGYJZ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZBGo8WNlnRZUGYJZ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 15/3/23 12:16, Daniel P. Berrangé wrote:
> On Wed, Mar 15, 2023 at 08:43:33AM +0100, Philippe Mathieu-Daudé wrote:
>> Hi Marco,
>>
>> (+Python experts)
>>
>> On 13/3/23 18:25, Marco Liebel wrote:
>>> Replace python 2 format string with f-strings
>>>
>>> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
>>> ---
>>>    target/hexagon/gen_helper_funcs.py      |  54 ++--
>>>    target/hexagon/gen_helper_protos.py     |  10 +-
>>>    target/hexagon/gen_idef_parser_funcs.py |   8 +-
>>>    target/hexagon/gen_op_attribs.py        |   4 +-
>>>    target/hexagon/gen_op_regs.py           |  10 +-
>>>    target/hexagon/gen_opcodes_def.py       |   2 +-
>>>    target/hexagon/gen_printinsn.py         |  14 +-
>>>    target/hexagon/gen_shortcode.py         |   2 +-
>>>    target/hexagon/gen_tcg_func_table.py    |   2 +-
>>>    target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
>>>    target/hexagon/hex_common.py            |   4 +-
>>>    11 files changed, 198 insertions(+), 229 deletions(-)
>>
>> These files use a mix of ', " and '''... Since you are modifying
>> them, it would be nice to unify. I'm not sure there is a recommended
>> style; matter of taste, I find the single quote (') less aggressive,
>> then escaping it using ", and keeping ''' for multi-lines strings.
> 
> FWIW, rather than debating code style issues and coming up with a custom
> set of rules for QEMU python code, my recommendation would be to consider
> adopting 'black'
> 
>    https://black.readthedocs.io/en/stable/
> 
> There is a trend with recent languages to offer an opinionated code
> formatting tool as standard to maximise consistency across projects
> in a given language. 'black' is a decent attempt to bring this to
> the python world. I found it pretty liberating when doing recent
> python work in libvirt, to be able to mostly not worry about formatting
> anymore.

Clever.

So per 'black -t py37' the style is """, I was not even close.

> The main downside is the bulk-reformat in the history, which can
> make backports more challenging. For "git blame" you can use the
> .git-blame-ignore-revs file to hide the reformats.

TIL .git-blame-ignore-revs, thanks!

