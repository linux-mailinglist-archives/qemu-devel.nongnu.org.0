Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504843BA25D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 16:49:56 +0200 (CEST)
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKUN-0007Sm-E0
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 10:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzKTH-0006Yy-NM
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:48:47 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzKTF-0004ft-M8
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:48:47 -0400
Received: by mail-wm1-x32b.google.com with SMTP id o22so6864906wms.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=peaYXKbPM0ngX5phYfY8/tEqYFu4qXOk8RuyzrXrWTc=;
 b=kM+qmyBFTrRqnVkWqQ78XvCb72+SVakYDpYtObaGqdHU44hbN2NhYiFdEd7cAV+Slg
 G8xmbygwO+9SaQlHUZsbE3RQqwpGhPrw8/3VXYCAdMGWbhMaa8gweFIiBJyqL1pELwAG
 lBYMOCqKEic3GnBcW8jAi/5HZmKTMVDcYQc9tVLQhi9dBKVKsGQj4/J7/2ey1+4k+Vxw
 XvdP9Cb8/Op9u9GmweVPNdTGBfTnpOH0kAEtE/krECiejEXqrsQGHaqcnqe4TGDInQFP
 /VwzygEJNy4nCZAwRviMORgBl3GmxvliK3fkPZsn5csfh3njV1PLPKAKI7qoCyw1HaWU
 kvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=peaYXKbPM0ngX5phYfY8/tEqYFu4qXOk8RuyzrXrWTc=;
 b=t/86bkSGKMnvZg+Q5ymUAzl98ET5apMutXconWMMrU3mMeMkPQ+pGDf78tbBBo0WEO
 vckdJEuCg07PkvYjOc9JdaCpE6LHApoI7baSxjZYt8TVSo4Tz1XJA4hJWy8R/1x/L30Y
 Njlpxwa2EUcxK1UPCAXRprcycEExLxh/N72GWO6jARY3ANoiCN9ZtdkJXbYu79wMzcka
 hcQGpvFs3Xpliz0QFGrUtp/2XwVr48ESRqUMr26H7yg7gX75kT95YInY7eO0WBWQwV1W
 FzPFPd+uLPFLagFPfSLC4pXTFNGVMjHPDDUvQ+mODMGWp7hIN1fH/0S2dj5NDtasCBFq
 43jQ==
X-Gm-Message-State: AOAM530lmi14kiFzgN75AxsFiNOYJPTRXkMWitzYkYy0u+4/4oXpWAtX
 szHiMrPJWU0ci/9Rg5xPex0=
X-Google-Smtp-Source: ABdhPJxkSslGAe2hWb3bqof7Ar1XkS7VrJgEE319GZyrAhztS0mSmVmY/Z8hKq5hXS4MIe9TfbOjNQ==
X-Received: by 2002:a7b:c0ca:: with SMTP id s10mr6027294wmh.172.1625237323328; 
 Fri, 02 Jul 2021 07:48:43 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id 25sm3023000wmf.21.2021.07.02.07.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 07:48:41 -0700 (PDT)
Subject: Re: Problem with Avocado and QEMU console
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <ac0e8d46-6e57-b454-9162-17dc2f3b6534@amsat.org>
 <CAKJDGDb5GXTLB=7nmdu9_znrf4tVHS+6Rto5vdzYXyNcLG+x8Q@mail.gmail.com>
 <c753b71a-b0a4-a182-976d-00c36edc5e4a@amsat.org>
 <CAKJDGDYuw-A+63wMvDcp7gK8QowoDDN-TwMCFv3i6=kvOqjUdQ@mail.gmail.com>
 <41a3f762-1fbb-c9f8-73b5-6d1d6654d4c5@amsat.org>
Message-ID: <225d9dd2-bb78-7399-e2b5-30a43d90a61d@amsat.org>
Date: Fri, 2 Jul 2021 16:48:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <41a3f762-1fbb-c9f8-73b5-6d1d6654d4c5@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:40 AM, Philippe Mathieu-Daudé wrote:
> On 5/3/21 4:46 PM, Willian Rampazzo wrote:
>> On Mon, May 3, 2021 at 10:36 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> On 5/3/21 3:12 PM, Willian Rampazzo wrote:
>>>> Hi Philippe,
>>>>
>>>> On Mon, May 3, 2021 at 9:59 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>>
>>>>> Hi Cleber, Willian,
>>>>>
>>>>> Avocado marked the test_mips64el_fuloong2e as failed while
>>>>> it succeeded:
>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/1231363571
>>>>>
>>>>> Apparently the first part of the console output is missing.
>>>>> (Normal console output attached).
>>>>>
>>>>> Any idea what could be the cause?
>>>>>
>>>>
>>>> The log shows the following:
>>>>
>>>> 12:00:37 ERROR| avocado.core.exceptions.TestFail: Failure message
>>>> found in console: "Kernel panic - not syncing". Expected: "Kernel
>>>> command line: printk.time=0 console=ttyS0"
>>>>
>>>> Does your comment about "console output missing" means the expected
>>>> message was supposed to be on this missing part?
>>>
>>> Yes, "the first part is missing" so Avocado didn't see the expected
>>> message pass, but the messages emitted *after* it are logged.
>>>
>>
>> Okay, got it.
>>
>> The reason for it to fail is here:
>> https://gitlab.com/qemu-project/qemu/-/blob/master/tests/acceptance/boot_linux_console.py#L53.
>> The way the `wait_for_console_pattern` method is defined tells the
>> test to fail if that `failure_message` is found.
>>
>> I'm still checking why the test missed the first part.
> 
> Could this be related to the recent failures in N8x0Machine.test_n810?
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/1280746618#L128

Yet another one:

https://gitlab.com/qemu-project/qemu/-/jobs/1390365314#L129

