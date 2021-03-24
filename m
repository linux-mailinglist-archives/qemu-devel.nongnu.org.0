Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803B2347337
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:12:43 +0100 (CET)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOyd8-0000dF-3p
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lOybc-00005f-TP
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:11:08 -0400
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:59726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lOybZ-00035z-86
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:11:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 58254255DB0;
 Wed, 24 Mar 2021 09:11:01 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 24 Mar
 2021 09:11:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00218faf0fb-6c6b-4281-8891-29b03bcc6bcf,
 A3683C8426EAFB0D53556ADBC9F5B6912A1CF25D) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 24 Mar 2021 09:10:59 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: Crashes with qemu-system-ppc64
Message-ID: <20210324091059.1f4706a9@bahia.lan>
In-Reply-To: <72f4839a-2a0d-f73b-bbde-8cad398dbbc9@amsat.org>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
 <20210324000056.349b6782@bahia.lan>
 <72f4839a-2a0d-f73b-bbde-8cad398dbbc9@amsat.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0b8eb247-a68e-4a38-af77-a871486c9754
X-Ovh-Tracer-Id: 17587963923298097513
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegjedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Mar 2021 00:35:05 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> On 3/24/21 12:00 AM, Greg Kurz wrote:
> > Cc'ing David
> >=20
> > On Tue, 23 Mar 2021 17:48:36 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >=20
> >>
> >> In case anyone is interested in fixing those, there are two regression=
s with=20
> >> qemu-system-ppc64 in the current master branch:
> >>
> >> $ ./qemu-system-ppc64 -M ppce500 -device macio-oldworld
> >> qemu-system-ppc64: ../../devel/qemu/softmmu/memory.c:2443:=20
> >> memory_region_add_subregion_common: Assertion `!subregion->container' =
failed.
> >>
> >> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> >> /home/thuth/devel/qemu/include/hw/boards.h:24:MACHINE: Object 0x5635bd=
53af10=20
> >> is not an instance of type machine
> >> Aborted (core dumped)
> >>
> >=20
> > I've bisected this one to:
> >=20
> > 3df261b6676b5850e93d6fab3f7a98f8ee8f19c5 is the first bad commit
> > commit 3df261b6676b5850e93d6fab3f7a98f8ee8f19c5
> > Author: Peter Maydell <peter.maydell@linaro.org>
> > Date:   Fri Mar 13 17:24:47 2020 +0000
> >=20
> >     softmmu/vl.c: Handle '-cpu help' and '-device help' before 'no defa=
ult machine'
> >    =20
> >     Currently if you try to ask for the list of CPUs for a target
> >     architecture which does not specify a default machine type
> >     you just get an error:
> >    =20
> >       $ qemu-system-arm -cpu help
> >       qemu-system-arm: No machine specified, and there is no default
> >       Use -machine help to list supported machines
> >    =20
> >     Since the list of CPUs doesn't depend on the machine, this is
> >     unnecessarily unhelpful. "-device help" has a similar problem.
> >    =20
> >     Move the checks for "did the user ask for -cpu help or -device help"
> >     up so they precede the select_machine() call which checks that the
> >     user specified a valid machine type.
> >    =20
> >     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >=20
> >  softmmu/vl.c | 26 ++++++++++++++++----------
> >  1 file changed, 16 insertions(+), 10 deletions(-)
> > bisect run success
> >=20
> > This change is fine but it unveils a bad assumption.
> >=20
> > 0  0x00007ffff64a3708 in raise () at /lib64/power9/libc.so.6
> > #1  0x00007ffff6483bcc in abort () at /lib64/power9/libc.so.6
> > #2  0x00000001008db940 in object_dynamic_cast_assert
> >     (obj=3D0x10126f670, typename=3D0x100c20380 "machine", file=3D0x100b=
34878 "/home/greg/Work/qemu/qemu-ppc/include/hw/boards.h", line=3D<optimize=
d out>, func=3D0x100bcd320 <__func__.30338> "MACHINE") at ../../qom/object.=
c:883
> > #3  0x0000000100456e00 in MACHINE (obj=3D<optimized out>) at /home/greg=
/Work/qemu/qemu-ppc/include/hw/boards.h:24
> > #4  0x0000000100456e00 in cpu_core_instance_init (obj=3D0x10118e2c0) at=
 ../../hw/cpu/core.c:69
> > #5  0x00000001008d9f44 in object_init_with_type (obj=3Dobj@entry=3D0x10=
118e2c0, ti=3D0x1011fd470) at ../../qom/object.c:375
> > #6  0x00000001008d9f24 in object_init_with_type (obj=3Dobj@entry=3D0x10=
118e2c0, ti=3D0x101211ad0) at ../../qom/object.c:371
> > #7  0x00000001008d9f24 in object_init_with_type (obj=3Dobj@entry=3D0x10=
118e2c0, ti=3Dti@entry=3D0x101212760) at ../../qom/object.c:371
> > #8  0x00000001008dc474 in object_initialize_with_type (obj=3Dobj@entry=
=3D0x10118e2c0, size=3Dsize@entry=3D160, type=3Dtype@entry=3D0x101212760) a=
t ../../qom/object.c:517
> > #9  0x00000001008dc678 in object_new_with_type (type=3D0x101212760) at =
../../qom/object.c:732
> > #10 0x00000001009fbad8 in qmp_device_list_properties (typename=3D<optim=
ized out>, errp=3D<optimized out>) at ../../qom/qom-qmp-cmds.c:146
> > #11 0x00000001005a4bf0 in qdev_device_help (opts=3D0x10126c200) at ../.=
./softmmu/qdev-monitor.c:285
> > #12 0x0000000100760afc in device_help_func (opaque=3D<optimized out>, o=
pts=3D<optimized out>, errp=3D<optimized out>) at ../../softmmu/vl.c:1204
> > #13 0x0000000100ad1050 in qemu_opts_foreach (list=3D<optimized out>, fu=
nc=3D0x100760ae0 <device_help_func>, opaque=3D0x0, errp=3D0x0) at ../../uti=
l/qemu-option.c:1167
> > #14 0x00000001007653cc in qemu_process_help_options () at ../../softmmu=
/vl.c:2451
> > #15 0x00000001007653cc in qemu_init (argc=3D<optimized out>, argv=3D<op=
timized out>, envp=3D<optimized out>) at ../../softmmu/vl.c:3521
> > #16 0x00000001002f4f88 in main (argc=3D<optimized out>, argv=3D<optimiz=
ed out>, envp=3D<optimized out>) at ../../softmmu/main.c:49
> >=20
> > Basically, "-device power8_v2.0-spapr-cpu-core,help" ends up
> > instantiating an object of the "power8_v2.0-spapr-cpu-core" type,
> > which derives from "cpu-core". The "cpu-core" type has an instance
> > init function that assumes that qdev_get_machine() returns an object
> > of type "machine"...
> >=20
> > static void cpu_core_instance_init(Object *obj)
> > {
> >     MachineState *ms =3D MACHINE(qdev_get_machine());
> >                          ^^
> >                      ...here.
> >=20
> > qdev_get_machine() cannot return a valid machine type since
> > select_machine() hasn't been called yet... an instance init
> > function is probably not the best place to use qdev_get_machine()
> > if any.
>=20
> Hmmm does this assert() matches your comment?
>=20
> -- >8 --
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a9..41cbee77d14 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1130,6 +1130,8 @@ Object *qdev_get_machine(void)
>  {
>      static Object *dev;
>=20
> +    assert(phase_check(PHASE_MACHINE_CREATED));
> +


Heh... I didn't know about phase_check() but it could make sense
to prevent early misuse of qdev_get_machine() indeed.

>      if (dev =3D=3D NULL) {
>          dev =3D container_get(object_get_root(), "/machine");
>      }
> ---
>=20
> >=20
> >     CPUCore *core =3D CPU_CORE(obj);
> >=20
> >     core->nr_threads =3D ms->smp.threads;
> > }
> >=20
> > It seems that this should rather sit in a device realize function,
> > when the machine type is known.
> >=20

Or maybe leave everything in the instance init function but rely
on current_machine instead of qdev_get_machine(), i.e. something
like:

static void cpu_core_instance_init(Object *obj)
{
    MachineState *ms =3D current_machine;
    CPUCore *core =3D CPU_CORE(obj);

    /*
     * This can be called with "-device some_cpu_core,help" before the
     * machine has been created.
     */
    if (!ms) {
        core->nr_threads =3D 1;
        return;
    }

    core->nr_threads =3D ms->smp.threads;
}

> >>   Thomas
> >>
> >>
> >=20
> >=20
>=20


