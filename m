Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050594975E9
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 23:13:34 +0100 (CET)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBl77-00037U-5Z
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 17:13:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nBl6K-0002Hz-0g; Sun, 23 Jan 2022 17:12:44 -0500
Received: from mail.ispras.ru ([83.149.199.84]:47484)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cheptsov@ispras.ru>)
 id 1nBl6H-0007cZ-Cu; Sun, 23 Jan 2022 17:12:43 -0500
Received: from smtpclient.apple (unknown [77.37.166.174])
 by mail.ispras.ru (Postfix) with ESMTPSA id D793B40755E6;
 Sun, 23 Jan 2022 22:12:29 +0000 (UTC)
Content-Type: multipart/signed;
 boundary="Apple-Mail=_33FB2333-7464-4736-9315-D792E47C8A70";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] target/ppc/mmu_common: Fix SRR1/MSR error code on Book-E
From: Vitaly Cheptsov <cheptsov@ispras.ru>
In-Reply-To: <c51426a6-d655-0ba1-2ea9-3d84070520ed@kaod.org>
Date: Mon, 24 Jan 2022 01:12:29 +0300
Message-Id: <82D3B97F-8356-4C6B-AB08-91C18F7EEB6A@ispras.ru>
References: <BE5775C6-A54F-4443-9752-DBB6587E1F46@ispras.ru>
 <9717e63d-b72a-81f6-e9b9-052294f560f1@kaod.org>
 <979A28AD-F229-498E-89CD-1D475EC6C94E@ispras.ru>
 <c51426a6-d655-0ba1-2ea9-3d84070520ed@kaod.org>
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


--Apple-Mail=_33FB2333-7464-4736-9315-D792E47C8A70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi C=C3=A9dric,

> and the default ppce500 machine has enough devices for the purpose ?

We cannot test much without a predictable timer emulation on QEMU, =
sometimes we have fairly random freezes, but otherwise the basics work =
ok. I will let you know in case we find something more or less =
reproducible.

Best,
Vitaly

> On 21 Jan 2022, at 20:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
> Hello Vitaly,
>=20
> On 1/21/22 10:33, Vitaly Cheptsov wrote:
>> Hi C=C3=A9dric,
>>> This looks correct and even fixing an issue that Mario reported
>>> on the TCG e6500 CPU with a kernel + KVM compiled in :
>>>=20
>>>  =
https://lore.kernel.org/all/R5JFVM$911E343FF81933B99D53FD0992D8848F@locati=
.it/
>>>=20
>>> KVM has some issues also with the e6500 but that's another problem
>>> I think.
>> Glad to hear that. Could you schedule the inclusion of the patch in =
6.2.1 or 6.3 please?
>=20
> 7.0 it should be.
>=20
>>> What is your environment ? Which QEMU machine ? Can you provide a
>>> command line ?
>> We have an in-house RTOS at ISP RAS, which we use to run some =
environmental tests on QEMU.
>=20
> not a Linux. Diversity is good for the models.
>=20
>> The target hardware in this particular example is a QorIQ P3041-based =
board.
>=20
> and the default ppce500 machine has enough devices for the purpose ?
>=20
> Thanks,
>=20
> C.
>=20
>> The command line approximately looks like this:
>> qemu-system-ppc -cpu e500mc -M ppce500 -m 128M -icount 1 -kernel =
/path/to/kernel.elf -serial tcp::1111,server,nodelay
>>> Could you please resend the patch in a non attached way ?  See :
>>>=20
>>>  https://www.qemu.org/docs/master/devel/submitting-a-patch.html
>>>=20
>>> and copy qemu-devel.
>> Yes, sure. Have just done that.
>> Best regards,
>> Vitaly
>>> On 21 Jan 2022, at 11:17, C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>>>=20
>>> Hello Vitaly
>>>=20
>>> On 1/21/22 01:02, Vitaly Cheptsov wrote:
>>>> Hello,
>>>> PowerPC e500mc defines MSR bit 35 differently from most other =
PowerPC variants. In particular, for e500mc this is GS (Guest =
Supervisor) bit[1], while for others it is NOEXEC GUARD bit[2].
>>>> QEMU ignores this architectural difference when handling the =
exceptions of attempting to run not executable code on e500mc, and =
mistakenly sets the GS bit[3][4].
>>>> Setting this bit eventually leads to crashes, because although QEMU =
does not support Guest Supervisor mode on e500mc, it still requires it =
to be disabled[5].
>>>=20
>>> This looks correct and even fixing an issue that Mario reported
>>> on the TCG e6500 CPU with a kernel + KVM compiled in :
>>>=20
>>>  =
https://lore.kernel.org/all/R5JFVM$911E343FF81933B99D53FD0992D8848F@locati=
.it/
>>>=20
>>> KVM has some issues also with the e6500 but that's another problem
>>> I think.
>>>=20
>>>=20
>>> What is your environment ? Which QEMU machine ? Can you provide a
>>> command line ?
>>>=20
>>> Could you please resend the patch in a non attached way ?  See :
>>>=20
>>>  https://www.qemu.org/docs/master/devel/submitting-a-patch.html
>>>=20
>>> and copy qemu-devel.
>>>=20
>>> Thanks,
>>>=20
>>> C.
>>>=20
>>>=20
>>>> Best regards,
>>>> Vitaly
>>>> [1] https://www.nxp.com/docs/en/reference-manual/E500MCRM.pdf, =
2.7.1 MSR
>>>> [2] =
https://openpowerfoundation.org/?resource_lib=3Dpower-isa-version-3-0, =
6.5.5 Instruction Storage Interrupt
>>>> [3] =
https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/mmu_common.c#L1426
>>>> [4] =
https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/excp_helper.c#L414-L41=
6
>>>> [5] =
https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/mmu_helper.c#L1078-L10=
80
>>>=20
>=20


--Apple-Mail=_33FB2333-7464-4736-9315-D792E47C8A70
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEsLABAI5Y5VbvBdmpL8K2O86Eyz4FAmHt0s0ACgkQL8K2O86E
yz7gNhAAixolP6iTrG2QwiAZXTmYtUggj6jE/8cv60nClIvRqMD+VcsqMZYw8g3X
E9lfHfDq9bKk1znh/gwgOU9xzi+p7EbYzPtuKAAXb5+0mokxs21+IOBLQTTlXkVb
fUk8cwr0ezliyN7GVbge2Z8s2DhPJz12CLW43afpTV+xN6iXypO6oZw6YUQ+7wQM
ldLGFwqO/TpSr+P+PFk7HqB78Uu24/WbISkC5ouIKe8DpIaou7GpeAiVWUtasdXP
en/Qg/lz10Ff729laxvk1iVIrC8ulKMkfow5qHzHhgrJ6epe+eUfOy3uviyoUkJf
E4ZTeMFejgeH6fRiZUhAbqNgWyRke3ESWNTX0yPRCBPQQmQpJ0TA/uvX4kABEvao
tMAcP01LeZXaF7chinawuecN5yZaKe3rXPwyt8K0QSrDCuRkVCC6lx34/Sgrp2Dj
JmMeyle5/2tdyDjiqALn+9IvAYkBLVbnXs2486NCo28QltdFquFm4FB8ieEsXy6t
+J2NPna3ZCQrNaEH1ZK6YlhGdlcp3rZ/CkWDFwVkHhCFA4gqB45kdNHROfxcNNyF
n08PzKfCj4fsHJrh0qgTOuKTfI/kXSYZVcmQQ0V6kqTcGKy3ZOVvAtXmiVhpWn63
UTQJ05gnrWS9i4Q0ZvxuZjqMshv95nyTvKXzLfR8/GDWrJVvRVw=
=p5TU
-----END PGP SIGNATURE-----

--Apple-Mail=_33FB2333-7464-4736-9315-D792E47C8A70--

