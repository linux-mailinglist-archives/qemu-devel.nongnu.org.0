Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470D8643E8A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 09:27:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2THP-0001iU-8l; Tue, 06 Dec 2022 03:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2THN-0001iE-Tx
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:26:17 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2THM-0006li-3h
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:26:17 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bs21so22381858wrb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+cIpnEFN0xoCbYAdQQSNQGrYWRcFqBATSYyldYZpG8w=;
 b=OEsqbcxT1Pe+eNhpyaEJins+cJX5RE0sIRqmrqdYOo6QAiZa6XPhjW40KoPJPNI06s
 fjhQgDjsMnlxRdVH+lbkMS3YZafmEdLSEhymYx67+9gmETTcRq7BjyFoHo9t9TVDbwS+
 KwIfODYCBgJBbzVfzdS5NdAYknxQIYyp9g2bruUR4cVqNdS+i1wDmmjWYMwtYiYvdBOf
 DvZfDuHRavgZ5JpytFvC/q0D2JwC+FluHcftaKJCjSmsBZ5CUafeucrEbCuXYmOXVwgw
 RPTY7amCIVp+/wXg8FE114XuvbigpE97fLqUGubB+VX5iLdK8dlt31a6wTeqOXMLYvJ/
 a9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+cIpnEFN0xoCbYAdQQSNQGrYWRcFqBATSYyldYZpG8w=;
 b=4VoKgQaRTElJltZVNCC5NWYbRhi/mBM2gxJ+7+ZqHafay99aeE2Dr2mDUrrrnIAwCY
 AvscV0FErxScXd6CWtB+WWn8sRYtq1DTL3gLlvh8Bc0YQthHqLcObRPcy5pJuk5dDDIC
 iHLFJYErvB6jpEodfAIcnoQNwnmVTMVYHlXssnI2T8f/dNPzyCT/Tb5O3VuswBmh0CU+
 bN8y++69erPLA8kQnkXTpIZWVnmPnwEfXfFaNznZRA+AtGPdU5tTURTY8vBTQUGJHNrX
 lGDvmdRxuqjOsAe6uuYk8y3ZxoMJEyzLS2gI/3NLOHv4No5z2FEqRfS0ibvjWp2TD/S9
 ALsg==
X-Gm-Message-State: ANoB5pljKrtK6oNaWiZWXsdJhDEvwAiFxh4GxZ0cbzOG7TLXOEXa3Nex
 r7Ak6U9r7RdwKK1QV05q1ag+Qg==
X-Google-Smtp-Source: AA0mqf6x/PdofS2C520eesAzxvwyoFoDj3CYPXJFdY/wKzmdZVJi/GFthPOx2NhiiwatcQqsod+w+g==
X-Received: by 2002:adf:a54b:0:b0:242:49b:5bb1 with SMTP id
 j11-20020adfa54b000000b00242049b5bb1mr33210537wrb.337.1670315174114; 
 Tue, 06 Dec 2022 00:26:14 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003cfd4cf0761sm26311227wmq.1.2022.12.06.00.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 00:26:13 -0800 (PST)
Message-ID: <73e22a62-d319-7a18-098f-1e4df70e5439@linaro.org>
Date: Tue, 6 Dec 2022 09:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 12/21] i386/xen: set shared_info page
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-13-dwmw2@infradead.org>
 <cbb522e1-3d8d-5332-7ac8-c0e054be33e2@linaro.org>
 <ffcf677c1669a8dc43f8eda498e0d7914028a3c1.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ffcf677c1669a8dc43f8eda498e0d7914028a3c1.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

+Juan/David/Claudio.

On 6/12/22 03:20, David Woodhouse wrote:
> On Mon, 2022-12-05 at 23:17 +0100, Philippe Mathieu-Daudé wrote:
>> On 5/12/22 18:31, David Woodhouse wrote:
>>> From: Joao Martins <joao.m.martins@oracle.com>
>>>
>>> This is done by implementing HYPERVISOR_memory_op specifically
>>> XENMEM_add_to_physmap with space XENMAPSPACE_shared_info. While
>>> Xen removes the page with its own, we instead use the gfn passed
>>> by the guest.
>>>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> ---
>>>    accel/kvm/kvm-all.c      |  6 ++++
>>>    include/hw/core/cpu.h    |  2 ++
>>>    include/sysemu/kvm.h     |  2 ++
>>>    include/sysemu/kvm_int.h |  3 ++
>>>    target/i386/cpu.h        |  8 ++++++
>>>    target/i386/trace-events |  1 +
>>>    target/i386/xen-proto.h  | 19 +++++++++++++
>>>    target/i386/xen.c        | 61 ++++++++++++++++++++++++++++++++++++++++
>>>    8 files changed, 102 insertions(+)
>>>    create mode 100644 target/i386/xen-proto.h
>>
>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 8830546121..e57b693528 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -443,6 +443,8 @@ struct CPUState {
>>>    
>>>        /* track IOMMUs whose translations we've cached in the TCG TLB */
>>>        GArray *iommu_notifiers;
>>> +
>>> +    struct XenState *xen_state;
>>
>> Since you define a type definition below, use it.
> 
> Ack.
> 
> More importantly though, some of that state needs to be persisted
> across live migration / live update.
> 
> There is per-vCPU state (the GPAs for vcpu_info etc., upcall vector,
> timer info). I think I see how I could add that to the vmstate_x86_cpu
> defined in target/i386/machine.c.
> 
> For the machine-wide state, where do I add that? Should I just
> instantiate a dummy device (a bit like TYPE_KVM_CLOCK, AFAICT) to hang
> that state off?

XenState in CPUState indeed is an anti-pattern.

As you said elsewhere (patch 2 maybe) your use is not a new accelerator
but a machine, so new state should go in a derived MachineState.

Migration is not my area of expertise, but since only the xenfv machine
will use this configuration, it seems simpler to store the vCPUs
migration states there...

Regards,

Phil.

