Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D717116846
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 09:38:13 +0100 (CET)
Received: from localhost ([::1]:37278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieEYW-00085P-Ff
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 03:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ieEXN-0007E3-CQ
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 03:37:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ieEXL-0000Sq-JW
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 03:37:01 -0500
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:43883)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ieEXL-0000MT-9W
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 03:36:59 -0500
Received: from player799.ha.ovh.net (unknown [10.108.35.27])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id AA2281B825B
 for <qemu-devel@nongnu.org>; Mon,  9 Dec 2019 09:36:49 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id C2AD7CFF6191;
 Mon,  9 Dec 2019 08:36:47 +0000 (UTC)
Date: Mon, 9 Dec 2019 09:36:45 +0100
From: Greg Kurz <groug@kaod.org>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/core: Fix data type in do_nmi()
Message-ID: <20191209093645.091c9e4b@bahia.w3ibm.bluemix.net>
In-Reply-To: <8b4e97d1-eddb-b7d2-1069-453ec4a4263a@redhat.com>
References: <20191206063642.40942-1-gshan@redhat.com>
 <20191206175031.66f62929@bahia.w3ibm.bluemix.net>
 <8b4e97d1-eddb-b7d2-1069-453ec4a4263a@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 549720630353828246
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekledguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.63.121
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

On Sun, 8 Dec 2019 00:14:00 +1100
Gavin Shan <gshan@redhat.com> wrote:

> On 12/7/19 3:50 AM, Greg Kurz wrote:
> > On Fri,  6 Dec 2019 17:36:42 +1100
> > Gavin Shan <gshan@redhat.com> wrote:
> > 
> >> object_dynamic_cast() should return machine (or GPIO) state instad of NMI
> >> state in do_nmi(). So it's wrong to convert it to NMI state unconditionally.
> >>
> > 
> > object_dynamic_cast() returns either its first argument if it can be cast
> > to the given typename or NULL. Since the x86, ccw and spapr machines and
> > the PowerMac GPIO implement the NMI interface, nothing is wrong here.
> > 
> > The do_nmi() function is called for all objects in the QOM tree and simply
> > filters out the ones that don't implement the NMI interface.
> > 
> > I do agree that this isn't super obvious though. It would be clearer to
> > do the filtering in the foreach() function. Something like:
> > 
> > https://patchwork.ozlabs.org/patch/1182232/
> > 
> 
> Greg, Thanks for the review and comments. I think we're talking about
> different issues. I do agree it's worthy to simplify the code with the
> object_child_foreach_type(), but later.
> 
> When we have below parameters to qemu, object_dynamic_cast(o, TYPE_NMI)
> returns object of "pc-q35-4.2-machine", which is passed to the subquent
> NMIClass::nmi_monitor_handler(). However, the function expects a NMIState
> from its prototype as below. This patch changes the prototype to fill the
> gap.
> 
>     void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp);
> 

Hmm... the "pc-q35-4.2-machine" type inherits from the TYPE_PC_MACHINE,
which in turns inherits from TYPE_X86_MACHINE, which implements the
TYPE_NMI interface. It thus seems okay to pass this object to x86_nmi().

What are you trying to fix here ?

>     Changed to:
> 
>     void (*nmi_monitor_handler)(Object *parent, int cpu_index, Error **errp);
> 
>     ~/sandbox/src/qemu/qemu.main.x86/x86_64-softmmu/qemu-system-x86_64              \
>     --enable-kvm -machine type=q35,accel=kvm,kernel-irqchip=on -cpu host -smp 2 -m 1G    \
>     -monitor none -serial mon:stdio -nographic -s                                        \
>     -bios ~/sandbox/src/firmware/seabios/out/bios.bin                                    \
>     -kernel ~/sandbox/src/linux/linux.main.x86/arch/x86/boot/bzImage                     \
>     -initrd ~/sandbox/src/util/buildroot/output/images/rootfs.cpio.xz                    \
>     -append "earlyprintk=ttyS0 console=ttyS0 debug"                                      \
>     -device virtio-net-pci,netdev=unet,mac=52:54:00:f1:26:a6                             \
>     -netdev user,id=unet,hostfwd=tcp::50959-:22                                          \
>     -drive file=~/sandbox/images/vm.img,if=none,format=raw,id=nvme0                      \
>     -device nvme,drive=nvme0,serial=foo                                                  \
>     -drive file=~/sandbox/images/vm1.img,if=none,format=raw,id=nvme1                     \
>     -device nvme,drive=nvme1,serial=foo1
> 
> >> This changes the prototype of NMIClass::nmi_monitor_handler() to accept
> >> the parent object of NMI state instead of itself. With this, he parent object
> >> is passed to the function, to avoid potential data corruption.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   hw/core/nmi.c              | 8 ++++----
> >>   hw/i386/x86.c              | 2 +-
> >>   hw/misc/macio/gpio.c       | 6 +++---
> >>   hw/ppc/spapr.c             | 2 +-
> >>   hw/s390x/s390-virtio-ccw.c | 2 +-
> >>   include/hw/nmi.h           | 2 +-
> >>   6 files changed, 11 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/hw/core/nmi.c b/hw/core/nmi.c
> >> index 481c4b3c7e..554708d0db 100644
> >> --- a/hw/core/nmi.c
> >> +++ b/hw/core/nmi.c
> >> @@ -37,13 +37,13 @@ static void nmi_children(Object *o, struct do_nmi_s *ns);
> >>   static int do_nmi(Object *o, void *opaque)
> >>   {
> >>       struct do_nmi_s *ns = opaque;
> >> -    NMIState *n = (NMIState *) object_dynamic_cast(o, TYPE_NMI);
> >> +    Object *parent = object_dynamic_cast(o, TYPE_NMI);
> >>   
> >> -    if (n) {
> >> -        NMIClass *nc = NMI_GET_CLASS(n);
> >> +    if (parent) {
> >> +        NMIClass *nc = NMI_GET_CLASS(parent);
> >>   
> >>           ns->handled = true;
> >> -        nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err);
> >> +        nc->nmi_monitor_handler(parent, ns->cpu_index, &ns->err);
> >>           if (ns->err) {
> >>               return -1;
> >>           }
> >> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> >> index 394edc2f72..b98204f104 100644
> >> --- a/hw/i386/x86.c
> >> +++ b/hw/i386/x86.c
> >> @@ -190,7 +190,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
> >>       return ms->possible_cpus;
> >>   }
> >>   
> >> -static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
> >> +static void x86_nmi(Object *parent, int cpu_index, Error **errp)
> >>   {
> >>       /* cpu index isn't used */
> >>       CPUState *cs;
> >> diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
> >> index 6cca6b27d6..6b4dfcc188 100644
> >> --- a/hw/misc/macio/gpio.c
> >> +++ b/hw/misc/macio/gpio.c
> >> @@ -196,10 +196,10 @@ static void macio_gpio_reset(DeviceState *dev)
> >>       macio_set_gpio(s, 1, true);
> >>   }
> >>   
> >> -static void macio_gpio_nmi(NMIState *n, int cpu_index, Error **errp)
> >> +static void macio_gpio_nmi(Object *parent, int cpu_index, Error **errp)
> >>   {
> >> -    macio_set_gpio(MACIO_GPIO(n), 9, true);
> >> -    macio_set_gpio(MACIO_GPIO(n), 9, false);
> >> +    macio_set_gpio(MACIO_GPIO(parent), 9, true);
> >> +    macio_set_gpio(MACIO_GPIO(parent), 9, false);
> >>   }
> >>   
> >>   static void macio_gpio_class_init(ObjectClass *oc, void *data)
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index e076f6023c..3b92e4013d 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -3377,7 +3377,7 @@ void spapr_do_system_reset_on_cpu(CPUState *cs, run_on_cpu_data arg)
> >>       ppc_cpu_do_system_reset(cs);
> >>   }
> >>   
> >> -static void spapr_nmi(NMIState *n, int cpu_index, Error **errp)
> >> +static void spapr_nmi(Object *parent, int cpu_index, Error **errp)
> >>   {
> >>       CPUState *cs;
> >>   
> >> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> >> index d3edeef0ad..a49952a8b9 100644
> >> --- a/hw/s390x/s390-virtio-ccw.c
> >> +++ b/hw/s390x/s390-virtio-ccw.c
> >> @@ -431,7 +431,7 @@ static void s390_hot_add_cpu(MachineState *machine,
> >>       s390x_new_cpu(object_class_get_name(oc), id, errp);
> >>   }
> >>   
> >> -static void s390_nmi(NMIState *n, int cpu_index, Error **errp)
> >> +static void s390_nmi(Object *parent, int cpu_index, Error **errp)
> >>   {
> >>       CPUState *cs = qemu_get_cpu(cpu_index);
> >>   
> >> diff --git a/include/hw/nmi.h b/include/hw/nmi.h
> >> index a1e128724e..75afa67790 100644
> >> --- a/include/hw/nmi.h
> >> +++ b/include/hw/nmi.h
> >> @@ -38,7 +38,7 @@ typedef struct NMIState NMIState;
> >>   typedef struct NMIClass {
> >>       InterfaceClass parent_class;
> >>   
> >> -    void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp);
> >> +    void (*nmi_monitor_handler)(Object *parent, int cpu_index, Error **errp);
> >>   } NMIClass;
> >>   
> >>   void nmi_monitor_handle(int cpu_index, Error **errp);
> > 
> 
> Regards,
> Gavin
> 


