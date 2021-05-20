Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53099389B7A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 04:42:20 +0200 (CEST)
Received: from localhost ([::1]:45640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljYde-0007Hh-Ei
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 22:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljYcJ-0006ab-1W
 for qemu-devel@nongnu.org; Wed, 19 May 2021 22:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljYcF-0005ve-L7
 for qemu-devel@nongnu.org; Wed, 19 May 2021 22:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621478449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6wqjW1+oVrdBk9/2x05FFD6aYEVdUmhQMw0xxAoGrHc=;
 b=SxYrC3vaPPJ64eTZs8rchxkq1aj5gE5TGK6Xt4fE2D3rusKFylVl7Bs71VDZy7QfsuveVp
 2DPC0XU7VWE1WefTXYJccowSr8ensj+qfqVBFHCh2hU26u6ddgOIiPk1qAYt51ywLXnw+O
 jCZuWBmxKFBIzIsSZJ7UbIUckE/PAjc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Z7jjSZe2PEa_I5ym7CwP6Q-1; Wed, 19 May 2021 22:40:47 -0400
X-MC-Unique: Z7jjSZe2PEa_I5ym7CwP6Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso8020639wrh.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 19:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6wqjW1+oVrdBk9/2x05FFD6aYEVdUmhQMw0xxAoGrHc=;
 b=j6EcrRUkmPNyixCz1JrwqbqnyYRCAIv30DrSCtFhOCfi3AYtvDTHMdmySDyD8dsc7f
 ercrEqCQjTbs9nymltME6OyppVNgsKgV6L3xmctx96pQ2Cs2aYXzQUEi/gX6bjwje7r0
 iZtCAz8LWSFtTbuCn6HQM/ZJiW9hZPbVBIQhEb2Ujp2z9aVbKu3XnnX5RiTTUwixzVxy
 t9ZxHfoSWPZa9fVondqJf7ZpMcKT4Vy36Rtw9taaXmXW8JhY5UF6Bc3SyMqWrZfhX9Mm
 D4JdHrqcD3Qd5vwHQo5J8hiQpTbzfvEkmhC3xLNj4C0OjxJx/UVlk8O7CmchnnzwAYPn
 uDWA==
X-Gm-Message-State: AOAM5302cd1EjcaK5HzETdRkVwYM44Ynzuxm4uGo0qfuLz9tEKBHQa/K
 tKggkgFeN3+MkLLp8w8ELY5MozJrvjSMw0FbwwEWSOjORMvi6Uht82lj31h8vprOWbms7TM4heB
 uZT5X1NHa8wmQtvf7oAiHDAdz81S+hd1Lbau0Es82LODxrjGIWjfhk0/i1WxIAjVs
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr1735223wmj.157.1621478445494; 
 Wed, 19 May 2021 19:40:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO4PJxSk09jKRbmGyLEcwuMQPo6CxRwV/t4AjdOIdYmJ3vY5Q3xhVSSsNhMCkmGIAqzfFbsA==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr1735208wmj.157.1621478445179; 
 Wed, 19 May 2021 19:40:45 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d3sm1234949wri.75.2021.05.19.19.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 19:40:44 -0700 (PDT)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
 <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
 <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
 <d5bf0064-052e-a0c7-cc17-72db815949e2@redhat.com>
 <b2a28a69-2525-b07e-bec8-65d7439f1154@redhat.com>
 <11382e1f-4ab9-6f04-6c53-938bd50a1e78@redhat.com>
 <9840231d-9b5b-a61e-fd8c-098c1a9a7596@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <75e088da-b815-8f97-acf2-1743205967f5@redhat.com>
Date: Thu, 20 May 2021 04:40:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9840231d-9b5b-a61e-fd8c-098c1a9a7596@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 12:25 PM, Thomas Huth wrote:
> On 14/05/2021 12.22, Philippe Mathieu-Daudé wrote:
>> On 5/9/21 6:05 PM, Thomas Huth wrote:
>>> On 07/05/2021 14.41, Paolo Bonzini wrote:
>>>> On 07/05/21 11:45, Thomas Huth wrote:
>>>>>
>>>>>
>>>>> diff --git a/Makefile b/Makefile
>>>>> index bcbbec71a1..3088502329 100644
>>>>> --- a/Makefile
>>>>> +++ b/Makefile
>>>>> @@ -85,7 +85,8 @@ x := $(shell rm -rf meson-private meson-info
>>>>> meson-logs)
>>>>>    endif
>>>>>
>>>>>    # 1. ensure config-host.mak is up-to-date
>>>>> -config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios
>>>>> $(SRC_PATH)/VERSION
>>>>> +config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios
>>>>> $(SRC_PATH)/VERSION \
>>>>> +                $(SRC_PATH)/default-configs/targets
>>>>>           @echo config-host.mak is out-of-date, running configure
>>>>>           @if test -f meson-private/coredata.dat; then \
>>>>>             ./config.status --skip-meson; \
>>>>>
>>>>> I.e. re-run configure if somethings in default-configs/targets
>>>>> changed.
>>>>> Does that look sane?
>>>>
>>>> I am not sure if using a directory is reliable (it's pre-existing for
>>>> pc-bios).  However you probably can use
>>>>
>>>> # currently in tests/Makefile.include, move it to toplevel Makefile
>>>> TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa,
>>>> $(ninja-targets)))
>>>> config-host.mak: $(SRC_PATH)/configure
>>>> $(TARGETS:%=default-configs/targets/%)
>>>>
>>>> And then if a file goes missing it will trigger the rebuild of
>>>> config-host.mak.
>>>
>>> Sounds like an idea, too ... but I'm unsure whether it's doable due to
>>> the order of the statements there... TARGETS gets populated from
>>> ninja-targets, but ninja-targets gets set *after* the config-host.mak
>>> block ... would it be safe to move the config-host.mak block around?
>>
>> Not sure I understood Paolo's suggestion, I tried:
>>
>> -- >8 --
>> diff --git a/Makefile b/Makefile
>> index bcbbec71a1c..3ef3622228b 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -152,6 +152,10 @@ ifneq ($(filter $(ninja-targets),
>> $(ninja-cmd-goals)),)
>>          +$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) -d keepdepfile \
>>             $(NINJAFLAGS) $(sort $(filter $(ninja-targets),
>> $(ninja-cmd-goals))) | cat)
>>   endif
>> +
>> +TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa,
>> $(ninja-targets)))
>> +config-host.mak: $(SRC_PATH)/configure
>> $(TARGETS:%=default-configs/targets/%)
>> +
>>   endif
>>
>>   # Force configure to re-run if the API symbols are updated
>> ---
>>
>> But still get (after git pull this morning):
>>
>> $ ninja qemu-system-ppc
>> [0/1] Regenerating build files.
>> ...
>> meson.build:1303:2: ERROR: Failed to load
>> default-configs/targets/moxie-softmmu.mak: [Errno 2] No such file or
>> directory: 'default-configs/targets/moxie-softmmu.mak'
>> A full log can be found at meson-logs/meson-log.txt
>> FAILED: build.ninja
>>
>> I'm keeping the directory unmodified in case you want me to try
>> other fixes.
> 
> If you run ninja directly, you certainly won't fix this issue by
> patching the "Makefile" ;-)

OK... Not sure how to detect it from ninja then.

For now I'm blowing this builddir and start with a fresh one.

If we want to reproduce to fix we can checkout before/after your
pull request tag. Eventually it will be automagically fixed when
we'll remove the next target :)

Regards,

Phil.


