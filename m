Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3908380733
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 12:29:40 +0200 (CEST)
Received: from localhost ([::1]:56258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhV4d-0007ah-W2
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 06:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhUy5-0000LV-QV
 for qemu-devel@nongnu.org; Fri, 14 May 2021 06:22:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhUy2-0007P9-HV
 for qemu-devel@nongnu.org; Fri, 14 May 2021 06:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620987769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tlXm9fVnhbKRgOmNDNe/uaJeAebTfBheO3ZsqWoNnUk=;
 b=h3abC28qxI4xGJt4YyW4O4ioAGmaXd9PVdRYkAd2+xWlc95OGWZibsZZZMSpNnfzj6EWme
 pJTc29mXc7Xh4LAI/Po7i5j84kxwtkBth0Vc5Dbt+W0PVwoq/6DgX6tYIONk4aibvsTh4L
 iPEOBfB8XaZwt9l5iqgM5vhl0GTVkdc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-LwlI5fRXMoGsC2YZPmxKuw-1; Fri, 14 May 2021 06:22:48 -0400
X-MC-Unique: LwlI5fRXMoGsC2YZPmxKuw-1
Received: by mail-ed1-f71.google.com with SMTP id
 k10-20020a50cb8a0000b0290387e0173bf7so16258248edi.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 03:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tlXm9fVnhbKRgOmNDNe/uaJeAebTfBheO3ZsqWoNnUk=;
 b=fblBqU2WWGsYY5Ic3708rL6jQHN8wu0Ld3iATMbJLfpZJv0oxvh3NW6lU9OvshJ+/I
 iQjwOVdUyBN7bzbB18BMSHMSjSJj8WmKI3Xt2wuNYsIK0o2tFTggdAOLR7GXKtWuBBjQ
 37McSGJJyImDqUYChns4TwfLcHlTUf4R1lm3FL42YnDI3ROw2W4qy/YkUWqXRBhiTJZm
 AxXH3UkEtw/SPPvvkr/CZD+pGTVi4eepjKNuaa6Rki0sWg8MV+2GfErk3RcOeada0pyl
 TKh4g56nhXkWLWEAvNqhVBHL3P/wQF2vwahc8o5bvqvTj/rKwaCLYQQwl8Gnz7HsWWCX
 ZAVg==
X-Gm-Message-State: AOAM533vsSkqVhbJXkn5WYoDPeyKqzm/x2ejPuLOtgRZRhBNCXbrD8jn
 vKCdCLJbfNoCAk7gLHe7BCN2zxY4fl32EEo7mfGi6Dx2S5C57vSymIi8+nNhybPAh5KnLW5+jso
 YwZqczrPkwTMWDb+8R/u2oYjUb3bzOF+NKqpfXulFGCYQcKaQYTy97hNhjN9QBvF8
X-Received: by 2002:a17:906:2559:: with SMTP id
 j25mr46881415ejb.42.1620987766279; 
 Fri, 14 May 2021 03:22:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLhx/JtnPFs6B7SIzG1yj8S9QK3kgmgkWD78xTN6IS3J8st237fHnYlxVAQ6+CpfE4wkggnA==
X-Received: by 2002:a17:906:2559:: with SMTP id
 j25mr46881394ejb.42.1620987765956; 
 Fri, 14 May 2021 03:22:45 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id cq9sm2577110edb.44.2021.05.14.03.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 03:22:45 -0700 (PDT)
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11382e1f-4ab9-6f04-6c53-938bd50a1e78@redhat.com>
Date: Fri, 14 May 2021 12:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b2a28a69-2525-b07e-bec8-65d7439f1154@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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

On 5/9/21 6:05 PM, Thomas Huth wrote:
> On 07/05/2021 14.41, Paolo Bonzini wrote:
>> On 07/05/21 11:45, Thomas Huth wrote:
>>>
>>>
>>> diff --git a/Makefile b/Makefile
>>> index bcbbec71a1..3088502329 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -85,7 +85,8 @@ x := $(shell rm -rf meson-private meson-info
>>> meson-logs)
>>>   endif
>>>
>>>   # 1. ensure config-host.mak is up-to-date
>>> -config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios
>>> $(SRC_PATH)/VERSION
>>> +config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios
>>> $(SRC_PATH)/VERSION \
>>> +                $(SRC_PATH)/default-configs/targets
>>>          @echo config-host.mak is out-of-date, running configure
>>>          @if test -f meson-private/coredata.dat; then \
>>>            ./config.status --skip-meson; \
>>>
>>> I.e. re-run configure if somethings in default-configs/targets changed.
>>> Does that look sane?
>>
>> I am not sure if using a directory is reliable (it's pre-existing for
>> pc-bios).  However you probably can use
>>
>> # currently in tests/Makefile.include, move it to toplevel Makefile
>> TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa,
>> $(ninja-targets)))
>> config-host.mak: $(SRC_PATH)/configure
>> $(TARGETS:%=default-configs/targets/%)
>>
>> And then if a file goes missing it will trigger the rebuild of
>> config-host.mak.
> 
> Sounds like an idea, too ... but I'm unsure whether it's doable due to
> the order of the statements there... TARGETS gets populated from
> ninja-targets, but ninja-targets gets set *after* the config-host.mak
> block ... would it be safe to move the config-host.mak block around?

Not sure I understood Paolo's suggestion, I tried:

-- >8 --
diff --git a/Makefile b/Makefile
index bcbbec71a1c..3ef3622228b 100644
--- a/Makefile
+++ b/Makefile
@@ -152,6 +152,10 @@ ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
        +$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) -d keepdepfile \
           $(NINJAFLAGS) $(sort $(filter $(ninja-targets),
$(ninja-cmd-goals))) | cat)
 endif
+
+TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa,
$(ninja-targets)))
+config-host.mak: $(SRC_PATH)/configure
$(TARGETS:%=default-configs/targets/%)
+
 endif

 # Force configure to re-run if the API symbols are updated
---

But still get (after git pull this morning):

$ ninja qemu-system-ppc
[0/1] Regenerating build files.
...
meson.build:1303:2: ERROR: Failed to load
default-configs/targets/moxie-softmmu.mak: [Errno 2] No such file or
directory: 'default-configs/targets/moxie-softmmu.mak'
A full log can be found at meson-logs/meson-log.txt
FAILED: build.ninja

I'm keeping the directory unmodified in case you want me to try
other fixes.


