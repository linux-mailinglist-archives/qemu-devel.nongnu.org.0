Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F7116B8D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 11:56:08 +0100 (CET)
Received: from localhost ([::1]:38430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieGhz-0000hI-0L
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 05:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ieGh7-00009S-64
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 05:55:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ieGh4-0001ro-Ql
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 05:55:12 -0500
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:50571)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ieGh4-0001ip-KE
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 05:55:10 -0500
Received: from player795.ha.ovh.net (unknown [10.108.54.13])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id BB70021ACCC
 for <qemu-devel@nongnu.org>; Mon,  9 Dec 2019 11:55:07 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 8DD32CDD57A5;
 Mon,  9 Dec 2019 10:55:05 +0000 (UTC)
Date: Mon, 9 Dec 2019 11:55:03 +0100
From: Greg Kurz <groug@kaod.org>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/core: Fix data type in do_nmi()
Message-ID: <20191209115503.6b7bcf59@bahia.w3ibm.bluemix.net>
In-Reply-To: <d4d6efdd-62d4-c5e5-adff-999caca8fe7b@redhat.com>
References: <20191206063642.40942-1-gshan@redhat.com>
 <20191206175031.66f62929@bahia.w3ibm.bluemix.net>
 <8b4e97d1-eddb-b7d2-1069-453ec4a4263a@redhat.com>
 <20191209093645.091c9e4b@bahia.w3ibm.bluemix.net>
 <d4d6efdd-62d4-c5e5-adff-999caca8fe7b@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 2885399988850563478
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.57.129
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Dec 2019 20:12:09 +1100
Gavin Shan <gshan@redhat.com> wrote:

> On 12/9/19 7:36 PM, Greg Kurz wrote:
> > On Sun, 8 Dec 2019 00:14:00 +1100
> > Gavin Shan <gshan@redhat.com> wrote:
> >=20
> >> On 12/7/19 3:50 AM, Greg Kurz wrote:
> >>> On Fri,  6 Dec 2019 17:36:42 +1100
> >>> Gavin Shan <gshan@redhat.com> wrote:
> >>>
> >>>> object_dynamic_cast() should return machine (or GPIO) state instad o=
f NMI
> >>>> state in do_nmi(). So it's wrong to convert it to NMI state uncondit=
ionally.
> >>>>
> >>>
> >>> object_dynamic_cast() returns either its first argument if it can be =
cast
> >>> to the given typename or NULL. Since the x86, ccw and spapr machines =
and
> >>> the PowerMac GPIO implement the NMI interface, nothing is wrong here.
> >>>
> >>> The do_nmi() function is called for all objects in the QOM tree and s=
imply
> >>> filters out the ones that don't implement the NMI interface.
> >>>
> >>> I do agree that this isn't super obvious though. It would be clearer =
to
> >>> do the filtering in the foreach() function. Something like:
> >>>
> >>> https://patchwork.ozlabs.org/patch/1182232/
> >>>
> >>
> >> Greg, Thanks for the review and comments. I think we're talking about
> >> different issues. I do agree it's worthy to simplify the code with the
> >> object_child_foreach_type(), but later.
> >>
> >> When we have below parameters to qemu, object_dynamic_cast(o, TYPE_NMI)
> >> returns object of "pc-q35-4.2-machine", which is passed to the subquent
> >> NMIClass::nmi_monitor_handler(). However, the function expects a NMISt=
ate
> >> from its prototype as below. This patch changes the prototype to fill =
the
> >> gap.
> >>
> >>      void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **e=
rrp);
> >>
> >=20
> > Hmm... the "pc-q35-4.2-machine" type inherits from the TYPE_PC_MACHINE,
> > which in turns inherits from TYPE_X86_MACHINE, which implements the
> > TYPE_NMI interface. It thus seems okay to pass this object to x86_nmi().
> >=20
> > What are you trying to fix here ?
> >=20
>=20
> There is no valid instance associated with interface class. For this spec=
ific
> case, there is no NMIState instance. I don't understand how we can pass a
> valid NMIState to the function.

Ah I get it. Please read the include/qom/object.h to understand what QOM
interfaces are about. Especially this paragraph:

 * # Interfaces #
 *
 * Interfaces allow a limited form of multiple inheritance.  Instances are
 * similar to normal types except for the fact that are only defined by
 * their classes and never carry any state.  You can dynamically cast an ob=
ject
 * to one of its #Interface types and vice versa.

> Furthermore, below code returns "pc-q35-4.2-machine"
> object instead of NMIState. It's not safe to do the forced conversion her=
e.
>=20
>     /* It returns "pc-q35-4.2-machine" instance */
>     NMIState *n =3D (NMIState *) object_dynamic_cast(o, TYPE_NMI);
>       :
>     nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err);

As explained in my previous mail, this _forced conversion_ is the current
way to implement object_child_foreach_type(). It is ugly and confusing for
newcomers but it is safe since the pointer is either TYPE_NMI or NULL, in
which case the handler isn't called.

>=20
>=20
> If "struct NMIState" is declared and the data struct is written in the fu=
nction.
> We will run into data corruption if I'm correct.
>=20

The 'struct NMIState' isn't defined on purpose, but I agree this isn't docu=
mented
anywhere except in this changelog:

commit 00ed3da9b5c2e66e796a172df3e19545462b9c90
Author: David Gibson <david@gibson.dropbear.id.au>
Date:   Tue Sep 24 16:00:33 2019 +1000

    xics: Minor fixes for XICSFabric interface
   =20
    Interface instances should never be directly dereferenced.  So, the com=
mon
    practice is to make them incomplete types to make sure no-one does that.
    XICSFrabric, however, had a dummy type which is less safe.
   =20
    We were also using OBJECT_CHECK() where we should have been using
    INTERFACE_CHECK().
   =20
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
    Reviewed-by: Greg Kurz <groug@kaod.org>
    Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Maybe the NMIState naming was a poor choice since there's no associated
state with QOM interfaces. But we do want to keep a typedef though: it
is more precise and hence safer to pass an NMIState * than an Object *.

> I'm pasting the message I had. Hope this helps for understanding the issu=
e:
>=20
> --- a/hw/core/nmi.c
> +++ b/hw/core/nmi.c
> @@ -42,6 +42,10 @@ static int do_nmi(Object *o, void *opaque)
>       if (n) {
>           NMIClass *nc =3D NMI_GET_CLASS(n);
>  =20
> +       fprintf(stdout, "%s: o=3D%s, n=3D%s\n",
> +                __func__, object_get_typename(OBJECT(o)),
> +                object_get_typename(OBJECT(n)));
> +
>=20

object_get_typename() returns the type of the instance, which is either
a machine or a GPIO in the current code base. This is different from
object_dynamic_cast() which just tells if a given object can be cast
to a give type (either regular QOM type or QOM interface).

It is up to the various NMIClass::nmi_monitor_handler() to make sure
they're being passed the right object.

macio_gpio_nmi() explicitly does that with MACIO_GPIO(n). The other
ones only need to access the CPU state and end up checking it is
valid: s390_nmi() checks S390_CPU(cs), x86_nmi() checks X86_CPU(cs)
and

spapr_nmi()
 ->async_run_on_cpu()
   ->spapr_do_system_reset_on_cpu()
     ->ppc_cpu_do_system_reset() checks POWERPC_CPU(cs)

but they could maybe assert(object_dynamic_cast()) as well for
clarity.

>=20
> # QEMU 4.1.93 monitor - type 'help' for more information
> (qemu) nmi
> do_nmi: o=3Dpc-q35-4.2-machine, n=3Dpc-q35-4.2-machine
>=20
>=20
> >>      Changed to:
> >>
> >>      void (*nmi_monitor_handler)(Object *parent, int cpu_index, Error =
**errp);
> >>
> >>      ~/sandbox/src/qemu/qemu.main.x86/x86_64-softmmu/qemu-system-x86_6=
4              \
> >>      --enable-kvm -machine type=3Dq35,accel=3Dkvm,kernel-irqchip=3Don =
-cpu host -smp 2 -m 1G    \
> >>      -monitor none -serial mon:stdio -nographic -s                    =
                    \
> >>      -bios ~/sandbox/src/firmware/seabios/out/bios.bin                =
                    \
> >>      -kernel ~/sandbox/src/linux/linux.main.x86/arch/x86/boot/bzImage =
                    \
> >>      -initrd ~/sandbox/src/util/buildroot/output/images/rootfs.cpio.xz=
                    \
> >>      -append "earlyprintk=3DttyS0 console=3DttyS0 debug"              =
                        \
> >>      -device virtio-net-pci,netdev=3Dunet,mac=3D52:54:00:f1:26:a6     =
                        \
> >>      -netdev user,id=3Dunet,hostfwd=3Dtcp::50959-:22                  =
                        \
> >>      -drive file=3D~/sandbox/images/vm.img,if=3Dnone,format=3Draw,id=
=3Dnvme0                      \
> >>      -device nvme,drive=3Dnvme0,serial=3Dfoo                          =
                        \
> >>      -drive file=3D~/sandbox/images/vm1.img,if=3Dnone,format=3Draw,id=
=3Dnvme1                     \
> >>      -device nvme,drive=3Dnvme1,serial=3Dfoo1
> >>
> >>>> This changes the prototype of NMIClass::nmi_monitor_handler() to acc=
ept
> >>>> the parent object of NMI state instead of itself. With this, he pare=
nt object
> >>>> is passed to the function, to avoid potential data corruption.
> >>>>
> >>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>>> ---
> >>>>    hw/core/nmi.c              | 8 ++++----
> >>>>    hw/i386/x86.c              | 2 +-
> >>>>    hw/misc/macio/gpio.c       | 6 +++---
> >>>>    hw/ppc/spapr.c             | 2 +-
> >>>>    hw/s390x/s390-virtio-ccw.c | 2 +-
> >>>>    include/hw/nmi.h           | 2 +-
> >>>>    6 files changed, 11 insertions(+), 11 deletions(-)
> >>>>
> >>>> diff --git a/hw/core/nmi.c b/hw/core/nmi.c
> >>>> index 481c4b3c7e..554708d0db 100644
> >>>> --- a/hw/core/nmi.c
> >>>> +++ b/hw/core/nmi.c
> >>>> @@ -37,13 +37,13 @@ static void nmi_children(Object *o, struct do_nm=
i_s *ns);
> >>>>    static int do_nmi(Object *o, void *opaque)
> >>>>    {
> >>>>        struct do_nmi_s *ns =3D opaque;
> >>>> -    NMIState *n =3D (NMIState *) object_dynamic_cast(o, TYPE_NMI);
> >>>> +    Object *parent =3D object_dynamic_cast(o, TYPE_NMI);
> >>>>   =20
> >>>> -    if (n) {
> >>>> -        NMIClass *nc =3D NMI_GET_CLASS(n);
> >>>> +    if (parent) {
> >>>> +        NMIClass *nc =3D NMI_GET_CLASS(parent);
> >>>>   =20
> >>>>            ns->handled =3D true;
> >>>> -        nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err);
> >>>> +        nc->nmi_monitor_handler(parent, ns->cpu_index, &ns->err);
> >>>>            if (ns->err) {
> >>>>                return -1;
> >>>>            }
> >>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> >>>> index 394edc2f72..b98204f104 100644
> >>>> --- a/hw/i386/x86.c
> >>>> +++ b/hw/i386/x86.c
> >>>> @@ -190,7 +190,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(M=
achineState *ms)
> >>>>        return ms->possible_cpus;
> >>>>    }
> >>>>   =20
> >>>> -static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
> >>>> +static void x86_nmi(Object *parent, int cpu_index, Error **errp)
> >>>>    {
> >>>>        /* cpu index isn't used */
> >>>>        CPUState *cs;
> >>>> diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
> >>>> index 6cca6b27d6..6b4dfcc188 100644
> >>>> --- a/hw/misc/macio/gpio.c
> >>>> +++ b/hw/misc/macio/gpio.c
> >>>> @@ -196,10 +196,10 @@ static void macio_gpio_reset(DeviceState *dev)
> >>>>        macio_set_gpio(s, 1, true);
> >>>>    }
> >>>>   =20
> >>>> -static void macio_gpio_nmi(NMIState *n, int cpu_index, Error **errp)
> >>>> +static void macio_gpio_nmi(Object *parent, int cpu_index, Error **e=
rrp)
> >>>>    {
> >>>> -    macio_set_gpio(MACIO_GPIO(n), 9, true);
> >>>> -    macio_set_gpio(MACIO_GPIO(n), 9, false);
> >>>> +    macio_set_gpio(MACIO_GPIO(parent), 9, true);
> >>>> +    macio_set_gpio(MACIO_GPIO(parent), 9, false);
> >>>>    }
> >>>>   =20
> >>>>    static void macio_gpio_class_init(ObjectClass *oc, void *data)
> >>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >>>> index e076f6023c..3b92e4013d 100644
> >>>> --- a/hw/ppc/spapr.c
> >>>> +++ b/hw/ppc/spapr.c
> >>>> @@ -3377,7 +3377,7 @@ void spapr_do_system_reset_on_cpu(CPUState *cs=
, run_on_cpu_data arg)
> >>>>        ppc_cpu_do_system_reset(cs);
> >>>>    }
> >>>>   =20
> >>>> -static void spapr_nmi(NMIState *n, int cpu_index, Error **errp)
> >>>> +static void spapr_nmi(Object *parent, int cpu_index, Error **errp)
> >>>>    {
> >>>>        CPUState *cs;
> >>>>   =20
> >>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> >>>> index d3edeef0ad..a49952a8b9 100644
> >>>> --- a/hw/s390x/s390-virtio-ccw.c
> >>>> +++ b/hw/s390x/s390-virtio-ccw.c
> >>>> @@ -431,7 +431,7 @@ static void s390_hot_add_cpu(MachineState *machi=
ne,
> >>>>        s390x_new_cpu(object_class_get_name(oc), id, errp);
> >>>>    }
> >>>>   =20
> >>>> -static void s390_nmi(NMIState *n, int cpu_index, Error **errp)
> >>>> +static void s390_nmi(Object *parent, int cpu_index, Error **errp)
> >>>>    {
> >>>>        CPUState *cs =3D qemu_get_cpu(cpu_index);
> >>>>   =20
> >>>> diff --git a/include/hw/nmi.h b/include/hw/nmi.h
> >>>> index a1e128724e..75afa67790 100644
> >>>> --- a/include/hw/nmi.h
> >>>> +++ b/include/hw/nmi.h
> >>>> @@ -38,7 +38,7 @@ typedef struct NMIState NMIState;
> >>>>    typedef struct NMIClass {
> >>>>        InterfaceClass parent_class;
> >>>>   =20
> >>>> -    void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error *=
*errp);
> >>>> +    void (*nmi_monitor_handler)(Object *parent, int cpu_index, Erro=
r **errp);
> >>>>    } NMIClass;
> >>>>   =20
> >>>>    void nmi_monitor_handle(int cpu_index, Error **errp);
> >>>
>=20
> Regards,
> Gavin
>=20


