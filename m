Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6BC5701A6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:07:26 +0200 (CEST)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAsCC-0005tZ-W9
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oAsAK-00024M-9U; Mon, 11 Jul 2022 08:05:28 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:18174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oAsAH-00065A-ON; Mon, 11 Jul 2022 08:05:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AEF00748FE9;
 Mon, 11 Jul 2022 14:05:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 74A7274763D; Mon, 11 Jul 2022 14:05:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 72DBF746E07;
 Mon, 11 Jul 2022 14:05:17 +0200 (CEST)
Date: Mon, 11 Jul 2022 14:05:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
In-Reply-To: <c08df33f-f6e8-67bb-9159-190a0b9a2dd5@ilande.co.uk>
Message-ID: <345bdf2c-9af6-926f-4dbd-d49258b174bd@eik.bme.hu>
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
 <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
 <47277f4f-a6a5-85dc-4806-67df8e2fc153@gmail.com>
 <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
 <1d2cd44f-fd61-4693-ecc0-f71c80131005@ilande.co.uk>
 <6b5e0e42-973d-19de-4979-7db06941ea19@kaod.org>
 <13b65b0e-716f-a6e0-fd63-c1e7cfe2a63c@kaod.org>
 <c08df33f-f6e8-67bb-9159-190a0b9a2dd5@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-142569123-1657541117=:34212"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-142569123-1657541117=:34212
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 11 Jul 2022, Mark Cave-Ayland wrote:
> On 06/07/2022 08:45, Cédric Le Goater wrote:
>> I gave KVM a try on a :
>>
>>      cpu        : PPC970MP, altivec supported
>>      clock    : 2000.000000MHz
>>      revision    : 1.0 (pvr 0044 0100)
>>      processor    : 1
>>      cpu        : PPC970MP, altivec supported
>>      clock    : 2000.000000MHz
>>      revision    : 1.0 (pvr 0044 0100)
>>      timebase    : 33333333
>>      platform    : PowerMac
>>      model    : PowerMac11,2
>>      machine    : PowerMac11,2
>>      motherboard    : PowerMac11,2 MacRISC4 Power Macintosh
>>      detected as    : 337 (PowerMac G5 Dual Core)
>>      pmac flags    : 00000000
>>      L2 cache    : 1024K unified
>>      pmac-generation    : NewWorld
>> 
>> running debian with kernel 5.18.0-2-powerpc64. With the installed QEMU 
>> 7.0.0,
>>
>>      qemu-system-ppc64 -M mac99 -cpu host -accel kvm ...
>> 
>> doesn't go very far. Program exception is quickly reached and host says:
>>
>>      [56450.118422] Couldn't emulate instruction 0x00000000 (op 0 xop 0)
>>      [56450.119060] kvmppc_exit_pr_progint: emulation at 100 failed 
>> (00000000)

Maybe try with -d unimp,guest_errors at least or some more debug options 
to find why it gets a 0 opcode. It probably takes a wrong exception 
somewhere? But with KVM maybe this does not give more info and you need to 
enable KVM tracing or run in a debgger instead?

In the past I've managed to run Linux on qemu-system-ppc64 -M mac99 
with TCG and trace KVM-PR guest within that but I forgot the details. If I 
remember correctly I've found there's some problem with emulated KVM and 
nobody replied on the list so I could not go further. It's also quite slow 
that way so not the best way to test.

>> Anything special I should know ?
>
> As I don't have access to a G5 I've never tried that, however the 
> qemu-system-ppc64 mac99 is wired differently to the qemu-system-ppc mac99 
> machine so I wouldn't be surprised if something is broken there.

I think you can get the 32 bit version with qemu-system-ppc64 by adding 
-cpu G4 as it decides based on CPU type what to emulate. By default -M 
mac99 with qemu-system-ppc64 is a G5 Mac but OpenBIOS still gives it the 
same device-tree as the G4 one so guests might be confused by this. Linux 
did not seem to care that much though.

> My normal test for MacOS is something like:
>
>   qemu-system-ppc -M mac99 -accel kvm -hda macos104.img

This should really be -M mac99,via=pmu as that is the closest to real 
hardware currently.

This mac99 machine is quite confusing and maybe the only reason we need 
separate ppc and ppc64 qemu executables. What do you think about 
deprecating it and splitting it into something like powermac3_1 for 
mac99,via=pmu with G4 CPU, powermac7_2 for the G5 one and maybe some 
powerbookX_Y for the mac99 with CUDA instead of PMU but I don't know if 
that actually exists in real hardware? Also rename g3beige to the actual 
model name at the same time. This would clear this up and avoid the 
confusing options that we have now because of everything emulated by the 
single mac99 machine.

Regards,
BALATON Zoltan
--3866299591-142569123-1657541117=:34212--

