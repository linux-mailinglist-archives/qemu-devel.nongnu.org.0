Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8E6218CF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQsF-0001jV-9b; Tue, 08 Nov 2022 10:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1osQsD-0001jI-3f; Tue, 08 Nov 2022 10:50:49 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1osQs6-00026y-5W; Tue, 08 Nov 2022 10:50:48 -0500
Received: by mail-pf1-x42b.google.com with SMTP id z26so14185007pff.1;
 Tue, 08 Nov 2022 07:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4knHnpnx6aWKN7j5NNV+/dRxetRLSyda3Kt5238DxBg=;
 b=IdPPV84la5Q01TDY8BSP+/CvytXsi3W3//D7x+hJBBIhIu70GhS0T1AK55Qz1jdNWs
 UOOS7wMrUBgGOdevHe9/dblK21uCUCZQBmrJBQSY8MXijzjJlfWGwQQ6rQLuZboxi8SF
 MgXmeyegp7w9ekb6v+gBp5igPnpROr5jYa+vyufcUzfUIjoGxXcPasqXg7dEzNq2iHkf
 ws5k1BELgl7rDT1KgdxcvvVqF8FHllvfgjEo26eehEpZlyJVwzyqLtvst9sVZjRjBjMs
 2ajkQK4io01HIAR4ZVZgDGSxbbWIQGIANL874liGrEBIob8HTPDHx+24XrEe7I9tvsGm
 g/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4knHnpnx6aWKN7j5NNV+/dRxetRLSyda3Kt5238DxBg=;
 b=C0DMecYPvGcrl+J4KiSKbCXh4hm7YmGn1eHQmoFNC3Ey5QXVgwBkjZLs3pZW+JpAh7
 F2G1sHzGZ2ZtoVkWLHE0rZMiloGOtL/dx6YFWx81zw37Il2CEnJQ62bKSTK5CrSS/ViB
 DHIYB3iMiCiv35t/rvOCNssq6JGNLhR+WktuNoOMMPZqoAK2LIOAMgDzzFzoP515n/0F
 8QC0NMKGETpVGpqTlNbGRLey0Y7VzqfmXRbEf04LlW/RFPSPGpwY8V0gz2kvvxEzopYA
 LNpVkChRSlc7wDKMBbLExtup2NjImHuH00v/WchA56m0RW0YJ7XvouXHXXzVr9Se03Jh
 pcow==
X-Gm-Message-State: ACrzQf1+YoObwcqd5GqUuwUj5JGnLvhsZkyqxQZfLP6RL6f/zvSrfDJo
 LKTdsyYr1RgaZWir1gVkdsdijUVcpV9fxOCO
X-Google-Smtp-Source: AMsMyM4CEi9GAYqC3dxCf9iO3rcZnJ/khMoZ/i4F/eiYuCbjILN7yyjghPIAgFKnhntQqvpHZWrfLA==
X-Received: by 2002:a65:56c4:0:b0:458:85e:9e65 with SMTP id
 w4-20020a6556c4000000b00458085e9e65mr49338890pgs.358.1667922639518; 
 Tue, 08 Nov 2022 07:50:39 -0800 (PST)
Received: from steamdeck ([125.122.211.175]) by smtp.gmail.com with ESMTPSA id
 k15-20020aa79d0f000000b0056d73ef41fdsm6548620pfp.75.2022.11.08.07.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 07:50:38 -0800 (PST)
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
User-agent: mu4e 1.8.9; emacs 27.2
From: Schspa Shi <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Tue, 08 Nov 2022 23:36:44 +0800
In-reply-to: <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
Message-ID: <875yfpbg38.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=schspa@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>>
>> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
>> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>> > > There is a whole comment in boot.c talking about keeping initrd with=
in
>> > > lowmem:
>> > >
>> > >     /*
>> > >      * We want to put the initrd far enough into RAM that when the
>> > >      * kernel is uncompressed it will not clobber the initrd. However
>> > >      * on boards without much RAM we must ensure that we still leave
>> > >      * enough room for a decent sized initrd, and on boards with lar=
ge
>> > >      * amounts of RAM we must avoid the initrd being so far up in RAM
>> > >      * that it is outside lowmem and inaccessible to the kernel.
>> > >      * So for boards with less  than 256MB of RAM we put the initrd
>> > >      * halfway into RAM, and for boards with 256MB of RAM or more we=
 put
>> > >      * the initrd at 128MB.
>> > >      * We also refuse to put the initrd somewhere that will definite=
ly
>> > >      * overlay the kernel we just loaded, though for kernel formats =
which
>> > >      * don't tell us their exact size (eg self-decompressing 32-bit =
kernels)
>> > >      * we might still make a bad choice here.
>> > >      */
>> > >
>> >
>> > I think this lowmem does not mean below 4GB. and it is to make sure
>> > the initrd_start > memblock_start_of_DRAM for Linux address range chec=
k.
>>
>> The wording of this comment pre-dates 64-bit CPU support: it
>> is talking about the requirement in the 32-bit booting doc
>> https://www.kernel.org/doc/Documentation/arm/Booting
>> that says
>> "If an initramfs is in use then, as with the dtb, it must be placed in
>> a region of memory where the kernel decompressor will not overwrite it
>> while also with the region which will be covered by the kernel's
>> low-memory mapping."
>>
>> So it does mean "below 4GB", because you can't boot a 32-bit kernel
>> if you don't put the kernel, initrd, etc below 4GB.
>
> A kernel person corrects me on the meaning of "lowmem" here -- the
> kernel means by it "within the first 768MB of RAM". There is also
> an implicit requirement that everything be within the bottom 32-bits
> of the physical address space.
>

Thanks for your comment.

In this view, initrd shouldn't be placed higher than 4GB ? But it
seems the Linux kernel can boot when there is no memory below 4GB.

I know that lowmem is needed for SWIOTLB etc. It will be used to make
the 32bit IP work without IOMMU. But it seems it's not required to
boot.

> -- PMM

--=20
BRs
Schspa Shi

