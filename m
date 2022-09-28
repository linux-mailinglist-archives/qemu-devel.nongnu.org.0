Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41935EE39E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:55:09 +0200 (CEST)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbH2-0003C7-Jj
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1odZvR-00042c-Lp
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:28:46 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1odZvJ-0005iK-Bq
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:28:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9C2B412CD28E9;
 Wed, 28 Sep 2022 18:28:24 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 28 Sep
 2022 18:28:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00349c75544-118b-41af-a7ed-004146c99ceb,
 C75DA7A61898C88B8DB19AE4E08673D8991D436D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3becce0a-1b7a-385a-4180-f68cf192595a@kaod.org>
Date: Wed, 28 Sep 2022 18:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v9 01/10] s390x/cpus: Make absence of multithreading clear
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, Nico Boehr <nrb@linux.ibm.com>,
 <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, <borntraeger@de.ibm.com>, <pasic@linux.ibm.com>, 
 <richard.henderson@linaro.org>, <david@redhat.com>, <thuth@redhat.com>,
 <cohuck@redhat.com>, <mst@redhat.com>, <pbonzini@redhat.com>,
 <kvm@vger.kernel.org>, <ehabkost@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <seiden@linux.ibm.com>,
 <frankja@linux.ibm.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-2-pmorel@linux.ibm.com>
 <166237756810.5995.16085197397341513582@t14-nrb>
 <c394823e-edd5-a722-486f-438e5fba2c9d@linux.ibm.com>
 <0d3fd34e-d060-c72e-ee19-e9054e06832a@kaod.org>
 <724d962a-c11b-c18d-f67f-9010eb2f32e2@linux.ibm.com>
 <dff1744f-3242-af11-6b4b-02037a7e2af5@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <dff1744f-3242-af11-6b4b-02037a7e2af5@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d302ef6c-085e-4171-ba0f-e0dae8a43de5
X-Ovh-Tracer-Id: 8514055098936494861
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegkedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrhgrnhhkjhgrsehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/28/22 18:16, Pierre Morel wrote:
> More thinking about this I will drop this patch for backward compatibility and in topology masks treat CPUs as being cores*threads

yes. You never know, people might have set threads=2 in their
domain file (like me). You could give the user a warning though,
with warn_report().

Thanks,

C.

  
> 
> 
> 
> On 9/28/22 15:21, Pierre Morel wrote:
>>
>>
>> On 9/27/22 11:44, Cédric Le Goater wrote:
>>> On 9/5/22 17:10, Pierre Morel wrote:
>>>>
>>>>
>>>> On 9/5/22 13:32, Nico Boehr wrote:
>>>>> Quoting Pierre Morel (2022-09-02 09:55:22)
>>>>>> S390x do not support multithreading in the guest.
>>>>>> Do not let admin falsely specify multithreading on QEMU
>>>>>> smp commandline.
>>>>>>
>>>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>>>> ---
>>>>>>   hw/s390x/s390-virtio-ccw.c | 3 +++
>>>>>>   1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>>>>>> index 70229b102b..b5ca154e2f 100644
>>>>>> --- a/hw/s390x/s390-virtio-ccw.c
>>>>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>>>>> @@ -86,6 +86,9 @@ static void s390_init_cpus(MachineState *machine)
>>>>>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>>>>>       int i;
>>>>>> +    /* Explicitely do not support threads */
>>>>>            ^
>>>>>            Explicitly
>>>>>
>>>>>> +    assert(machine->smp.threads == 1);
>>>>>
>>>>> It might be nicer to give a better error message to the user.
>>>>> What do you think about something like (broken whitespace ahead):
>>>>>
>>>>>      if (machine->smp.threads != 1) {if (machine->smp.threads != 1) {
>>>>>          error_setg(&error_fatal, "More than one thread specified, but multithreading unsupported");
>>>>>          return;
>>>>>      }
>>>>>
>>>>
>>>>
>>>> OK, I think I wanted to do this and I changed my mind, obviously, I do not recall why.
>>>> I will do almost the same but after a look at error.h I will use error_report()/exit() instead of error_setg()/return as in:
>>>>
>>>>
>>>> +    /* Explicitly do not support threads */
>>>> +    if (machine->smp.threads != 1) {
>>>> +        error_report("More than one thread specified, but multithreading unsupported");
>>>> +        exit(1);
>>>> +    }
>>>
>>>
>>> or add an 'Error **errp' parameter to s390_init_cpus() and use error_setg()
>>> as initially proposed. s390x_new_cpu() would benefit from it also.
>>>
>> OK, Thanks,
>>
>> Pierre
>>
> 


