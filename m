Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C99364806
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:15:22 +0200 (CEST)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWYS-0004gK-VQ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYWW8-0002tf-GE; Mon, 19 Apr 2021 12:12:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:37158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYWW5-00053q-N7; Mon, 19 Apr 2021 12:12:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34790B303;
 Mon, 19 Apr 2021 16:12:50 +0000 (UTC)
Subject: Re: [RFC v1 1/5] hw/s390x: only build qemu-tod from the CONFIG_TCG
 build
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>
References: <20210322191551.25752-1-cfontana@suse.de>
 <20210322191551.25752-2-cfontana@suse.de>
 <20210331130756.20971c8a.cohuck@redhat.com>
 <4eaf4c51-b940-66df-7ef7-61782b0cf31d@suse.de>
Message-ID: <0eecb78f-c521-f217-1ea5-e570dc080a15@suse.de>
Date: Mon, 19 Apr 2021 18:12:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4eaf4c51-b940-66df-7ef7-61782b0cf31d@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 11:11 AM, Claudio Fontana wrote:
> Hi Cornelia,
> 
> On 3/31/21 1:07 PM, Cornelia Huck wrote:
>> On Mon, 22 Mar 2021 20:15:47 +0100
>> Claudio Fontana <cfontana@suse.de> wrote:
>>
>>> this allows to remove unneeded stubs for target/s390x.
>>
>> This patch doesn't seem to remove any, though?
> 
> The next patch does... I'll split more the patches so it becomes clearer.
> 
>>
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  hw/s390x/tod.c       | 9 ++++++++-
>>>  hw/s390x/meson.build | 5 ++++-
>>>  2 files changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
>>> index 3c2979175e..322732d7fd 100644
>>> --- a/hw/s390x/tod.c
>>> +++ b/hw/s390x/tod.c
>>> @@ -14,6 +14,8 @@
>>>  #include "qemu/error-report.h"
>>>  #include "qemu/module.h"
>>>  #include "sysemu/kvm.h"
>>> +#include "sysemu/tcg.h"
>>> +#include "sysemu/qtest.h"
>>>  #include "migration/qemu-file-types.h"
>>>  #include "migration/register.h"
>>>  
>>> @@ -23,8 +25,13 @@ void s390_init_tod(void)
>>>  
>>>      if (kvm_enabled()) {
>>>          obj = object_new(TYPE_KVM_S390_TOD);
>>> -    } else {
>>> +    } else if (tcg_enabled()) {
>>>          obj = object_new(TYPE_QEMU_S390_TOD);
>>> +    } else if (qtest_enabled()) {
>>> +        return;
>>> +    } else {
>>> +        warn_report("current accelerator not handled in s390_init_tod!");
>>> +        return;
>>
>> I'm wondering whether this should be a fatal error.
> 
> I would agree with that.
> 
>>
>>>      }
>>>      object_property_add_child(qdev_get_machine(), TYPE_S390_TOD, obj);
>>>      object_unref(obj);
>>> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
>>> index 91495b5631..7f31f9e5d5 100644
>>> --- a/hw/s390x/meson.build
>>> +++ b/hw/s390x/meson.build
>>> @@ -16,7 +16,6 @@ s390x_ss.add(files(
>>>    'sclp.c',
>>>    'sclpcpu.c',
>>>    'sclpquiesce.c',
>>> -  'tod-qemu.c',
>>>    'tod.c',
>>>  ))
>>>  s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>>> @@ -25,6 +24,10 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>>>    's390-stattrib-kvm.c',
>>>    'pv.c',
>>>  ))
>>> +s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
>>> +  'tod-qemu.c',
>>
>> Should we rename this to tod-tcg.c?
> 
> I think so.

Here we are a bit limited though by the fact that the object is currently called:

include/hw/s390x/tod.h:26:#define TYPE_QEMU_S390_TOD TYPE_S390_TOD "-qemu"

So there might be a compatibility issue in trying to make this consistent, which would mean to replace this with:

#define TYPE_TCG_S390_TOD TYPE_S390_TOD "-tcg"

What do you think?


> 
>>
>>> +))
>>> +
>>>  s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-ccw.c'))
>>>  s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
>>>  s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))
>>
>>
> 
> Will prepare a new version,
> 
> Thanks,
> 
> Claudio
> 


