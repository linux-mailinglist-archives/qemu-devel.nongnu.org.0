Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BCA1755DD
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 09:21:11 +0100 (CET)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8gK6-0003rd-5B
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 03:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j8gJG-0003N8-4I
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 03:20:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j8gJE-0000nY-IN
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 03:20:17 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49653
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j8gJE-0000n0-Ef
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 03:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583137215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2R35AImrW2UvF6uJXCQkE5KOWASWii47qvCR4sj9qIU=;
 b=bboxr23G8SNDnJg0INSEfS0dBoLwhfna/Vou3GlQf2qqjc79MPESVv5L7vCA11+ThAweWk
 0UuudVlKRMpMQ7LeUrK2Y53dLG9lTinz/vleBwK4boabWX7MxzgfgOhswDeqa57S8ZENl5
 4ic6boEKFOAX5ppU5N0bnHf1QSGkV7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-fNRJmKuEPciWV5KFZ4oKLg-1; Mon, 02 Mar 2020 03:20:14 -0500
X-MC-Unique: fNRJmKuEPciWV5KFZ4oKLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AD951084420;
 Mon,  2 Mar 2020 08:20:13 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC4ED92D24;
 Mon,  2 Mar 2020 08:20:07 +0000 (UTC)
Date: Mon, 2 Mar 2020 09:20:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH] hw/smbios: add options for type 4 max_speed and
 current_speed
Message-ID: <20200302092005.14ad6033@redhat.com>
In-Reply-To: <6ee4aed5-211a-e290-9252-f02420e19f34@huawei.com>
References: <20200225075046.30151-1-guoheyi@huawei.com>
 <4bd58f6e-e522-d920-bc9a-8198147e8856@redhat.com>
 <6e6c6c8b-c67c-6433-2bb8-d246c5f49b62@huawei.com>
 <20200228103950.6fd7ecb5@redhat.com>
 <6ee4aed5-211a-e290-9252-f02420e19f34@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: wanghaibin.wang@huawei.com,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 29 Feb 2020 08:17:48 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> Hi Igor,
>=20
> On 2020/2/28 17:39, Igor Mammedov wrote:
> > On Thu, 27 Feb 2020 17:12:21 +0800
> > Heyi Guo <guoheyi@huawei.com> wrote:
> > =20
> >> On 2020/2/25 17:24, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >>> On 2/25/20 8:50 AM, Heyi Guo wrote: =20
> >>>> Common VM users sometimes care about CPU speed, so we add two new
> >>>> options to allow VM vendors to present CPU speed to their users.
> >>>> Normally these information can be fetched from host smbios.
> >>>>
> >>>> Strictly speaking, the "max speed" and "current speed" in type 4
> >>>> are not really for the max speed and current speed of processor, for
> >>>> "max speed" identifies a capability of the system, and "current spee=
d"
> >>>> identifies the processor's speed at boot (see smbios spec), but some
> >>>> applications do not tell the differences.
> >>>>
> >>>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> >>>>
> >>>> ---
> >>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >>>> Cc: Igor Mammedov <imammedo@redhat.com>
> >>>> ---
> >>>>  =C2=A0 hw/smbios/smbios.c | 22 +++++++++++++++++++---
> >>>>  =C2=A0 qemu-options.hx=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> >>>>  =C2=A0 2 files changed, 21 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> >>>> index ffd98727ee..1d5439643d 100644
> >>>> --- a/hw/smbios/smbios.c
> >>>> +++ b/hw/smbios/smbios.c
> >>>> @@ -94,6 +94,8 @@ static struct {
> >>>>  =C2=A0 =C2=A0 static struct {
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *sock_pfx, *manufacturer,=
 *version, *serial, *asset,
> >>>> *part;
> >>>> +=C2=A0=C2=A0=C2=A0 uint32_t max_speed;
> >>>> +=C2=A0=C2=A0=C2=A0 uint32_t current_speed;
> >>>>  =C2=A0 } type4;
> >>>>  =C2=A0 =C2=A0 static struct {
> >>>> @@ -272,6 +274,14 @@ static const QemuOptDesc
> >>>> qemu_smbios_type4_opts[] =3D {
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "v=
ersion",
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D QE=
MU_OPT_STRING,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .help =3D "v=
ersion number",
> >>>> +=C2=A0=C2=A0=C2=A0 },{
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "max_speed", =
=20
> > I'd suggest to use - instead of _ in option name =20
>=20
> Thanks for your comments. However I can see other options like=20
> "sock_pfx" and "loc_pfx" also use "_" in option names. Should we keep=20
> consistent with the context?

For new options one should use '-',
that way we won't have to build wrappers around it if it becomes
a qom property in the future.

>=20
> Thanks,
>=20
> Heyi
>=20
>=20
> > =20
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D QEMU_OPT_NUMBE=
R,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .help =3D "max speed in =
MHz",
> >>>> +=C2=A0=C2=A0=C2=A0 },{
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "current_speed=
", =20
> > ditto
> > =20
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D QEMU_OPT_NUMBE=
R,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .help =3D "speed at syst=
em boot in MHz",
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },{
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "s=
erial",
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D QE=
MU_OPT_STRING,
> >>>> @@ -586,9 +596,8 @@ static void
> >>>> smbios_build_type_4_table(MachineState *ms, unsigned instance)
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SMBIOS_TABLE_SET_STR(4, processor_ve=
rsion_str, type4.version);
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t->voltage =3D 0;
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t->external_clock =3D cpu_to_le16(0)=
; /* Unknown */
> >>>> -=C2=A0=C2=A0=C2=A0 /* SVVP requires max_speed and current_speed to =
not be unknown. */
> >>>> -=C2=A0=C2=A0=C2=A0 t->max_speed =3D cpu_to_le16(2000); /* 2000 MHz =
*/
> >>>> -=C2=A0=C2=A0=C2=A0 t->current_speed =3D cpu_to_le16(2000); /* 2000 =
MHz */
> >>>> +=C2=A0=C2=A0=C2=A0 t->max_speed =3D cpu_to_le16(type4.max_speed);
> >>>> +=C2=A0=C2=A0=C2=A0 t->current_speed =3D cpu_to_le16(type4.current_s=
peed);
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t->status =3D 0x41; /* Socket popula=
ted, CPU enabled */
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t->processor_upgrade =3D 0x01; /* Ot=
her */
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t->l1_cache_handle =3D cpu_to_le16(0=
xFFFF); /* N/A */
> >>>> @@ -1129,6 +1138,13 @@ void smbios_entry_add(QemuOpts *opts, Error
> >>>> **errp)
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 save_opt(&type4.serial, opts, "serial");
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 save_opt(&type4.asset, opts, "asset");
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 save_opt(&type4.part, opts, "part");
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/*
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * SVVP requires max_speed and current_speed to not be
> >>>> unknown, and
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * we set the default value to 2000MHz as we did before.
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 */
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
type4.max_speed =3D qemu_opt_get_number(opts, "max_speed",
> >>>> 2000);
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
type4.current_speed =3D qemu_opt_get_number(opts,
> >>>> "current_speed",
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 2000); =20
> >>> Maybe check speeds are <=3D UINT16_MAX else set errp? =20
> >> OK; I can do that in the v2. But I would wait for the maintainers to
> >> provide more comments :)
> >>
> >> Thanks,
> >>
> >> Heyi
> >> =20
> >>>    =20
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return;
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 11:
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 qemu_opts_validate(opts, qemu_smbios_type11_opts, &err);
> >>>> diff --git a/qemu-options.hx b/qemu-options.hx
> >>>> index ac315c1ac4..bc9ef0fda8 100644
> >>>> --- a/qemu-options.hx
> >>>> +++ b/qemu-options.hx
> >>>> @@ -2233,6 +2233,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specify SMBIOS ty=
pe 3 fields\n"
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-smbios
> >>>> type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Dstr][,seri=
al=3Dstr]\n"
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [,asset=3Dstr][,part=3Dstr]\n=
"
> >>>> +=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [,max_speed=3D%d][,current_speed=3D%d]\n"
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specify SMBIOS ty=
pe 4 fields\n"
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-smbios
> >>>> type=3D17[,loc_pfx=3Dstr][,bank=3Dstr][,manufacturer=3Dstr][,serial=
=3Dstr]\n"
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [,asset=3Dstr][,part=3D=
str][,speed=3D%d]\n"
> >>>> @@ -2255,7 +2256,7 @@ Specify SMBIOS type 2 fields
> >>>>  =C2=A0 @item -smbios
> >>>> type=3D3[,manufacturer=3D@var{str}][,version=3D@var{str}][,serial=3D=
@var{str}][,asset=3D@var{str}][,sku=3D@var{str}]
> >>>>  =C2=A0 Specify SMBIOS type 3 fields
> >>>>  =C2=A0 -@item -smbios
> >>>> type=3D4[,sock_pfx=3D@var{str}][,manufacturer=3D@var{str}][,version=
=3D@var{str}][,serial=3D@var{str}][,asset=3D@var{str}][,part=3D@var{str}]
> >>>> +@item -smbios
> >>>> type=3D4[,sock_pfx=3D@var{str}][,manufacturer=3D@var{str}][,version=
=3D@var{str}][,serial=3D@var{str}][,asset=3D@var{str}][,part=3D@var{str}][,=
max_speed=3D@var{%d}][,current_speed=3D@var{%d}]
> >>>>  =C2=A0 Specify SMBIOS type 4 fields
> >>>>  =C2=A0 =C2=A0 @item -smbios
> >>>> type=3D17[,loc_pfx=3D@var{str}][,bank=3D@var{str}][,manufacturer=3D@=
var{str}][,serial=3D@var{str}][,asset=3D@var{str}][,part=3D@var{str}][,spee=
d=3D@var{%d}]
> >>>>    =20
> >>>
> >>> . =20
> >
> > . =20
>=20
>=20


