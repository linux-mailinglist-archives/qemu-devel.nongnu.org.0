Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF36687E7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 13:10:44 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmysV-0001C4-9j
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 07:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46008)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hmys4-0008D9-81
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:10:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hmys3-0007yP-4W
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 07:10:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48502)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hmys0-0007uU-KH; Mon, 15 Jul 2019 07:10:12 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BA42309174E;
 Mon, 15 Jul 2019 11:10:10 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8B84F81;
 Mon, 15 Jul 2019 11:09:57 +0000 (UTC)
Date: Mon, 15 Jul 2019 13:09:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20190715130955.4a117388.cohuck@redhat.com>
In-Reply-To: <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 15 Jul 2019 11:10:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3] hw/Kconfig: PCI bus
 implies PCI_DEVICES
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Collin Walling <walling@linux.ibm.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Jul 2019 13:04:28 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 7/15/19 12:56 PM, Cornelia Huck wrote:
> > On Mon, 15 Jul 2019 12:48:55 +0200
> > Thomas Huth <thuth@redhat.com> wrote:
> >  =20
> >> On 15/07/2019 12.19, Peter Maydell wrote: =20
> >>> On Mon, 15 Jul 2019 at 11:15, Thomas Huth <thuth@redhat.com> wrote:  =
 =20
> >>>>
> >>>> On 15/07/2019 11.55, Philippe Mathieu-Daud=C3=A9 wrote:   =20
> >>>>> If a controller device provides a PCI bus, we can plug any PCI
> >>>>> daughter card on it.
> >>>>>
> >>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>>>> ---   =20
> >>>    =20
> >>>>> diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
> >>>>> index 77f8b005ff..0f7267db35 100644
> >>>>> --- a/hw/pci/Kconfig
> >>>>> +++ b/hw/pci/Kconfig
> >>>>> @@ -1,5 +1,6 @@
> >>>>>  config PCI
> >>>>>      bool
> >>>>> +    imply PCI_DEVICES   =20
> >>>>
> >>>> No, please don't change this. This was done on purpose, since almost=
 all
> >>>> PCI_DEVICES do not work on s390x (so s390x does *not* imply PCI_DEVI=
CES).   =20
> >>>
> >>> But that means that every board that provides PCI has to have an
> >>> "imply PCI_DEVICES" line, which is pretty clunky just to work
> >>> around an s390x limitation.
> >>>
> >>> Is there some way in the Kconfig syntax for s390x to say
> >>> "no PCI_DEVICES" so we can have the corner-case be handled
> >>> by the s390x Kconfig in one place rather than in 20 places
> >>> affecting everywhere except s390x?   =20
> >>
> >> IIRC the problem on s390x are the legacy IRQs. s390x has only MSIs. So=
 I
> >> guess the correct way to fix this would be to introduce some
> >> PCI_LEGACY_IRQ switch and let all old devices that do not work with MSI
> >> depend on it. =20
> >=20
> > s/MSI/MSI-X/, IIRC. Not sure how far 'legacy' would stretch. =20
>=20
> Maybe we can have something like PCI_LEGACY_DEVICES and PCI_MSI_DEVICES?
>=20
> So if s390x only selects PCI_LEGACY (not PCI_MSI) bus, then it only get
> legacy devices?

Wrong way around? We need MSI-X for s390x, not plain MSI or
'legacy' (whatever that is).

>=20
> Other MSI compliant should select PCI_MSI instead. PCI alone seems to
> give troubles.
>=20
> > cc:ing Collin in case there's something else.
> >  =20


