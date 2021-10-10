Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72278428422
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 01:08:11 +0200 (CEST)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZhvO-0006UF-1q
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 19:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mZhuM-0005oW-BP
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 19:07:06 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mZhuK-000342-K7
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 19:07:06 -0400
Received: by mail-il1-x12d.google.com with SMTP id r9so16210985ile.5
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 16:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HuRG+NoD15xqUUFLEalQg1wkcPEuhRnyOzE+yY57Tis=;
 b=pC/kqROzdhiKvyxUzeaaYUSNNrY1tX+3uCnFY5YY9PZ7JqT/T+foRG4xM7FHmNxgLl
 gS6oy3dt46ioShLbfKH7jWFvDJVUHtXTnRLzD9olezew2OBTJihXwpYOnv6fLoQuBM8f
 /YcxSkE39HUoBFC2a7tlSsrMfT/uNeqNX6hF70ZnCbwBCzjw62ItlfCj5hJZ8Sqac4BL
 QPfmwvLpz43qApMLDqqhIv6P2YKxQTp/oNgyxLfT8V/kZ9W7YjtUMvFUqcWsGmPD28WO
 8qD/TRiNvLZh8WZ9rd0CNa+DhVpZXfOZ184F/EW24Y5kQ0ABZLqhN7l4fZu+0W/WzV6h
 QG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HuRG+NoD15xqUUFLEalQg1wkcPEuhRnyOzE+yY57Tis=;
 b=Ac8HBhvsIDPTRucF5JcanITleTXif9MBEN7ew3VCHdvpAXN//44ztwo/By5YWfp0xg
 w1QP4r1ygmvNmczjRACZGJF8n7Nb0TYdx6bARMqocSjJeP5fIaULTSHeh4o4NEfwV5s7
 mpImXmwZs42tvQ1oqzs4Sk+dO7T+6ySruyhgrCMmpLC3znJ2oMAqcpNwWMBa6+8FPG60
 TVw4KTo7C10Ph14CgyLSjn99YSBV5l+G7O3ljhOrUPu1jSf0H1xLsumZRhkp9HNhMY5Z
 7qGBccGqaYcLa4P44oQZx1ptUHggCgbZsZ1fWNTSPPBq/KXyKmyqzJklaDP9Ual0Jahr
 ykmw==
X-Gm-Message-State: AOAM532JmkfOiJLRfSKqY55Rs4YHm0YMDECG2zCSKTSz1K+LGoKSw6o5
 JUmJlISD07fN+jTF0/Iou3GFYmlDdsnEICdWEjc=
X-Google-Smtp-Source: ABdhPJwidRcuGSLcIYTMnkVMK8KcLYfqQlcfF0YgH32bagfkHuZPXkCdWzmG+sXB1EKJJOeQ/0AhV6htARXeawtAa34=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr17089790ill.46.1633907222011; 
 Sun, 10 Oct 2021 16:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
 <CAKmqyKPF+91=qpqmd-5OwLvDCTE_8vb083RA_k-NGi+7Bwa51Q@mail.gmail.com>
 <6b919273-ab23-6822-fdeb-66e18009f70a@redhat.com>
 <97f817b9-9455-9899-ff20-530baa77190d@greensocs.com>
In-Reply-To: <97f817b9-9455-9899-ff20-530baa77190d@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Oct 2021 09:06:36 +1000
Message-ID: <CAKmqyKMNqrqPzWNBTj3w47g_6CcTycqy_psi-hBAzR918ZKD_w@mail.gmail.com>
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 8:38 PM Damien Hedde <damien.hedde@greensocs.com> wr=
ote:
>
>
>
> On 10/7/21 09:59, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 10/7/21 08:41, Alistair Francis wrote:
> >> On Wed, Oct 6, 2021 at 10:04 PM Damien Hedde <damien.hedde@greensocs.c=
om> wrote:
> >>> On 10/6/21 13:49, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>> On 10/6/21 13:37, Damien Hedde wrote:
> >>>>> Right now, we cannot load some binary file if it is bigger than the
> >>>>> machine's ram size. This limitation only occurs when loading a
> >>>>> binary file: we can load a corresponding elf file without this
> >>>>> limitation.
> >>>>>
> >>>>> This is an issue for machines that have small ram or do not use the
> >>>>> ram_size feature at all.
> >>>>>
> >>>>> Also get rid of "hw/boards.h" include, since we needed it only
> >>>>> to access `current_machine`.
> >>>>>
> >>>>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
> >>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >>>>> ---
> >>>>>
> >>>>> Hi Alistair,
> >>>>>
> >>>>> I found this while experimenting with a ram_size=3D0 machine.
> >>>
> >>>
> >>>
> >>>>
> >>>> Where are you loading your file?
> >>>>
> >>>
> >>> In a rom.
> >>>
> >>> The loader does not check at all that we are loading to the machine's
> >>> ram. It just check the size for the raw binary file format.
> >>
> >> Hmmm... This is probably correct, in that a user might want to load a
> >> binary into ROM and doesn't want to be blocked by the ram size.
> >>
> >> In general though a user would expect an error if they are loading a
> >> file into RAM that is larger then the RAM. So I'm not fully convinced
> >> we want this change.
> >
> > I agree with Damien using current_machine->ram_size is not ideal,
> > for example some machines have the RAM split and mapped at different
> > regions, so even if ram_size is enough for the image to load,
> > a region might not be big enough and I'd expect load_image_targphys_as(=
)
> > to fail.
> >
> > Maybe we can call memory_region_find(s->addr) then on match:
> >
> >   if (memory_region_is_ram*(match)) {
> >     size =3D memory_region_size(match);
> >   } else {
> >     size =3D -1;
> >   }
> >
>
> So I worked a bit on this.
>
> We could call memory_region_find(get_system_memory(), addr, ...) like
> Philippe proposed.
> and check that the memory is big enough and has the proper "type" (ram,
> rom, ...)
>
> Note that we will check only the current state of the address space. So
> it means the region must already exists (sounds reasonable to me).
>
> If this sounds like a good direction to you, I'll propose an updated
> version of the patch.

This sounds like the right direction to me. It also seems like a
significant improvement over what we do now.

Alistair

>
> regarding relying on load_image_targphys to check this. I don't know...
> all these functions (load_targphys_...() and rom_add_...()) just put
> rom(s) in a list. The list is checked afterward against overlap and
> loaded at reset.
> It is possible but it changes the behavior of all rom_add_...() functions=
.
>
> We could also check, during the reset, that the rom loading works. But
> maybe some part of qemu expects that we silently skip some missing bits.
> Maybe a log/warning there ?
>
> Thanks,
> Damien

