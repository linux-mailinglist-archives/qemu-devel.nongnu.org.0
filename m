Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765145F04A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 16:04:16 +0100 (CET)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqclq-0005qH-Kl
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 10:04:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mqckL-0004b6-6E; Fri, 26 Nov 2021 10:02:41 -0500
Received: from [2001:738:2001:2001::2001] (port=16549 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mqckH-0008Hs-Bv; Fri, 26 Nov 2021 10:02:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5F0CC748F54;
 Fri, 26 Nov 2021 16:02:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3BE39746353; Fri, 26 Nov 2021 16:02:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3A3C77462D3;
 Fri, 26 Nov 2021 16:02:33 +0100 (CET)
Date: Fri, 26 Nov 2021 16:02:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the
 G4 family
In-Reply-To: <095292e8-f715-309d-67dc-3dc290a59d95@kaod.org>
Message-ID: <d6387673-473f-df68-6079-7373a1908e3f@eik.bme.hu>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
 <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
 <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
 <87ilwfqesw.fsf@linux.ibm.com> <095292e8-f715-309d-67dc-3dc290a59d95@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1695245900-1637938953=:62560"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, danielhb413@gmail.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1695245900-1637938953=:62560
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 26 Nov 2021, Cédric Le Goater wrote:
>>> Right. If we're doing this to say "I can boot a kernel with a 7450 cpu in 
>>> QEMU" but
>>> the implementation is different from real hardware, then I'm not sure what 
>>> the real
>>> value is. That effectively leaves option b) if someone is willing to do 
>>> the work, or
>>> as you say to simply remove the code from QEMU.
>> 
>> Yeah, that is a good point. Although the software TLB is well contained,
>> so we could certainly document that our 7450s don't have that feature
>> and call it a day. Does QEMU have any policy on how much of a machine is
>> required to be implemented?
>> 
>> I am more inclined to apply c) for now as I said, just to have some code
>> running on the CPU and maybe document in a gitlab issue that we're
>> lacking the runtime switch and eventually implement that. It's not like
>> this is high traffic code anyway. It has been broken for 10+ years.
>> 
>> That said, if Cédric and Daniel see more value in moving the 7450s to
>> the POWERPC_MMU_32B I won't oppose.
>
> I am in favor of dropping unused code in QEMU and keeping the CPUs for
> which we have support in Linux using the POWERPC_MMU_32B in QEMU and the
> openbios patch. If we need SoftTLB support for the 74x CPUs in QEMU, we
> can always dig in the history.

If we can't find a guest that needs it and can be used to test with it may 
be OK to remove it for now but digging the history may not be easy if 
somebody later comes along with a guest that would need this. Likely they 
would just go away when finding it's not supported or maybe try to redo it 
from scratch and not think of checking history first. So if you drop it 
maybe leave a one line comment at some obvious place saying something like 
"74xx soft TLB removed in commit xxxxx" to make it simpler for those who 
may want to resurrect it later.

Regards,
BALATON Zoltan

> We can give FreeBSB a try also since they had support for the G4 :
>
>  https://people.freebsd.org/~arved/stuff/minimac
>
>
> With the openbios patch, Linux boots fine under 7450, 7455, 7447 CPUs.
>
> Under 7448, it drops in xmon with a :
> kernel tried to execute exec-protected page (c07fdd98) - exploit attempt? 
> (uid: 0)
> BUG: Unable to handle kernel instruction fetch
> Faulting instruction address: 0xc07fdd98
> Vector: 400 (Instruction Access) at [f1019d30]
>    pc: c07fdd98: __do_softirq+0x0/0x2f0
>    lr: c00516a4: irq_exit+0xbc/0xf8
>    sp: f1019df0
>   msr: 10001032
>  current = 0xc0d00000
>    pid   = 1, comm = swapper
>
>
> This should be fixable.
>
> Thanks,
>
> C.
>
>
>
>
>
--3866299591-1695245900-1637938953=:62560--

