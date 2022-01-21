Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76008495DBB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:26:18 +0100 (CET)
Received: from localhost ([::1]:59270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAr7Z-0005RP-3n
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nAqJB-0001KE-9G; Fri, 21 Jan 2022 04:34:13 -0500
Received: from mail.ispras.ru ([83.149.199.84]:40900)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nAqIy-0006NE-5r; Fri, 21 Jan 2022 04:34:12 -0500
Received: from smtpclient.apple (unknown [77.37.166.174])
 by mail.ispras.ru (Postfix) with ESMTPSA id 781AE40D3BFF;
 Fri, 21 Jan 2022 09:33:57 +0000 (UTC)
Content-Type: multipart/signed;
 boundary="Apple-Mail=_1EFE8244-1147-4A1C-ABF0-BB0DFD85401A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] target/ppc/mmu_common: Fix SRR1/MSR error code on Book-E
From: Vitaly Cheptsov <cheptsov@ispras.ru>
In-Reply-To: <9717e63d-b72a-81f6-e9b9-052294f560f1@kaod.org>
Date: Fri, 21 Jan 2022 12:33:57 +0300
Message-Id: <979A28AD-F229-498E-89CD-1D475EC6C94E@ispras.ru>
References: <BE5775C6-A54F-4443-9752-DBB6587E1F46@ispras.ru>
 <9717e63d-b72a-81f6-e9b9-052294f560f1@kaod.org>
To: =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=83.149.199.84; envelope-from=cheptsov@ispras.ru;
 helo=mail.ispras.ru
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
Cc: Kurban Mallachiev <mallachiev@ispras.ru>,
 "mario@locati.it" <mario@locati.it>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_1EFE8244-1147-4A1C-ABF0-BB0DFD85401A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi C=C3=A9dric,

> This looks correct and even fixing an issue that Mario reported
> on the TCG e6500 CPU with a kernel + KVM compiled in :
>=20
>  =
https://lore.kernel.org/all/R5JFVM$911E343FF81933B99D53FD0992D8848F@locati=
.it/
>=20
> KVM has some issues also with the e6500 but that's another problem
> I think.

Glad to hear that. Could you schedule the inclusion of the patch in =
6.2.1 or 6.3 please?

> What is your environment ? Which QEMU machine ? Can you provide a
> command line ?

We have an in-house RTOS at ISP RAS, which we use to run some =
environmental tests on QEMU. The target hardware in this particular =
example is a QorIQ P3041-based board. The command line approximately =
looks like this:
qemu-system-ppc -cpu e500mc -M ppce500 -m 128M -icount 1 -kernel =
/path/to/kernel.elf -serial tcp::1111,server,nodelay

> Could you please resend the patch in a non attached way ?  See :
>=20
>  https://www.qemu.org/docs/master/devel/submitting-a-patch.html
>=20
> and copy qemu-devel.

Yes, sure. Have just done that.

Best regards,
Vitaly

> On 21 Jan 2022, at 11:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
> Hello Vitaly
>=20
> On 1/21/22 01:02, Vitaly Cheptsov wrote:
>> Hello,
>> PowerPC e500mc defines MSR bit 35 differently from most other PowerPC =
variants. In particular, for e500mc this is GS (Guest Supervisor) =
bit[1], while for others it is NOEXEC GUARD bit[2].
>> QEMU ignores this architectural difference when handling the =
exceptions of attempting to run not executable code on e500mc, and =
mistakenly sets the GS bit[3][4].
>> Setting this bit eventually leads to crashes, because although QEMU =
does not support Guest Supervisor mode on e500mc, it still requires it =
to be disabled[5].
>=20
> This looks correct and even fixing an issue that Mario reported
> on the TCG e6500 CPU with a kernel + KVM compiled in :
>=20
>  =
https://lore.kernel.org/all/R5JFVM$911E343FF81933B99D53FD0992D8848F@locati=
.it/
>=20
> KVM has some issues also with the e6500 but that's another problem
> I think.
>=20
>=20
> What is your environment ? Which QEMU machine ? Can you provide a
> command line ?
>=20
> Could you please resend the patch in a non attached way ?  See :
>=20
>  https://www.qemu.org/docs/master/devel/submitting-a-patch.html
>=20
> and copy qemu-devel.
>=20
> Thanks,
>=20
> C.
>=20
>=20
>> Best regards,
>> Vitaly
>> [1] https://www.nxp.com/docs/en/reference-manual/E500MCRM.pdf, 2.7.1 =
MSR
>> [2] =
https://openpowerfoundation.org/?resource_lib=3Dpower-isa-version-3-0, =
6.5.5 Instruction Storage Interrupt
>> [3] =
https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/mmu_common.c#L1426
>> [4] =
https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/excp_helper.c#L414-L41=
6
>> [5] =
https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/mmu_helper.c#L1078-L10=
80
>=20


--Apple-Mail=_1EFE8244-1147-4A1C-ABF0-BB0DFD85401A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEsLABAI5Y5VbvBdmpL8K2O86Eyz4FAmHqfgUACgkQL8K2O86E
yz4hmw/8C0FiKnn14/aonyntt7BZXWBL5AlFI1plgpY+rZ+XfKViEzFX2La6+NR4
3uagYixLYcjWqZxK9hPXn8A40Wu+KYiu5skXisv0xPrSE8oVcR/8ff1gc06P0UKm
amg4GQu52CJO8Omp+ChjKVG1FbluMzgLPtQ5JTEUXV+vHID3F498QGKo6qyN5UN/
9rRJCWCvh3KseWxA+8ZjZ3UxFwrETZQtN0iBzwdicUJj4C6iK+sB0ajXlWXxoT+J
r4iodP0v7+Su4YSiq7Pcaky8DV/v2+KZfU6gddnd0hVxumatUIIBzqcYJHWjKFzB
3THOFzkDlhiHDs0uJAEcfXb67dMGWviEIWFMnbJbjbG5dapMsQTWSyHyJwMhXzNw
bn3nrccJlsrwnFZEnoRCYtmwYhRKmgGicNj3MeqeEkDvz1Ea4AUCMhtmXhtL4Q6a
/DayM6NsDa6YL4QsYPnusvnjvOegmD/WhuC3KZc3bZ6smHxzGjw8jHS1gx/V3T0i
HcNYhcEZQ6wcOsHFTQ0AvaKz3Dvk+USf6zijj/HPcYjXIMHA5zuq3YtwphVuL2/m
+OQhKbDpxDEc7MckzDz4rn08XBqNzRusH3eOuT1ASMivxsY0hOzWyw+1I0AyHaoQ
rluuDGCMT/zfkRRG4S4V+9KXiT38RAGZT9X9KZqHExudnG108kQ=
=Y84z
-----END PGP SIGNATURE-----

--Apple-Mail=_1EFE8244-1147-4A1C-ABF0-BB0DFD85401A--

