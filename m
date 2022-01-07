Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F148740F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:21:32 +0100 (CET)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5kV9-0002d5-6Y
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:21:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5kTB-0001kz-Ue
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:19:33 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:55505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5kT9-000809-JY
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:19:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3FABF22E99;
 Fri,  7 Jan 2022 08:19:25 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 7 Jan
 2022 09:19:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0024bb79487-ca57-4c32-b699-3b535b7d5066,
 D1700ACFBCC0ABDAABB75BE948F39103D7C2068B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0dbc9805-e08b-2190-8c1b-2a9e4081c02e@kaod.org>
Date: Fri, 7 Jan 2022 09:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the G4
 family
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, <qemu-devel@nongnu.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
 <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
 <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
 <87ilwfqesw.fsf@linux.ibm.com>
 <095292e8-f715-309d-67dc-3dc290a59d95@kaod.org>
 <874k7vq8ug.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <874k7vq8ug.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d91e248c-a731-4ca6-bcc1-7f40caadc435
X-Ovh-Tracer-Id: 17837913700111190889
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudegtddguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgkedtfeevffeijeehiefhffehgfeuvdeffeeuieetffekgfduteejteekkeefueenucffohhmrghinhepfhhrvggvsghsugdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
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
Cc: danielhb413@gmail.com, openbios@openbios.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 16:28, Fabiano Rosas wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>>>> Right. If we're doing this to say "I can boot a kernel with a 7450 cpu in QEMU" but
>>>> the implementation is different from real hardware, then I'm not sure what the real
>>>> value is. That effectively leaves option b) if someone is willing to do the work, or
>>>> as you say to simply remove the code from QEMU.
>>>
>>> Yeah, that is a good point. Although the software TLB is well contained,
>>> so we could certainly document that our 7450s don't have that feature
>>> and call it a day. Does QEMU have any policy on how much of a machine is
>>> required to be implemented?
>>>
>>> I am more inclined to apply c) for now as I said, just to have some code
>>> running on the CPU and maybe document in a gitlab issue that we're
>>> lacking the runtime switch and eventually implement that. It's not like
>>> this is high traffic code anyway. It has been broken for 10+ years.
>>>
>>> That said, if Cédric and Daniel see more value in moving the 7450s to
>>> the POWERPC_MMU_32B I won't oppose.
>>
>> I am in favor of dropping unused code in QEMU and keeping the CPUs for
>> which we have support in Linux using the POWERPC_MMU_32B in QEMU and the
>> openbios patch. If we need SoftTLB support for the 74x CPUs in QEMU, we
>> can always dig in the history.
> 
> Ack. I'll send a v2.
> 
>>
>> We can give FreeBSB a try also since they had support for the G4 :
>>
>>     https://people.freebsd.org/~arved/stuff/minimac
>>
>>
>> With the openbios patch, Linux boots fine under 7450, 7455, 7447 CPUs.
>>
>> Under 7448, it drops in xmon with a :
>>    
>> kernel tried to execute exec-protected page (c07fdd98) - exploit attempt? (uid: 0)
>> BUG: Unable to handle kernel instruction fetch
>> Faulting instruction address: 0xc07fdd98
>> Vector: 400 (Instruction Access) at [f1019d30]
>>       pc: c07fdd98: __do_softirq+0x0/0x2f0
>>       lr: c00516a4: irq_exit+0xbc/0xf8
>>       sp: f1019df0
>>      msr: 10001032
>>     current = 0xc0d00000
>>       pid   = 1, comm = swapper
> 
> I see two possible issues:
> 
> 1) The 7448 is configured as a 7400 in QEMU (cpu-models.c), so it will
> behave differently from the 7450s. The user manual seems to indicate it
> is closer to a 7445 than a 7400. We need to double check what is correct.
> 
> 2) OpenBIOS already has support for the 7448 PVR without my patch, but
> given that no other cpu of the 7450 family is supported, I'd say this is
> accidental. The mask that OpenBIOS uses for e600/MPC86xx is:
> 
>          .iu_version = 0x80040000,
>          .name = "PowerPC,MPC86xx",
> 
> And the verification:
> 
>      iu_version = mfpvr() & 0xffff0000;
> 
>      for (i = 0; i < sizeof(ppc_defs) / sizeof(struct cpudef); i++) {
>          if (iu_version == ppc_defs[i].iu_version)
>              return &ppc_defs[i];
>      }
>      printk("Unknown cpu (pvr %x), freezing!\n", iu_version);
> 
> But QEMU says the PVRs are as follows:
> 
>      CPU_POWERPC_e600               = 0x80040010,
> #define CPU_POWERPC_MPC8610          CPU_POWERPC_e600
> #define CPU_POWERPC_MPC8641          CPU_POWERPC_e600
> #define CPU_POWERPC_MPC8641D         CPU_POWERPC_e600
> 
>      CPU_POWERPC_7448_v10           = 0x80040100,
>      CPU_POWERPC_7448_v11           = 0x80040101,
>      CPU_POWERPC_7448_v20           = 0x80040200,
>      CPU_POWERPC_7448_v21           = 0x80040201,
> 
> So by applying the mask, OpenBIOS is matching both 0x80040100 and
>   0x80040010 when it looks like it only wants to match the latter.

Hello,

a quick status on how QEMU has evolved regarding this topic.

We have merged :

   a09410ed1fb8 ("target/ppc: Remove the software TLB model of 7450 CPUs")

and switched MMU model to POWERPC_MMU_32B in :

   1da666cd8e79 ("target/ppc: Disable software TLB for the 7450 family")

With the two patches of this series, we can boot the latest linux on all
7450 CPUs. With an extra small fix on the CPU table, 7448 boots.

  
Thanks,

C.

