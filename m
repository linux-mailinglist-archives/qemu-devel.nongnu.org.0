Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADB06D60DC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:37:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjft2-0004FD-Hk; Tue, 04 Apr 2023 08:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjfsz-0004Ed-AE
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:35:41 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjfsw-000595-Mq
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 08:35:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 14D042B9E9;
 Tue,  4 Apr 2023 12:35:33 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 4 Apr
 2023 14:35:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004c24e5812-f45a-4985-b190-7409fe1dc94f,
 85507D0075A56E5AD4EA03BF56E5282CC2D8C3A6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <55c4e517-dbd0-bbd2-7dde-0e2cab746101@kaod.org>
Date: Tue, 4 Apr 2023 14:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v19 01/21] s390x/cpu topology: add s390 specifics to CPU
 topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, <borntraeger@de.ibm.com>, <pasic@linux.ibm.com>, 
 <richard.henderson@linaro.org>, <david@redhat.com>, <thuth@redhat.com>,
 <cohuck@redhat.com>, <mst@redhat.com>, <pbonzini@redhat.com>,
 <kvm@vger.kernel.org>, <ehabkost@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <seiden@linux.ibm.com>,
 <nrb@linux.ibm.com>, <nsg@linux.ibm.com>, <frankja@linux.ibm.com>,
 <berrange@redhat.com>
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-2-pmorel@linux.ibm.com>
 <4118bb4e-0505-26d3-3ffe-49245eae5364@kaod.org>
 <bd5cc488-20a7-54d1-7c3e-86136db77f84@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <bd5cc488-20a7-54d1-7c3e-86136db77f84@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7426cdbf-8ecc-4bed-bc37-7433792faba1
X-Ovh-Tracer-Id: 1843098149859199955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefgfekteekgeelheeujeeghfetkeetleeiudeuffektefgkeehueffheevveekjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddupdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpmhhorhgvlheslhhinhhugidrihgsmhdrtghomhdpnhhsgheslhhinhhugidrihgsmhdrtghomhdpnhhrsgeslhhinhhugidrihgsmhdrtghomhdpshgvihguvghnsehlihhnuhigrdhisghmrdgtohhmpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpvghhrggskhhosh
 htsehrvgguhhgrthdrtghomhdpkhhvmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrseguvgdrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpmhhsthesrhgvughhrghtrdgtohhmpdgsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

>>> @@ -0,0 +1,15 @@
>>> +/*
>>> + * CPU Topology
>>> + *
>>> + * Copyright IBM Corp. 2022
>>
>> Shouldn't we have some range : 2022-2023 ?
> 
> There was a discussion on this in the first spins, I think to remember that Nina wanted 22 and Thomas 23,
> 
> now we have a third opinion :) .
> 
> I must say that all three have their reasons and I take what the majority wants.

There is an internal IBM document describing the copyright tags. If I recall
well, first date is the first year the code was officially published, second
year is the last year it was modified (so last commit of the year). Or
something like that and it's theory, because we tend to forget.

For an example, see the OPAL FW https://github.com/open-power/skiboot/,
and run :

   "grep Copyright.*IBM" in the OPAL FW
  [ ...]

>>> @@ -30,8 +30,19 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
>>>   {
>>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>       GString *s = g_string_new(NULL);
>>> +    const char *multiply = " * ", *prefix = "";
>>>   -    g_string_append_printf(s, "sockets (%u)", ms->smp.sockets);
>>> +    if (mc->smp_props.drawers_supported) {
>>> +        g_string_append_printf(s, "drawers (%u)", ms->smp.drawers);
>>> +    prefix = multiply;
>>
>> indent issue.
> 
> right, seems I forgot to update the patch set after the checkpatch.

nope, you didn't. checkpatch doesn't report it. It's not perfect :/

C.

