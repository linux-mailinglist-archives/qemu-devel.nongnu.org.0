Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2119513147
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:27:46 +0200 (CEST)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1NB-0005xH-QD
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nk0qU-00037A-NN
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:54:01 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nk0qT-0000tw-3s
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:53:58 -0400
Received: by mail-ej1-x62d.google.com with SMTP id dk23so8460379ejb.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ElEeVwBSr3hgo84y+do+evpRbzMYbPIXq8DP8h9z6zk=;
 b=NdR/Bp2XN3jo+un2y0jhdsR0eN/dK9s8c+0g/bbvpIYhr4nAqLbNSQgrm+441urcRo
 07LG0zzakNt9YlVOpE32kuxEE8TTOqf0cc1mWUGLuFKXp9Ln78QI71lDMPQWvOXILHTz
 PNci1VDczGfuKo6kpDoqmOWD/xhJ5PmwQ0Yn3RjT6wi/KwIwejEtQnZ7ZOtlIedkZ+sI
 OgfxHrkTThRfjCMfSdVyjaPI9k97CE60LxPHN09qgScH1q/OxUWOBBO0PEg829J42lEX
 /iCdJpl+rI7UwogadXtjOjjXWMkdJZ2dtoUSh5ttIHLyHxJA0PDsYhQTMI9mV/Rj+Gr5
 jW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ElEeVwBSr3hgo84y+do+evpRbzMYbPIXq8DP8h9z6zk=;
 b=pb1WYF4XytC3fjQze8663wHFTdxQ49n2LpPeDsrHACNQ17JkzbUuqPtb5ZkDpl7flY
 694LMHp3Xced2tA6LQVo4wN4maMu14hfyqpEoSq1JW3ghvScMev8UNzIOrjxd0zVu3xn
 5+7Ta0gmgdlOemeVarbk1i8mwoME2Vzbk3LXope8KYVm5cLDj5gug5ZkzrXS4QwW393A
 tKA2cfsbZT7SZe09Ff5GKDqEjgYzpi5v0bms9rkghK5tTWJmoUYhW5aiEtYYjk1g1OLE
 0PigFwp0xqXdPnm9ceouD9/LwIVXp1RuUvvQXGxn5c7HU9sXu4zYJNu6wgFrgct1RiUD
 J8+w==
X-Gm-Message-State: AOAM533Bkqk1TgsuyGgQaTRW9zouF+y5MgTTwFUtSTZn4tdZfQzeWNs0
 nxYqnYw2IYcbLT6dDPAZ2f8=
X-Google-Smtp-Source: ABdhPJwtctMlcB3HqbvKNaQQ/pEDTTy3IdcyoEf1RmizBcUdIVIFAHkU0uGTo+mldDRTb1doefjwiw==
X-Received: by 2002:a17:906:9744:b0:6da:9e49:9fe3 with SMTP id
 o4-20020a170906974400b006da9e499fe3mr31367673ejy.319.1651139635274; 
 Thu, 28 Apr 2022 02:53:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 bd28-20020a056402207c00b0042617ba6391sm1269485edb.27.2022.04.28.02.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 02:53:54 -0700 (PDT)
Message-ID: <e3edecfe-1dc7-dc50-4b5f-e8627eee8e80@redhat.com>
Date: Thu, 28 Apr 2022 11:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-8-pbonzini@redhat.com> <YmkwndPwSDxqqdZA@work-vm>
 <6655dcbe-860e-b107-e63e-ff397189d178@redhat.com> <Ymk4U4O4CN3e7+9A@work-vm>
 <2aed3f83-5941-d723-7c27-cc657f7c257a@redhat.com> <YmleMMNkZ8ukENDZ@work-vm>
 <cde483f2-28ee-88fb-921d-336186ff8222@redhat.com> <Yml6bAfSs+4eGtfj@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yml6bAfSs+4eGtfj@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 19:16, Dr. David Alan Gilbert wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>> On 4/27/22 17:16, Dr. David Alan Gilbert wrote:
>>> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>>>> On 4/27/22 14:34, Dr. David Alan Gilbert wrote:
>>>>> If I specify a 'vm' it's not obvious to me whether I'd get NICs and
>>>>> block devices in the future?
>>>>
>>>> VM would not get those (it's global statistics), but the size could balloon
>>>> if you specify no target at all.
>>>>
>>>>> Adding a syntax for 'all' into the vcpus list would fix that?
>>>>
>>>> I don't like having special syntax.  The current QAPI just doesn't filter
>>>> what is not in the arguments.
>>>
>>> Is there a object that represents the set of all vcpus?
>>
>> No.
> 
> If it was easy to create one then you could remove all the special
> casing of vCPUs/VM target?
> (It feels really like you should call a 'stats' method on the target)

There are two possibilities for that:

1) add statistics to an object like /machine, that would return the 
sum/max of the statistics.  Advantage: you have an easy way to summarize 
stats without reading many KBs of data. Disadvantage: it doesn't do what 
you're asking. :)  But it may be an interesting addition.

2) make query-stats return the statistics for all objects below a given 
QOM path, and then the caller would pass / or /machine as the target.

Both make sense, but neither extends easily to the case where you don't 
have a QOM path, as is the case for block or network devices. 
Unfortunately, both of them are prime candidates for extending the 
subsystem, so they can't be dismissed easily, and that is why 
implemented neither of them.

If block or network devices were QOM, it would be possible and easy to 
have a single "qom-path" argument to replace both "target" and the 
sub-records like StatsVCPUFilter.

Paolo

