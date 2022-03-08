Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293364D1FBB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:10:02 +0100 (CET)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReHZ-0001GV-4H
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:10:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReGR-0008Hc-Iw; Tue, 08 Mar 2022 13:08:51 -0500
Received: from [2607:f8b0:4864:20::102e] (port=39634
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReGQ-0000vE-63; Tue, 08 Mar 2022 13:08:51 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so2893521pjb.4; 
 Tue, 08 Mar 2022 10:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tMbQPQmNCJpXJZVpub/5ENhMlycIfgXJrOoUE5B7Dl4=;
 b=QjvBaB0DahMCCa9Zqkscw6x8G+DY69EZ/JYA54g+9nmKhuhJivlgo4eU4Ez7QuNzg7
 IL0wCHCLJ/T+GvU04444LRrk234dPjy0h6LEN2MPUgimePf4NnxQKqRcTqNvF/IROtZ8
 w9OEGWnJNIfRZSTgZEUXvYAXAj8fHMJo2tfLwhq4LNSB4PmbqWJSD3HHhC1srV5tZoRO
 rRA0a5EUgkTBuulXoga1mIYtY3nlIebet464pAJ8QJ6rSggoqvz1p2HyNUm8HKMVNTk7
 BGOS086cgs1ACG3AcbjMfs4yDO2SD42Pg9CWuM9HEEaYD5NGYZ7bhChdiAO/L2oCiB7N
 5dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tMbQPQmNCJpXJZVpub/5ENhMlycIfgXJrOoUE5B7Dl4=;
 b=lKOMLK+w7GK9XMb9ER/STmmwu725ngJH5iuvmxiqSE0tIuRqW95U/bDtJ5IUfZ31lG
 cawF0s/V7/r2qJKow6aDKRMOPXfWl2dIwmnKK/p/GAE0Z1h8Eaf4uAARWNkq7V3o2Huq
 MuFS+8500To2qJbwQyrwPaFoEBPKLkcDe23duFSKudscoK31rzNgKRXtu4xrhef7VzmP
 3SvYsnmBhuluisK8iM8nmMUyKwGpDApn74IH5l0x5zSCf78ZSM26ZPDd9N/T9Pdv7SYS
 Q3DR3SqR4iGMDRb89YyGzVJlg+89OQe/JDm9ZJgtLtCBuUCtIL+w5+SQfYBbY8QdNKy5
 8JfQ==
X-Gm-Message-State: AOAM532D97bg6geZ3PwOoIKdV33ngKkn3ASrKuRukaQNBXggsZSNF7Rl
 vP+y2ZBlUnwW9gKKXyduLoQ=
X-Google-Smtp-Source: ABdhPJzrI64es64KfgopdXuaRz4UkzGuel0cUKEtYU2OZ3I0udJqdMpk31WVAEPgkhftrZZHS/maGg==
X-Received: by 2002:a17:90a:bd04:b0:1bf:951d:5bf2 with SMTP id
 y4-20020a17090abd0400b001bf951d5bf2mr2932285pjr.18.1646762928507; 
 Tue, 08 Mar 2022 10:08:48 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00170200b004e0f0c0e13esm20914906pfc.66.2022.03.08.10.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:08:48 -0800 (PST)
Message-ID: <e670a39d-5aea-a580-e78d-099dcc01aea9@gmail.com>
Date: Tue, 8 Mar 2022 19:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 0/9] This patch series contains updates to PMBus in
 QEMU along with some PMBus device models for Renesas regulators. I have also
 added myself to MAINTAINERS as this code is in use daily, where I am
 responsible for it.
Content-Language: en-US
To: minyard@acm.org
References: <20220302015053.1984165-1-titusr@google.com>
 <20220304214354.GL3457@minyard.net>
 <CAMvPwGpzO3VyCqGJY28QVQoo9AwYxxrvP3RqPS6JTgpTk8ojtw@mail.gmail.com>
 <1af23dba-8f7a-8d93-706d-6e16067cdce2@gmail.com>
 <20220308135324.GU3457@minyard.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220308135324.GU3457@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org, Titus Rwantare <titusr@google.com>,
 venture@google.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/22 14:53, Corey Minyard wrote:
> On Mon, Mar 07, 2022 at 01:00:02AM +0100, Philippe Mathieu-Daudé wrote:
>> On 5/3/22 00:42, Titus Rwantare wrote:
>>> On Fri, 4 Mar 2022 at 13:43, Corey Minyard <minyard@acm.org> wrote:
>>>>
>>>> On Tue, Mar 01, 2022 at 05:50:44PM -0800, Titus Rwantare wrote:
>>>>> v2:
>>>>>     - split PMBus commit with updates into individual fixes
>>>>>     - renamed isl_pmbus[.ch] adding _vr for voltage regulators
>>>>>
>>>>> v3:
>>>>>     - split uint refactor commit and removed commit renaming files
>>>>>     - rename rolled into preceding commits
>>>>>     - update commit description for uint refactoring change
>>>>
>>>> This all looks good to me:
>>>>
>>>> Acked-by: Corey Minyard <cminyard@mvista.com>
>>>>
>>>> Do you have a plan for getting this in to qemu?  Like through the ARM
>>>> tree?  I could take it into an I2C tree, but there's really not much
>>>> activity or work there.
>>>>
>>>> -corey
>>>
>>> In general PMBus is more specific to i2c than ARM, but I'm not sure of
>>> the QEMU implications.
>>
>> Titus, could you address my comments?
>>
>> Corey, if you are busy, I can take care of this series.
> 
> It's not a "too busy" sort of thing, the i2c tree doesn't get much
> traffic.  I can take it, but it's not much different than just pulling
> it directly.
> 
> So it's probably best if you take it.

OK. I'll send a pullreq shortly.

Regards,

Phil.

