Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91902975EC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 19:42:02 +0200 (CEST)
Received: from localhost ([::1]:47296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW14j-0003IN-NK
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 13:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW12J-0001g2-L6
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 13:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW12G-000286-O2
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 13:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603474766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5szQ9pVeUPzMu8KMWHYrzq0vMDFI59xBrpNUp4nvIM=;
 b=Fgxq8dN4P1z4CCT5ngv7F1DMnJ7cCI9OEt6FJxZQlVMroSW2o3phjZjqOX2lkPOVVQKo5w
 x8ix9AxiTSIlVZFdDu12HVavRyabCjKag30LQq+9bOIAGJ9KVIRbdg6u4wYQbhQuqq9PSf
 iBeESubqUrRAE1KotAsGRLTQhgFHB/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-72gFNjkuMtGnqo9EECmpBg-1; Fri, 23 Oct 2020 13:39:18 -0400
X-MC-Unique: 72gFNjkuMtGnqo9EECmpBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5A23804B71;
 Fri, 23 Oct 2020 17:39:16 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 857C35D9CC;
 Fri, 23 Oct 2020 17:39:14 +0000 (UTC)
Date: Fri, 23 Oct 2020 19:39:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 8/9] hw/arm/raspi: Add the Raspberry Pi Zero machine
Message-ID: <20201023193913.3a01f99e@redhat.com>
In-Reply-To: <af02ebea-0aeb-9e6a-5f79-95aeb10b1bb4@amsat.org>
References: <20201018203358.1530378-1-f4bug@amsat.org>
 <20201018203358.1530378-9-f4bug@amsat.org>
 <20201023175130.50a379bd@redhat.com>
 <af02ebea-0aeb-9e6a-5f79-95aeb10b1bb4@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Oct 2020 19:35:19 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Hi Igor,
>=20
> On 10/23/20 5:51 PM, Igor Mammedov wrote:
> > On Sun, 18 Oct 2020 22:33:57 +0200
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >  =20
> >> Similarly to the Pi A, the Pi Zero uses a BCM2835 SoC (ARMv6Z core).
> >>
> >> Example booting the machine using content from [*]:
> >>
> >>    $ qemu-system-arm -M raspi0 -serial stdio \
> >>        -kernel raspberrypi/firmware/boot/kernel.img \
> >>        -dtb raspberrypi/firmware/boot/bcm2708-rpi-zero.dtb \
> >>        -append 'printk.time=3D0 earlycon=3Dpl011,0x20201000 console=3D=
ttyAMA0'
> >>    [    0.000000] Booting Linux on physical CPU 0x0
> >>    [    0.000000] Linux version 4.19.118+ (dom@buildbot) (gcc version =
4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1311 Mon Apr 27 14:1=
6:15 BST 2020
> >>    [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision =
7 (ARMv7), cr=3D00c5387d
> >>    [    0.000000] CPU: VIPT aliasing data cache, unknown instruction c=
ache
> >>    [    0.000000] OF: fdt: Machine model: Raspberry Pi Zero
> >>    ...
> >>
> >> [*] http://archive.raspberrypi.org/debian/pool/main/r/raspberrypi-firm=
ware/raspberrypi-kernel_1.20200512-2_armhf.deb
> >>
> >> Reviewed-by: Luc Michel <luc.michel@greensocs.com>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>   hw/arm/raspi.c | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> >> index 91a59d1d489..1510ca01afe 100644
> >> --- a/hw/arm/raspi.c
> >> +++ b/hw/arm/raspi.c
> >> @@ -319,6 +319,15 @@ static void raspi_machine_class_common_init(Machi=
neClass *mc,
> >>       mc->default_ram_id =3D "ram";
> >>   };
> >>  =20
> >> +static void raspi0_machine_class_init(ObjectClass *oc, void *data)
> >> +{
> >> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> >> +
> >> +    rmc->board_rev =3D 0x900092; =20
> >=20
> > shouldn't it be
> > 920092=09Zero=091.2=09512MB=09Embest
> > or
> > 920093  Zero=091.3=09512MB=09Embest =20
>=20
> I took the value from the "New-style revision codes"
> table listed in hw/arm/raspi.c before the REV_CODE
> register definitions:
>=20
> https://www.raspberrypi.org/documentation/hardware/raspberrypi/revision-c=
odes/README.md
>=20
> 90009x's manufacturer is "Sony UK", 92009x is "Embest".
> I guess we don't care much the manufacturer :)
>=20
> The Revision 1.3 exposed the MIPI camera interface.
> As we don't model it, I prefer to use the 1.2 revision
> which matches better.
>=20
> I'll add this information in the commit description.

With that
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

>=20
> Thanks for reviewing!
>=20
> >  =20
> >> +    raspi_machine_class_common_init(mc, rmc->board_rev);
> >> +};
> >> +
> >>   static void raspi1ap_machine_class_init(ObjectClass *oc, void *data)
> >>   {
> >>       MachineClass *mc =3D MACHINE_CLASS(oc);
> >> @@ -352,6 +361,10 @@ static void raspi3b_machine_class_init(ObjectClas=
s *oc, void *data)
> >>  =20
> >>   static const TypeInfo raspi_machine_types[] =3D {
> >>       {
> >> +        .name           =3D MACHINE_TYPE_NAME("raspi0"),
> >> +        .parent         =3D TYPE_RASPI_MACHINE,
> >> +        .class_init     =3D raspi0_machine_class_init,
> >> +    }, {
> >>           .name           =3D MACHINE_TYPE_NAME("raspi1ap"),
> >>           .parent         =3D TYPE_RASPI_MACHINE,
> >>           .class_init     =3D raspi1ap_machine_class_init, =20
> >=20
> >  =20
>=20


