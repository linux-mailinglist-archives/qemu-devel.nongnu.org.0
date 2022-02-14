Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DFC4B564E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 17:34:15 +0100 (CET)
Received: from localhost ([::1]:54410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJeIo-0007z0-32
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 11:34:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJeGq-00075h-IP
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 11:32:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJeGn-0000B4-K6
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 11:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644856328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zbjp4EoPUVr+XpeuhFNTpQtAmtutDQ9QIqPvVEgDCA=;
 b=g90Un4R+ZRb4vUo0z1Hu0J1jgbkriswY1a5Xhs7Caty3aYnedzzKQ3IxFbeh9DvFNPyXxz
 yECf+zzUMI5RuJIszyQ6+zu9ZUg033oTk7tImYplMin1cOfDm6PObjAIENhptjhv4s8ljZ
 FT541NRo99y/noRJulyurI9hkT7WmtY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-FBqbCeK0OZK-xeXHFvMONQ-1; Mon, 14 Feb 2022 11:32:07 -0500
X-MC-Unique: FBqbCeK0OZK-xeXHFvMONQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay41-20020a05600c1e2900b0037c5168b3c4so3202185wmb.7
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 08:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=2zbjp4EoPUVr+XpeuhFNTpQtAmtutDQ9QIqPvVEgDCA=;
 b=Yqk1t4gDnBEV22mcwUJL/9iUQxXVio/PVvavsphPJAIu2RID5IflBHXAROtqy4q0wy
 nU9D/yg1/UyRJwmIm1cL8iMAkQFfIMKoBlB98fdPFaAKAjqgzKUrgLZFV77GmU0AAKx6
 DfZJG48UwNZvqtQcMXKsbDsiOJc+zLtdPxTa1FDIARXCWNKAlQH0R3S9m+iHPmxfm/+k
 rntFcr7Jiz3falH85IqxPBPPt8StK+ml5Tn2HFNEPfVAF5QReAUMbgURy7dWmNdM9nAO
 wpXO8aEaCeR2oMARsm/UDwvjwgoVQ8RKpHNbYRV8OKQrwHfVb2tnptMdE7o/gRbIltKC
 ZqjQ==
X-Gm-Message-State: AOAM530sLgmhL1kVvkAokosFKvTuj2fyPSFSvMAZvUINZHAtqe9h+syj
 O1kE+tVTnS0pkf86l1vpjktsajU842j7tg0OMd5E6g1PjKdb8cWg1QZit2EhULcaajQo8XupcOc
 cLf4JFtEQEoSj3oo=
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr133683wmg.3.1644856325996; 
 Mon, 14 Feb 2022 08:32:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNqQekQHEpWPSjnIk8qAR9HJzoLsSqG3czYQnv4XY0+vcQA9+siecLZVMV8XQ6tFZn6++xYg==
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr133663wmg.3.1644856325742; 
 Mon, 14 Feb 2022 08:32:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:5400:d8a3:8885:3275:4529?
 (p200300cbc7075400d8a3888532754529.dip0.t-ipconnect.de.
 [2003:cb:c707:5400:d8a3:8885:3275:4529])
 by smtp.gmail.com with ESMTPSA id c5sm22809753wrq.102.2022.02.14.08.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 08:32:05 -0800 (PST)
Message-ID: <2743ef0f-c73c-5a55-067b-6068c23334f3@redhat.com>
Date: Mon, 14 Feb 2022 17:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Igor Mammedov <imammedo@redhat.com>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <20220214165515.226a1955@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: 9 TiB vm memory creation
In-Reply-To: <20220214165515.226a1955@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>
>>> With KVM enabled it bails out with:
>>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
>>>
>>> all of that on a host with 32G of RAM/no swap.
>>>
>>>   
>>
>> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
>>
>> ~8 TiB (7,999999)
> 
> so essentially that's the our max for initial RAM
> (ignoring initial RAM slots before 4Gb)
> 
> Are you aware of any attempts to make it larger?

Not really, I think for now only s390x had applicable machines where
you'd have that much memory on a single NUMA node.

> 
> But can we use extra pc-dimm devices for additional memory (with 8TiB limit)
> as that will use another memslot?

I remember that was the workaround for now for some extremely large VMs
where you'd want a single NUMA node or a lot of memory for a single NUMA
node.

> 
> 
>>
>> In QEMU, we have
>>
>> static hwaddr kvm_max_slot_size = ~0;
>>
>> And only s390x sets
>>
>> kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
>>
>> with
>>
>> #define KVM_SLOT_MAX_BYTES (4UL * TiB)
> in QEMU default value is:
>   static hwaddr kvm_max_slot_size = ~0
> it is kernel side that's failing

... and kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES) works around the
kernel limitation for s390x in user space.

I feel like the right thing would be to look into increasing the limit
in the kernel, and bail out if the kernel doesn't support it. Would
require a new kernel for starting gigantic VMs with a single large
memory backend, but then, it's a new use case.

-- 
Thanks,

David / dhildenb


