Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF47B40A9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 20:56:56 +0200 (CEST)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9wBD-0005BY-Fo
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 14:56:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i9w9l-0004cR-Qg
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 14:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i9w9f-0005eV-O1
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 14:55:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56926)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1i9w9f-0005e8-CQ; Mon, 16 Sep 2019 14:55:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8A8AC5117D;
 Mon, 16 Sep 2019 18:55:18 +0000 (UTC)
Received: from dhcp-17-173.bos.redhat.com (dhcp-17-173.bos.redhat.com
 [10.18.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C838B600F8;
 Mon, 16 Sep 2019 18:55:14 +0000 (UTC)
Date: Mon, 16 Sep 2019 14:55:13 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20190916185513.GA13659@dhcp-17-173.bos.redhat.com>
References: <20190915211940.30427-1-f4bug@amsat.org>
 <20190915211940.30427-3-f4bug@amsat.org>
 <20190916175914.GA7550@dhcp-17-173.bos.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190916175914.GA7550@dhcp-17-173.bos.redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 16 Sep 2019 18:55:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/6] tests/acceptance: Test Open
 Firmware on the PReP/40p
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 16, 2019 at 01:59:22PM -0400, Cleber Rosa wrote:
> On Sun, Sep 15, 2019 at 11:19:36PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> > User case from:
> > https://tyom.blogspot.com/2019/04/aixprep-under-qemu-how-to.html
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > ---
> >  tests/acceptance/ppc_prep_40p.py | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >=20
> > diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_=
prep_40p.py
> > index 53f2d2ecf0..a0eac40d9f 100644
> > --- a/tests/acceptance/ppc_prep_40p.py
> > +++ b/tests/acceptance/ppc_prep_40p.py
> > @@ -61,3 +61,24 @@ class IbmPrep40pMachine(Test):
> >          os_banner =3D 'NetBSD 4.0 (GENERIC) #0: Sun Dec 16 00:49:40 =
PST 2007'
> >          self.wait_for_console_pattern(os_banner)
> >          self.wait_for_console_pattern('Model: IBM PPS Model 6015')
> > +
> > +    def test_openfirmware(self):
> > +        """
> > +        :avocado: tags=3Darch:ppc
> > +        :avocado: tags=3Dmachine:40p
> > +        """
> > +        bios_url =3D ('https://github.com/artyom-tarasenko/openfirmw=
are/'
> > +                    'releases/download/40p-20190413/q40pofw-serial.r=
om')
> > +        bios_hash =3D '880c80172ea5b2247c0ac2a8bf36bbe385192c72'
> > +        bios_path =3D self.fetch_asset(bios_url, asset_hash=3Dbios_h=
ash)
> > +
> > +        self.vm.set_machine('40p')
> > +        self.vm.set_console()
> > +        self.vm.add_args('-bios', bios_path)
> > +
> > +        self.vm.launch()
> > +        self.wait_for_console_pattern('QEMU PReP/40p')
> > +        fw_banner =3D 'Open Firmware, built  April 13, 2019 09:29:23=
'
> > +        self.wait_for_console_pattern(fw_banner)
> > +        prompt_msg =3D 'Type any key to interrupt automatic startup'
> > +        self.wait_for_console_pattern(prompt_msg)
> > --=20
> > 2.20.1
> >=20
>=20
> Tested-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>

Actually, I'm seeing random but consistent failures.  I've tracked
it down to the 'Open Firmware, built  April 13, 2019 09:29:23'.  Out
of 100 executions I got 27 failures, with that line logged as:

  2019-09-16 14:44:54,540 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:45:00,762 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:45:06,575 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:45:12,859 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:45:18,707 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:45:21,876 ppc_prep_40p     L0033 DEBUG| en Firmware, buil=
t  April 13, 2019 09:29:23
  2019-09-16 14:45:28,054 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:45:31,163 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:45:34,291 ppc_prep_40p     L0033 DEBUG| en Firmware, buil=
t  April 13, 2019 09:29:23
  2019-09-16 14:45:57,719 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:46:03,610 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:46:06,795 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:46:17,087 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:46:21,534 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:46:24,694 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:46:38,076 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:46:49,863 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:46:54,435 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:47:00,672 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:47:03,834 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:47:06,852 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:47:14,276 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:47:17,380 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:47:34,749 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:47:39,217 ppc_prep_40p     L0033 DEBUG| n Firmware, built=
  April 13, 2019 09:29:23
  2019-09-16 14:47:43,750 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23
  2019-09-16 14:48:04,003 ppc_prep_40p     L0033 DEBUG| Firmware, built  =
April 13, 2019 09:29:23

Given that we're not seeing this behavior in other target/marchine
tests, my first impression is that this is what's being produced
by QEMU, and not what's being badly captured by the Avocado and/or
the test code.

Any ideas?

- Cleber.

