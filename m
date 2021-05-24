Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC138E5EE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 13:57:15 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9Cs-0005c1-4O
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 07:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ll9C0-0004ws-Iz; Mon, 24 May 2021 07:56:20 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:35891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ll9By-0008U4-DG; Mon, 24 May 2021 07:56:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C96D774570D;
 Mon, 24 May 2021 13:56:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 76373745709; Mon, 24 May 2021 13:56:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7499B7456B4;
 Mon, 24 May 2021 13:56:14 +0200 (CEST)
Date: Mon, 24 May 2021 13:56:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <YKs8N0RBzcST1nxU@yekko>
Message-ID: <5fa1c32c-9ca8-f4a-11f4-131cc4744652@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <77716be-4cf7-d222-d465-13685bf0783a@eik.bme.hu>
 <8e2d201d-a6a3-72bc-5d0f-5226930f1cbc@ozlabs.ru>
 <8c712d-a369-4db-177e-2a5e63836af4@eik.bme.hu>
 <f0137979-699f-3df2-59b5-9eeb62cbc654@ozlabs.ru>
 <YKs8N0RBzcST1nxU@yekko>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-62660492-1621857374=:15801"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-62660492-1621857374=:15801
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 24 May 2021, David Gibson wrote:
> On Mon, May 24, 2021 at 02:26:42PM +1000, Alexey Kardashevskiy wrote:
>> On 5/23/21 21:24, BALATON Zoltan wrote:
>>> On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
>>>> On 23/05/2021 01:02, BALATON Zoltan wrote:
>>>>> On Sat, 22 May 2021, BALATON Zoltan wrote:
>>>>>> On Sat, 22 May 2021, Alexey Kardashevskiy wrote:
>>>>>>> VOF itself does not prints anything in this patch.
>>>>>>
>>>>>> However it seems to be needed for linux as the first thing
>>>>>> it does seems to be getting /chosen/stdout and calls exit if
>>>>>> it returns nothing. So I'll need this at least for linux. (I
>>>>>> think MorphOS may also query it to print a banner or some
>>>>>> messages but not sure it needs it, at least it does not
>>>>>> abort right away if not found.)
>>>>>>
>>>>>>>> but to see Linux output do I need a stdout in VOF or
>>>>>>>> it will just open the serial with its own driver and
>>>>>>>> use that?
>>>>>>>> So I'm not sure what's the stdout parts in the
>>>>>>>> current vof patch does and if I need that for
>>>>>>>> anything. I'll try to experiment with it some more
>>>>>>>> but fixing the ld and Kconfig seems to be enough to
>>>>>>>> get it work for me.
>>>>>>>
>>>>>>> So for the client to print something, /chosen/stdout
>>>>>>> needs to have a valid ihandle.
>>>>>>> The only way to get a valid ihandle is having a valid
>>>>>>> phandle which vof_client_open() can open.
>>>>>>> A valid phandle is a phandle of any node in the device
>>>>>>> tree. On spapr we pick some spapr-vty, open it and store
>>>>>>> in /chosen/stdout.
>>>>>>>
>>>>>>> From this point output from the client can be seen via a tracepoint.
>>>>>
>>>>> I've got it now. Looking at the original firmware device tree dump:
>>>>>
>>>>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2/attach/PegasosII_OFW-Dump.txt
>>>>>
>>>>> I see that /chosen/stdout points to "screen" which is an alias
>>>>> to /bootconsole. Just adding an empty /bootconsole node in the
>>>>> device tree and vof_client_open_store() that as /chosen/stdout
>>>>> works and I get output via vof_write traces so this is enough
>>>>> for now to test Linux. Properly connecting a serial backend can
>>>>> thus be postponed.
>>>>>
>>>>> So with this the Linux kernel does not abort on the first device
>>>>> tree access but starts to decompress itself then the embedded
>>>>> initrd and crashes at calling setprop:
>>>>>
>>>>> [...]
>>>>> vof_client_handle: setprop
>>>>>
>>>>> Thread 4 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
>>>>> (gdb) bt
>>>>> #0  0x0000000000000000 in  ()
>>>>> #1  0x0000555555a5c2bf in vof_setprop
>>>>>      (vof=0x7ffff48e9420, vallen=4, valaddr=<optimized out>,
>>>>> pname=<optimized out>, nodeph=8, fdt=0x7fff8aaff010,
>>>>> ms=0x5555564f8800)
>>>>>      at ../hw/ppc/vof.c:308
>>>>> #2  0x0000555555a5c2bf in vof_client_handle
>>>>>      (nrets=1, rets=0x7ffff48e93f0, nargs=4,
>>>>> args=0x7ffff48e93c0, service=0x7ffff48e9460 "setprop",
>>>>>       vof=0x7ffff48e9420, fdt=0x7fff8aaff010, ms=0x5555564f8800)
>>>>> at ../hw/ppc/vof.c:842
>>>>> #3  0x0000555555a5c2bf in vof_client_call
>>>>>      (ms=0x5555564f8800, vof=vof@entry=0x55555662a3d0,
>>>>> fdt=fdt@entry=0x7fff8aaff010,
>>>>> args_real=args_real@entry=23580472)
>>>>>      at ../hw/ppc/vof.c:935
>>>>>
>>>>> loooks like it's trying to set /chosen/linux,initrd-start:
>>>>
>>>> It is not horribly clear why it crashed though.
>>>
>>> It crashed becuase I had TYPE_VOF_MACHINE_IF but did not set a setprop
>>> callback and it tried to call that here. Adding a {return true;} empty
>>> callback avoids this.
>>
>>
>> Ah ok.
>>
>>>
>>>>> (gdb) up
>>>>> #1  0x0000555555a5c2bf in vof_setprop (vof=0x7ffff48e9420,
>>>>> vallen=4, valaddr=<optimized out>, pname=<optimized out>,
>>>>> nodeph=8,
>>>>>      fdt=0x7fff8aaff010, ms=0x5555564f8800) at ../hw/ppc/vof.c:308
>>>>> 308            if (!vmc->setprop(ms, nodepath, propname, val, vallen)) {
>>>>> (gdb) p nodepath
>>>>> $1 = "/chosen\000\060/rPC,750CXE/", '\000' <repeats 234 times>
>>>>> (gdb) p propname
>>>>> $2 = "linux,initrd-start\000linux,initrd-end\000linux,cmdline-timeout\000bootarg"
>>>>> (gdb) p val
>>>>> $3 = <optimized out>
>>>>>
>>>>> I think I need the callback for setprop in TYPE_VOF_MACHINE_IF.
>>>>> I can copy spapr_vof_setprop() but some explanation on why
>>>>> that's needed might help. Ciould I just do fdt_setprop in my
>>>>> callback as vof_setprop() would do without a machine callback or
>>>>> is there some special handling needed for these properties?
>>>>
>>>> The short answer is yes, you do not need TYPE_VOF_MACHINE_IF.
>>>>
>>>> The long answer is that we build the FDT on spapr twice:
>>>> 1. at the reset time and
>>>> 2. after "ibm,client-arhitecture-support" (early in the boot the
>>>> spapr paravirtual client says what it supports - ISA level, MMU
>>>> features, etc)
>>>>
>>>> Between 1 and 2 the kernel moves initrd and we do not update the
>>>> QEMU's version of its location, the tree at 2) will have the old
>>>> values.
>>>>
>>>> So for that reason I have TYPE_VOF_MACHINE_IF. You most definitely
>>>> do not need it.
>>>
>>> I need TYPE_VOF_MACHINE_IF because that has the quiesce callback that I
>>> need to shut VOF down when the guest is finished with it otherwise it
>>> would crash later (more on this in next message).
>>
>> Nah, quiesce() only means stopping IO in VOF. VOF is shut down when the
>> client decides to stop using it (and zero that memory).
>>
>>> But since I shut down VOF here I don't need to remember changes to the
>>> FDT so I can just use an empty setprop callback. (I wouldn't even need
>>> that if VOF would check that a callback is non-NULL before calling it.)
>>
>> I'll add the check.
>>
>> I'll need some time to go though the other mails, closer to the weekend,
>> there are too many gaps in my knowledge about those 32bit systems.
>>
>> I am really not sure that you need TYPE_PPC_VIRTUAL_HYPERVISOR (is this just
>> to make "sc 1" work? there should be a better way) or RTAS (although it
>> looks like you need it for PCI, you likely do not need it for your serial
>> device which is ISA which I have no idea how it works). Do you have an
>> actual machine? Can you dump its device tree to see what yours is missing?
>
> IIUC, it's basicaly so that the 'sc 1' instructions can be routed
> through to VOF.  'sc 1' is an illegal instruction on ppc32, AFAIK, so
> we need some sort of hack here.

Yes correct, I'm just using vhyp as that was already there and is the 
simplest way to get it working without any other changes needed to 
target/ppc or vof (apart from small changes to vof to make it work on 
ppc32 and correctly handle ELF with entry != load address that the 
pegasos2 kernel happens to do which are probably bugs in vof anyway so 
could be fixed).

> vhyp wasn't really designed for this, but I suspect it is the simplest
> way to intercept those 'sc 1' calls.
>
> Unfortunately, shutting it down presents a real problem.  Currently
> you're relying on quiesce being the last call to OF the client makes.
> That's often the case in practice, but not necessarily in all cases,
> as you've seen.  However, there's no alternative point at which we can
> determine that we're done with the client interface.
>
> My inclination for now would be to just leave the vhyp handler in
> place.  Strictly speaking it won't give you correct behaviour: later
> calls to 'sc 1' will invoke VOF rather than giving a 0x700 exception.
> But nothing on a 32-bit system should be attempting 'sc 1' anyway, so
> I think it will probably work in practice.

I agree with that if it works. Until we find a reason to replace it I 
think this is the simplest way and so far I could get it mostly working. 
I'll keep trying.

Regards,
BALATON Zoltan
--3866299591-62660492-1621857374=:15801--

