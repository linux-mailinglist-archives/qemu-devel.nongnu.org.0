Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E912E7E8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 16:09:29 +0100 (CET)
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1in26K-00042u-OT
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 10:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45775)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1in25U-0003Dj-QD
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:08:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1in25T-0005IT-LH
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:08:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22297
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1in25T-0005IM-Ha
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577977714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejS/IciBwYM3jpFG/vpE3D5D4O5EQVLMWMm6QI65164=;
 b=ZUdWQ0v446QX/K4xg8khL5vpjv+Znf+kETPqdR4m0I/E6MxtHz/pgNWrNLCwt1lZInlG3l
 UFg3s3PmzDkuREYcTYHmhSe1Vt1enfnxtYrgRDDpV3P4Kg8BRhLK6usaaDgZeKBdhZxx8v
 bqEMKT9hI2Tvql1c+3k+5TdEbNkNFYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-U2gGWeOINi-tWFbdN5-WfQ-1; Thu, 02 Jan 2020 10:08:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2FAA64A9B;
 Thu,  2 Jan 2020 15:08:32 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D891B64435;
 Thu,  2 Jan 2020 15:08:29 +0000 (UTC)
Date: Thu, 2 Jan 2020 16:08:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 43/86] hppa: drop RAM size fixup
Message-ID: <20200102160827.790b8ed2@redhat.com>
In-Reply-To: <a3017f38-b32b-de32-9896-b287253d0fa2@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
 <1577797450-88458-44-git-send-email-imammedo@redhat.com>
 <bc7bac60-0d20-d0e3-b9ac-2c9ff62c2c15@redhat.com>
 <8cb7bd0f-7841-7e60-8de6-708515b81b00@gmx.de>
 <7cc361d0-300f-a8a1-3650-9358e815c070@redhat.com>
 <20200102151223.73e1448b@redhat.com>
 <a3017f38-b32b-de32-9896-b287253d0fa2@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: U2gGWeOINi-tWFbdN5-WfQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jan 2020 15:17:14 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 1/2/20 3:12 PM, Igor Mammedov wrote:
> > On Thu, 2 Jan 2020 13:06:33 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >  =20
> >> On 1/2/20 12:31 PM, Helge Deller wrote: =20
> >>> On 31.12.19 16:44, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >>>> On 12/31/19 2:03 PM, Igor Mammedov wrote: =20
> >>>>> If user provided non-sense RAM size, board will complain and
> >>>>> continue running with max RAM size supported.
> >>>>> Also RAM is going to be allocated by generic code, so it won't be
> >>>>> possible for board to fix things up for user.
> >>>>>
> >>>>> Make it error message and exit to force user fix CLI,
> >>>>> instead of accepting non-sense CLI values.
> >>>>>
> >>>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>>>> ---
> >>>>>   =C2=A0 hw/hppa/machine.c | 3 ++-
> >>>>>   =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> >>>>> index 5d0de26..25f5afc 100644
> >>>>> --- a/hw/hppa/machine.c
> >>>>> +++ b/hw/hppa/machine.c
> >>>>> @@ -92,7 +92,8 @@ static void machine_hppa_init(MachineState *machi=
ne)
> >>>>>   =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Limit main memory. */
> >>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ram_size > FIRMWARE_START) {
> >>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 machine->ram_size =3D r=
am_size =3D FIRMWARE_START;
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report("RAM size =
more than %d is not supported", FIRMWARE_START);
> >>>>> +        exit(EXIT_FAILURE); =20
> >>>>
> >>>> $ qemu-system-hppa -m 3841m
> >>>> qemu-system-hppa: invalid accelerator kvm
> >>>> qemu-system-hppa: falling back to tcg
> >>>> qemu-system-hppa: RAM size more than -268435456 is not supported
> >>>>
> >>>> Instead of using qemu_strtosz_MiB on FIRMWARE_START or unsigned form=
at, we can simply use "RAM size more than 3840m is not supported". Is that =
OK with you? =20
> >>>
> >>> I don't really like that change.
> >>>
> >>> We currently only emulate a 32-bit system, and for those 4GB is the m=
aximum.
> >>> So, if I start my machine with "qemu-system-hppa -m 4G", the current =
code
> >>> then automatically uses the maximum possible of 3841MB (which is limi=
ted by
> >>> firmware start address).
> >>> I don't expect users to know the excact 3841MB number.
> >>> Even on a phyiscal machine you can only add DIMMs of sizes 2GB, 3GB o=
r 4GB,
> >>> but not "3841MB". =20
> >>
> >> Thanks for the explanation. This deserves a comment in the source file
> >> IMHO (and displaying a warning to the user that the behavior is change=
d).
> >>
> >> I understand the CPU can't access this DRAM area because the ROM is
> >> mapped there. What about other devices, can they do DMA access to it?
> >>
> >> Igor: If this complicates your series too much, I think we can directl=
y
> >> allocate up-to 4GiB and not worry about the 256MiB lost. =20
> >=20
> > Do you mean
> > s/"RAM size more than %d is not supported"/"RAM size more than 4Gb is n=
ot supported"/ =20
>=20
> Works for me! You can keep my R-b with this change, thanks.

Well, it's not that simple.
Do we map whole 4G in address space, if yes then we have to "unbreak"
firmware mapping and use overlap mapping or do we map only portion of it?
Both would make code more confusing and all for the sake of user convenienc=
e
so they won't have to change their CLI?


> >>> So, I think that patch is - although it's more correct - not a
> >>> benefit for the end user.
> >>>
> >>> Helge
> >>>     =20
> >>
> >> =20
> >  =20
>=20


