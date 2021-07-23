Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F307C3D3809
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 11:50:14 +0200 (CEST)
Received: from localhost ([::1]:50942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ros-00045K-1g
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 05:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6rnt-0003Oo-Ly
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6rnr-0001Kc-OX
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627033750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ou5EZhFcAYkXbf2a9agdBySzNAI7jZtn866h8oW+UGA=;
 b=M4LqvaNCX1GMJoC+hlj9t6yZ9rOzAiLH9Bgax6f3Ch5wmx8/RKjq21wUqwkwMtNRdE0Gog
 fQ8cd0eFpoee0vpf0QCqN/V4/9mdxKidfafoSO05dlEGo30s4BVI9DNcOqL8MK5m8qyVCY
 QvSH4iyGi4h4LEPwDboBguqRe4rEN6c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-POZuaGKHMY6f5NC4iwIOoA-1; Fri, 23 Jul 2021 05:49:09 -0400
X-MC-Unique: POZuaGKHMY6f5NC4iwIOoA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a19-20020a1709063e93b0290551ea218ea2so445214ejj.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 02:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ou5EZhFcAYkXbf2a9agdBySzNAI7jZtn866h8oW+UGA=;
 b=GVTrj7D5Ze1aIunGJXfa+6uhIE4bONc7YgQNdzzWuf1rH8jNawmbAky8thPDTkVAwC
 1IfIoyhWnc9n47koDaoz0kaLcne1nLld7hX9m0AmpuliMwRy6x7QIYDzNiYtPfDWbssA
 IQ1yKi30FbU7U2ARI5xTcSPrdTg/M0RxNitd+3XIjPR23U7fLeUV0IQHwOM5xrLl74mw
 aTe/yfz/chdTSGZ75P42S7bVUIHqGHd7z+Vlf4156ow1hL0pG+18Jn2EGCZPIDLJ/OSO
 ekmW0qkpVOjVvJ2ZXLrgQdA4gc6BWUR0pkWV0A80fzOoXpLn29ONewVALkM3cygnOJX9
 TWvQ==
X-Gm-Message-State: AOAM5336eFesxi83VEYj6ynmVTFkPuobz4dPmLhCM2EKs4J25gXaLaKZ
 UFkUj2kKNFyJSj1SkW1Ok+423L+2gWGxnKC8C8W41+VOl6710g7kftZz3dqv1TQ7NzuF9pkzwmD
 4OqoJKWo8cfoGR1L+SrG1Ixbz6MzIOAe4RtFVCTPrlY3rIe1dAxV03pde2bjADfpIUUY=
X-Received: by 2002:a05:6402:3453:: with SMTP id
 l19mr4524256edc.88.1627033747917; 
 Fri, 23 Jul 2021 02:49:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykhiIl4B/MjV6gdnB6MQ3e9CHYlCAsriHUPdwXj+VjylS9fl1QOTIQwQwznfvRKBq3GN4cMA==
X-Received: by 2002:a05:6402:3453:: with SMTP id
 l19mr4524232edc.88.1627033747737; 
 Fri, 23 Jul 2021 02:49:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id j1sm13592800edl.80.2021.07.23.02.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 02:49:07 -0700 (PDT)
Subject: Re: [PATCH 1/2] qapi: introduce forwarding visitor
To: Markus Armbruster <armbru@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-2-pbonzini@redhat.com>
 <87v952fnut.fsf@dusky.pond.sub.org>
 <3426ca4c-fc26-1730-76f8-c46bc7fddca3@redhat.com>
 <87zguee50k.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7b6ac329-fe04-0b37-680a-597771cd9d69@redhat.com>
Date: Fri, 23 Jul 2021 11:49:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87zguee50k.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/21 17:34, Markus Armbruster wrote:
>> This is not a fifth type of visitor, it's a wrapper for the existing
>> types (two of them, input and output; the other two don't break
>> horribly but make no sense either).
> 
> Unlike the other visitors, this one isn't of a fixed type.  I think
> mentioning this would be nice.  Perhaps add to the paragraph

Ah okay, I didn't understand that paragraph referred to the actual 
visitors and not just the kinds in the enum.

>>> Can you explain why you treat names in sub-structs differently than
>>> names other than the alias name in the root struct?
>>
>> Taking the example of QOM alias properties, if the QOM property you're
>> aliasing is a struct, its field names are irrelevant.  The caller may
>> not even know what they are, as they are not part of the namespace (e.g.
>> the toplevel QDict returned by keyval_parse) that is being modified.
>>
>> There are no aliased compound QOM properties that I can make a proper
>> example with, unfortunately.
> 
> Since the intent is to forward *only* the alias, I wonder why we forward
> *everything* when v->depth > 0.
> 
> Oh.  Is it because to get to v->depth > 0, we must have entered the
> alias, so whatever we forward there must be members of the alias?

Yes, exactly.  v->depth is only nonzero after the name translation has 
succeeded (and until end_struct/end_list).

>>>> +Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to)
>>>> +{
>>>> +    ForwardFieldVisitor *v = g_new0(ForwardFieldVisitor, 1);
>>>> +
>>>> +    v->visitor.type = target->type;
>>>
>>> Do arbitrary types work?  Or is this limited to input and output
>>> visitors?
>>
>> They don't crash, but they don't make sense because 1) they should not
>> live outside qapi_clone and visit_free_* 2) they use NULL for the
>> outermost name.
> 
> I'd prefer to restrict the forwarding visitor to the cases that make
> sense and have test coverage.

Yup, I had added an assertion in the incremental diff already.

>>> Not forwarded: method .type_size().  Impact: visit_type_size() will call
>>> the wrapped visitor's .type_uint64() instead of its .type_size().  The
>>> two differ for the opts visitor, the keyval input visitor, the string
>>> input visitor, and the string output visitor.
>>
>> Fixed, of course.  Incremental diff after my sig.
> 
> Looks good to me apart from rather long lines in block comments.
> Best to wrap these around column 70, unless the wrapping obviously
> reduces legibility.

Thanks!

paolo


