Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313A246D905
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 17:56:43 +0100 (CET)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0FF-0001tt-Rc
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 11:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mv0DS-0000sa-71
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:54:50 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:60883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mv0DQ-0007Lv-2G
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 11:54:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A8F70D0AB120;
 Wed,  8 Dec 2021 17:54:44 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 8 Dec
 2021 17:54:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0059bcd52ce-5d2a-4ddb-85d7-06afa9e1537f,
 8F2F55344B714E1E8EB9F2B8AB3A843E42DFE4C2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e1c367bd-042b-6257-55d2-f2fad4e96538@kaod.org>
Date: Wed, 8 Dec 2021 17:54:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20211202191446.1292125-1-clg@kaod.org>
 <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
 <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
 <32012645-274e-9ee9-2d8a-a3d87c4a6bf5@csgroup.eu>
 <599e5aa0-d7a9-b89c-2da9-5e7c909a6064@kaod.org>
 <75b27dfe-cb8f-d40c-c1bd-79415264a87f@redhat.com>
 <CAFEAcA9OQ=nFaMXgFi22BSuchP35OUiTwteG_yxFSnLXFHNTbQ@mail.gmail.com>
 <f29e3aba-a1d7-484d-2aa2-b676113c4f43@kaod.org>
 <d6005c8e-d007-2a66-00f3-5f9d3f30e420@redhat.com>
 <91db1fab-46f4-ebcc-bf2c-1bb36b49ebf8@kaod.org>
 <bbaf15f6-7c77-78a2-118d-f2771b65096d@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <bbaf15f6-7c77-78a2-118d-f2771b65096d@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 222f63cc-2fbe-4c63-b40d-8405c6068db8
X-Ovh-Tracer-Id: 16380717748635732844
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeettdetieeuvdevfffhgfektdfhjeffieeltdffveevvedvveehjeegveekhefhheenucffohhmrghinhepghhithhlrggsrdgtohhmpdguvghngidruggvnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 LEROY Christophe <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/21 14:19, Thomas Huth wrote:
> On 08/12/2021 14.15, Cédric Le Goater wrote:
>> On 12/8/21 14:07, Thomas Huth wrote:
>>> On 03/12/2021 13.25, Cédric Le Goater wrote:
>>>> On 12/3/21 11:40, Peter Maydell wrote:
>>>>> On Fri, 3 Dec 2021 at 10:32, Thomas Huth <thuth@redhat.com> wrote:
>>>>>> I guess it's an accidential NULL pointer dereference somewhere in the u-boot
>>>>>> code ... which will be quite hard to track down when the first page of
>>>>>> memory is marked as writable... :-/
>>>>>
>>>>> Attach a target-arch gdb to the QEMU gdbstub and put a watchpoint on
>>>>> address zero ? (Or if you suspect something inside QEMU is doing it
>>>>> then run QEMU under gdb and watchpoint the host memory location
>>>>> corresponding to guest address 0, but that's more painful.) Nothing
>>>>> in the pre-kernel part of the boot process will have set up paging,
>>>>> so the watchpointing should be pretty reliable.
>>>>
>>>> That's the guy:
>>>>
>>>> https://gitlab.com/huth/u-boot/-/blob/taihu/arch/powerpc/cpu/ppc4xx/sdram.c#L199
>>>>
>>>> There must be an error in how get_ram_size() restores the RAM values :
>>>>
>>>>    https://gitlab.com/huth/u-boot/-/blob/taihu/common/memsize.c
>>>
>>> There is definitely something wrong in that function. Seems like they tried to fix it once here:
>>>
>>>   https://source.denx.de/u-boot/u-boot/-/commit/b8496cced856ff411f
>>>
>>> but that patch got later reverted without a replacement later...
>>
>>
>> a fix restoring address 0, something like :
>>
>> @@ -60,6 +60,9 @@ long get_ram_size(long *base, long maxsi
>>           return (0);
>>       }
>>
>> +    addr = base;
>> +    *addr = save[i];
>> +
>>       for (cnt = 1; cnt < maxsize / sizeof(long); cnt <<= 1) {
>>           addr = base + cnt;    /* pointer arith! */
>>           val = *addr;
>>
>> is not enough. trap_init() will also overwrite the kernel image.
>> And u-boot will complain about a wrong CRC.
>>
>> The 405 series I sent improves support and latest kernel 5.16-rc4
>> can be loaded without uboot. It's a start to debug user space.
> 
> Yes, your series is certainly the better way forward. I'll stop messing 
> with u-boot now ... since upstream u-boot already removed the 405 support 
> a long time ago, my hack was a dead end anyway (but it helped to get at 
> least a kernel running again, so it was not in vain)

This is not what I meant ! sorry ! What I wanted to express is that
now nothing is blocking us from fixing user space :)

The patchset I sent does not break booting from U-Boot. It still
very much works and we should keep it because it exercises more
our models. Even if the SDRAM still needs a U-Boot hack. I believe
that can be fixed in QEMU with some time. When done, I hope we
can merge the U-Boot binary in QEMU.

Regarding Linux loading in QEMU or U-Boot, the problem is the PPC
board information which is out of sync in all components ...

Today, the easiest is to boot directly from a Linux 405 hotfoot
kernel under QEMU because we are a bit lucky. The proc frequency
is set to some non zero value so the kernel boots. I pushed
experiments a bit further and network seems to be OK also.

My idea was to merge the first round of changes for direct linux
boot. See how that goes (user space) and then merge a custom
ppc405-hotfoot machine to work around the board information
problem.

Thanks,

C.

