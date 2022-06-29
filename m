Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01D55FD85
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:41:56 +0200 (CEST)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6V8t-0000dB-En
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1o6V5i-0007DU-3l
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1o6V5e-00039j-Mo
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656499114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0fk3HRRKw4PJPTNYjK+Eg9y2dq/QoeNY5r/IVHl1pE=;
 b=bpKgfSHUJIye/9ZDz7AUuV7HujmAqmMEn8e3NuqMMnn/AIMn1xuFTenhUhxS1LKSfK8HPH
 ZVK5YtUvsaheOIAmgAM9HNbDjM5xlrBOBl4Be/l1t4Vz4NMd73bEtqcfz4+vnwTrGuv/2J
 16VIuu9ZiZ7xYSbmrYKE6rDh6Mib3AY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-nFQy64UWM56Z6ooQYP4pUQ-1; Wed, 29 Jun 2022 06:38:32 -0400
X-MC-Unique: nFQy64UWM56Z6ooQYP4pUQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 v13-20020ad4528d000000b004707f3f4683so15008604qvr.14
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z0fk3HRRKw4PJPTNYjK+Eg9y2dq/QoeNY5r/IVHl1pE=;
 b=7OtQq8UbFy+qPdfWx25s37WWgc+pOfTG5nZnhT05tkjSM/0jrYJ/Le/YNMm6mqy9gx
 RmztDLnBLspC+dgwyv1tWlN85OZcvDXAa9DZvyQvYH61NlsXBKELysPHijGSNzuD1xoP
 QZgSQv4hE5tJMrkWT3FeE8c001WWxdfv5hFKQGmWJFeDvd+Wvet/Wrv6XsI9xwR4BzE8
 xzsiDUqbKi7PB5ncYrFzo+PNhBzQJHG45Lgb5c6ta4Oq/BRnlG7xniGnXzPt1DJN6rYZ
 CKBEDyWw+awTWI/1UakxqVwGxBv0ky3jXfCl+GvDRRl0aG7u9e0FRGBCVrBcaOoun5bX
 xejQ==
X-Gm-Message-State: AJIora/sfimvJLD/PUrYW4CjziNr9o8jdcoaqdE657pmaV8+DhnFOKNc
 ejm8I05NOW2bJw9cDCkQa/qw/nmTEDz5b1XssSpWnUk1gHnfm5MP3y6fkxhOpUFlqPMyyhPX1zP
 Ot27wttj9X4+8HIo=
X-Received: by 2002:a05:620a:d94:b0:6a6:6c9c:c7ec with SMTP id
 q20-20020a05620a0d9400b006a66c9cc7ecmr1357640qkl.221.1656499112009; 
 Wed, 29 Jun 2022 03:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tq/g+awcs9IOhX9q+GQ2SpG1tSyeyS4J73QCmSe16b9ZLzQx+bCsbWHTYka0QzLjVoaIJD4g==
X-Received: by 2002:a05:620a:d94:b0:6a6:6c9c:c7ec with SMTP id
 q20-20020a05620a0d9400b006a66c9cc7ecmr1357619qkl.221.1656499111675; 
 Wed, 29 Jun 2022 03:38:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h18-20020ac87772000000b002f905347586sm10620776qtu.14.2022.06.29.03.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 03:38:31 -0700 (PDT)
Message-ID: <9dfbfd42-6a40-80d2-8d9d-f5849de0b726@redhat.com>
Date: Wed, 29 Jun 2022 12:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH RFC 1/2] arm/kvm: enable MTE if available
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220512131146.78457-1-cohuck@redhat.com>
 <20220512131146.78457-2-cohuck@redhat.com>
 <a3d0a093-3d59-5882-c9c8-6619e5aeb3ab@redhat.com> <877d5jskmw.fsf@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <877d5jskmw.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
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

Hi Connie,

On 6/14/22 10:40, Cornelia Huck wrote:
> On Fri, Jun 10 2022, Eric Auger <eauger@redhat.com> wrote:
> 
>> Hi Connie,
>> On 5/12/22 15:11, Cornelia Huck wrote:
>>> We need to disable migration, as we do not yet have a way to migrate
>>> the tags as well.
>>
>> This patch does much more than adding a migration blocker ;-) you may
>> describe the new cpu option and how it works.
> 
> I admit this is a bit terse ;) The idea is to control mte at the cpu
> level directly (and not indirectly via tag memory at the machine
> level). I.e. the user gets whatever is available given the constraints
> (host support etc.) if they don't specify anything, and they can
> explicitly turn it off/on.

Could the OnOffAuto property value be helpful?
> 
>>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>>>  target/arm/cpu.c     | 18 ++++------
>>>  target/arm/cpu.h     |  4 +++
>>>  target/arm/cpu64.c   | 78 ++++++++++++++++++++++++++++++++++++++++++++
>>>  target/arm/kvm64.c   |  5 +++
>>>  target/arm/kvm_arm.h | 12 +++++++
>>>  target/arm/monitor.c |  1 +
>>>  6 files changed, 106 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 029f644768b1..f0505815b1e7 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -1435,6 +1435,11 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>>>              error_propagate(errp, local_err);
>>>              return;
>>>          }
>>> +        arm_cpu_mte_finalize(cpu, &local_err);
>>> +        if (local_err != NULL) {
>>> +            error_propagate(errp, local_err);
>>> +            return;
>>> +        }
>>>      }
>>>  
>>>      if (kvm_enabled()) {
>>> @@ -1504,7 +1509,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>>          }
>>>          if (cpu->tag_memory) {
>>>              error_setg(errp,
>>> -                       "Cannot enable KVM when guest CPUs has MTE enabled");
>>> +                       "Cannot enable KVM when guest CPUs has tag memory enabled");
>> before this series, tag_memory was used to detect MTE was enabled at
>> machine level. And this was not compatible with KVM.
>>
>> Hasn't it changed now with this series? Sorry I don't know much about
>> that tag_memory along with the KVM use case? Can you describe it as well
>> in the cover letter.
> 
> IIU the current code correctly, the purpose of tag_memory is twofold:
> - control whether mte should be available in the first place
> - provide a place where a memory region used by the tcg implemtation can
>   be linked

OK I now understand the tag memory is a pure TCG thingy. So its setting
along with KVM shall be invalid indeed.
> 
> The latter part (extra memory region) is not compatible with
> kvm. "Presence of extra memory for the implementation" as the knob to
> configure mte for tcg makes sense, but it didn't seem right to me to use
> it for kvm while controlling something which is basically a cpu property.


> 
>>>              return;
>>>          }
>>>      }
> 
> (...)
> 
>>> +void aarch64_add_mte_properties(Object *obj)
>>> +{
>>> +    ARMCPU *cpu = ARM_CPU(obj);
>>> +
>>> +    /*
>>> +     * For tcg, the machine type may provide tag memory for MTE emulation.
>> s/machine type/machine?
> 
> Either, I guess, as only the virt machine type provides tag memory in
> the first place.
yeah that's what just a nit about the terminology.
> 
>>> +     * We do not know whether that is the case at this point in time, so
>>> +     * default MTE to on and check later.
>>> +     * This preserves pre-existing behaviour, but is really a bit awkward.
>>> +     */
>>> +    qdev_property_add_static(DEVICE(obj), &arm_cpu_mte_property);
>>> +    if (kvm_enabled()) {
>>> +        /*
>>> +         * Default MTE to off, as long as migration support is not
>>> +         * yet implemented.
>>> +         * TODO: implement migration support for kvm
>>> +         */
>>> +        cpu->prop_mte = false;
>>> +    }
>>> +}
>>> +
>>> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
>>> +{
>>> +    if (!cpu->prop_mte) {
>>> +        /* Disable MTE feature bits. */
>>> +        cpu->isar.id_aa64pfr1 =
>>> +            FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
>>> +        return;
>>> +    }
>>> +#ifndef CONFIG_USER_ONLY
>>> +    if (!kvm_enabled()) {
>>> +        if (cpu_isar_feature(aa64_mte, cpu) && !cpu->tag_memory) {
>>> +            /*
>>> +             * Disable the MTE feature bits, unless we have tag-memory
>>> +             * provided by the machine.
>>> +             * This silent downgrade is not really nice if the user had
>>> +             * explicitly requested MTE to be enabled by the cpu, but it
>>> +             * preserves pre-existing behaviour. In an ideal world, we
>>
>>
>> Can't we "simply" prevent the end-user from using the prop_mte option
>> with a TCG CPU? and have something like
>>
>> For TCG, MTE depends on the CPU feature availability + machine tag memory
>> For KVM, MTE depends on the user opt-in + CPU feature avail (if
>> relevant) + host VM capability (?)
> 
> I don't like kvm and tcg cpus behaving too differently... but then, tcg
> is already different as it needs tag_memory.
> 
> Thinking about it, maybe we could repurpose tag_memory in the kvm case
> (e.g. for a temporary buffer for migration purposes) and require it in
> all cases (making kvm fail if the user specified tag memory, but the
> host doesn't support it). A cpu feature still looks more natural to me,
> but I'm not yet quite used to how things are done in arm :)
If the tag memory is an implementation "detail" for TCG then I agree
with you that a CPU property would be more adapted for KVM.
> 
> The big elefant in the room is how migration will end up
> working... after reading the disscussions in
> https://lore.kernel.org/all/CAJc+Z1FZxSYB_zJit4+0uTR-88VqQL+-01XNMSEfua-dXDy6Wg@mail.gmail.com/
> I don't think it will be as "easy" as I thought, and we probably require
> some further fiddling on the kernel side.
Yes maybe the MTE migration process shall be documented and discussed
separately on the ML? Is Haibu Xu's address bouncing?

Eric
> 
>>
>> But maybe I miss the point ...
>>> +             * would fail if MTE was requested, but no tag memory has
>>> +             * been provided.
>>> +             */
>>> +            cpu->isar.id_aa64pfr1 =
>>> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
>>> +        }
>>> +        if (!cpu_isar_feature(aa64_mte, cpu)) {
>>> +            cpu->prop_mte = false;
>>> +        }
>>> +        return;
>>> +    }
>>> +    if (kvm_arm_mte_supported()) {
>>> +#ifdef CONFIG_KVM
>>> +        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0)) {
>>> +            error_setg(errp, "Failed to enable KVM_CAP_ARM_MTE");
>>> +        } else {
>>> +            /* TODO: add proper migration support with MTE enabled */
>>> +            if (!mte_migration_blocker) {
>>> +                error_setg(&mte_migration_blocker,
>>> +                           "Live migration disabled due to MTE enabled");
>>> +                if (migrate_add_blocker(mte_migration_blocker, NULL)) {
>> error_free(mte_migration_blocker);
>> mte_migration_blocker = NULL;
> 
> Ah, I missed that, thanks.
> 
>>> +                    error_setg(errp, "Failed to add MTE migration blocker");
>>> +                }
>>> +            }
>>> +        }
>>> +#endif
>>> +    }
>>> +    /* When HVF provides support for MTE, add it here */
>>> +#endif
>>> +}
>>> +
> 


