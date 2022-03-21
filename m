Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D334E3281
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:57:56 +0100 (CET)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQ2E-0008Gk-OL
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:57:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWPzX-000781-Ng; Mon, 21 Mar 2022 17:55:10 -0400
Received: from [2a00:1450:4864:20::335] (port=51010
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWPzV-0002uw-U5; Mon, 21 Mar 2022 17:55:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id h16so8797383wmd.0;
 Mon, 21 Mar 2022 14:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gScqlb2rCIc6WPHLCKIeAXIxeCHOKTICQ+ZFanQilDg=;
 b=UJaKN13tBasLcAUOKZaZS4k4xEqLa49hsTBVnf7Koof4tYVChaxhcBZfbxhwUx5zjh
 UlxxEvyuSr2wJlMu2dU2UWJ56va1BCL0jmCLIGajEzkBqIwQPh9iyYwkLeRzYfOBKE5E
 iPJPtoHDhSS6ULuc+7gVkqQ8u+s/9Ccmjih6yGhe3mxQJq0cw84aATdIlFFxSsR8PPbb
 e3yiUsl8vXXfN++ta01BrsT5gl0ACYKLRuz1uvYCUyVjMFQOLBf+Kj34h9uckpvzWudD
 P4KHy4ph3fny2sfoc9aWPre3oKXgMpsHTJXG2pFeyl63Sr1CtqIgOkXXMWx70QmVJ3bC
 jqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gScqlb2rCIc6WPHLCKIeAXIxeCHOKTICQ+ZFanQilDg=;
 b=MPGeUUheQPmAwKe7lIBB1WxCSuG9tkLyu2MG2SeuamIUI1gdYXVg9Moh9rlu6tfY5U
 K+1ncH4z4jqaT/iXeBPEmB5DfWukQd0kSzpLlGtoCT41iA/stbrfQagYX+d3x98N/0Gh
 CN6+lQZ4sDXOIKTOXkkOBgc2QB1o1j1lWHb1kgLCXxg2Ce23wf/gllWikL0xQPBZe0/L
 7/F5JBJ8pbH/XRRsv/PvolzywvKllLAzlABde0/pCAXiiYpif0CKxw/ldUzlXCojTde6
 4pXtNnHcc/a79V3lcsjdQbwD4KBQzAAEsTQF2EK3FsKsWa6Uq2zCnp9khcGrobyDqNuf
 yprA==
X-Gm-Message-State: AOAM533awZHiSIt+5Gh+xJlmCiw82Sg8kolWWPFDO9asvR95OQnSTDnu
 //NJjeu6eBb6Vj4mmn0BfK8=
X-Google-Smtp-Source: ABdhPJxvjRMWSHHVLqjiJ36FLzbC0YF/yo8vjhwxaux2v9XHKhuymTxVefmcDpx1jFNPWIL28kQr0Q==
X-Received: by 2002:a05:600c:4e12:b0:38b:b715:18a6 with SMTP id
 b18-20020a05600c4e1200b0038bb71518a6mr953768wmq.17.1647899702708; 
 Mon, 21 Mar 2022 14:55:02 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d598c000000b002045ff40259sm403774wri.58.2022.03.21.14.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:55:01 -0700 (PDT)
Message-ID: <19196e24-5596-428b-2b62-9ac902cbb6ba@gmail.com>
Date: Mon, 21 Mar 2022 22:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
 <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com> <87a6dr48n2.fsf@linaro.org>
 <YjCfjmxMnGZYGGv6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YjCfjmxMnGZYGGv6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/3/22 15:15, Daniel P. Berrangé wrote:
> On Tue, Mar 15, 2022 at 01:59:59PM +0000, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> writes:
>>
>>> On 15/3/22 13:12, Alex Bennée wrote:
>>>> Another cleanup patch tripped over the fact we weren't being careful
>>>> in our casting. Fix the casts, allow for a non-const and switch from
>>>> g_realloc to g_renew.
>>>> The whole semihosting argument handling could do with some tests
>>>> though.
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>    semihosting/config.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>> diff --git a/semihosting/config.c b/semihosting/config.c
>>>> index 137171b717..50d82108e6 100644
>>>> --- a/semihosting/config.c
>>>> +++ b/semihosting/config.c
>>>> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
>>>>        bool enabled;
>>>>        SemihostingTarget target;
>>>>        Chardev *chardev;
>>>> -    const char **argv;
>>>> +    char **argv;
>>>>        int argc;
>>>>        const char *cmdline; /* concatenated argv */
>>>>    } SemihostingConfig;
>>>> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
>>>>        if (strcmp(name, "arg") == 0) {
>>>>            s->argc++;
>>>>            /* one extra element as g_strjoinv() expects NULL-terminated array */
>>>> -        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
>>>> -        s->argv[s->argc - 1] = val;
>>>> +        s->argv = g_renew(char *, s->argv, s->argc + 1);
>>>> +        s->argv[s->argc - 1] = g_strdup(val);
>>>
>>> Why strdup()?
>>
>> The compiler was having issues with adding a const char * into the array
>> and it was the quickest way to stop it complaining. I'm not sure what
>> guarantees you can make about a const char * after you leave the scope
>> of the function.
> 
> No guarantees at all. This method was implicitly relying on the caller
> never free'ing the const arg it passed in. That is indeed the case here,
> because the arg came from a QemuOpts list. It is bad practice to rely
> on such things though, so adding the strdup is sane IMHO.

I see, thanks.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

