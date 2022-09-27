Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA35EBF42
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:10:03 +0200 (CEST)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7XO-00041c-DA
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1od79D-0000jK-F3
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:45:04 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:50503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1od79A-0005zN-MX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:45:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4E01912C5AA11;
 Tue, 27 Sep 2022 11:44:56 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 27 Sep
 2022 11:44:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00683c076b6-2ca7-40aa-a930-f03bf132be68,
 12A65CACE92C1DACCE6E97948814F03D28E096F2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0d3fd34e-d060-c72e-ee19-e9054e06832a@kaod.org>
Date: Tue, 27 Sep 2022 11:44:54 +0200
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c394823e-edd5-a722-486f-438e5fba2c9d@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c412c6eb-ac12-4b22-a287-0a08348e524f
X-Ovh-Tracer-Id: 14274159021011471117
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeggedgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrhgrnhhkjhgrsehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/5/22 17:10, Pierre Morel wrote:
> 
> 
> On 9/5/22 13:32, Nico Boehr wrote:
>> Quoting Pierre Morel (2022-09-02 09:55:22)
>>> S390x do not support multithreading in the guest.
>>> Do not let admin falsely specify multithreading on QEMU
>>> smp commandline.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
>>>   hw/s390x/s390-virtio-ccw.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>>> index 70229b102b..b5ca154e2f 100644
>>> --- a/hw/s390x/s390-virtio-ccw.c
>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>> @@ -86,6 +86,9 @@ static void s390_init_cpus(MachineState *machine)
>>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>>       int i;
>>> +    /* Explicitely do not support threads */
>>            ^
>>            Explicitly
>>
>>> +    assert(machine->smp.threads == 1);
>>
>> It might be nicer to give a better error message to the user.
>> What do you think about something like (broken whitespace ahead):
>>
>>      if (machine->smp.threads != 1) {if (machine->smp.threads != 1) {
>>          error_setg(&error_fatal, "More than one thread specified, but multithreading unsupported");
>>          return;
>>      }
>>
> 
> 
> OK, I think I wanted to do this and I changed my mind, obviously, I do not recall why.
> I will do almost the same but after a look at error.h I will use error_report()/exit() instead of error_setg()/return as in:
> 
> 
> +    /* Explicitly do not support threads */
> +    if (machine->smp.threads != 1) {
> +        error_report("More than one thread specified, but multithreading unsupported");
> +        exit(1);
> +    }


or add an 'Error **errp' parameter to s390_init_cpus() and use error_setg()
as initially proposed. s390x_new_cpu() would benefit from it also.

Thanks,

C.


> 
> 
> Thanks,
> 
> Regards,
> Pierre
> 


