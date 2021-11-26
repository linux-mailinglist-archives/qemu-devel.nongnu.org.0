Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06345EF7A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 14:55:28 +0100 (CET)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqbhG-0006Dr-OT
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 08:55:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqbfn-0005Cx-Pz
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 08:53:55 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqbfk-0003SE-OI
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 08:53:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D4689222AE;
 Fri, 26 Nov 2021 13:53:49 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 14:53:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0052344bacb-c978-4493-8dd1-024b322b0380,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <095292e8-f715-309d-67dc-3dc290a59d95@kaod.org>
Date: Fri, 26 Nov 2021 14:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the G4
 family
To: Fabiano Rosas <farosas@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, <qemu-devel@nongnu.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
 <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
 <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
 <87ilwfqesw.fsf@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <87ilwfqesw.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4c31839c-9cf1-4db3-9d48-285f2cd5b7e6
X-Ovh-Tracer-Id: 16639956198417664873
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuffevfedvleeuheettedvtedvieehheeuffeugfeijeeugedvkeduheelteejffenucffohhmrghinhepfhhrvggvsghsugdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: openbios@openbios.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> Right. If we're doing this to say "I can boot a kernel with a 7450 cpu in QEMU" but
>> the implementation is different from real hardware, then I'm not sure what the real
>> value is. That effectively leaves option b) if someone is willing to do the work, or
>> as you say to simply remove the code from QEMU.
> 
> Yeah, that is a good point. Although the software TLB is well contained,
> so we could certainly document that our 7450s don't have that feature
> and call it a day. Does QEMU have any policy on how much of a machine is
> required to be implemented?
> 
> I am more inclined to apply c) for now as I said, just to have some code
> running on the CPU and maybe document in a gitlab issue that we're
> lacking the runtime switch and eventually implement that. It's not like
> this is high traffic code anyway. It has been broken for 10+ years.
> 
> That said, if Cédric and Daniel see more value in moving the 7450s to
> the POWERPC_MMU_32B I won't oppose.

I am in favor of dropping unused code in QEMU and keeping the CPUs for
which we have support in Linux using the POWERPC_MMU_32B in QEMU and the
openbios patch. If we need SoftTLB support for the 74x CPUs in QEMU, we
can always dig in the history.

We can give FreeBSB a try also since they had support for the G4 :

   https://people.freebsd.org/~arved/stuff/minimac


With the openbios patch, Linux boots fine under 7450, 7455, 7447 CPUs.

Under 7448, it drops in xmon with a :
  
kernel tried to execute exec-protected page (c07fdd98) - exploit attempt? (uid: 0)
BUG: Unable to handle kernel instruction fetch
Faulting instruction address: 0xc07fdd98
Vector: 400 (Instruction Access) at [f1019d30]
     pc: c07fdd98: __do_softirq+0x0/0x2f0
     lr: c00516a4: irq_exit+0xbc/0xf8
     sp: f1019df0
    msr: 10001032
   current = 0xc0d00000
     pid   = 1, comm = swapper


This should be fixable.

Thanks,

C.




