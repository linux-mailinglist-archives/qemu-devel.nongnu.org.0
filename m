Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96569532A21
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:14:43 +0200 (CEST)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTQv-0001ce-Vj
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSbF-0003aR-Mv
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSbB-0007QF-PY
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653391273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WifcL3GWboBhV6VCepRqMi5lRGmaISZXF2VzmYsE6Kc=;
 b=aHEscB9INDxkpI7zRmEn/AfS84QSo6t9/T9nMWCmJtFnkRsmHdP4jHQjY5LbiL4bZ9jQXt
 CBtxcn09kWVgFzSLFaYjpraUsEt1PqF+XYlqx48psEh53pjNA9fGDLhONKy8G6Wlpi11Wl
 1dONbmGqmcrGGv+zxm2JG4rR8oFex6I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-7kWrfM-4PEqe80cyRCk0JA-1; Tue, 24 May 2022 07:21:11 -0400
X-MC-Unique: 7kWrfM-4PEqe80cyRCk0JA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j14-20020a05600c1c0e00b003973bf0d146so1159783wms.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 04:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=WifcL3GWboBhV6VCepRqMi5lRGmaISZXF2VzmYsE6Kc=;
 b=rMkQIXNP6+Zjky6cXwEXTSn4+fKWAEYpDNF+4ZLF7Y1HEzGq+tZvWsaXasrDzoqJov
 FUPqb87DTw+LMOd/QiqaNxbcujNZDPdwXBakpK8kSn2OaW5gD+5RLkBOqGr8/8Zb+hRL
 yUSwb6+2ZVhejDJkAcsJn9MRsBgMxnT8W6yUK8Y6hKCC5nHUDrbeSEhGmkjfwDZSoByB
 cIkNvOulidZfvA8Xfv6cv+qBwPnq5RCLXrLLWv5AjNr6vy20J8L0c09XUX11bRr86C0A
 VAMzayrDTB4Oy5kiBi1U0OjcvJZpk9IlG7SOWyUEnSJZqeRSesBKfybG3UnpfqXXHwAr
 NuXw==
X-Gm-Message-State: AOAM533IuZCzZvLzYxFCjeX6jMMWx4gY+KDpKU1l7sOQW9Gfr6jiSXDL
 chMAhoALjJMATFN+v8YyVx1sxLgyBPvohlrlpvXXhj+CrGtC0BL+xhIC9vVhrdSSDxdmt2DYoG6
 tN7h3la3fjt+WufQ=
X-Received: by 2002:a5d:47a3:0:b0:20e:5c89:9da2 with SMTP id
 3-20020a5d47a3000000b0020e5c899da2mr23193577wrb.277.1653391270550; 
 Tue, 24 May 2022 04:21:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5BQ8RVKG2Jspp3aI6yQs1df/0NKWIyX8kwfamTDA1yTEZ8OVXBNnNISey7yGgYhen6YymJw==
X-Received: by 2002:a5d:47a3:0:b0:20e:5c89:9da2 with SMTP id
 3-20020a5d47a3000000b0020e5c899da2mr23193551wrb.277.1653391270251; 
 Tue, 24 May 2022 04:21:10 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0ac800b0039729309a84sm1792690wmr.20.2022.05.24.04.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 04:21:09 -0700 (PDT)
Message-ID: <489c9e03-417d-e201-26b9-bf2835127734@redhat.com>
Date: Tue, 24 May 2022 13:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
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
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] target/s390x: kvm: Honor storage keys during emulation
In-Reply-To: <e948f801-c3bf-7f85-3afd-b336146398a9@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/05/2022 13.10, Christian Borntraeger wrote:
> 
> 
> Am 24.05.22 um 12:43 schrieb Thomas Huth:
>> On 19/05/2022 15.53, Janis Schoetterl-Glausch wrote:
>>> On 5/19/22 12:05, Thomas Huth wrote:
>>>> On 06/05/2022 17.39, Janis Schoetterl-Glausch wrote:
>>>>> Storage key controlled protection is currently not honored when
>>>>> emulating instructions.
>>>>> If available, enable key protection for the MEM_OP ioctl, thereby
>>>>> enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
>>>>> As a result, the emulation of the following instructions honors storage
>>>>> keys:
>>>>>
>>>>> * CLP
>>>>>         The Synch I/O CLP command would need special handling in order
>>>>>         to support storage keys, but is currently not supported.
>>>>> * CHSC
>>>>>      Performing commands asynchronously would require special
>>>>>      handling, but commands are currently always synchronous.
>>>>> * STSI
>>>>> * TSCH
>>>>>      Must (and does) not change channel if terminated due to
>>>>>      protection.
>>>>> * MSCH
>>>>>      Suppressed on protection, works because fetching instruction.
>>>>> * SSCH
>>>>>      Suppressed on protection, works because fetching instruction.
>>>>> * STSCH
>>>>> * STCRW
>>>>>      Suppressed on protection, this works because no partial store is
>>>>>      possible, because the operand cannot span multiple pages.
>>>>> * PCISTB
>>>>> * MPCIFC
>>>>> * STPCIFC
>>>>>
>>>>> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>>>>> ---
>>>>>    target/s390x/kvm/kvm.c | 9 +++++++++
>>>>>    1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>>>> index 53098bf541..7bd8db0e7b 100644
>>>>> --- a/target/s390x/kvm/kvm.c
>>>>> +++ b/target/s390x/kvm/kvm.c
>>>>> @@ -151,12 +151,15 @@ const KVMCapabilityInfo 
>>>>> kvm_arch_required_capabilities[] = {
>>>>>    static int cap_sync_regs;
>>>>>    static int cap_async_pf;
>>>>>    static int cap_mem_op;
>>>>> +static int cap_mem_op_extension;
>>>>>    static int cap_s390_irq;
>>>>>    static int cap_ri;
>>>>>    static int cap_hpage_1m;
>>>>>    static int cap_vcpu_resets;
>>>>>    static int cap_protected;
>>>>>    +static bool mem_op_storage_key_support;
>>>>> +
>>>>>    static int active_cmma;
>>>>>      static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
>>>>> @@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>>>        cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
>>>>>        cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
>>>>>        cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
>>>>> +    cap_mem_op_extension = kvm_check_extension(s, 
>>>>> KVM_CAP_S390_MEM_OP_EXTENSION);
>>>>> +    mem_op_storage_key_support = cap_mem_op_extension > 0;
>>>>
>>>> Ah, so KVM_CAP_S390_MEM_OP_EXTENSION is a "version number", not a 
>>>> boolean flag? ... ok, now I've finally understood that ... ;-)
>>>
>>> Yeah, potentially having a bunch of memop capabilities didn't seem nice 
>>> to me.
>>> We can remove extensions if, when introducing an extension, we define 
>>> that version x supports functionality y, z...,
>>> but for the storage keys I've written in api.rst that it's supported if 
>>> the cap > 0.
>>> So we'd need a new cap if we want to get rid of the skey extension and 
>>> still support some other extension,
>>> but that doesn't seem particularly likely.
>>
>> Oh well, never say that ... we've seen it in the past, that sometimes we 
>> want to get rid of features again, and if they don't have a separate 
>> feature flag bit somewhere, it's getting very ugly to disable them again.
>>
>> So since we don't have merged this patch yet, and thus we don't have a 
>> public userspace program using this interface yet, this is our last chance 
>> to redefine this interface before we might regret it later.
>>
>> I'm in strong favor of treating the KVM_CAP_S390_MEM_OP_EXTENSION as a 
>> flag field instead of a version number. What do others think? Christian? 
>> Halil?
> 
> Its too late for that. This is part of 5.18.

Is it? We don't have to change the source code of the kernel,
it's just about rewording what we have in api.rst documentation
(which should be OK as long as there is no userspace program
using this yet), e.g.:

diff a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3759,7 +3759,7 @@ If the KVM_S390_MEMOP_F_SKEY_PROTECTION flag is set, storage key
  protection is also in effect and may cause exceptions if accesses are
  prohibited given the access key designated by "key"; the valid range is 0..15.
  KVM_S390_MEMOP_F_SKEY_PROTECTION is available if KVM_CAP_S390_MEM_OP_EXTENSION
-is > 0.
+has the lowest bit set.
  
  Absolute read/write:
  ^^^^^^^^^^^^^^^^^^^^
@@ -3770,7 +3770,7 @@ the checks required for storage key protection as one operation (as opposed to
  user space getting the storage keys, performing the checks, and accessing
  memory thereafter, which could lead to a delay between check and access).
  Absolute accesses are permitted for the VM ioctl if KVM_CAP_S390_MEM_OP_EXTENSION
-is > 0.
+has the lowest bit set.
  Currently absolute accesses are not permitted for VCPU ioctls.
  Absolute accesses are permitted for non-protected guests only.
  
What do you think?

  Thomas


