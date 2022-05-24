Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44BC53289A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 13:16:17 +0200 (CEST)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntSWO-0005Jn-Pz
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 07:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntS0m-0007Xh-OX
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:43:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntS0k-0000cE-5J
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653389013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbhkzfYMThZQ1URKp2sj4y10vmYT3Yj+H0kJy/RFPt8=;
 b=Fvcg41MDA+bcVluV2HXCr/9N+9HA3xbg4uLxMQ0hxOpvWzHBn6esvKGO74WrLuWwg2+XoY
 aOdJim/j7P/5OZgzsbQHrFPttiXkiVnr0RXTQhE41f9nG+q6nrfn7/V7ePaLQR7dOtCJGT
 NznzHH4+pm+IPPejFY5DLmg5Q40uzMI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-LyQxaGJ-ODuE_pAhQ6zk-A-1; Tue, 24 May 2022 06:43:32 -0400
X-MC-Unique: LyQxaGJ-ODuE_pAhQ6zk-A-1
Received: by mail-wr1-f72.google.com with SMTP id
 q10-20020adfcd8a000000b0020ff96b68c2so203202wrj.19
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 03:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=lbhkzfYMThZQ1URKp2sj4y10vmYT3Yj+H0kJy/RFPt8=;
 b=cE9dXt+EvsIDKLe4HAA/qgFz28ILX8gcljTc5CuFGU+u/HMdkMo5xoi5RdOiiYefs7
 PpIEpKXSglSqbIGzhd2aJBv0jTVX/5/StNEJd4uvepKORgqrCBCjR5m/vk8o61huXV6T
 IFuBjbcwn2WFE6csaIGv379Gqn+dbo6bCAmvMEq39oUztmOJyENYhA9ukJziSkKghGVb
 +yIkEwhobFGWuaGdEvDAV0FmuRInbQgqn+S0ZzcGLfjMhKSiOXFk4mDRN9+y8fVEgvGJ
 vEUYhXKyvJidmmC2ZEfC9MPTnYYfCQP4IiOy1U8vuZsR9+KpufBxogFLas3f2vTqqJKC
 NWjQ==
X-Gm-Message-State: AOAM532h253sRfNGPrKSDBuYszYdJecNwwaYi18XZ9m/WBBXvP8MX6yb
 Slwet6sKkTPqRDNTNHrnRzumlaeTDt7fmCEASNdWLv+QsRhIHtgK/ohtJgaOIg1jls1TbTM+a4L
 DBMnxDHlmq/gG+FI=
X-Received: by 2002:adf:d192:0:b0:20f:fad6:a96c with SMTP id
 v18-20020adfd192000000b0020ffad6a96cmr50553wrc.136.1653389011174; 
 Tue, 24 May 2022 03:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVw3mkNAZVlpGvLJpg1F9xhUTgjJNnLMLWjR6zu2/OcaAz61eX7GRYEw7ihFRFTdiPPR5pDg==
X-Received: by 2002:adf:d192:0:b0:20f:fad6:a96c with SMTP id
 v18-20020adfd192000000b0020ffad6a96cmr50521wrc.136.1653389010752; 
 Tue, 24 May 2022 03:43:30 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a7bc92b000000b00397122e63b6sm1776145wml.29.2022.05.24.03.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 03:43:30 -0700 (PDT)
Message-ID: <17934f59-4425-cdae-80b2-cfeb9bd97f7d@redhat.com>
Date: Tue, 24 May 2022 12:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
 <20220506153956.2217601-3-scgl@linux.ibm.com>
 <21468730-e57f-a54a-bde4-6bb927d6b651@redhat.com>
 <384df8c6-4309-17a5-464e-46b23507f362@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] target/s390x: kvm: Honor storage keys during emulation
In-Reply-To: <384df8c6-4309-17a5-464e-46b23507f362@linux.ibm.com>
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

On 19/05/2022 15.53, Janis Schoetterl-Glausch wrote:
> On 5/19/22 12:05, Thomas Huth wrote:
>> On 06/05/2022 17.39, Janis Schoetterl-Glausch wrote:
>>> Storage key controlled protection is currently not honored when
>>> emulating instructions.
>>> If available, enable key protection for the MEM_OP ioctl, thereby
>>> enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
>>> As a result, the emulation of the following instructions honors storage
>>> keys:
>>>
>>> * CLP
>>>         The Synch I/O CLP command would need special handling in order
>>>         to support storage keys, but is currently not supported.
>>> * CHSC
>>>      Performing commands asynchronously would require special
>>>      handling, but commands are currently always synchronous.
>>> * STSI
>>> * TSCH
>>>      Must (and does) not change channel if terminated due to
>>>      protection.
>>> * MSCH
>>>      Suppressed on protection, works because fetching instruction.
>>> * SSCH
>>>      Suppressed on protection, works because fetching instruction.
>>> * STSCH
>>> * STCRW
>>>      Suppressed on protection, this works because no partial store is
>>>      possible, because the operand cannot span multiple pages.
>>> * PCISTB
>>> * MPCIFC
>>> * STPCIFC
>>>
>>> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>>> ---
>>>    target/s390x/kvm/kvm.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>> index 53098bf541..7bd8db0e7b 100644
>>> --- a/target/s390x/kvm/kvm.c
>>> +++ b/target/s390x/kvm/kvm.c
>>> @@ -151,12 +151,15 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>>    static int cap_sync_regs;
>>>    static int cap_async_pf;
>>>    static int cap_mem_op;
>>> +static int cap_mem_op_extension;
>>>    static int cap_s390_irq;
>>>    static int cap_ri;
>>>    static int cap_hpage_1m;
>>>    static int cap_vcpu_resets;
>>>    static int cap_protected;
>>>    +static bool mem_op_storage_key_support;
>>> +
>>>    static int active_cmma;
>>>      static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
>>> @@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>        cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
>>>        cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
>>>        cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
>>> +    cap_mem_op_extension = kvm_check_extension(s, KVM_CAP_S390_MEM_OP_EXTENSION);
>>> +    mem_op_storage_key_support = cap_mem_op_extension > 0;
>>
>> Ah, so KVM_CAP_S390_MEM_OP_EXTENSION is a "version number", not a boolean flag? ... ok, now I've finally understood that ... ;-)
> 
> Yeah, potentially having a bunch of memop capabilities didn't seem nice to me.
> We can remove extensions if, when introducing an extension, we define that version x supports functionality y, z...,
> but for the storage keys I've written in api.rst that it's supported if the cap > 0.
> So we'd need a new cap if we want to get rid of the skey extension and still support some other extension,
> but that doesn't seem particularly likely.

Oh well, never say that ... we've seen it in the past, that sometimes we 
want to get rid of features again, and if they don't have a separate feature 
flag bit somewhere, it's getting very ugly to disable them again.

So since we don't have merged this patch yet, and thus we don't have a 
public userspace program using this interface yet, this is our last chance 
to redefine this interface before we might regret it later.

I'm in strong favor of treating the KVM_CAP_S390_MEM_OP_EXTENSION as a flag 
field instead of a version number. What do others think? Christian? Halil?

  Thomas


