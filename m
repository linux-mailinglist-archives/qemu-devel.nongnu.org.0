Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B404E6D6492
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:02:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhE1-0004oe-GX; Tue, 04 Apr 2023 10:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pjhDp-0004oL-QH
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:01:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pjhDg-000632-QF
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680616867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4HXyQwBCg9/ryVx5MRWQIlA9oxzW1bpFOINMEQUL5U=;
 b=EBgH1fhqSMGep7FK+du2x+MK8POXTxZnWotNmTDDXfp5e3Xf4WOI9MLghW3AwJeP6mfr8N
 rENS8i1md83JCBKlfnVW74n1shpS9h16p3fb8AAD6piVHx1ohokEAJmeExb5Pju7Gi9pX5
 sIhJSScRXQkpbzEtKfy/uSf6/ZmYOnU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-DAuWN0lKMcaybd2fY7BFSQ-1; Tue, 04 Apr 2023 10:00:29 -0400
X-MC-Unique: DAuWN0lKMcaybd2fY7BFSQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 187-20020a3707c4000000b007468d9a30faso14755535qkh.23
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680616821;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g4HXyQwBCg9/ryVx5MRWQIlA9oxzW1bpFOINMEQUL5U=;
 b=F8NKSaA6NHVpcVIYJteeRnFYTdqN6W0cAYu/EKx9qM8NGXY19iZmXG4a1gHulOR4cB
 ecufS8n4NLE9hZOWLginnGOBkjIgjW+LdCqjtmg8nEZ9zSR6+XZNjZGah9cY7uKCBMQ6
 wuZw8qXJa51dCXpS1JDgfraFIudKroxDUU/qPx0wbRlBT2q0FBDS2zGDe9+KTJu3+Zkx
 u4N2uebABa9unIYZYnKQ/uIgIe8Egvc0nDUqb0/VPXgCQ5kiaA7ocYBymV4AVPUF8DoC
 gFwwM4JVmlgYIjXqf6mA+m4aCS8WQGpQ+xuCEFs/9SdwWEUN05kY6d1G7PxkFTkr7COJ
 3eRw==
X-Gm-Message-State: AAQBX9fbiklz4JA+q02a3lDR0RTxf2Beg3K8SDAKDnmuxnaINduHcBDy
 CpZfe7yLqEqHMX+mtrxiDqZxk+3kiLxzaGkKZhBOLfQIJYMu9/tkPhmO78L/knzdnyeIBD7MueL
 WRjnOYVvVzSu/aHQ=
X-Received: by 2002:a05:6214:19e6:b0:5cb:6880:1924 with SMTP id
 q6-20020a05621419e600b005cb68801924mr3987706qvc.13.1680616820977; 
 Tue, 04 Apr 2023 07:00:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350atMBb5/0d6dDY7otVmKnmDuV/rI/o4TeEZXulHEUL5GDuCUYmn27sWpD66KP8kk68/UTlohA==
X-Received: by 2002:a05:6214:19e6:b0:5cb:6880:1924 with SMTP id
 q6-20020a05621419e600b005cb68801924mr3987565qvc.13.1680616820175; 
 Tue, 04 Apr 2023 07:00:20 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-74.web.vodafone.de.
 [109.43.178.74]) by smtp.gmail.com with ESMTPSA id
 d70-20020a376849000000b007467a4d8691sm3625613qkc.47.2023.04.04.07.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:00:19 -0700 (PDT)
Message-ID: <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
Date: Tue, 4 Apr 2023 16:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cedric Le Goater <clegoate@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05/02/2023 23.12, Mark Cave-Ayland wrote:
> On 30/01/2023 20:45, Alex Bennée wrote:
> 
>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>
>>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>> Testing 32-bit host OS support takes a lot of precious time during the 
>>>>> QEMU
>>>>> contiguous integration tests, and considering that many OS vendors stopped
>>>>> shipping 32-bit variants of their OS distributions and most hardware from
>>>>> the past >10 years is capable of 64-bit
>>>>
>>>> True for x86, not necessarily true for other architectures.
>>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>>> I'm not entirely sure about whether we're yet at a point where
>>>> I'd want to deprecate-and-drop 32-bit arm host support.
>>>
>>> Do we have a feeling on which aspects of 32-bit cause us the support
>>> burden ? The boring stuff like compiler errors from mismatched integer
>>> sizes is mostly quick & easy to detect simply through a cross compile.
>>>
>>> I vaguely recall someone mentioned problems with atomic ops in the past,
>>> or was it 128-bit ints, caused implications for the codebase ?
>>
>> Atomic operations on > TARGET_BIT_SIZE and cputlb when
>> TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
>> backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
>> throughout.
> 
> I am one of an admittedly small group of people still interested in using 
> KVM-PR on ppc32 to boot MacOS, although there is some interest on using 
> 64-bit KVM-PR to run super-fast MacOS on modern Talos hardware.
> 
>  From my perspective losing the ability to run 64-bit guests on 32-bit 
> hardware with TCG wouldn't be an issue, as long as it were still possible to 
> use qemu-system-ppc on 32-bit hardware using both TCG and KVM to help debug 
> the remaining issues.

  Hi Mark!

Just out of curiosity (since we briefly talked about 32-bit KVM on ppc in 
today's QEMU/KVM call - in the context of whether qemu-system-ppc64 is a 
proper superset of qemu-system-ppc when it comes to building a unified 
qemu-system binary): What host machine are you using for running KVM-PR? And 
which QEMU machine are you using for running macOS? The mac99 or the g3beige 
machine?

Unrelated to KVM: Do you happen to know whether there are any problems when 
running 32-bit guests with TCG with the mac99 or g3beige machine while using 
qemu-system-ppc64 ?

  Thanks,
   Thomas


