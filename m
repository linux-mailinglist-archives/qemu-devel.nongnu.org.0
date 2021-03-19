Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E168034173A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 09:20:17 +0100 (CET)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNAMi-0002qx-Cd
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 04:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lNALe-00023v-Kz; Fri, 19 Mar 2021 04:19:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:39896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lNALc-0006Eo-Rp; Fri, 19 Mar 2021 04:19:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B049AAB8C;
 Fri, 19 Mar 2021 08:19:03 +0000 (UTC)
Subject: Re: arm_cpu_post_init (Was: Re: arm: "max" CPU class hierarchy
 changes possible?)
To: Eduardo Habkost <ehabkost@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
 <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
 <20210311191046.ykcelkwq7orajyu7@kamzik.brq.redhat.com>
 <5467e45c-cc8e-6422-0c56-398405a7c331@suse.de>
 <c3397f29-82eb-5a1b-803d-8184c9a8d508@suse.de>
 <20210318120837.cg4gfdpchjwiabav@kamzik.brq.redhat.com>
 <fc769a96-a304-7429-5dee-a65b52179b1c@suse.de>
 <20210318125908.zwpm47ftlsuen3zo@kamzik.brq.redhat.com>
 <20210318131010.GT3139005@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ce57f177-9215-fcb7-1b93-5cc738e50f4e@suse.de>
Date: Fri, 19 Mar 2021 09:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210318131010.GT3139005@habkost.net>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 2:10 PM, Eduardo Habkost wrote:
> On Thu, Mar 18, 2021 at 01:59:08PM +0100, Andrew Jones wrote:
>> On Thu, Mar 18, 2021 at 01:42:36PM +0100, Claudio Fontana wrote:
>>> On 3/18/21 1:08 PM, Andrew Jones wrote:
>>>> On Thu, Mar 18, 2021 at 12:32:30PM +0100, Claudio Fontana wrote:
>>>>> And why do we have a separate arm_cpu_finalize_features()?
>>>>
>>>> Separate, because it's not just called from arm_cpu_realizefn().
>>>
>>> In particular it is also called by the monitor.c in qmp_query_cpu_model_expansion(),
>>>
>>> which basically creates an object of the cpu subclass,
>>> and then calls arm_cpu_finalize_[features]() explicitly on the object.
>>>
>>> Is the qdev realize() method not called in this case? Should instead it be triggered, rather than initializing/realizing an incomplete object?
>>
>> Can you elaborate on what you mean by "triggered"? The QMP query does the
>> least that it can get away with while still reusing the CPU model's
>> feature initialization code. Any suggestions for improving that,
>> preferably in the form of a patch, would be welcome. If it works well for
>> Arm, then it could probably be applied to other architectures. The Arm QMP
>> query is modeled off the others.
> 
> This sound very similar to x86_cpu_expand_features(), so the
> approach makes sense to me.

Interesting, to me it sounds like a CPUClass method is hiding here, cc->cpu_expand_features(),
I could help kickstart the implementation but would need a good description / comment of exactly which features are supposed to be expanded there. 

> 
> It wouldn't make sense to call realize() inside
> qmp_query_cpu_model_expansion().  Realizing the CPU means
> plugging it into the guest, and we would never want to do that
> when executing a query command.
> 

Makes sense, thanks for the explanation.

Ciao,

Claudio

