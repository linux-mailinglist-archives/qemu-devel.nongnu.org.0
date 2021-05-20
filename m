Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032E389CF0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:10:22 +0200 (CEST)
Received: from localhost ([::1]:34112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljawv-0001O7-7Z
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljavZ-0000BV-Ll
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljavT-0005Ov-1d
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621487329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87OUABg7I5yoGNAIeRRUo7ij+mWXDOFSmOzRHBYT1us=;
 b=imDcoIR1mpgKIZer0N5rNFZXBG3sY2kopPeXSz7eiGCEpafE7ocYxjQmKe1+BYtQUfu7wV
 AmtR4miQRXYFHkkY9zy5oQ4gp0/1i/2kNuPjJt7/dJfTkaSsGDMbnJmT7VynpAuvMyR13M
 9hR8YFSbQRwHhNE7GHzLhhu8lOWY25o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-4urIu43RNnuoMyym0N0GqQ-1; Thu, 20 May 2021 01:08:47 -0400
X-MC-Unique: 4urIu43RNnuoMyym0N0GqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51E901020C3E;
 Thu, 20 May 2021 05:08:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1122836D5;
 Thu, 20 May 2021 05:08:44 +0000 (UTC)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
 <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
 <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
 <d5bf0064-052e-a0c7-cc17-72db815949e2@redhat.com>
 <b2a28a69-2525-b07e-bec8-65d7439f1154@redhat.com>
 <11382e1f-4ab9-6f04-6c53-938bd50a1e78@redhat.com>
 <9840231d-9b5b-a61e-fd8c-098c1a9a7596@redhat.com>
 <75e088da-b815-8f97-acf2-1743205967f5@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3b1e8f37-7d38-1450-b288-c23c2d14b90a@redhat.com>
Date: Thu, 20 May 2021 07:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <75e088da-b815-8f97-acf2-1743205967f5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 20/05/2021 04.40, Philippe Mathieu-Daudé wrote:
> On 5/14/21 12:25 PM, Thomas Huth wrote:
>> On 14/05/2021 12.22, Philippe Mathieu-Daudé wrote:
>>> On 5/9/21 6:05 PM, Thomas Huth wrote:
>>>> On 07/05/2021 14.41, Paolo Bonzini wrote:
>>>>> On 07/05/21 11:45, Thomas Huth wrote:
>>>>>>
>>>>>>
>>>>>> diff --git a/Makefile b/Makefile
>>>>>> index bcbbec71a1..3088502329 100644
>>>>>> --- a/Makefile
>>>>>> +++ b/Makefile
>>>>>> @@ -85,7 +85,8 @@ x := $(shell rm -rf meson-private meson-info
>>>>>> meson-logs)
>>>>>>     endif
>>>>>>
>>>>>>     # 1. ensure config-host.mak is up-to-date
>>>>>> -config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios
>>>>>> $(SRC_PATH)/VERSION
>>>>>> +config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios
>>>>>> $(SRC_PATH)/VERSION \
>>>>>> +                $(SRC_PATH)/default-configs/targets
>>>>>>            @echo config-host.mak is out-of-date, running configure
>>>>>>            @if test -f meson-private/coredata.dat; then \
>>>>>>              ./config.status --skip-meson; \
>>>>>>
>>>>>> I.e. re-run configure if somethings in default-configs/targets
>>>>>> changed.
>>>>>> Does that look sane?
>>>>>
>>>>> I am not sure if using a directory is reliable (it's pre-existing for
>>>>> pc-bios).  However you probably can use
>>>>>
>>>>> # currently in tests/Makefile.include, move it to toplevel Makefile
>>>>> TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa,
>>>>> $(ninja-targets)))
>>>>> config-host.mak: $(SRC_PATH)/configure
>>>>> $(TARGETS:%=default-configs/targets/%)
>>>>>
>>>>> And then if a file goes missing it will trigger the rebuild of
>>>>> config-host.mak.
>>>>
>>>> Sounds like an idea, too ... but I'm unsure whether it's doable due to
>>>> the order of the statements there... TARGETS gets populated from
>>>> ninja-targets, but ninja-targets gets set *after* the config-host.mak
>>>> block ... would it be safe to move the config-host.mak block around?
>>>
>>> Not sure I understood Paolo's suggestion, I tried:
>>>
>>> -- >8 --
>>> diff --git a/Makefile b/Makefile
>>> index bcbbec71a1c..3ef3622228b 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -152,6 +152,10 @@ ifneq ($(filter $(ninja-targets),
>>> $(ninja-cmd-goals)),)
>>>           +$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) -d keepdepfile \
>>>              $(NINJAFLAGS) $(sort $(filter $(ninja-targets),
>>> $(ninja-cmd-goals))) | cat)
>>>    endif
>>> +
>>> +TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa,
>>> $(ninja-targets)))
>>> +config-host.mak: $(SRC_PATH)/configure
>>> $(TARGETS:%=default-configs/targets/%)
>>> +
>>>    endif
>>>
>>>    # Force configure to re-run if the API symbols are updated
>>> ---
>>>
>>> But still get (after git pull this morning):
>>>
>>> $ ninja qemu-system-ppc
>>> [0/1] Regenerating build files.
>>> ...
>>> meson.build:1303:2: ERROR: Failed to load
>>> default-configs/targets/moxie-softmmu.mak: [Errno 2] No such file or
>>> directory: 'default-configs/targets/moxie-softmmu.mak'
>>> A full log can be found at meson-logs/meson-log.txt
>>> FAILED: build.ninja
>>>
>>> I'm keeping the directory unmodified in case you want me to try
>>> other fixes.
>>
>> If you run ninja directly, you certainly won't fix this issue by
>> patching the "Makefile" ;-)
> 
> OK... Not sure how to detect it from ninja then.

Every time you pull, there could be changes to the "configure" script which 
affect the build ... I guess you also won't notice those when you're only 
compiling with ninja? Thus at least after pulling from upstream, I think you 
have to type "make" once at least.

  Thomas


