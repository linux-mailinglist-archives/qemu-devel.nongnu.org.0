Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD837271933
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 04:13:38 +0200 (CEST)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKBKj-0007gC-9P
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 22:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kKBJq-0007HG-L5
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 22:12:42 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:34047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kKBJo-0007jH-Pv
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 22:12:42 -0400
Received: by mail-lf1-x143.google.com with SMTP id u8so12274882lff.1
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 19:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dm8TVBK+524UVZzEo+5U0Or7nsuxPqETpMpYlezR5Ng=;
 b=n9JrGHRywCl59wWmnZ2KE3B+s5auiEy0ousGDZwnCn2KzdlNJHm2FJ6v/skOboFUzm
 29TQBaC571I/5LEAGv/gKoh55mwZ7EoJYVChkDp4puXDlbpSvlCkKprNb65lLfKXHRdo
 37f9Vv9/hPSJxcOp4D+fv5o1DlAfbbzNs9Xe5qBaWaEMNaXAuXJmo0pgabebZirxcJtf
 Em3DQT5YLM/tlG8XAo5SbjIVu//NTRr0oZoow72cmHlfEbXcykKnjiL5y4gAiHeRke41
 0P0T9zBukydDNGuQVv+EAUB/MSMVtzh6gXxnrogBT1jjBNFh2DmVrM8KFoSLj+zzdoZI
 djrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dm8TVBK+524UVZzEo+5U0Or7nsuxPqETpMpYlezR5Ng=;
 b=DxdN8scfXjSuYcCG9xui0z0rFjY3J84NsXNGf+U72XYRIeZZfI/GCO7oUz9+JBXhIL
 hKJ3I+DlZL6K+Jy4mQ2+NgaewVw3mFbbZYhAWIOOX83yQ5EbWmivXJU/qeW7UYKWkMG+
 H7BuS46JcWtuRuIuzzeMwtv05c0fMusWRA0HYDXuK7BcFDDXysJemGwKuwcIy9JnvHHz
 7wb6GyaGNBlLRS8yNMEeWYzNXAAWZgUF/0GylCZY2jNiNHrTS7RJvnEX+J+Oe1v9Zxwm
 O819PnGa6q1Nexyj9LelMp5fWAvOpQAZ8IE5JJ/rGYe3fRccfMgpMdrjMbpe2RNOXteY
 Mikw==
X-Gm-Message-State: AOAM530r9689b3cP1oOrpoVv6ZDq4rwdXWL+NnjvKeMVpUJ1o9plDtiS
 5aqR2k8csUN8EGytPNKQRKTOR1zxt5CBbr51794=
X-Google-Smtp-Source: ABdhPJzksqerevkgUhjNtJFsFC6+hmx59maKaH0hI5/FER3U1l58F/av6T0gUgtHZ0la0BxbLzfugDFtHaKC7L/SzAE=
X-Received: by 2002:a05:6512:370e:: with SMTP id
 z14mr16006305lfr.80.1600654358157; 
 Sun, 20 Sep 2020 19:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <1600222344-16808-1-git-send-email-chenhc@lemote.com>
 <1600222344-16808-7-git-send-email-chenhc@lemote.com>
 <c3804617-7c65-4082-de76-81e718f6d139@amsat.org>
 <CAAhV-H5OysVNvGzD066eVqA+-k2+GJDjwSGR0hJT0VUh3Ld83A@mail.gmail.com>
 <63a89ba1-a920-c2b9-bd4f-7f523fdda895@amsat.org>
 <31d4f14f-bba5-a5a5-d024-668558416083@amsat.org>
 <CAAhV-H71RPoqf046-BJWEHkSumNM5mohxhwShSD9PyELTEzEtw@mail.gmail.com>
 <ff3c4df0-6c11-ef9c-a26e-0397e13fc628@amsat.org>
In-Reply-To: <ff3c4df0-6c11-ef9c-a26e-0397e13fc628@amsat.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 21 Sep 2020 10:12:25 +0800
Message-ID: <CABDp7VrN41hr2Tv6=yfdx04F75HcbhjocyaTzm82HP6YgEOHZg@mail.gmail.com>
Subject: Re: [PATCH V9 6/6] hw/mips: Add Loongson-3 machine support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Sat, Sep 19, 2020 at 9:59 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 9/19/20 3:00 AM, Huacai Chen wrote:
> > Hi, Philippe,
> >
> > On Thu, Sep 17, 2020 at 3:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> On 9/16/20 12:47 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> On 9/16/20 11:49 AM, Huacai Chen wrote:
> >>>> On Wed, Sep 16, 2020 at 3:56 PM Philippe Mathieu-Daud=C3=A9 <f4bug@a=
msat.org> wrote:
> >>>>> On 9/16/20 4:12 AM, Huacai Chen wrote:
> >>> [...]
> >>>>>> +static void mips_loongson3_virt_init(MachineState *machine)
> >>>>>> +{
> >>>>>> +    int i;
> >>>>>> +    long bios_size;
> >>>>>> +    MIPSCPU *cpu;
> >>>>>> +    CPUMIPSState *env;
> >>>>>> +    DeviceState *liointc;
> >>>>>> +    char *filename;
> >>>>>> +    const char *kernel_cmdline =3D machine->kernel_cmdline;
> >>>>>> +    const char *kernel_filename =3D machine->kernel_filename;
> >>>>>> +    const char *initrd_filename =3D machine->initrd_filename;
> >>>>>> +    ram_addr_t ram_size =3D machine->ram_size;
> >>>>>> +    MemoryRegion *address_space_mem =3D get_system_memory();
> >>>>>> +    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> >>>>>> +    MemoryRegion *bios =3D g_new(MemoryRegion, 1);
> >>>>>> +    MemoryRegion *iomem =3D g_new(MemoryRegion, 1);
> >>>>>> +
> >>>>>> +    /* TODO: TCG will support all CPU types */
> >>>>>> +    if (!kvm_enabled()) {
> >>>>>> +        if (!machine->cpu_type) {
> >>>>>> +            machine->cpu_type =3D MIPS_CPU_TYPE_NAME("Loongson-3A=
1000");
> >>>>>> +        }
> >>>>>> +        if (!strstr(machine->cpu_type, "Loongson-3A1000")) {
> >>>>>> +            error_report("Loongson-3/TCG need cpu type Loongson-3=
A1000");
> >>>>>> +            exit(1);
> >>>>>> +        }
> >>>>>> +    } else {
> >>>>>> +        if (!machine->cpu_type) {
> >>>>>> +            machine->cpu_type =3D MIPS_CPU_TYPE_NAME("Loongson-3A=
4000");
> >>>>>> +        }
> >>>>>> +        if (!strstr(machine->cpu_type, "Loongson-3A4000")) {
> >>>>>> +            error_report("Loongson-3/KVM need cpu type Loongson-3=
A4000");
> >>>>>> +            exit(1);
> >>>>>> +        }
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    if (ram_size < 512 * MiB) {
> >>>>>> +        error_report("Loongson-3 need at least 512MB memory");
> >>>>>
> >>>>> Typo "needs", but why?
> >>>> Though you told me "QEMU shouldn't assume anything about the guest",
> >>>> but Loongson-3 machine really need at least 512M memory. And as you
> >>>> said, this can simplify the memsize/highmemsize process (always larg=
er
> >>>> than 256).
> >>>
> >>> OK, that's fine.
> >>>
> >>>>
> >>>>>
> >>>>>> +        exit(1);
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    /*
> >>>>>> +     * The whole MMIO range among configure registers doesn't gen=
erate
> >>>>>> +     * exception when accessing invalid memory. Create an empty s=
lot to
> >>>>>> +     * emulate this feature.
> >>>>>> +     */
> >>>>>> +    empty_slot_init("fallback", 0, 0x80000000);
> >>>>>
> >>>>> Again, this doesn't look correct (no comment in my previous review)=
.
> >>>> This is written by Jiaxun because this is only needed by TCG, and he
> >>>> said that malta also uses empty_slot_init() here.
> >>>
> >>> IIRC for Malta this is a GT64120 specific hole.
> >>>
> >>> In this case I'd like to know the justification first.
> >>> Maybe you want to add this hole in the LOONGSON_LIOINTC device...
> >>
> >> Which makes me also wonder why are you splitting out 256MB of the RAM?
> >>
> >> This was a physical restriction of the GT64120 on 32-bit targets.
> >> Your hardware is virtual and 64-bit...
> > The physical memory address layout of Loongson-3:
> > 0-0x40000000  Low RAM (256MB)
> > 0x40000000-0x80000000 Hole for several MMIO registers (256MB)
> > 0x80000000-TopOfMemory High RAM
> >
> > Thogh this is a virtual platform, but the kernel link address is in
> > CKSEG0, so "Low RAM" should exist. Though MMIO is different from real
> > hardware, but put it in the same hole can make life easy.
>
> OK...
>
> >
> > Then it seems there is really a mistake of empty_slot_init() but has
> > nothing to do with liointc, and the right one should be
> > empty_slot_init("fallback", 0x40000000, 0x40000000);
>
> The EMPTY_SLOT models physical slot for busses that don't
> generate bus error when the slot is accessed and there is
> nothing there.
>
> If the 256MiB region starting at 0x40000000 is reserved for
> MMIO registers, you certainly want to get a bus error if the
> CPU tries to address an unmapped/illegal address.
>
> If you know some area belong to a device that might be accessed
> by firmware/kernel but it isn't important to model it, then you
> can create an UNIMP_DEVICE with create_unimplemented_device(),
> which behaves as RAZ/WI accesses on the bus.
Yes, there are some MMIO access from firmware/kernel that doesn't
belong to any emulated devices, then I found that "empty slot" and
"unimplemented device" is nearly the same thing, what are their
differences?

Huacai
>
> Regards,
>
> Phil.
>
> >
> > Huacai
> >



--=20
Huacai Chen

