Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65364BBA7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 19:12:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p59kg-0003p2-9M; Tue, 13 Dec 2022 13:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p59kd-0003nN-U0; Tue, 13 Dec 2022 13:11:36 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p59kb-0004Pz-OY; Tue, 13 Dec 2022 13:11:35 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 787C0748131;
 Tue, 13 Dec 2022 19:09:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 26DAC74812F; Tue, 13 Dec 2022 19:09:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 24B2674810A;
 Tue, 13 Dec 2022 19:09:51 +0100 (CET)
Date: Tue, 13 Dec 2022 19:09:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>, 
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
In-Reply-To: <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
Message-ID: <e3ce4608-c516-568b-df37-8446fbe6735b@eik.bme.hu>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
 <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
 <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1281552382-1670954991=:38442"
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1281552382-1670954991=:38442
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 13 Dec 2022, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 16:53, Cédric Le Goater <clg@kaod.org> wrote:
>> On 12/13/22 17:27, Richard Henderson wrote:
>>> On 12/13/22 10:21, Peter Maydell wrote:
>>>> It does seem odd, though. We have a value in host endianness
>>>> (the EPAPR_MAGIC constant, which is host-endian by virtue of
>>>> being a C constant). But we're storing it to env->gpr[], which
>>>> is to say the CPUPPCState general purpose register array. Isn't
>>>> that array *also* kept in host endianness order?
>>>
>>> Yes indeed.
>>>
>>>> If so, then the right thing here is "don't swap at all",
>>>
>>> So it would seem...
>>>
>>>> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
>>>> that the current code is setting the wrong value for the GPR
>>>> on little-endian hosts, which seems a bit unlikely...
>>>
>>> ... unless this board has only been tested on matching hosts.

I can't remember the details but I think I've had no tswap in sam460ex 
first but that did not work and had to add it but I've probably looked at 
other examples and did not really understand why this was needed. I tested 
on x86_64 so not matching host. The board firmware has some reference to 
this magic value in:

qemu/roms/u-boot-sam460ex/arch/powerpc/lib/bootm.c::boot_jump_linux()

I don't know what it does with it but I think kernel expects it in big 
endian and what we put there should match what U-Boor does (if this is 
actually used on sam460ex which I'm not sure about). The Linux kernel I've 
tested with back then was probably from Ubuntu_16.04 or Debian Jessie 
which supported this board. Not sure this helps but that's all I can 
gather now but I may remember wrong.

Regards,
BALATON Zoltan

>> But these are register default values. Endianness doesn't apply
>> there. Doesn't it ?
>
> Any time you have a value that's more than 1 byte wide,
> endianness applies in some sense :-) We choose for our
> emulated CPUs typically to keep register values in struct
> fields and variables in the C code in host endianness. This
> is the "obvious" choice given that you want to be able to
> do things like do a simple host add to emulate a guest CPU
> add, but in theory you could store the values the other
> way around if you wanted (then "store register into RAM"
> would be trivial, and "add 1 to register" would require
> extra effort; currently it's the other way round.)
>
> Anyway, I think that in the virtex_ml507 and sam460ex code
> the use of tswap32() should be removed. In hw/ppc/e500.c
> we get this right:
>    env->gpr[6] = EPAPR_MAGIC;
>
> We have a Linux kernel boot test in the avocado tests for
> virtex_ml507 -- we really do set up this magic value wrongly
> afaict, but it seems like the kernel doesn't check it (the
> test passes regardless of whether we swap the value or not).
>
> I think what has happened here is that this bit of code is
> setting up CPU registers for an EPAPR style boot, but the
> test kernel at least doesn't expect that. It boots via the
> code in arch/powerpc/kernel/head_44x.S. That file claims
> in a comment that it expects
> *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
> *   r4 - Starting address of the init RAM disk
> *   r5 - Ending address of the init RAM disk
> *   r6 - Start of kernel command line string (e.g. "mem=128")
> *   r7 - End of kernel command line string
>
> but actually it only cares that r3 == device-tree-blob.
>
> Documentation/powerpc/booting.rst says the expectation
> (for a non-OpenFirmware boot) is:
>                r3 : physical pointer to the device-tree block
>                (defined in chapter II) in RAM
>
>                r4 : physical pointer to the kernel itself. This is
>                used by the assembly code to properly disable the MMU
>                in case you are entering the kernel with MMU enabled
>                and a non-1:1 mapping.
>
>                r5 : NULL (as to differentiate with method a)
>
> which isn't the same as what the kernel code actually cares about
> or what the kernel's comment says it cares about...
>
> So my guess about what's happening here is that the intention
> was that these boards should be able to boot both kernels built
> to be entered directly in the way booting.rst says, and also
> kernels and other guest programs built to assume boot by
> EPAPR firmware, but this bug means that we're only currently
> supporting the first of these two categories. The reason nobody's
> noticed before is presumably that in practice nobody's trying to
> boot the "built to boot from EPAPR firmware" type binary on
> these two boards.
>
> TLDR: we should drop the "tswap32()" entirely from both files.
>
> thanks
> -- PMM
>
>
--3866299591-1281552382-1670954991=:38442--

