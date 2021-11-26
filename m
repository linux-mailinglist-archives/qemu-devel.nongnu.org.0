Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D960345EE4E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:53:06 +0100 (CET)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqaiv-0002Wp-OV
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:53:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqabe-00045I-MV
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 07:45:34 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:48887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqabc-0008SZ-Dm
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 07:45:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3D0D422526;
 Fri, 26 Nov 2021 12:45:28 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 13:45:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005cc422275-90b4-41e9-be12-9a7b16945e72,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <37135ecd-dec9-860f-69b7-cffe97b0ee8a@kaod.org>
Date: Fri, 26 Nov 2021 13:45:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [OpenBIOS] Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB
 support in the G4 family
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, Segher Boessenkool
 <segher@kernel.crashing.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
 <20211125093801.GM614@gate.crashing.org>
 <484dc989-71db-6273-e868-efaf2ad29fcf@kaod.org>
 <20211126103732.GP614@gate.crashing.org> <87lf1bqflu.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87lf1bqflu.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d9b975ca-19ec-4a21-9bbc-903a1ebe9705
X-Ovh-Tracer-Id: 15485627319526853484
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/21 13:13, Fabiano Rosas wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> 
>> Hi!
>>
>> On Fri, Nov 26, 2021 at 09:34:44AM +0100, Cédric Le Goater wrote:
>>> On 11/25/21 10:38, Segher Boessenkool wrote:
>>>> On Thu, Nov 25, 2021 at 01:45:00AM +0100, BALATON Zoltan wrote:
>>>>> As for guests, those running on the said PowerMac G4 should have support
>>>>> for these CPUs so maybe you can try some Mac OS X versions (or maybe
>>>>
>>>> OSX uses hardware pagetables.
>>>>
>>>>> MorphOS but that is not the best for debugging as there's no source
>>>>> available nor any help from its owners but just to see if it boots it may
>>>>> be sufficient, it should work on real PowerMac G4).
>>>>
>>>> I have no idea what MorphOS uses, but I bet HPT as well.  That is
>>>> because HPT is fastest in general.  Software TLB reloads are good in
>>>> special cases only; the most common is real-time OSes, which can use its
>>>> lower guaranteed latency for some special address spaces (and can have a
>>>> simpler address map in general).
>>>
>>> The support was added to QEMU knowing that Linux didn't handle soft TLBs.
>>> And the commit says that it was kept disabled initially. I guess that was
>>> broken these last years.
>>
>> Ah :-)  So when was it enabled, do you know?
> 
> Hm.. That commit message does not match the code. They simply added the
> software TLB implementation to an already existing SOFT_74xx MMU
> model. I don't see anything that would keep it disabled at that time.
> 

because most of the cpu definitions in ppc_defs[] are protected by a :

#if defined (TODO)

See below. commit 8ca3f6c3824c ("Allow selection of all defined PowerPC
74xx (aka G4) CPUs.") removed the TODO without a reason :/ This is old,
when SVN was in used.


Thanks,

C.

....
#if defined (TODO)
     /* PowerPC 7450 (G4)                                                     */
     POWERPC_DEF("7450",        CPU_POWERPC_7450,        0xFFFFFFFF, 7450),
     /* Code name for PowerPC 7450                                            */
     POWERPC_DEF("Vger",        CPU_POWERPC_7450,        0xFFFFFFFF, 7450),
#endif
#if defined (TODO)
     /* PowerPC 7450 v1.0 (G4)                                                */
     POWERPC_DEF("7450v1.0",    CPU_POWERPC_7450_v10,    0xFFFFFFFF, 7450),
#endif
#if defined (TODO)
     /* PowerPC 7450 v1.1 (G4)                                                */
     POWERPC_DEF("7450v1.1",    CPU_POWERPC_7450_v11,    0xFFFFFFFF, 7450),
#endif
#if defined (TODO)
     /* PowerPC 7450 v1.2 (G4)                                                */
     POWERPC_DEF("7450v1.2",    CPU_POWERPC_7450_v12,    0xFFFFFFFF, 7450),
#endif
#if defined (TODO)
     /* PowerPC 7450 v2.0 (G4)                                                */
     POWERPC_DEF("7450v2.0",    CPU_POWERPC_7450_v20,    0xFFFFFFFF, 7450),
#endif
#if defined (TODO)
     /* PowerPC 7450 v2.1 (G4)                                                */
     POWERPC_DEF("7450v2.1",    CPU_POWERPC_7450_v21,    0xFFFFFFFF, 7450),
#endif
#if defined (TODO)
     /* PowerPC 7441 (G4)                                                     */
     POWERPC_DEF("7441",        CPU_POWERPC_74x1,        0xFFFFFFFF, 7440),
     /* PowerPC 7451 (G4)                                                     */
....

