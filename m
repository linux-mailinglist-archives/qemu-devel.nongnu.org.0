Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C80399654
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 01:25:12 +0200 (CEST)
Received: from localhost ([::1]:48896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loaEZ-0006nN-4t
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 19:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loaDd-0005oZ-Jh
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 19:24:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loaDb-00061c-TG
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 19:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622676250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32yapjM7P2WKlGgXTw+cmudjE2tHbVURPSGd4GZ1TRs=;
 b=Fjc/5O8lwIL6WKeCIhoU0AoILwB1Nb2BaB8bywJHlXJGgxAx3pr1a2c4hnZeUekJTLYDm9
 LJN7sPF/x62jVhRT4xkHXj6PM7hVt8LwVivDuzT6SGi9D5e6yMm3Ti7LZOhVnPY9f3JN4i
 vm0NRgndmCzRFu1YX4CPO6WfdEO0nQ4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-6mEmeMLzP6W2Dzjw4F0JuA-1; Wed, 02 Jun 2021 19:24:07 -0400
X-MC-Unique: 6mEmeMLzP6W2Dzjw4F0JuA-1
Received: by mail-ed1-f72.google.com with SMTP id
 j26-20020aa7ca5a0000b029038ffacf1cafso2268432edt.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 16:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32yapjM7P2WKlGgXTw+cmudjE2tHbVURPSGd4GZ1TRs=;
 b=AF7j1U2AXLNZl8bFAZmGz5l4PsNmXJIZL8qHKFGrTXvZB3QnuLvjU7OVsHgHZu/zdr
 SVpfTAY4VHY0fFGxqSfjZN5JBJdrXCW9vAikBVwlK18sG3QMfN4mwe0D2KzYorWumQBM
 VZN9HS8muS8YHKBB9Xbhb+XE7NfhX6697fb40bfJNBjXG+DYb9clLMU3Rhhvfn9Up+zh
 iiX0BccPD49oyOke/XRr2MChqIaZiU0EkkKZxwmY83Qo2ZHG/Fn4Ury76vFmWXMd8V5/
 b+0FqbRozIFaJ9PU2TVZUT1OIViu1wcY9H1Dbp3HEueQqREStIdmw4YucW4biqsWYsNC
 oRpQ==
X-Gm-Message-State: AOAM531CypEVZ8F8gShFlzIXt0BK/T665zC7lv0zIgy14wX/7H1X7W9M
 8Q/FaMawE/qFOAlsa9teImy5mFY7+mnEz3RjSXY/Q1LNg2WKU4Pf85hXeJtr6empHe6yY4tOrA+
 +odtzyJZRq5oewkc=
X-Received: by 2002:a17:906:6c88:: with SMTP id
 s8mr10970080ejr.129.1622676244528; 
 Wed, 02 Jun 2021 16:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEBz6BrPcvbQgWkbTtc7tntpee6QnsimtFGcGxwdyc60NnAEn6IvC0i7FqK1ccayc+NGrvpQ==
X-Received: by 2002:a17:906:6c88:: with SMTP id
 s8mr10970059ejr.129.1622676244290; 
 Wed, 02 Jun 2021 16:24:04 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id r1sm724495edp.90.2021.06.02.16.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 16:24:03 -0700 (PDT)
Subject: Re: [PATCH v8] qapi: introduce 'query-kvm-cpuid' action
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210531123806.23030-1-valeriy.vdovin@virtuozzo.com>
 <266974fa-da6c-d0fc-ce12-6a7ce1752fa6@redhat.com>
 <20210602204604.crsxvqixkkll4ef4@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4e53e323-076c-da89-4239-cb15df8de210@redhat.com>
Date: Thu, 3 Jun 2021 01:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602204604.crsxvqixkkll4ef4@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 10:46 PM, Eduardo Habkost wrote:
> On Wed, Jun 02, 2021 at 08:17:28PM +0200, Philippe Mathieu-Daudé wrote:
>> Hi Valeriy,
>>
>> (Sorry for not looking earlier than v8)
>>
>> On 5/31/21 2:38 PM, Valeriy Vdovin wrote:
>>> Introducing new qapi method 'query-kvm-cpuid'. This method can be used to
>>> get virtualized cpu model info generated by QEMU during VM initialization in
>>> the form of cpuid representation.
>>>
>>> Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
>>> command line option. From there it takes the name of the model as the basis for
>>> feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
>>> that state if additional cpu features should be present on the virtual cpu or
>>> excluded from it (tokens '+'/'-' or '=on'/'=off').
>>> After that QEMU checks if the host's cpu can actually support the derived
>>> feature set and applies host limitations to it.
>>> After this initialization procedure, virtual cpu has it's model and
>>> vendor names, and a working feature set and is ready for identification
>>> instructions such as CPUID.
>>>
>>> Currently full output for this method is only supported for x86 cpus.
>>>
>>> To learn exactly how virtual cpu is presented to the guest machine via CPUID
>>> instruction, new qapi method can be used. By calling 'query-kvm-cpuid'
>>> method, one can get a full listing of all CPUID leafs with subleafs which are
>>> supported by the initialized virtual cpu.
>>>
>>> Other than debug, the method is useful in cases when we would like to
>>> utilize QEMU's virtual cpu initialization routines and put the retrieved
>>> values into kernel CPUID overriding mechanics for more precise control
>>> over how various processes perceive its underlying hardware with
>>> container processes as a good example.
>>>
>>> Output format:
>>> The output is a plain list of leaf/subleaf agrument combinations, that
>>> return 4 words in registers EAX, EBX, ECX, EDX.
>>>
>>> Use example:
>>> qmp_request: {
>>>   "execute": "query-kvm-cpuid"
>>> }
>>>
>>> qmp_response: [
>>>   {
>>>     "eax": 1073741825,
>>>     "edx": 77,
>>>     "in_eax": 1073741824,
>>>     "ecx": 1447775574,
>>>     "ebx": 1263359563,
>>>   },
>>>   {
>>>     "eax": 16777339,
>>>     "edx": 0,
>>>     "in_eax": 1073741825,
>>>     "ecx": 0,
>>>     "ebx": 0,
>>>   },
>>>   {
>>>     "eax": 13,
>>>     "edx": 1231384169,
>>>     "in_eax": 0,
>>>     "ecx": 1818588270,
>>>     "ebx": 1970169159,
>>>   },
>>>   {
>>>     "eax": 198354,
>>>     "edx": 126614527,
>>>   ....
>>>
>>> Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>

>>> +##
>>> +# @query-kvm-cpuid:
>>> +#
>>> +# Returns raw data from the KVM CPUID table for the first VCPU.
>>> +# The KVM CPUID table defines the response to the CPUID
>>> +# instruction when executed by the guest operating system.
>>
>> What is specific to KVM here?
>>
>> What about 'query-accel-cpuid' or 'query-vm-cpu-id'?
> 
> The implementation is KVM-specific.  I believe it's a reasonable
> compromise because the implementation is trivial, and a raw copy
> of the KVM CPUID table makes it a more useful (KVM-specific)
> debugging/testing mechanism.
> 
> I don't really mind how the command is called, but I would prefer
> to add a more complex abstraction only if maintainers of other
> accelerators are interested and volunteer to provide similar
> functionality.  I don't want to introduce complexity for use
> cases that may not even exist.

Fine, fair enough.


