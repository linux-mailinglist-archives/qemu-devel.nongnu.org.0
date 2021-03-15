Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7933B228
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:08:46 +0100 (CET)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLm1d-0005ai-W4
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLls9-0000Ay-Ux
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:58:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLls7-0004xk-11
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615809534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WA9Rnr2yqHzP3JI1Rqoqgc7ndUeiub8q4edtQgWgrC0=;
 b=fvAywXdHcLtz+nr855ER4G3803Xw4VO9qZon5qhoAsHZN0bj9mX78EdbHExoyPqVRRjGx5
 HWcC+h3SGvMu28XwEN1AEOFJKQmD1Y+ndE93m1e93uE0nFaKPjyoSQVyR7Q1PeLMnd5rfD
 TatYQSR9ct7Psl1APYbsN2WEvFoFQXk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-9Ak03MLLPLCcOjimxvV-8A-1; Mon, 15 Mar 2021 07:58:52 -0400
X-MC-Unique: 9Ak03MLLPLCcOjimxvV-8A-1
Received: by mail-wm1-f69.google.com with SMTP id v5so8081669wml.9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WA9Rnr2yqHzP3JI1Rqoqgc7ndUeiub8q4edtQgWgrC0=;
 b=rUHB3Q4mp1uPSw3TCosj1AoA8sVKBgLI/e+zwhde5HZQdUYfI4wpN+f3mFROFkwn8+
 essSHSd6gObFbe4eSrWppYxfPu/xGQXL3ZVW4UtWP/XHlLwft4lUH0mrCP5ea5zFESdR
 rEBiwwf1S7oUdtps+6+kzAoSa510vryKwaRyUb6CWgvyyCf/Wi19Q37y3MCZJywWonQT
 cnvkbDPDG7OgGytqiediZTOsRhNFoPSyFKPD5AOIkatscp9nHAgguYr9nwTpVleCwpz3
 95hEs+BXAjAgfAIAyTKYXBTI8kJTTItwAvDDzM1IRWwKt36L9wc0Tw9/IBRaD02zPBdk
 RGFA==
X-Gm-Message-State: AOAM532kOIAJu4ZOoapR3C3KFGYTmvPIX1D3Q6YBHtGScXpTpEPFVkpG
 YUqwfXdKAA6tjnoiX+l5OctcHM+9YuF5SDCxjwINLbBFbzICj7SNeEwEY8xQob6tF0YOkElUyNq
 WAoMf3Wgwbr8yNRA=
X-Received: by 2002:a05:6000:24b:: with SMTP id
 m11mr27030404wrz.393.1615809531745; 
 Mon, 15 Mar 2021 04:58:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0Xmavy5pTfhY+SzyVuh4Wj0PmuA+7a3HcmAm1KtioRVRNtYHK9uIxdT/nXvhffn5XcbVXdA==
X-Received: by 2002:a05:6000:24b:: with SMTP id
 m11mr27030374wrz.393.1615809531495; 
 Mon, 15 Mar 2021 04:58:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id s20sm12045254wmj.36.2021.03.15.04.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 04:58:50 -0700 (PDT)
Subject: Re: [PATCH v3 27/30] hmp: QAPIfy object_add
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-28-kwolf@redhat.com>
 <87pn03rxmq.fsf@dusky.pond.sub.org>
 <cb9bee91-8d38-b232-44bd-b163d7081395@redhat.com>
 <87tupckb7d.fsf@dusky.pond.sub.org> <YE9AWksF89nc2NjV@merkur.fritz.box>
 <YE9HSDSVK5XpupIL@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <79a14a45-6d5e-2c29-dabf-9ac8373cf317@redhat.com>
Date: Mon, 15 Mar 2021 12:58:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YE9HSDSVK5XpupIL@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/21 12:38, Dr. David Alan Gilbert wrote:
> * Kevin Wolf (kwolf@redhat.com) wrote:
>> Am 15.03.2021 um 10:39 hat Markus Armbruster geschrieben:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> On 13/03/21 14:28, Markus Armbruster wrote:
>>>>> Kevin Wolf <kwolf@redhat.com> writes:
>>>>>
>>>>>> This switches the HMP command object_add from a QemuOpts-based parser to
>>>>>> user_creatable_add_from_str() which uses a keyval parser and enforces
>>>>>> the QAPI schema.
>>>>>>
>>>>>> Apart from being a cleanup, this makes non-scalar properties and help
>>>>>> accessible. In order for help to be printed to the monitor instead of
>>>>>> stdout, the printf() calls in the help functions are changed to
>>>>>> qemu_printf().
>>>>>>
>>>>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>>>>> Acked-by: Peter Krempa <pkrempa@redhat.com>
>>>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>>> ---
>>>>>>    monitor/hmp-cmds.c      | 17 ++---------------
>>>>>>    qom/object_interfaces.c | 11 ++++++-----
>>>>>>    hmp-commands.hx         |  2 +-
>>>>>>    3 files changed, 9 insertions(+), 21 deletions(-)
>>>>>>
>>>>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>>>>> index 3c88a4faef..652cf9ff21 100644
>>>>>> --- a/monitor/hmp-cmds.c
>>>>>> +++ b/monitor/hmp-cmds.c
>>>>>> @@ -1670,24 +1670,11 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
>>>>>>    
>>>>>>    void hmp_object_add(Monitor *mon, const QDict *qdict)
>>>>>>    {
>>>>>> +    const char *options = qdict_get_str(qdict, "object");
>>>>>>        Error *err = NULL;
>>>>>> -    QemuOpts *opts;
>>>>>> -    Object *obj = NULL;
>>>>>> -
>>>>>> -    opts = qemu_opts_from_qdict(qemu_find_opts("object"), qdict, &err);
>>>>>> -    if (err) {
>>>>>> -        goto end;
>>>>>> -    }
>>>>>>    
>>>>>> -    obj = user_creatable_add_opts(opts, &err);
>>>>>> -    qemu_opts_del(opts);
>>>>>> -
>>>>>> -end:
>>>>>> +    user_creatable_add_from_str(options, &err);
>>>>>>        hmp_handle_error(mon, err);
>>>>>> -
>>>>>> -    if (obj) {
>>>>>> -        object_unref(obj);
>>>>>> -    }
>>>>>>    }
>>>>>
>>>>> Doesn't this break the list-valued properties (Memdev member host-nodes,
>>>>> NumaNodeOptions member cpus) exactly the same way that made us keep
>>>>> QemuOpts for qemu-system-FOO -object?
>>>>
>>>> Yes, it does.  I guess it can just be documented, unlike for the command
>>>> line?
>>>
>>> Maybe.  Judgement call, not mine to make.
>>>
>>> Do people create such objects in HMP?  I figure we don't really know.
>>> Educated guess?
>>>
>>> If you try, how does it break?  Is it confusing?  Can you show an
>>> example?
>>
>> (qemu) object_add memory-backend-ram,id=mem,size=4G,policy=bind,host-nodes=0
>> Error: Invalid parameter type for 'host-nodes', expected: array
>> (qemu) object_add memory-backend-ram,id=mem,size=4G,policy=bind,host-nodes.0=0
>> (qemu)
>>
>> HMP is not a stable interface, so changing the syntax didn't feel like a
>> problem to me. I doubt many people do HMP memory hotplug while setting a
>> specific NUMA policy, but it wouldn't change my assessment anyway. I
>> should have made this explicit in the commit message, though.
> 
> I'm OK for it to change, but yes I'd like to have the before/after
> syntax listed somewhere as easy references for people confused.

I think we should try to improve the string-value QObject visitor to 
also allow JSON values in some places, for example to allow

object_add 
memory-backend-ram,id=mem,size=4G,policy=bind,host-nodes=[0,1,2,3]

Paolo


