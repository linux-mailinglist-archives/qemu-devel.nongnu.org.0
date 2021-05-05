Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE3373E91
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:32:51 +0200 (CEST)
Received: from localhost ([::1]:34932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJW6-0001b6-9i
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leJSX-0008FB-Tn
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leJSU-00043v-60
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620228545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDdpqs3tfIWJVrHbBw8hZ+NCVPTorvGxAt7OMDVgjCo=;
 b=XRg5nFAaMAtAoHzSMWfnmeghKcuHnCKgfEdnNMdl5t/n4/xnvqNBu1owspuZ3QWH1dx0Qq
 mTRwGRGOQ2+bH9q7O/+z2ZWmYwWjfamIJstAiAqbIddKHk4ZQSzm/zr6SMOJGT69cddTTW
 S5Qoit7ee+uisBWgdzl0vvolZicLRp4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-MQBGNPLSOlWpTECpZWmexA-1; Wed, 05 May 2021 11:29:00 -0400
X-MC-Unique: MQBGNPLSOlWpTECpZWmexA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l4-20020a7bcf040000b029014daf4d9d3aso464744wmg.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wDdpqs3tfIWJVrHbBw8hZ+NCVPTorvGxAt7OMDVgjCo=;
 b=BIxsTdzclx9L6eZgHYsdJ3B31nx6i7ha9ArFhrtNEQxypqzgJyBVpnj85M+X3tO9M4
 FPH7L3Xe6kHIVLmCW1IoMyHFuwobq/64RXxGiPPZBIoh/Y/F8HPQEMjAzJcsIro5omlL
 RdeUIEgm0P7GSxK8SeDGHrO6Lbr5G8gmoIP9ISW11KkcRgNameq8NC0oWIL8odsTxvYh
 7EetUlYn3CcVIUbXSEkct6wfkRRoIFqPqZD8P9RGaqTj3F9tRt45RUmkESm3Nf26VYHt
 bCjxWMXWC3vTjBXmFXCO0gYiSia5BJtx2pVP6Z7WUEtwQBSBDPKqaupyFsRf0W3LmTFF
 jxOg==
X-Gm-Message-State: AOAM5337fGaWt3hkjs/zDu2NhlpbEIn9cIfqlOlbZturhAFTF3qXqIU3
 nneqXwY1k+hTIncLQsNZssC/fr78FtN++2r1ba3l49iPrLCf5Ff/rYuzVfQOtY4++vigcAKdWLe
 Nsi2ablcRfk8c3cY=
X-Received: by 2002:a1c:e387:: with SMTP id a129mr34177993wmh.61.1620228538893; 
 Wed, 05 May 2021 08:28:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT9fah2JjrvrmX72L4D0m1sJD89u0Z6lEulvB3BCi6Jz+y04tO486IWz7LisWsOkE3t7U0MQ==
X-Received: by 2002:a1c:e387:: with SMTP id a129mr34177964wmh.61.1620228538695; 
 Wed, 05 May 2021 08:28:58 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id i3sm5716808wmq.28.2021.05.05.08.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 08:28:58 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-3-philmd@redhat.com>
 <87o8dpvet4.fsf@dusky.pond.sub.org>
 <918d1fc1-260c-57b7-2dd9-61f1125a2aa2@redhat.com>
 <87tunhns16.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <44333ee1-6096-1fb4-cf95-6e3d74b36bf1@redhat.com>
Date: Wed, 5 May 2021 17:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87tunhns16.fsf@dusky.pond.sub.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 5:01 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 5/5/21 9:07 AM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> Introduce the 'query-accels' QMP command which returns a list
>>>> of built-in accelerator names.
>>>>
>>>> - Accelerator is a QAPI enum of all existing accelerators,
>>>>
>>>> - AcceleratorInfo is a QAPI structure providing accelerator
>>>>   specific information. Currently the common structure base
>>>>   provides the name of the accelerator, while the specific
>>>>   part is empty, but each accelerator can expand it.
>>>>
>>>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>>>
>>>> For example on a KVM-only build we get:
>>>>
>>>>     { "execute": "query-accels" }
>>>>     {
>>>>         "return": [
>>>>             {
>>>>                 "name": "qtest"
>>>>             },
>>>>             {
>>>>                 "name": "kvm"
>>>>             }
>>>>         ]
>>>>     }
>>>>
>>>> Note that we can't make the enum values or union branches conditional
>>>> because of target-specific poisoning of accelerator definitions.
>>>
>>> Let me try to complete this argument;
>>>
>>>   If we did, enum Accelerator could only be used in target-specific
>>>   code.  But we want to use it in generic code, too.
>>>
>>> Which generic code exactly?
>>
>>
>> cpu.c:133:#ifdef CONFIG_TCG
>> hmp-commands-info.hx:271:#if defined(CONFIG_TCG)
>> monitor/misc.c:324:#ifdef CONFIG_TCG
>> softmmu/physmem.c:28:#ifdef CONFIG_TCG
>>
>> and more importantly:
>>
>> include/exec/cpu-all.h:430:#ifdef CONFIG_TCG
>> include/exec/cpu-defs.h:77:#if !defined(CONFIG_USER_ONLY) &&
>> defined(CONFIG_TCG)
>> include/exec/exec-all.h:25:#ifdef CONFIG_TCG
>> include/sysemu/cpu-timers.h:27:#ifdef CONFIG_TCG
>>
>> Thomas might provide more cases, IIRC he audited this recently.
> 
> No need, I'm interested in examples, not a complete list.
> 
> Please amend the commit message:
> 
>     Note that we can't make the enum values or union branches conditional
>     because of target-specific poisoning of accelerator definitions.
>     If we did, enum Accelerator could only be used in target-specific
>     code.  But we want to also use it in generic code, such as ...
> 
> with ... replaced by one or more references to relevant code.
> 
> If we expect readers of the code to later wonder why we're not using
> QAPI conditionals, then we should add a comment to the QAPI schema,
> too.  Not a demand, since I'm not sure what to expect.

OK, will do in v8.


