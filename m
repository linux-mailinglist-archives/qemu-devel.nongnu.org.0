Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E5B47B3E0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:42:12 +0100 (CET)
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOY0-0007YA-22
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:42:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzNEp-0000JJ-P9
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 13:18:19 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:41311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzNEm-0006VT-AA
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 13:18:19 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D51B5D3124C8;
 Mon, 20 Dec 2021 19:18:12 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 20 Dec
 2021 19:18:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0025651214b-f2d9-448d-b2d2-ce1e76abd00f,
 B7813907D459CA292B6C6623195014302564F6C9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <957bd09f-dde5-aa2f-bc7e-dcb7827bdbc0@kaod.org>
Date: Mon, 20 Dec 2021 19:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/15] ppc/ppc405: decade cleanup
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211206103712.1866296-1-clg@kaod.org>
 <880aa46a-97cb-ad79-b72e-f8276692d750@kaod.org>
 <b3345770-21e2-39f2-8fe2-e9963886e680@csgroup.eu>
 <c2eeced6-9cfa-2ea6-88be-a4dfb3d7aca2@kaod.org>
 <b4d0eb8f-a349-51df-3b4c-6081d55f5a04@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b4d0eb8f-a349-51df-3b4c-6081d55f5a04@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 958401f5-ed70-4a6a-a26a-999db33a4f28
X-Ovh-Tracer-Id: 14475695103066278764
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtvddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 19:07, Philippe Mathieu-Daudé wrote:
> On 12/20/21 09:33, Cédric Le Goater wrote:
>>>
>>> Don't know if this is the reason of our problems but I think there is
>>> something to investigate around timer interrupts:
>>>
>>>
>>> / # cat /proc/interrupts
>>>               CPU0
>>>     16:         68       UIC   1 Level     serial
>>> LOC:          0   Local timer interrupts for timer event device
>>> LOC:          0   Local timer interrupts for others
>>> SPU:          0   Spurious interrupts
>>> PMI:          0   Performance monitoring interrupts
>>> MCE:          0   Machine check exceptions
>>>
>>> Any idea what the problem can be ? How does QEMU generates timer
>>> interrupts ?
>>
>> I did some archeology and fixed the 405 timer (PIT). Please see commits
>> in :
>>
>>    https://github.com/legoater/qemu/commits/ppc405
>>
>> but we are still getting segfaults. At some point /init tries to load from
>> fffffe04 which is obviously wrong.
> 
> Fetching an u32 value from a missing ROM?


hmm, I don't think so. Here are some logs.

Thanks,

C.

....
mmu40x_get_physical_address: access granted b7bd6000 => 00000000005ba000 13 0

0xb7bd6744:  80dffff8  lwz      r6, -8(r31)
0xb7bd6748:  7ce63850  subf     r7, r6, r7
0xb7bd674c:  80a70008  lwz      r5, 8(r7)
0xb7bd6750:  7c843214  add      r4, r4, r6
0xb7bd6754:  8065000c  lwz      r3, 0xc(r5)
0xb7bd6758:  80c7000c  lwz      r6, 0xc(r7)
0xb7bd675c:  7c071800  cmpw     r7, r3
0xb7bd6760:  41a20008  beq      0xb7bd6768

ppcemb_tlb_check: TLB 14 address fffffe04 PID 3 <=> c0000000 ff000000 0 f
ppcemb_tlb_check: TLB 15 address fffffe04 PID 3 <=> c7000000 ff000000 0 f
ppcemb_tlb_check: TLB 16 address fffffe04 PID 3 <=> c1000000 ff000000 0 f
ppcemb_tlb_check: TLB 17 address fffffe04 PID 3 <=> b7bdc000 fffff000 2 d
ppcemb_tlb_check: TLB 19 address fffffe04 PID 3 <=> b7c30000 fffff000 2 b
ppcemb_tlb_check: TLB 20 address fffffe04 PID 3 <=> bfe4f000 fffff000 2 9
ppcemb_tlb_check: TLB 22 address fffffe04 PID 3 <=> b7c32000 fffff000 2 b
ppcemb_tlb_check: TLB 23 address fffffe04 PID 3 <=> b7bff000 fffff000 2 d
ppcemb_tlb_check: TLB 24 address fffffe04 PID 3 <=> 00913000 fffff000 2 d
ppcemb_tlb_check: TLB 25 address fffffe04 PID 3 <=> b7c64000 fffff000 3 b
ppcemb_tlb_check: TLB 26 address fffffe04 PID 3 <=> b7c2f000 fffff000 3 9
ppcemb_tlb_check: TLB 27 address fffffe04 PID 3 <=> b7bf5000 fffff000 3 d
ppcemb_tlb_check: TLB 28 address fffffe04 PID 3 <=> bfe4f000 fffff000 3 b
ppcemb_tlb_check: TLB 30 address fffffe04 PID 3 <=> 009bc000 fffff000 2 9
ppcemb_tlb_check: TLB 32 address fffffe04 PID 3 <=> 009c1000 fffff000 2 b
ppcemb_tlb_check: TLB 33 address fffffe04 PID 3 <=> 009c0000 fffff000 2 9
ppcemb_tlb_check: TLB 34 address fffffe04 PID 3 <=> 00970000 fffff000 2 d
ppcemb_tlb_check: TLB 35 address fffffe04 PID 3 <=> b7c44000 fffff000 3 b
ppcemb_tlb_check: TLB 36 address fffffe04 PID 3 <=> 00911000 fffff000 3 d
ppcemb_tlb_check: TLB 37 address fffffe04 PID 3 <=> 00912000 fffff000 3 d
ppcemb_tlb_check: TLB 38 address fffffe04 PID 3 <=> 0090e000 fffff000 3 d
ppcemb_tlb_check: TLB 39 address fffffe04 PID 3 <=> 00919000 fffff000 2 d
ppcemb_tlb_check: TLB 40 address fffffe04 PID 3 <=> 00971000 fffff000 2 d
ppcemb_tlb_check: TLB 41 address fffffe04 PID 3 <=> 009bf000 fffff000 2 9
ppcemb_tlb_check: TLB 42 address fffffe04 PID 3 <=> b7ba8000 fffff000 2 d
ppcemb_tlb_check: TLB 43 address fffffe04 PID 3 <=> 009c0000 fffff000 3 b
ppcemb_tlb_check: TLB 44 address fffffe04 PID 3 <=> 0090f000 fffff000 3 d
ppcemb_tlb_check: TLB 45 address fffffe04 PID 3 <=> 00910000 fffff000 3 d
ppcemb_tlb_check: TLB 46 address fffffe04 PID 3 <=> 008d9000 fffff000 3 d
ppcemb_tlb_check: TLB 47 address fffffe04 PID 3 <=> 00976000 fffff000 3 d
ppcemb_tlb_check: TLB 48 address fffffe04 PID 3 <=> b7bf4000 fffff000 3 d
ppcemb_tlb_check: TLB 49 address fffffe04 PID 3 <=> b7bd5000 fffff000 3 d
ppcemb_tlb_check: TLB 50 address fffffe04 PID 3 <=> b7c00000 fffff000 3 d
ppcemb_tlb_check: TLB 51 address fffffe04 PID 3 <=> b7ba7000 fffff000 3 d
ppcemb_tlb_check: TLB 52 address fffffe04 PID 3 <=> 0090d000 fffff000 3 d
ppcemb_tlb_check: TLB 53 address fffffe04 PID 3 <=> 00918000 fffff000 3 d
ppcemb_tlb_check: TLB 54 address fffffe04 PID 3 <=> 0097a000 fffff000 3 d
ppcemb_tlb_check: TLB 55 address fffffe04 PID 3 <=> b7bd6000 fffff000 3 d
ppcemb_tlb_check: TLB 56 address fffffe04 PID 3 <=> b7bf8000 fffff000 3 d
ppcemb_tlb_check: TLB 58 address fffffe04 PID 3 <=> b7c46000 fffff000 3 b
mmu40x_get_physical_address: access refused fffffe04 => ffffffffffffffff 4096 -1
NIP b7bd6744   LR b7bd66cc CTR b7bf471c XER 00000000 CPU#0
MSR 0000c030 HID0 00000300  HF 00004012 iidx 0 didx 0
TB 00000000 984786301 DECR 4294956920
GPR00 00000000b7bd66cc 00000000bfe4f9a0 00000000b7c6b470 0000000000000000
GPR04 00000000000000c8 00000000b7c30124 00000000009c140c 00000000fffffdfc
GPR08 000000002d740000 00000000009c12d0 0000000000000049 00000000bfe4f9a0
GPR12 0000000020004002 00000000009bfa94 0000000000000000 0000000000000000
GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24 0000000000000004 00000000bfe4f9f8 00000000009c0054 0000000000000000
GPR28 00000000bfe4f9a8 00000000b7c4642c 00000000b7c2fd58 00000000009c1210
CR 20004002  [ E  -  -  -  G  -  -  E  ]             RES ffffffff
  SRR0 b7bd672c  SRR1 0000c030    PVR 51210950 VRSAVE 00000000
SPRG0 00000049 SPRG1 bfe4f9a0  SPRG2 bfe4f9a0  SPRG3 00c3ee70
SPRG4 20004002 SPRG5 00000049  SPRG6 00000049  SPRG7 bfe4f9a0
   TCR 04000000   TSR c8000000    ESR 00800000   DEAR b7c4642c
  EVPR 00000000  SRR2 00000000   SRR3 00000000  PID 00000003
Raise exception at b7bd674c => DTLB (13) error=00
....

