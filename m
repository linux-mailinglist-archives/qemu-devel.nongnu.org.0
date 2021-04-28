Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3436D5D7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:31:42 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhTp-0004vZ-Tw
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lbhSo-0004UX-4F; Wed, 28 Apr 2021 06:30:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:41598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lbhSm-0003Xw-5f; Wed, 28 Apr 2021 06:30:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD532B0E5;
 Wed, 28 Apr 2021 10:30:32 +0000 (UTC)
Subject: Re: [RFC v3 13/13] MAINTAINERS: update s390x directories
To: Cornelia Huck <cohuck@redhat.com>
References: <20210422115430.15078-1-cfontana@suse.de>
 <20210422115430.15078-14-cfontana@suse.de>
 <20210427170047.2cf0d6c0.cohuck@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8d527589-8fcb-4c87-55b3-530173c7a1a7@suse.de>
Date: Wed, 28 Apr 2021 12:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210427170047.2cf0d6c0.cohuck@redhat.com>
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

Hello Cornelia,

On 4/27/21 5:00 PM, Cornelia Huck wrote:
> On Thu, 22 Apr 2021 13:54:30 +0200
> Claudio Fontana <cfontana@suse.de> wrote:
> 
>> After the reshuffling, update MAINTAINERS accordingly.
>> Make use of the new directories:
>>
>> target/s390x/kvm/
>> target/s390x/tcg/
> 
> Is there anything left in target/s390x/ that is neither in kvm/ nor in

Btw the series still does not include the move of TCGCPUOps to a tcg CPU class accel in tcg/,
if ok with you all I would do it in a later series, but let me know if you'd like it here instead.

After this series, there is still:

cpu class code, cpu-*
machine.c
arch_dump.c
cpu_models*
cpu_features*
helper.c
diag.c
interrupt.c
ioinst.c

mmu_helper.c [ part of this could be still split between tcg/ and kvm/ but it is not a clear call]
sigp.c       [ same here, could be investigated for further split, but likely common parts would remain here]

Many of these items match the S390 KVM CPUs section, which in some cases should probably instead be more in the general section:

S390 KVM CPUs
M: Halil Pasic <pasic@linux.ibm.com>
M: Cornelia Huck <cohuck@redhat.com>
M: Christian Borntraeger <borntraeger@de.ibm.com>
S: Supported
F: target/s390x/kvm/
F: target/s390x/ioinst.[ch]
F: target/s390x/machine.c
F: target/s390x/sigp.c
F: target/s390x/cpu_features*.[ch]
F: target/s390x/cpu_models*.[ch]
F: hw/s390x/pv.c
F: include/hw/s390x/pv.h
F: hw/intc/s390_flic.c
F: hw/intc/s390_flic_kvm.c
F: include/hw/s390x/s390_flic.h
F: gdb-xml/s390*.xml
T: git https://gitlab.com/cohuck/qemu.git s390-next
T: git https://github.com/borntraeger/qemu.git s390-next
L: qemu-s390x@nongnu.org


> tcg/? It seems that will only be covered by the general s390
> maintainers entry.
> 
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  MAINTAINERS | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7de873c9f5..3d738bd4fc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -315,7 +315,7 @@ S390 TCG CPUs
>>  M: Richard Henderson <richard.henderson@linaro.org>
>>  M: David Hildenbrand <david@redhat.com>
>>  S: Maintained
>> -F: target/s390x/
>> +F: target/s390x/tcg
>>  F: hw/s390x/
> 
> Unrelated: I'm wondering how much sense it makes to have the whole of
> hw/s390x/ under the tcg section... but if the maintainers are not
> complaining, I'm happy to leave it there :)
> 
>>  F: disas/s390.c
>>  F: tests/tcg/s390x/
>> @@ -417,14 +417,12 @@ M: Halil Pasic <pasic@linux.ibm.com>
>>  M: Cornelia Huck <cohuck@redhat.com>
>>  M: Christian Borntraeger <borntraeger@de.ibm.com>
>>  S: Supported
>> -F: target/s390x/kvm.c
>> -F: target/s390x/kvm_s390x.h
>> -F: target/s390x/kvm-stub.c
>> +F: target/s390x/kvm/
>>  F: target/s390x/ioinst.[ch]
>>  F: target/s390x/machine.c
>>  F: target/s390x/sigp.c
>>  F: target/s390x/cpu_features*.[ch]
>> -F: target/s390x/cpu_models.[ch]
>> +F: target/s390x/cpu_models*.[ch]
>>  F: hw/s390x/pv.c
>>  F: include/hw/s390x/pv.h
>>  F: hw/intc/s390_flic.c
> 
> 

Let me know if you need further changes here,
or if they should be in a separate context.

Thanks!

Claudio


