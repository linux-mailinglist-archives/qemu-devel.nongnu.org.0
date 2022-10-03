Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8007B5F38AE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:14:47 +0200 (CEST)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTi2-000478-JQ
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ofSWf-0005Dz-0U
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 16:58:57 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:41637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ofSWb-0007k3-Fs
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 16:58:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 86E2212ECEABF;
 Mon,  3 Oct 2022 22:58:42 +0200 (CEST)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 3 Oct
 2022 22:58:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004029eb2e1-1d47-424a-a554-97c63aa5f93f,
 946AF8A8FBD866D5F75487F1C01A9C4B3B50863B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a3653269-8d10-f8b0-a7f2-1ca2a5860d28@kaod.org>
Date: Mon, 3 Oct 2022 22:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH v2 00/29] PowerPC interrupt rework
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
CC: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>, <groug@kaod.org>, 
 <fbarrat@linux.ibm.com>, <alex.bennee@linaro.org>, <farosas@linux.ibm.com>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <9b310cf0-6140-a397-0f7d-a752b1ba4072@kaod.org>
 <03ad8964-a7c1-5b26-00aa-3b028296e0d0@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <03ad8964-a7c1-5b26-00aa-3b028296e0d0@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 47ef7e9d-6248-4ff8-a7e7-838c83636596
X-Ovh-Tracer-Id: 5548716218569296687
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehledgudehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.467,
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

> (qemu) info pic
> info pic
> CPU[0000]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
> CPU[0000]: USER    00   00  00    00   00  00  00   00  00000000
> CPU[0000]:   OS    00   00  00    ff   ff  00  ff   ff  00000000
> CPU[0000]: POOL    00   00  00    ff   00  00  00   00  00000000
> CPU[0000]: PHYS    00   ff  00    00   00  00  00   ff  80000000
> CPU[0001]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
> CPU[0001]: USER    00   00  00    00   00  00  00   00  00000000
> CPU[0001]:   OS    00   00  00    ff   ff  00  ff   ff  00000000
> CPU[0001]: POOL    00   00  00    ff   00  00  00   00  00000001
> CPU[0001]: PHYS    00   ff  00    00   00  00  00   ff  80000000
> CPU[0002]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
> CPU[0002]: USER    00   00  00    00   00  00  00   00  00000000
> CPU[0002]:   OS    00   00  00    ff   ff  00  ff   ff  00000000
> CPU[0002]: POOL    00   00  00    ff   00  00  00   00  00000002
> CPU[0002]: PHYS    00   ff  00    00   00  00  00   ff  80000000
> CPU[0003]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
> CPU[0003]: USER    00   00  00    00   00  00  00   00  00000000
> CPU[0003]:   OS    00   ff  00    00   ff  00  ff   ff  00000004

vCPU 4 was scheduled to run on this CPU at some point, but it is not
anymore : no VALID bit.

> CPU[0003]: POOL    00   00  00    ff   00  00  00   00  00000003
> CPU[0003]: PHYS    00   ff  00    00   00  00  00   ff  80000000
> XIVE[0] #0 Source 00000000 .. 000fffff
>    00000014 MSI --
>    00000015 MSI --
>    00000016 MSI --
>    00000017 MSI --
>    00000018 MSI --
>    00000019 MSI --
>    0000001a MSI --
>    0000001b MSI --
>    0000001e MSI P-

The 0x1E HW interrupt (virtual device) is pending. And not queued.

>    00000023 MSI --
>    00000024 MSI --
>    00000025 MSI --
>    00000026 MSI --
> XIVE[0] #0 EAT 00000000 .. 000fffff
>    00000014   end:00/000f data:00000010
>    00000015   end:00/0017 data:00000010
>    00000016   end:00/001f data:00000010
>    00000017   end:00/0027 data:00000010 -> 0x10 == CPU IPI 
>    00000018   end:00/004e data:00000010 -> This is the vCPU IPI 
>    00000019   end:00/004e data:00000012
>    0000001a   end:00/004e data:0000001b
>    0000001b   end:00/004e data:00000013
>    0000001e   end:00/004e data:00000016

notificationd of 0x1E HW interrupts will be pushed on vCPU 0 queue 0x4e,
with (Linux) effective interrupt number 0x16, the console may be.

>    00000023   end:00/004e data:00000017
>    00000024   end:00/004e data:00000018
>    00000025   end:00/004e data:00000019
>    00000026   end:00/004e data:0000001a

Follow the PHB interrupts, MSI and LSIs.

>    000fb000   end:00/001f data:00000030
>    000fb001   end:00/0027 data:00000031
>    000fb002   end:00/000f data:00000032
>    000fb003   end:00/000f data:00000033
>    000fb004   end:00/0017 data:00000034
>    000fb005   end:00/001f data:00000035
>    000fb006   end:00/0027 data:00000036
>    000fb7fe   end:00/000f data:00000029
>    000fb7ff   end:00/0017 data:0000002a
>    000fbffe   end:00/001f data:00000027
>    000fbfff   end:00/0027 data:00000028
>    000fcffe   end:00/000f data:00000025
>    000fcfff   end:00/0017 data:00000026
>    000fd000   end:00/001f data:00000037
>    000fd001   end:00/000f data:00000038
>    000fd002   end:00/0017 data:00000039
>    000fd003   end:00/001f data:0000003a
>    000fd004   end:00/0027 data:0000003b
>    000fd7fe   end:00/001f data:00000023
>    000fd7ff   end:00/0027 data:00000024
>    000fdffe   end:00/000f data:00000021
>    000fdfff   end:00/0017 data:00000022
>    000feffe   end:00/001f data:0000001f
>    000fefff   end:00/0027 data:00000020

opal events are after

>    000ffff0   end:00/000f data:00000011 
>    000ffff1   end:00/0017 data:00000012
>    000ffff2   end:00/001f data:00000013 
>    000ffff3   end:00/0027 data:00000014 # opal-psi#0:lpchc
>    000ffff4   end:00/000f data:00000015
>    000ffff5   end:00/0017 data:00000016
>    000ffff6   end:00/001f data:00000017
>    000ffff7   end:00/0027 data:00000018
>    000ffff8   end:00/000f data:00000019
>    000ffff9   end:00/0017 data:0000001a
>    000ffffa   end:00/001f data:0000001b
>    000ffffb   end:00/0027 data:0000001c
>    000ffffc   end:00/000f data:0000001d
>    000ffffd   end:00/0017 data:0000001e # opal-psi#0:psu ? 
> XIVE[0] #0 ENDT
>    0000000f -Q vqnb---f prio:7 nvt:00/0080 eq:@03400000   825/16384 ^1 [ 8000004f 8000004f 8000004f 8000004f 8000004f ^00000000 ]

event queue of host CPU 0 is filling up with escalation interrupt
numbers, 0x4f.

host CPU 0 (queue 0xf) is serving its own IPI, some MSIs, some EEH PCI
interrupts, and some OPAL events.

>    00000017 -Q vqnb---f prio:7 nvt:00/0084 eq:@03750000  1048/16384 ^1 [ 8000001e 8000001e 8000001e 8000001e 8000001e ^00000000 ]

hmm, host CPU 1 is serving 0xffffd = opal-psi#0:psu. May be too much.

>    0000001f -Q vqnb---f prio:7 nvt:00/0088 eq:@037f0000   154/16384 ^1 [ 8000003a 8000003a 8000003a 8000003a 8000003a ^00000000 ]

0x3a is an MSI.

>    00000027 -Q vqnb---f prio:7 nvt:00/008c eq:@038a0000   340/16384 ^1 [ 80000014 80000014 80000014 80000014 8000003b ^00000000 ]

This is the console 0x14 and 0x3b is an MSI

>    0000004e -Q vqnbeu-- prio:6 nvt:00/0004 eq:@1d170000  1104/16384 ^1 [ 80000016 80000016 80000016 80000016 80000016 ^00000000 ]

0x4e (0x48 + 6) is the event queue number of guest's vCPU 0 prio 6.
0x16 is the Linux interrupt number in the guest of HW interrupt 0x1e,
the one pending.

>    0000004f -Q v--be-s- prio:0 nvt:00/0000

0x4f is the escalation queue of vCPU 0 (when vCPU is not dispatched on any
HW threads) 0x4f is also a source interrupt number for escalations.

> XIVE[0] #0 END Escalation EAT
>    0000004e -Q    end:00/004f data:00000000
>    0000004f P-    end:00/000f data:0000004f

0x4f interrupt number is pending. vPCU 0 should be dispatched but the
escalation interrupt has not being served by the hypervisor at this
point in time. Since it is not queued, we may have reached some deadlock ?

> XIVE[0] #0 NVTT 00000000 .. 0007ffff
>    00000000 end:00/0028 IPB:00
>    00000001 end:00/0030 IPB:00
>    00000002 end:00/0038 IPB:00
>    00000003 end:00/0040 IPB:00
>    00000004 end:00/0048 IPB:02

         ^

0x4 is the vCPU0 notification virtual target number and an interrupt is
pending on prio 6. vCPU 0 did not acknowledge it yet, because vCPU 0 (NVT=4)
has not been dispatched on any HW thread because the escalation interrupt
was not handled on the host (CPU 0 should). Question is what is CPU 0 up to?


>    00000080 end:00/0008 IPB:00
>    00000084 end:00/0010 IPB:00
>    00000088 end:00/0018 IPB:00
>    0000008c end:00/0020 IPB:00
> PSIHB Source 000ffff0 .. 000ffffd
>    000ffff0 LSI --
>    000ffff1 LSI --
>    000ffff2 LSI --
>    000ffff3 LSI --
>    000ffff4 LSI --
>    000ffff5 LSI --
>    000ffff6 LSI --
>    000ffff7 LSI --
>    000ffff8 LSI --
>    000ffff9 LSI --
>    000ffffa LSI --
>    000ffffb LSI --
>    000ffffc LSI --
>    000ffffd LSI --
> PHB4[0:0] Source 000fe000 .. 000fefff  @6030203110100
>    00000ffe LSI --
>    00000fff LSI --
> PHB4[0:5] Source 000fb000 .. 000fb7ff  @6030203110228
>    00000000 MSI --
>    00000001 MSI --
>    00000002 MSI --
>    00000003 MSI --
>    00000004 MSI --
>    00000005 MSI --
>    00000006 MSI --
>    000007fe LSI --
>    000007ff LSI --
> PHB4[0:4] Source 000fb800 .. 000fbfff  @6030203110220
>    000007fe LSI --
>    000007ff LSI --
> PHB4[0:3] Source 000fc000 .. 000fcfff  @6030203110218
>    00000ffe LSI --
>    00000fff LSI --
> PHB4[0:2] Source 000fd000 .. 000fd7ff  @6030203110210
>    00000000 MSI --
>    00000001 MSI --
>    00000002 MSI --
>    00000003 MSI --
>    00000004 MSI --
>    000007fe LSI --
>    000007ff LSI --
> PHB4[0:1] Source 000fd800 .. 000fdfff  @6030203110208
>    000007fe LSI --
>    000007ff LSI --
> 
>> Could you please check with powersave=off in the host kernel also ?
>>
> 
> It still hangs with this option.

This is going to need some serious digging to solve. It might not be worse
the time :/

C.

