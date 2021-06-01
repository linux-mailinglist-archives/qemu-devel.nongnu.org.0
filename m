Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AE1396BF0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:42:10 +0200 (CEST)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnvI9-0001LF-GB
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnvH8-0000gR-7b
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:41:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnvH4-0003Cw-DD
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:41:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c3so12646061wrp.8
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 20:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kb+pG6+WLt50axCh1ihoUvksRaWuZUIwgtLYprZEc+I=;
 b=n2JIms7zWBc+X1pEaqOdD3bw/Fbzw0DQquVb6LW/HWx+1nIE2MQQMpVUOi/wRppCXM
 9CAjIcFubtq6DW9OcZCq5QsSgJgX8Muw6AeIIZJ9sRmVUIkNMcbceAhPx+awi0O5e0kD
 56QhURLlAuNynpHS4dx38pgfNISShom0YlVGS9DRllD2M2biCjW+WDnmPsrycyTtPyO2
 n8xR0AZ/jw5RI2oJN7EZzqWy9R2kHX0hAl0ccfCWXtQ5uZd3xsWw/GJcG0rXZ8zEd4mB
 XrQGAYGIhAe2vxaz9aNhUEw52rLuNUd/zmyMc+iuhF9hRKC6wNHe9CUHDF2edoR2bSsw
 sZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kb+pG6+WLt50axCh1ihoUvksRaWuZUIwgtLYprZEc+I=;
 b=fZjaQt89/l+dPL3fT4eAVAdp1mkLTRb6NgSdkB/qafKaxerbCtmgHbAcGs9HcWHN1Z
 rp4D3O912yazR6WonBvl8qL3eBeLlmLXzDlnDo72K7Umv4eVwDKUJfE4Z+J2+rhn1euZ
 sVybEYdGUrIfgOdkxSTjneABye6AKRIaAKe5H5f5IynE6Iep2pjCNuUEd3/DLTFVJoK1
 7zt0xmsDHU5tM5yDHha4/2aMavqSnYP/XfIKrCKrq/8tH2+DEwOULrtPd/HrWrlekhWp
 5M4Adp9wT+HTNBrMvwlmcOaAZTJrV195tXQtm0DeJGcylScrzeE2mKoIDxdwrxdXHzr9
 9eQQ==
X-Gm-Message-State: AOAM532TBf+hmbcatoz4TLqMC+YPfBjpD4MqoGjWAkPpFvGH6iRwEDXq
 F3r+984uZI96ZF0ldJRqCYk=
X-Google-Smtp-Source: ABdhPJyOzGvrEpCbIE9qgz/ry+Uavg4SqEoNQJcCd+3RzdYqYGFXNIqCXC2DjOPzez2fYro9IIfyfg==
X-Received: by 2002:a05:6000:1447:: with SMTP id
 v7mr5962452wrx.252.1622518859633; 
 Mon, 31 May 2021 20:40:59 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id s8sm1899554wrr.36.2021.05.31.20.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 20:40:58 -0700 (PDT)
Subject: Re: Problem with Avocado and QEMU console
To: Willian Rampazzo <wrampazz@redhat.com>
References: <ac0e8d46-6e57-b454-9162-17dc2f3b6534@amsat.org>
 <CAKJDGDb5GXTLB=7nmdu9_znrf4tVHS+6Rto5vdzYXyNcLG+x8Q@mail.gmail.com>
 <c753b71a-b0a4-a182-976d-00c36edc5e4a@amsat.org>
 <CAKJDGDYuw-A+63wMvDcp7gK8QowoDDN-TwMCFv3i6=kvOqjUdQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <41a3f762-1fbb-c9f8-73b5-6d1d6654d4c5@amsat.org>
Date: Tue, 1 Jun 2021 05:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDYuw-A+63wMvDcp7gK8QowoDDN-TwMCFv3i6=kvOqjUdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.591,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 4:46 PM, Willian Rampazzo wrote:
> On Mon, May 3, 2021 at 10:36 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 5/3/21 3:12 PM, Willian Rampazzo wrote:
>>> Hi Philippe,
>>>
>>> On Mon, May 3, 2021 at 9:59 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> Hi Cleber, Willian,
>>>>
>>>> Avocado marked the test_mips64el_fuloong2e as failed while
>>>> it succeeded:
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/1231363571
>>>>
>>>> Apparently the first part of the console output is missing.
>>>> (Normal console output attached).
>>>>
>>>> Any idea what could be the cause?
>>>>
>>>
>>> The log shows the following:
>>>
>>> 12:00:37 ERROR| avocado.core.exceptions.TestFail: Failure message
>>> found in console: "Kernel panic - not syncing". Expected: "Kernel
>>> command line: printk.time=0 console=ttyS0"
>>>
>>> Does your comment about "console output missing" means the expected
>>> message was supposed to be on this missing part?
>>
>> Yes, "the first part is missing" so Avocado didn't see the expected
>> message pass, but the messages emitted *after* it are logged.
>>
> 
> Okay, got it.
> 
> The reason for it to fail is here:
> https://gitlab.com/qemu-project/qemu/-/blob/master/tests/acceptance/boot_linux_console.py#L53.
> The way the `wait_for_console_pattern` method is defined tells the
> test to fail if that `failure_message` is found.
> 
> I'm still checking why the test missed the first part.

Could this be related to the recent failures in N8x0Machine.test_n810?

https://gitlab.com/qemu-project/qemu/-/jobs/1280746618#L128

