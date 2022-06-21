Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD5C553A87
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 21:28:40 +0200 (CEST)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3jYE-00081f-Qv
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 15:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3jXI-0007Mb-Vj
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 15:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3jXF-0006FK-Gj
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 15:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655839656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hoJA/FslyJ+XFAwQIG/MjhnNSoWyuOHD/exd9mTd3YM=;
 b=hI9XlyXgeNfrxwV3hsvo5Yr2b2/b4XxO/QEEIapGH53MM3q69Oxp1EE9vxBF3HNNi56HPM
 K1X9O1kWVdot208R7mr0Zzz+Siy9gKjWv642jr5DpnnCZcLm2AKiaoGg4AErJodSE0/Xdl
 oauaPAQyjSAh74/s/NppYfdTjI01KPk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-OQoGq0WMNh-jeiZDsA-0Ng-1; Tue, 21 Jun 2022 15:27:27 -0400
X-MC-Unique: OQoGq0WMNh-jeiZDsA-0Ng-1
Received: by mail-qk1-f200.google.com with SMTP id
 k188-20020a37a1c5000000b006a6c4ce2623so17507053qke.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 12:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hoJA/FslyJ+XFAwQIG/MjhnNSoWyuOHD/exd9mTd3YM=;
 b=uUvmo2xQJsVzGIB72NkYaSAo5tZK0FsZ/8TQMB4lgR04khPvMEIU/dSH3DqIghb9qf
 Mmcr6EiMrObotZVJhkIbU3b1JmXa7V0LBw+BAj+LBHDpCHPXXu1zEHlpXFqmGnRiErly
 8OUWYDfnpyDKxyzURkep9v3NYhSwCPNktDuXNBhZ1ZkZFJAp4HCAqHxSJ/TdtqL9n4wT
 H3oeZpv63qeYRKUR6Ff8q9ipatHh9gON9Glzgwu7fv12UVuGjIT43tpjQpmglDLwcLr3
 YuPBwt3zt82HAjYSDtzKE53G4wSr01RPjfy3/JLczpsQ1uvRuznuWa9UdfF+vYhPz7Uc
 p9cQ==
X-Gm-Message-State: AJIora/7QStsNF8DoizCcSTu9ExGMmLXSaT4bEWVCSaVvctpniXMQhE2
 79j9g/aVBlllCOjoDzfUK+nQ5FbT9PKZCRh929U+52TXNZ6KVWByiCzR2ltPzFeV7nu6W2/3xE5
 vv5ug9IR17zjtWHU=
X-Received: by 2002:a05:620a:1724:b0:6a7:6196:a651 with SMTP id
 az36-20020a05620a172400b006a76196a651mr21388310qkb.613.1655839647303; 
 Tue, 21 Jun 2022 12:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vmDmGORppWwDjrzfF9+ie9BGt0O8JCop1EZlF2fuR8aQj3Jr9ddeGVKZK2haSdyU5W5tPTXw==
X-Received: by 2002:a05:620a:1724:b0:6a7:6196:a651 with SMTP id
 az36-20020a05620a172400b006a76196a651mr21388285qkb.613.1655839646999; 
 Tue, 21 Jun 2022 12:27:26 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 g17-20020ac87751000000b00304efddbd70sm12844833qtu.92.2022.06.21.12.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 12:27:26 -0700 (PDT)
Message-ID: <efce9c42-77f4-a2c0-e379-fc8b71e8e191@redhat.com>
Date: Tue, 21 Jun 2022 21:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v3 04/11] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20220620101828.518865-1-lvivier@redhat.com>
 <20220620101828.518865-5-lvivier@redhat.com> <874k0fz7gg.fsf@pond.sub.org>
 <7eb9f5a3-5166-ee8d-86f8-1d05770331f6@redhat.com>
 <87tu8ev1ta.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87tu8ev1ta.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/06/2022 10:49, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> On 20/06/2022 17:21, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>
>>>> Copied from socket netdev file and modified to use SocketAddress
>>>> to be able to introduce new features like unix socket.
>>>>
>>>> "udp" and "mcast" are squashed into dgram netdev, multicast is detected
>>>> according to the IP address type.
>>>> "listen" and "connect" modes are managed by stream netdev. An optional
>>>> parameter "server" defines the mode (server by default)
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>>>> ---
> 
> [...]
> 
>>>> diff --git a/net/net.c b/net/net.c
>>>> index c337d3d753fe..440957b272ee 100644
>>>> --- a/net/net.c
>>>> +++ b/net/net.c
>> ...
>>>> @@ -1612,7 +1617,19 @@ void net_init_clients(void)
>>>>     */
>>>>    static bool netdev_is_modern(const char *optarg)
>>>>    {
>>>> -    return false;
>>>> +    QDict *args;
>>>> +    const char *type;
>>>> +    bool is_modern;
>>>> +
>>>> +    args = keyval_parse(optarg, "type", NULL, NULL);
>>>> +    if (!args) {
>>>> +        return false;
>>>> +    }
>>>> +    type = qdict_get_try_str(args, "type");
>>>> +    is_modern = !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>>>> +    qobject_unref(args);
>>>> +
>>>> +    return is_modern;
>>>>    }
>>>
>>> You could use g_autoptr here:
>>>
>>>          g_autoptr(QDict) args = NULL;
>>>          const char *type;
>>>          bool is_modern;
>>>
>>>          args = keyval_parse(optarg, "type", NULL, NULL);
>>>          if (!args) {
>>>              return false;
>>>          }
>>>          type = qdict_get_try_str(args, "type");
>>>          return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");
>>>
>>> Matter of taste; you decide.
>>
>> Looks good. We already had some series to convert existing code to g_autoptr(), so it
>> seems the way to do.
>>
>>>
>>> Now recall how this function is used: it decides whether to parse the
>>> modern way (with qobject_input_visitor_new_str()) or the traditional way
>>> (with qemu_opts_parse_noisily()).
>>>
>>> qemu_opts_parse_noisily() parses into a QemuOpts, for later use with the
>>> opts visitor.
>>>
>>> qobject_input_visitor_new_str() supports both dotted keys and JSON.  The
>>> former is parsed with keyval_parse(), the latter with
>>> qobject_from_json().  It returns the resulting parse tree wrapped in a
>>> suitable QAPI input visitor.
>>>
>>> Issue 1: since we get there only when keyval_parse() succeeds, JSON is
>>> unreachable.  Reproducer:
>>>
>>>       $ qemu-system-x86_64 -netdev '{"id":"foo"}'
>>>       upstream-qemu: -netdev {"id":"foo"}: Parameter 'id' is missing
>>>
>>> This is parsed with qemu_opts_parse_noisily(), resulting in a QemuOpts
>>> with a single option 'type' with value '{"id":"foo"}'.  The error
>>> message comes from the opts visitor.
>>>
>>> To fix this, make netdev_is_modern() return true when optarg[0] == '{'.
>>> This matches how qobject_input_visitor_new_str() recognizes JSON.
>>
>> OK
>>
>>>
>>> Issue 2: when keyval_parse() detects an error, we throw it away and fall
>>> back to QemuOpts.  This is commonly what we want.  But not always.  For
>>> instance:
>>>
>>>       $ qemu-system-x86_64 -netdev 'type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off'
>>>
>>> Note the typo "ipv4-off" instead of ipv4=off.  The error reporting is crap:
>>>
>>>       qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: warning: short-form boolean option 'addr.ipv4-off' deprecated
>>>       Please use addr.ipv4-off=on instead
>>>       qemu-system-x86_64: -netdev type=stream,id=foo,addr.type=inet,addr.host=localhost,addr.port=1234,addr.ipv4-off: Parameter 'type' is missing
>>>
>>> We get this because netdev_is_modern() guesses wrongly: keyval_parse()
>>> fails with the perfectly reasonable error message "Expected '=' after
>>> parameter 'addr.ipv4-off'", but netdev_is_modern() ignores the error,
>>> and fails.  We fall back to QemuOpts, and confusion ensues.
>>>
>>> I'm not sure we can do much better with reasonable effort.  If we decide
>>> to accept this behavior, it should be documented at least in the source
>>> code.
>>
>> What about using modern syntax by default?
>>
>>       args = keyval_parse(optarg, "type", NULL, NULL);
>>       if (!args) {
>>           /* cannot detect the syntax, use new style syntax */
>>           return true;
>>       }
> 
> As is, netdev_is_modern() has three cases:
> 
> 1. keyval_parse() fails
> 
> 2. keyval_parse() succeeds, but value of @type is not modern
> 
> 3. keyval_parse() succeeds, and value of @type is modern
> 
> In case 3. we're sure, because even if qemu_opts_parse_noisily() also
> succeeded, it would result in the same value of @type.
> 
> In case 2, assuming traditional seems reasonable.  The assumption can be
> wrong when the user intends modern, but fat-fingers the type=T part.
> 
> In case 1, we know nothing.
> 
> Guessing modern is wrong when the user intends traditional.  This
> happens when a meant-to-be-traditional @optarg also parses as modern.
> Quite possible.

I don't see why keyval_parse() fails in this case. Any example?

> Guessing traditional is wrong when the user intends modern.  This
> happens when a meant-to-be-modern @optarg fails to parse as modern,
> i.e. whenever the user screws up modern syntax.

This one is the example you gave (ipv4-off)

> Which guess is less bad?  I'm not sure.  Thoughts?

Perhaps we can simply fail if keyval_parse() fails?

something like:

     args = keyval_parse(optarg, "type", NULL, &error_fatal);
     type = qdict_get_try_str(args, "type");
     return !g_strcmp0(type, "stream") || !g_strcmp0(type, "dgram");

Thanks,
Laurent




