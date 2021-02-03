Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E930DF33
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:08:07 +0100 (CET)
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KhJ-00065F-QU
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KeI-0004Zc-JP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:04:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KeF-0005V5-S3
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612368294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmvZNim+xmUC/DnVZ6bCrKui5923MlZbBn0a+dFPYAA=;
 b=Ft/qXPDqbM9O23gssdSE30mBq4v6pTc8S6vA5/J1dxJxRpKCDHX9S9cmLH34/dXA+PzM+e
 O0lr4ToE7Ej+BFK1u7WmJM4UqsD078jpv75u5omUyUSnrsj51Cz8znyq7AQO5hIgo/9/so
 Q28u26EFrYjkQB2Pq4tAyJbIWWITAjg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-elQsVP_yNj-7JxqcRmwf2A-1; Wed, 03 Feb 2021 11:04:46 -0500
X-MC-Unique: elQsVP_yNj-7JxqcRmwf2A-1
Received: by mail-ej1-f70.google.com with SMTP id q11so2276ejd.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gmvZNim+xmUC/DnVZ6bCrKui5923MlZbBn0a+dFPYAA=;
 b=VPd4KLS6E/bgvyhrvjS9I+bHNNXDIQ5ySmphIvQcxXE6kPOf/RwxvqaPNqq9fGCRIi
 mdh80dWgvDa1IZMB8WPWOogclxUDXUdgpljJwEKSx8KsvdNHD+lMmIVHOxoOtinA5Yp7
 bkr7+JXSDyMao15Qi4OnXCFDtrjWnnUBzRbOqxTHTSqWc54Ck5GLhFm47BTyqLZHd7Ir
 0ySbG5Lk714L2nvjiXcw7KRBUTA7NCvG/HgMwsENxWlOU40/3+PLk5LBXJ9sB2Qb6bID
 SEhnqRAqmZ7sHpnGHjr9oGAwJk3/uxff5ssvWPt3W9e6/tawFKZxKtPsPDBPt3ntRwRi
 yzmg==
X-Gm-Message-State: AOAM530eTaXwHhf2HmW3v03H5hpKPnYAjLxTsQZU/SOJrqjFiFIRyeIh
 GOG2tKfXjK0KkfJ1xtSPABXP9mmZ6OvmKurWPfc4uuUv50F4DSmajvjVECVRb+hdMpuCPJ4fe8/
 aYWCOObu97lgdv1Y=
X-Received: by 2002:a17:906:f2ca:: with SMTP id
 gz10mr3793924ejb.285.1612368285737; 
 Wed, 03 Feb 2021 08:04:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGHNRjMfIozh/YG4q9dTEiyLd43vtYpf0UpKAKkKjabisaPQYXhtVCaeFN4PyD6Z3jRO3Phw==
X-Received: by 2002:a17:906:f2ca:: with SMTP id
 gz10mr3793893ejb.285.1612368285502; 
 Wed, 03 Feb 2021 08:04:45 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id df15sm993335edb.24.2021.02.03.08.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:04:44 -0800 (PST)
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 avocado-devel <avocado-devel@redhat.com>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
 <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
 <20210203104920.GE2950@work-vm>
 <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
 <20210203105933.GF2950@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d31bcfff-04e3-95e3-a98a-ebe9394366d9@redhat.com>
Date: Wed, 3 Feb 2021 17:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203105933.GF2950@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 11:59 AM, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Wed, 3 Feb 2021 at 10:49, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>>>
>>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>>>> On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>>>>>
>>>>> * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
>>>>>> Cc'ing migration team and qemu-arm@ list.
>>>>>
>>>>> I'll have to leave the detail of that to the ARM peole; but from a
>>>>> migration point of view I think we do want the 64 bit ARM migrations to
>>>>> be stable now.  Please tie incompatible changes to machine types.
>>>>
>>>> That is the intention, but because there's no upstream testing
>>>> of migration compat, we never notice if we get it wrong.
>>>> What is x86 doing to keep cross-version migration working ?
>>>
>>> I know there used to be some of our team running Avocado tests for
>>> compatibility regularly, I'm not sure of the current status.
>>> It's something we also do regularly around when we do downstream
>>> releases, so we tend to catch them then, although even on x86 that
>>> often turns out to be a bit late.
>>
>> So downstream testing only?
> 
> I thought there used to be some regular avocado testing of upstream but
> I'm not sure if it's all architectures and I'm not sure if it's still
> happening; I haven't seen any migration issues from it for a while,
> which makes me think it isn't.
> 
>> I think that unless we either (a) start
>> doing migration-compat testing consistently upstream or (b) RedHat or
>> some other downstream start testing and reporting compat issues
>> to us for aarch64 as they do for x86-64, in practice we're just
>> not going to have working migration compat despite our best
>> intentions. (None of the issues Aaron raises were deliberate
>> compat breaks -- they're all "we made a change we didn't think
>> affected migration but it turns out that it does".)
> 
> I'd agree; we still hit this too often on x86 as well.

Cc'ing avocado-devel, since previously discussed:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg654139.html


