Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DD7533985
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:08:39 +0200 (CEST)
Received: from localhost ([::1]:35702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntn0Q-0003rm-Ni
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntmst-0001Al-SU
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:00:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntmsr-00033E-QR
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653469249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdgleMX40UCIXhq7GFPUY/pEaFgc84tssTXo242BQeE=;
 b=H3SIRzL2sVyJXyTA9owaXY1olZOyu0Gbfu7MdsUlOUmYhNe1qaPEIbwXK3t0IRrdw2FbMl
 bcnOR3Jlk6KflmF6TcbINI6+01lFo7pSeXB4KfHcfs/l14wnO1qjVuInihYbPzYPUPFEhQ
 4yInLqIYFglwF3PiaTIhbrLTGR2Pw9s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-snuaISrCN4uOmxreq440zw-1; Wed, 25 May 2022 05:00:48 -0400
X-MC-Unique: snuaISrCN4uOmxreq440zw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k7-20020a05600c1c8700b003974d762928so3227461wms.7
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 02:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=tdgleMX40UCIXhq7GFPUY/pEaFgc84tssTXo242BQeE=;
 b=e/QUcdF8xzZpCaA7fTEq6XtkVjTjbZcvis0ToTxBMtC+sZ1PUxwtw2oic73AWib5M7
 sSvQ+neYxfX4Qy1endhEjkyyV/EQvu/j7in+3icu2RFYuN6hTf/voqo5aSFRoG81OPS+
 g7Ry4ATRRR1O4NVF0hILECdo/Z5aDriUZGd5CHpehjQKBZfymjJAnoiIjzRgn4FbS5F4
 Jb6lKt7ip/IT6gI51ytRwglJ/1JIOkbPz6fST8W813hl1IWmP5DIVoMCI0pwcuTEjZz9
 tO8ACe92SQ984m5ggW76FLxpdwynAg4su54RVV+gX9hvoFHf3996CDhVfD+W8+PS3XFQ
 X+CA==
X-Gm-Message-State: AOAM530UGErj6xda6phXMlV0hPVWwmP3G6RFkyRfW0dXpIPdFL41TcZC
 tEx/RIvPBk3Pcdj+BZ2HmmWHY5RRPttpsD/GCqpo8ElfugJPjUaL4kXfKLOv+TYK5ANJY6fkQXj
 MEVViIV5XSFOK0Fw=
X-Received: by 2002:adf:ce05:0:b0:20f:fa26:b888 with SMTP id
 p5-20020adfce05000000b0020ffa26b888mr3809824wrn.346.1653469246860; 
 Wed, 25 May 2022 02:00:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGjoDudHauNcBoPFUAynYar5FKJeC4Kncl4kGJ6wTrTa64OHNzjKmMliVmO0TzTVSVSQzmsw==
X-Received: by 2002:adf:ce05:0:b0:20f:fa26:b888 with SMTP id
 p5-20020adfce05000000b0020ffa26b888mr3809791wrn.346.1653469246510; 
 Wed, 25 May 2022 02:00:46 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-69.web.vodafone.de.
 [109.43.179.69]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0039749b01ea7sm1748382wmq.32.2022.05.25.02.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 02:00:45 -0700 (PDT)
Message-ID: <e264b928-86e0-c9a5-b636-210adfb46f00@redhat.com>
Date: Wed, 25 May 2022 11:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
 <20220506153956.2217601-3-scgl@linux.ibm.com>
 <21468730-e57f-a54a-bde4-6bb927d6b651@redhat.com>
 <384df8c6-4309-17a5-464e-46b23507f362@linux.ibm.com>
 <17934f59-4425-cdae-80b2-cfeb9bd97f7d@redhat.com>
 <e948f801-c3bf-7f85-3afd-b336146398a9@linux.ibm.com>
 <489c9e03-417d-e201-26b9-bf2835127734@redhat.com>
 <562d9424-67a6-add4-70dc-94d05c112875@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] target/s390x: kvm: Honor storage keys during emulation
In-Reply-To: <562d9424-67a6-add4-70dc-94d05c112875@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 24/05/2022 13.52, Janis Schoetterl-Glausch wrote:
> On 5/24/22 13:21, Thomas Huth wrote:
>> On 24/05/2022 13.10, Christian Borntraeger wrote:
>>>
>>>
>>> Am 24.05.22 um 12:43 schrieb Thomas Huth:
>>>> On 19/05/2022 15.53, Janis Schoetterl-Glausch wrote:
>>>>> On 5/19/22 12:05, Thomas Huth wrote:
>>>>>> On 06/05/2022 17.39, Janis Schoetterl-Glausch wrote:
>>>>>>> Storage key controlled protection is currently not honored when
>>>>>>> emulating instructions.
>>>>>>> If available, enable key protection for the MEM_OP ioctl, thereby
>>>>>>> enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
>>>>>>> As a result, the emulation of the following instructions honors storage
>>>>>>> keys:
>>>>>>>
>>>>>>> * CLP
>>>>>>>          The Synch I/O CLP command would need special handling in order
>>>>>>>          to support storage keys, but is currently not supported.
>>>>>>> * CHSC
>>>>>>>       Performing commands asynchronously would require special
>>>>>>>       handling, but commands are currently always synchronous.
>>>>>>> * STSI
>>>>>>> * TSCH
>>>>>>>       Must (and does) not change channel if terminated due to
>>>>>>>       protection.
>>>>>>> * MSCH
>>>>>>>       Suppressed on protection, works because fetching instruction.
>>>>>>> * SSCH
>>>>>>>       Suppressed on protection, works because fetching instruction.
>>>>>>> * STSCH
>>>>>>> * STCRW
>>>>>>>       Suppressed on protection, this works because no partial store is
>>>>>>>       possible, because the operand cannot span multiple pages.
>>>>>>> * PCISTB
>>>>>>> * MPCIFC
>>>>>>> * STPCIFC
>>>>>>>
>>>>>>> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>>>>>>> ---
>>>>>>>     target/s390x/kvm/kvm.c | 9 +++++++++
>>>>>>>     1 file changed, 9 insertions(+)
>>>>>>>
>>>>>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>>>>>> index 53098bf541..7bd8db0e7b 100644
>>>>>>> --- a/target/s390x/kvm/kvm.c
>>>>>>> +++ b/target/s390x/kvm/kvm.c
>>>>>>> @@ -151,12 +151,15 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>>>>>>     static int cap_sync_regs;
>>>>>>>     static int cap_async_pf;
>>>>>>>     static int cap_mem_op;
>>>>>>> +static int cap_mem_op_extension;
>>>>>>>     static int cap_s390_irq;
>>>>>>>     static int cap_ri;
>>>>>>>     static int cap_hpage_1m;
>>>>>>>     static int cap_vcpu_resets;
>>>>>>>     static int cap_protected;
>>>>>>>     +static bool mem_op_storage_key_support;
>>>>>>> +
>>>>>>>     static int active_cmma;
>>>>>>>       static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
>>>>>>> @@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>>>>>         cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
>>>>>>>         cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
>>>>>>>         cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
>>>>>>> +    cap_mem_op_extension = kvm_check_extension(s, KVM_CAP_S390_MEM_OP_EXTENSION);
>>>>>>> +    mem_op_storage_key_support = cap_mem_op_extension > 0;
>>>>>>
>>>>>> Ah, so KVM_CAP_S390_MEM_OP_EXTENSION is a "version number", not a boolean flag? ... ok, now I've finally understood that ... ;-)
>>>>>
>>>>> Yeah, potentially having a bunch of memop capabilities didn't seem nice to me.
>>>>> We can remove extensions if, when introducing an extension, we define that version x supports functionality y, z...,
>>>>> but for the storage keys I've written in api.rst that it's supported if the cap > 0.
>>>>> So we'd need a new cap if we want to get rid of the skey extension and still support some other extension,
>>>>> but that doesn't seem particularly likely.
>>>>
>>>> Oh well, never say that ... we've seen it in the past, that sometimes we want to get rid of features again, and if they don't have a separate feature flag bit somewhere, it's getting very ugly to disable them again.
>>>>
>>>> So since we don't have merged this patch yet, and thus we don't have a public userspace program using this interface yet, this is our last chance to redefine this interface before we might regret it later.
>>>>
>>>> I'm in strong favor of treating the KVM_CAP_S390_MEM_OP_EXTENSION as a flag field instead of a version number. What do others think? Christian? Halil?
>>>
>>> Its too late for that. This is part of 5.18.
>>
>> Is it? We don't have to change the source code of the kernel,
>> it's just about rewording what we have in api.rst documentation
>> (which should be OK as long as there is no userspace program
>> using this yet), e.g.:
>>
> api.rst says about KVM_CHECK_EXTENSION:
> :Returns: 0 if unsupported; 1 (or some other positive integer) if supported
> 
> but if we can return a negative value, we can define flags for possible future extensions
> and flip the sign bit if we want to get rid of the storage key extension.
> 
> A bit ugly, but doesn't require any changes now.

Oh well, I hope we'll never end up in that situation ...
I guess it will likely be better to drop the MEM_OP_EXTENSION capability in 
that case and come up with something new instead.

Anyway, since I'm apparently the only one with my opinion, and since it's 
very unlikely that we want to get rid of these extensions in the future 
again, and we still have the big hammer of removing MEM_OP_EXTENSION 
completely, I won't insist on a rework here.

Queued to s390x-next now:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


