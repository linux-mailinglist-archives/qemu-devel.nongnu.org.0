Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3E3BE401
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 09:54:30 +0200 (CEST)
Received: from localhost ([::1]:60748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12O5-00034Q-UH
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 03:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12NE-0002Or-WF
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12ND-00029O-C8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625644414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wF7x/DdBIirbbAI9FlxVlPqgqKaseu268/NrNWKxDwg=;
 b=WwTbuUE3W41KyuVVGfKf/gC9roC4bGSlpPB0k7jgy4wPIKUr5bN0VD3sApgnxK7eeWY/6w
 eLycIEM0xn6UmWvdLqHM/HZSVrHMcTKrbBvoqExIde9bM1Ytk907Oj7J3YGQaMRhibzqqx
 VbAmACVuFdw7irPpTDXay4t08DKGucQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-kuD8NlMROy2do62CnR_MIw-1; Wed, 07 Jul 2021 03:53:33 -0400
X-MC-Unique: kuD8NlMROy2do62CnR_MIw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i3-20020a05600c3543b02902075ed92710so2138773wmq.0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 00:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wF7x/DdBIirbbAI9FlxVlPqgqKaseu268/NrNWKxDwg=;
 b=XMD4iGrvzW4ewycnP3HAeYbe0R8iKNP3ZwRsvFqaPn8iI/1VXMzkDQWUetfS1kuTX6
 BYhJ1lhSmKN6IvudatpRAzOqZRVBrLLJNrYqjufgrFbHt+ebvCWo5CZUalpsQRuK8yOW
 sgAL7UPg8kXULcbKET+FxMGqL+UMLDdLW6jjQe6ELcOmHzgodEW47mFSaqsEtZhV+WLW
 GQ/umndUpXrLXL6oeG/qEoOlqRUzXfPjZBVt+4LlD8QT6F8V43x1+OECVJSYilMwbNQ+
 AZg2hf9MdxS5VuwLBHldUxTNJoE9XmLcWFe6z+j8wlEHNyAyvU8Z9G9hdRwKvmPh2o5d
 VDGA==
X-Gm-Message-State: AOAM530iqr0srY7DfO0auzFTQGELluyx5yH44P39Cxp8G3sA61h7CE9k
 p3H2XXRenYIkO5/mHXQeOpmbs/lNkDFGAX+FOQEJ7DgaQEUdYTnYhwade54gbLGyVzW9S+zEJ8l
 5j6BAUGufTjL3byY=
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr5800701wrs.187.1625644411467; 
 Wed, 07 Jul 2021 00:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1TlYPlmkxroCv3K7iGYXs4G32fScvOF1bM30nngUufH/I9Be6W/pFyDZZYYHVCsS/ndjb2Q==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr5800676wrs.187.1625644411221; 
 Wed, 07 Jul 2021 00:53:31 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v18sm19996068wrr.54.2021.07.07.00.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 00:53:30 -0700 (PDT)
Subject: Re: Plugin virtual-to-physical translation incorrect for some IO
 accesses
To: Aaron Lindsay <aaron@os.amperecomputing.com>
References: <YOTBZiyOcNYcqjOO@strawberry.localdomain>
 <c3c2440e-bd91-1671-f9dd-e297f90d01ab@redhat.com>
 <YOTRmAqH2dn+C87T@strawberry.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7bfcc4c0-bba6-d3cf-1d39-aebca1655078@redhat.com>
Date: Wed, 7 Jul 2021 09:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOTRmAqH2dn+C87T@strawberry.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 11:56 PM, Aaron Lindsay wrote:
> On Jul 06 23:10, Philippe Mathieu-Daudé wrote:
>> +Peter/Paolo
>>
>> On 7/6/21 10:47 PM, Aaron Lindsay wrote:
>>> Hello,
>>>
>>> I previously supplied a patch which modified the plugin interface such
>>> that it will return physical addresses for IO regions [0]. However, I
>>> have now found a case where the interface does not appear to correctly
>>> return the full physical addresses.
>>>
>>> In particular, when in qemu_plugin_hwaddr_phys_addr() for a particular
>>> store to IO memory (haddr->is_io==true), I find that haddr->v.io.offset
>>> is 0x0 and mrs->mr->addr is 0x3000, meaning 0x3000 is the returned
>>> "physical address".

v.io.offset is filled with iotlb_to_section() which use
AddressSpaceDispatch:

MemoryRegionSection *iotlb_to_section(CPUState *cpu,
                                      hwaddr index, MemTxAttrs attrs)
{
    int asidx = cpu_asidx_from_attrs(cpu, attrs);
    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
    AddressSpaceDispatch *d = qatomic_rcu_read(&cpuas->memory_dispatch);
    MemoryRegionSection *sections = d->map.sections;

    return &sections[index & ~TARGET_PAGE_MASK];
}

IIUC AddressSpaceDispatch is already adapted from the flatview to the
CPU (AS view). So v.io.offset is relative to each CPUAddressSpace.

Assuming an ARM Cortex-M core having it's secure world mapped at
0x8000000000 and non-secure mapped at 0x0000000000, the QEMU cpu
will have 2 CPUAddressSpaces, each CPUAddressSpace root MemoryRegion
is zero-based.

IOW the iotlb_to_section() API return you the relative offset (to the
CPUAddressSpace), not absolute (based on your expected 0x8000000000).

> However, I also find that
>>> mrs->offset_within_address_space is 0x8000007000 (and also that
>>> 0x8000007000 matches up with what an actual translation would be from
>>> inspecting the page tables).
>>>
>>> Would it be 'safe' to *always* begin using
>>> mrs->offset_within_address_space as the returned physical address here
>>> instead of `haddr->v.io.offset + mrs->mr->addr`, or is there a reason we
>>> should not do that?
> 
> I realized this was perhaps not clear, so for clarification, I am
> imagining the formula for calculating the address would be:
> `mrs->offset_within_address_space + mrs->mr->addr`. Perhaps this was a
> confusing example since the offset into the region is 0x0...

Yes, however remember this won't be the absolute address from the CPU
view, but the absolute address from address space (think of physical
bus) view. For example for a PCI BAR, this won't be the physical address
mapped on the CPU view, but the physical address on the PCI bus.

>> 'safety' is not my area, but using mrs->offset_within_address_space
>> sounds correct to me.
> 
> I'm not sure I was as clear as I could be here, either. My primary
> concern was/is correctness of the address calculation, so perhaps 'safe'
> was not the right way to put this.
> 
> -Aaron
> 


