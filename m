Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94BD382DDA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:48:20 +0200 (CEST)
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidbX-0002Th-Qr
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lidYw-00084e-Vs; Mon, 17 May 2021 09:45:39 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:38995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lidYt-0003o7-Ky; Mon, 17 May 2021 09:45:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8FA57745709;
 Mon, 17 May 2021 15:45:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 620EA7456E3; Mon, 17 May 2021 15:45:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 602E57456B4;
 Mon, 17 May 2021 15:45:30 +0200 (CEST)
Date: Mon, 17 May 2021 15:45:30 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
In-Reply-To: <0ab637d9-d54c-add1-ebdc-1c5c1bdcfdf8@ozlabs.ru>
Message-ID: <80a6ff6f-c6f8-cefe-b59d-df9cf5fdd342@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
 <dbdc9e7-b179-6c5e-61ef-297e72e086b5@eik.bme.hu>
 <64a2bb6f-85f-d029-1846-be4d693f7ab2@eik.bme.hu>
 <0ab637d9-d54c-add1-ebdc-1c5c1bdcfdf8@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-276255237-1621259130=:74573"
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-276255237-1621259130=:74573
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 17 May 2021, Alexey Kardashevskiy wrote:
> On 5/17/21 09:34, BALATON Zoltan wrote:
>> On Sat, 15 May 2021, BALATON Zoltan wrote:
>>> On Sat, 15 May 2021, BALATON Zoltan wrote:
>>>> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
>
> [snip]
>
>>>> vof_claim virt=0x0 size=0xc38 align=0x0 => 0x0
>>>> vof_claim virt=0x0 size=0x8000 align=0x8000 => 0x8000
>>>> vof_claim virt=0xc00000 size=0x18fd62 align=0x0 => 0xc00000
>>>> vof_claimed 0x0..0xc38 size=0xc38
>>>> vof_claimed 0x8000..0x10000 size=0x8000
>>>> vof_claimed 0xc00000..0xd8fd62 size=0x18fd62
>>>> vof_avail 0xc38..0x8000 size=0x73c8
>>>> vof_avail 0x10000..0xc00000 size=0xbf0000
>>>> vof_avail 0xd8fd62..0x20000000 size=0x1f27029e
>>>> via_superio_cfg: unimplemented register 0xf2
>>>> via_superio_cfg: unimplemented register 0xf4
>>>> via_superio_cfg: unimplemented register 0xf6
>>>> via_superio_cfg: unimplemented register 0xf7
[...]
>> 
>> OK, I've found that vof.bin needs to be at address 0 then hypercalls work 
>> and it tries to query /chosen/qemu.boot-kernel but I get len = -1 for some 
>> reason. I'm adding the kernel address and size like this:
>>
>>     uint64_t cells[2];
>>
>>     cells[0] = cpu_to_be64(pm->kernel_addr);
>>     cells[1] = cpu_to_be64(pm->kernel_size);
>>     qemu_fdt_setprop(fdt, "/chosen", "qemu,boot-kernel",
>>                      cells, sizeof(cells));
>> 
>> which is very much like what spapr does but when vof tries to query it I 
>> get:
>
>
> spapr_vof_reset() also claims the kernel/initrd/VOF memory and allocates the 
> stack,  vof_claim() barfs if there are overlaps.

I've also copied spapr_vof_reset and I don't see an error due to overlap, 
it seems to get past this as seen above. With the latest changes to load 
it to address 0 I see a bit different output:

$ .qemu-system-ppc -M pegasos2 -device ati-vga,romfile="" -cdrom morphos-3.15.iso -kernel boot.img -serial stdio -trace enable="vof*" -d unimp,guest_errors,int,in_asm
vof_claim virt=0x0 size=0x55f1 align=0x0 => 0x0
vof_claim virt=0x0 size=0x8000 align=0x8000 => 0x8000
vof_claim virt=0xc00000 size=0x18fd62 align=0x0 => 0xc00000
vof_claimed 0x0..0x55f1 size=0x55f1
vof_claimed 0x8000..0x10000 size=0x8000
vof_claimed 0xc00000..0xd8fd62 size=0x18fd62
vof_avail 0x55f1..0x8000 size=0x2a0f
vof_avail 0x10000..0xc00000 size=0xbf0000
vof_avail 0xd8fd62..0x20000000 size=0x1f27029e

The size of the vof area changed for some reason that I don't understand 
but it starts to run anyway and I get some hypercalls:

Raise exception at 00000150 => 00000008 (01)
hypercall r3=000000000000f005 r4=000000000000fe7c r5=0000000000000001 r6=0000000000000be8 r7=0000000000000000 r8=000000000000fe78 r9=000000000000fe7c r10=0000000000000001 r11=0000000000000000 r12=0000000000000000 nip=00000150
vof_finddevice "/chosen" => ph=0x5

Raise exception at 00000150 => 00000008 (01)
hypercall r3=000000000000f005 r4=000000000000fe6c r5=0000000000000001 r6=0000000000000005 r7=0000000000000bf0 r8=000000000000fe68 r9=000000000000fe6c r10=0000000000000001 r11=000000000000ff60 r12=0000000000000000 nip=00000150
vof_getprop ph=0x5 "qemu,boot-kernel" => len=-1 []

Then it panics here when I think it would jump to the guest code at this 
point if this was successful. I'm probably missing something that VOF 
expects which may cause problems. At the moment I don't have an initrd 
loaded and the stdout path set becuase I did not figure out how the latter 
works. Are those or anything else needed?

>> Raise exception at 00000150 => 00000008 (01)
>> hypercall r3=000000000000f005 r4=000000000000fe6c r5=0000000000000001 
>> r6=0000000000000005 r7=0000000000000bf0 r8=000000000000fe68 
>> r9=000000000000fe6c r10=0000000000000001 r11=000000000000ff60 
>> r12=0000000000000000 nip=00000150
>> vof_getprop ph=0x5 "qemu,boot-kernel" => len=-1 []
>> 
>> then it calls exit and the VM stops. Any idea what could be wrong with the 
>> above or what to check?
>
> Memory allocation. Another thing I saw was clang/llvm incorrectly 
> initializing bss start/end for prom (very early boot) so the prim init code 
> in the kernel would memset(0) wrong page and break things. Dunno.

I don't get errors about memory allocation, why do you think that would be 
a problem and where to look for such errors? I'm using your vof.bin, 
haven't recompiled it and using gcc anyway so I don't think I have a 
compiler problem.

I've uploaded my current changes I'm testing with here:

https://osdn.net/projects/qmiga/scm/git/qemu/blobs/pegasos2/hw/ppc/pegasos2.c

and these are the changes

https://osdn.net/projects/qmiga/scm/git/qemu/commits/80c3187758dccffbf167974de98f472ec5c5d03a

in case you can have a look and may spot something obviously wrong. I'm 
running it as above with MorphOS for now as I know that only reads the 
device tree at start up and should not use any other OF services. I'll 
eventually test with Linux too but this seemed simpler for first try and 
should probably work with minimal CI functionality but I hope to find 
that out when it starts.

Regards,
BALATON Zoltan
--3866299591-276255237-1621259130=:74573--

