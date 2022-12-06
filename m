Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705B7643E57
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 09:18:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2T8N-0006sQ-0Y; Tue, 06 Dec 2022 03:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2T8C-0006s0-21
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:16:55 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2T87-0004nm-5D
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:16:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m4-20020a05600c3b0400b003d1cb516ce0so50628wms.4
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ibrRQI8PsuwrNlAm1CIStABRIR6/UMs4AZvUrHrjOr4=;
 b=UycgPiklL99XKFn8EW2qC9UUacx5kptYySiMexzXcMKUTkvghCiAUYS8Fcy3Lmt3DF
 1DN6eDF6FfZeD8JvZuB7CENCqHbE5UvapVWcDk01KvvG8Fex52I3iR+srD6vwzP86LSN
 iyN+siHbq/5R+Ki9kVGI/W1XqF4cQgiS5ItS91irXjTqZYAyq96pkFW3sj+/MHFMYCwC
 TnOQFx14S7yv+yjBFsWhantRqNWyPYOQjbwsToIv7cbeaMOLoK0xeUzmU2bw3WfFICgM
 2GRopkqylpTvS8TTNbmIadxisxb7NYmr7rTzTBOeDtyXvoAJr6gXd3bnGR0PUrLP2MeE
 Q3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ibrRQI8PsuwrNlAm1CIStABRIR6/UMs4AZvUrHrjOr4=;
 b=yRiNf2AL4pQXjCf4Tbywjc568jqaJMYFQt5JBYTmLmswsbOgXWqqnMqPwY45gceYKg
 BOvODlkEphAhnPwRc3Rih1h3T7wpPnDlPTmjMJvJ51oSm4HnjxaKPiSv8Ah+9bmyzDJA
 Xw70rHm9dOIRh3slhwS7Zc9X93aDVmHg53ljX9vqInD2qteTxgpmU1S63ohpwfIDXNai
 fPF/1mcWjXfrTCto0aIEXRu7B9Frrl3ug/HSKzr3Vv81vyWDcG3F98sgBfhoQqXQaYdX
 aRjuSww+MzQaiPq6T9/qpXPIDP8lGzj/NwSQwpjaXBSNMnoPnHPMqVz6vGbBX6CQSMTe
 w/cQ==
X-Gm-Message-State: ANoB5pnsJlfoBQiQX18+Wb1uvlXu95TRrFNNhO5E3EvoxmwXlnA+ULkW
 lJzTrYE88an1EEsQCb3WiOOPfw==
X-Google-Smtp-Source: AA0mqf73e7JMd96f7n69hhi0xsPTSeFUWC3CVQryovhm4CjwG8xwNveNfI0skydtwoblxpYDO/DQ+A==
X-Received: by 2002:a05:600c:4f05:b0:3d0:3d33:a629 with SMTP id
 l5-20020a05600c4f0500b003d03d33a629mr38433619wmq.126.1670314600371; 
 Tue, 06 Dec 2022 00:16:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c310d00b003a2f2bb72d5sm30268912wmo.45.2022.12.06.00.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 00:16:40 -0800 (PST)
Message-ID: <d203e13d-e2f9-5816-030d-c1449bde364d@linaro.org>
Date: Tue, 6 Dec 2022 09:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 10/21] i386/xen: handle guest hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Thomas Huth <thuth@redhat.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-11-dwmw2@infradead.org>
 <efef965d-3c9b-abc0-ac5f-c252b10722bd@linaro.org>
 <cb4cdc7944c74ee1918667ba455b9afd0fae351c.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cb4cdc7944c74ee1918667ba455b9afd0fae351c.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

+Thomas

On 6/12/22 02:10, David Woodhouse wrote:
> On Mon, 2022-12-05 at 23:11 +0100, Philippe Mathieu-Daudé wrote:
>> On 5/12/22 18:31, David Woodhouse wrote:
>>> From: Joao Martins <joao.m.martins@oracle.com>
>>>
>>> This means handling the new exit reason for Xen but still
>>> crashing on purpose. As we implement each of the hypercalls
>>> we will then return the right return code.
>>>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>> [dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> ---
>>>    target/i386/kvm/kvm.c    |  5 +++++
>>>    target/i386/trace-events |  3 +++
>>>    target/i386/xen.c        | 45 ++++++++++++++++++++++++++++++++++++++++
>>>    target/i386/xen.h        |  1 +
>>>    4 files changed, 54 insertions(+)
>>>
>>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>>> index 4b21d03250..6396d11f1e 100644
>>> --- a/target/i386/kvm/kvm.c
>>> +++ b/target/i386/kvm/kvm.c
>>> @@ -5468,6 +5468,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>>>            assert(run->msr.reason == KVM_MSR_EXIT_REASON_FILTER);
>>>            ret = kvm_handle_wrmsr(cpu, run);
>>>            break;
>>> +#ifdef CONFIG_XEN
>>
>> CONFIG_XEN is set when the _host_ has Xen development files available.
>>
>> IIUC here you want to check if Xen HVM guest support is enabled.
>>
>> You might want to use a different CONFIG_XEN_xxx key, which itself
>> depends on CONFIG_XEN.
> 
> Yeah, I'd be interested in opinions on that one.
> 
> Strictly, the only one that *needs* to be a configure option is
> CONFIG_XEN for the Xen libraries, which is support for actually running
> on Xen.
> 
> Any time KVM is present, we *could* pull in the rest of the xenfv
> machine support unconditionally, since that's no longer dependent on
> true Xen.
> 
> But because there's a non-trivial amount of code in the event channel
> and grant table stuff, *perhaps* we want to make it optional? I don't
> really want to call that CONFIG_KVM_XEN since as noted, it's
> theoretically possible to do it with TCG or other accelerators too. So
> we could call it CONFIG_XEN_EMULATION.

I concur CONFIG_KVM_XEN is confusing; CONFIG_XEN_EMULATION / 
CONFIG_XEN_EMU sounds better.

Is it useful to have the CONFIG_XEN_EMU code under target/i386/ built
without having the xenfv machine built in?

I rather have hw/ and target/ features disentangled, so I'd use
CONFIG_XEN_EMU under target/ and CONFIG_XENFV_MACHINE under hw/,
eventually having CONFIG_XEN_EMU depending on CONFIG_XENFV_MACHINE
and -- for now -- CONFIG_KVM.

> I don't think we'd make that depend on CONFIG_XEN though, since none of
> the actual Xen libraries would be needed once everything's implemented
> and cleaned up.

Agreed.

> So things like the xenfv machine code would then depend on
> (CONFIG_XEN || CONFIG_XEN_EMULATION)... or we could make a new
> automatic config symbol CONFIG_XEN_MACHINE which has the same effect?

So per what you just cleared, not CONFIG_XEN but CONFIG_KVM.


