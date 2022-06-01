Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80B53A8C9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 16:12:58 +0200 (CEST)
Received: from localhost ([::1]:34540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwP5k-0002Nf-Od
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 10:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwP3G-0001BL-Kk
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwP3E-0007Qw-21
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 10:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654092616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2X6ZLww40zxUixUPhRD9wzJWBrQ/cDCEdxGhyIfOss=;
 b=R28m4v3w9ZZAhJ48lV1ehPJWWrV6na1xwMlx7A5u/Vj+hvsX0NfmNNgSbCxlkbcFnOciQ2
 qfNRjQkN7eeK9M5+U7mfxj+WhcIS5mWlvY6V9kz7bchYAtukdZbSHFK3vGpE+Rlhul+9tI
 ztjANIsMDUkfauf5LELu/hp3pbexf1U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651--2N_KnB2PKCXfwbSJmCVtw-1; Wed, 01 Jun 2022 10:10:15 -0400
X-MC-Unique: -2N_KnB2PKCXfwbSJmCVtw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n18-20020a05600c3b9200b00397335edc7dso3427385wms.7
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 07:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=S2X6ZLww40zxUixUPhRD9wzJWBrQ/cDCEdxGhyIfOss=;
 b=GX2RcV8cLRpJS8mYVa/a5XRPmpCKDSpLhcY/ZudfpCzq30o5/Ewuxg2JvnEev1yMPW
 LS5wx61orcopxgvWTCYwM+N+XtEv8rOsby1X2GjiV6szHc7w+1tyrvKxAY0ZgsV73gbs
 2pHrK7FUL0Aa8GiLMyYWN9ZykXppruA5wi4PomjVFHUPFg8D/+W4qYovMjictSCN+640
 v4ekRd4FmP4jHtqCHfPL2/r02baHxjoDSbrUGpI+KBRON6oIHOwJWpV81M8sCsyBewHz
 9A/NBJc7iNZjPJEAc/MAIOqXh8pEJfdU/ccNxEeD+OBrLuWEw3Gxvj6RVgPtmly6ZMCV
 fkEQ==
X-Gm-Message-State: AOAM533PElUQI/LvtvjCVqhIeEBywX9eMA7xnIOcl+L0+Cn6xK6gwnco
 yf2uPgdQeFX8O9OnjT93uTYhZDu6pV44g5m6GulW7SklZaPnUiz61peRWN1FTGq3Wv79b24rSye
 UkHVnCWcJrAYUXnI=
X-Received: by 2002:a7b:c7c3:0:b0:398:934f:a415 with SMTP id
 z3-20020a7bc7c3000000b00398934fa415mr85707wmk.27.1654092614255; 
 Wed, 01 Jun 2022 07:10:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTl9uz/zNJ7sFJjgk3LU0l5DtUJXTuFkUOmh3MJcMb06+pAEbmVWGUAy326g7/E53rzbtIYg==
X-Received: by 2002:a7b:c7c3:0:b0:398:934f:a415 with SMTP id
 z3-20020a7bc7c3000000b00398934fa415mr85677wmk.27.1654092613934; 
 Wed, 01 Jun 2022 07:10:13 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45?
 (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de.
 [2003:cb:c705:2600:951d:63df:c091:3b45])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a5d6e0c000000b0020ff877cfbdsm1645548wrz.87.2022.06.01.07.10.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 07:10:13 -0700 (PDT)
Message-ID: <f8d128d2-e58a-e0a0-ff8a-7ff2b2ffa31e@redhat.com>
Date: Wed, 1 Jun 2022 16:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220524190305.140717-1-mjrosato@linux.ibm.com>
 <20220524190305.140717-3-mjrosato@linux.ibm.com>
 <5b19dd64-d6be-0371-da63-0dd0b78a3a5c@redhat.com>
 <6030c7e6-479d-660c-9198-1c65c74735a1@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 2/8] target/s390x: add zpci-interp to cpu models
In-Reply-To: <6030c7e6-479d-660c-9198-1c65c74735a1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 01.06.22 15:48, Matthew Rosato wrote:
> On 6/1/22 5:52 AM, David Hildenbrand wrote:
>> On 24.05.22 21:02, Matthew Rosato wrote:
>>> The zpci-interp feature is used to specify whether zPCI interpretation is
>>> to be used for this guest.
>>
>> We have
>>
>> DEF_FEAT(SIE_PFMFI, "pfmfi", SCLP_CONF_CHAR_EXT, 9, "SIE: PFMF
>> interpretation facility")
>>
>> and
>>
>> DEF_FEAT(SIE_SIGPIF, "sigpif", SCLP_CPU, 12, "SIE: SIGP interpretation
>> facility")
>>
>>
>> Should we call this simply "zpcii" or "zpciif" (if the official name
>> includes "Facility")
>>
> 
> This actually controls the use of 2 facilities which really only make 
> sense together - Maybe just zpcii
> 
>>>
>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>> ---
>>>   hw/s390x/s390-virtio-ccw.c          | 1 +
>>>   target/s390x/cpu_features_def.h.inc | 1 +
>>>   target/s390x/gen-features.c         | 2 ++
>>>   target/s390x/kvm/kvm.c              | 1 +
>>>   4 files changed, 5 insertions(+)
>>>
>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>>> index 047cca0487..b33310a135 100644
>>> --- a/hw/s390x/s390-virtio-ccw.c
>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>> @@ -806,6 +806,7 @@ static void ccw_machine_7_0_instance_options(MachineState *machine)
>>>       static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_0 };
>>>   
>>>       ccw_machine_7_1_instance_options(machine);
>>> +    s390_cpudef_featoff_greater(14, 1, S390_FEAT_ZPCI_INTERP);
>>>       s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
>>>   }
>>>   
>>> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
>>> index e86662bb3b..4ade3182aa 100644
>>> --- a/target/s390x/cpu_features_def.h.inc
>>> +++ b/target/s390x/cpu_features_def.h.inc
>>> @@ -146,6 +146,7 @@ DEF_FEAT(SIE_CEI, "cei", SCLP_CPU, 43, "SIE: Conditional-external-interception f
>>>   DEF_FEAT(DAT_ENH_2, "dateh2", MISC, 0, "DAT-enhancement facility 2")
>>>   DEF_FEAT(CMM, "cmm", MISC, 0, "Collaborative-memory-management facility")
>>>   DEF_FEAT(AP, "ap", MISC, 0, "AP instructions installed")
>>> +DEF_FEAT(ZPCI_INTERP, "zpci-interp", MISC, 0, "zPCI interpretation")
>>
>> How is this feature exposed to the guest, meaning, how can the guest
>> sense support?
>>
>> Just a gut feeling: does this toggle enable the host to use
>> interpretation and the guest cannot really determine the difference
>> whether it's enabled or not? Then, it's not a guest CPU feature. But
>> let's hear first what this actually enables :)
> 
> This has changed a few times, but collectively we can determine on the 
> host kernel if it is allowable based upon the availability of certain 
> facility/sclp bits + the availability of an ioctl interface.
> 
> If all of these are available, the host kernel allows zPCI 
> interpretation, with userspace able to toggle it on/off for the guest 
> via this feature.  When allowed and enabled, 2 ECB bits then get set for 
> each guest vcpu that enable the associated facilities.  The guest 
> continues to use zPCI instructions in the same manner as before; the 
> function handles it receives from CLP instructions will look different 
> but are still used in the same manner.
> 
> We don't yet add vsie support of the facilities with this series, so the 
> corresponding facility and sclp bits aren't forwarded to the guest.

That's exactly my point:

sigpif and pfmfi are actually vsie features. I'd have expected that
zpcii would be a vsie feature as well.

If interpretation is really more an implementation detail in the
hypervisor to implement zpci, than an actual guest feature (meaning, the
guest is able to observe it as if it were a real CPU feature), then we
most probably want some other way to toggle it (maybe via the machine?).

Example: KVM uses SIGP interpretation based on availability. However, we
don't toggle it via sigpif. sigpif actually tells the guest that it can
use the SIGP interpretation facility along with vsie.

You mention "CLP instructions will look different", I'm not sure if that
should actually be handled via the CPU model. From my gut feeling, zpcii
should actually be the vsie zpcii support to be implemented in the future.


So I wonder if we could simply always enable zPCI interpretation if
HW+kernel support is around and we're on a new compat machine? I there
is a way that migration could break (from old kernel to new kernel),
we'd have to think about alternatives.


-- 
Thanks,

David / dhildenb


