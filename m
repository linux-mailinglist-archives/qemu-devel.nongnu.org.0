Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8112E820
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 16:36:23 +0100 (CET)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1in2WN-0007HD-1N
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 10:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50922)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1in2VU-0006Yz-NI
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:35:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1in2VT-0003Ki-0I
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:35:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56345
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1in2VS-0003KN-SD
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 10:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577979325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MoGwhsK32zhqVk+wFhSrGddKZdRRTBONPDpU2qKyIzs=;
 b=VDFXfhfMBeAbspwtjCuEmrcvMpx90fu48pnWhBf0DlcWvZO0tlDDvuf9J30vG/LunsYWAe
 /AsNjSLeegOFd/wZ0nwKEer/HJeBMou4KFTcNl0ajFP+Sc2NzJAOr8OpmDivAzv1Zrbq69
 62flnBx+yNLpm4OmenTRLMVbkqA8R5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-Yl2hFcBbPD-NmZmlajR9Ew-1; Thu, 02 Jan 2020 10:35:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82749802567;
 Thu,  2 Jan 2020 15:35:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 601067039B;
 Thu,  2 Jan 2020 15:35:19 +0000 (UTC)
Date: Thu, 2 Jan 2020 16:35:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 43/86] hppa: drop RAM size fixup
Message-ID: <20200102163518.54c36d68@redhat.com>
In-Reply-To: <2953de56-4544-1727-3454-18dc1c19821b@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
 <1577797450-88458-44-git-send-email-imammedo@redhat.com>
 <bc7bac60-0d20-d0e3-b9ac-2c9ff62c2c15@redhat.com>
 <8cb7bd0f-7841-7e60-8de6-708515b81b00@gmx.de>
 <20200102154158.460b2da6@redhat.com>
 <2953de56-4544-1727-3454-18dc1c19821b@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Yl2hFcBbPD-NmZmlajR9Ew-1
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

On Thu, 2 Jan 2020 15:45:55 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 1/2/20 3:41 PM, Igor Mammedov wrote:
> > On Thu, 2 Jan 2020 12:31:58 +0100
> > Helge Deller <deller@gmx.de> wrote:
> >  =20
> >> On 31.12.19 16:44, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >>> On 12/31/19 2:03 PM, Igor Mammedov wrote: =20
> >>>> If user provided non-sense RAM size, board will complain and
> >>>> continue running with max RAM size supported.
> >>>> Also RAM is going to be allocated by generic code, so it won't be
> >>>> possible for board to fix things up for user.
> >>>>
> >>>> Make it error message and exit to force user fix CLI,
> >>>> instead of accepting non-sense CLI values.
> >>>>
> >>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>>> ---
> >>>>  =C2=A0 hw/hppa/machine.c | 3 ++-
> >>>>  =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> >>>> index 5d0de26..25f5afc 100644
> >>>> --- a/hw/hppa/machine.c
> >>>> +++ b/hw/hppa/machine.c
> >>>> @@ -92,7 +92,8 @@ static void machine_hppa_init(MachineState *machin=
e)
> >>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Limit main memory. */
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ram_size > FIRMWARE_START) {
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 machine->ram_size =3D ra=
m_size =3D FIRMWARE_START;
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report("RAM size m=
ore than %d is not supported", FIRMWARE_START);
> >>>> +        exit(EXIT_FAILURE); =20
> >>>
> >>> $ qemu-system-hppa -m 3841m
> >>> qemu-system-hppa: invalid accelerator kvm
> >>> qemu-system-hppa: falling back to tcg
> >>> qemu-system-hppa: RAM size more than -268435456 is not supported
> >>>
> >>> Instead of using qemu_strtosz_MiB on FIRMWARE_START or unsigned forma=
t, we can simply use "RAM size more than 3840m is not supported". Is that O=
K with you? =20
> >>
> >> I don't really like that change.
> >>
> >> We currently only emulate a 32-bit system, and for those 4GB is the ma=
ximum.
> >> So, if I start my machine with "qemu-system-hppa -m 4G", the current c=
ode
> >> then automatically uses the maximum possible of 3841MB (which is limit=
ed by
> >> firmware start address).
> >> I don't expect users to know the excact 3841MB number. =20
> > It's annoying to see a error where it used to work before
> > with no matter what -m value user have used.
> >=20
> > But error message tells exact max size one could use,
> > so user doesn't have to know max, just fix CLI with provided value.
> >  =20
> >> Even on a phyiscal machine you can only add DIMMs of sizes 2GB, 3GB or=
 4GB,
> >> but not "3841MB".
> >>
> >> So, I think that patch is - although it's more correct - not a
> >> benefit for the end user. =20
> > Sure thing that users dislike when we do breaking changes (removing leg=
acy CLI
> > options, fixups or adding error checks that weren't there before).
> > But I'd choose correctness (and consistent codebase) vs convenience.
> > (it's no like we are hiding max from user) =20
>=20
> Going from 3841MB to 4GB is not a breaking change, and 4GB is correct I=
=20
under breaking change, I've meant exit with error when it used to work with
any values.

But the point in removing fixups to make user aware of valid input and
make clear what's going on when someone reads the code.

QEMU code is already too complex to read, so I'd avoid supporting values
that are not really supported by current impl. just for the sake of conveni=
ence.
(a wrapper script could do that RAM size clamping if it is really necessary=
)

> think. The Raspberry Pi machines do the same (allocate more RAM than the
> CPU is able to access, and DMA is able to use this extra RAM).
In current impl. raspi accepts RAM upto 1Gb maps all of it and reports
that size to the guest. QEMU doesn't mask or waste anything.
If we where to rise limit upto 4Gb, then there should be the code that
would inform and allow guest utilize that.



