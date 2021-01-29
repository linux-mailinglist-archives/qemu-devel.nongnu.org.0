Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3891030873E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:10:44 +0100 (CET)
Received: from localhost ([::1]:56302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Pnf-0002E7-9p
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5PkP-00077C-O7; Fri, 29 Jan 2021 04:07:22 -0500
Received: from ozlabs.org ([203.11.71.1]:59735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5PkM-00007l-Fp; Fri, 29 Jan 2021 04:07:21 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRs0w5mHMz9sWC; Fri, 29 Jan 2021 20:07:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611911232;
 bh=2vxlb5XexdG7g/CpHEuwdIelS3nOZQyezzUYIcs04zI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZB4tZk7VFCZnZMi5SRYWtDQ7v5JDcnNwt08PWx2e87L8mZZKgHbuBm68eCjwj0l5t
 JOia416gP4XLmq79PV0FiMXWiEC8rGQXws33vBHrCBox7aQt6pNhOtZopUrRrnnPYQ
 3D3foh39UevMqm99nHYou2l8Ox8JVRZNPCIze46k=
Date: Fri, 29 Jan 2021 17:23:42 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v7 10/13] spapr: Add PEF based confidential guest support
Message-ID: <20210129062342.GL6951@yekko.fritz.box>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-11-david@gibson.dropbear.id.au>
 <20210114113911.374d954a@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Content-Disposition: inline
In-Reply-To: <20210114113911.374d954a@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 11:39:11AM +0100, Greg Kurz wrote:
> On Thu, 14 Jan 2021 10:58:08 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > Some upcoming POWER machines have a system called PEF (Protected
> > Execution Facility) which uses a small ultravisor to allow guests to
> > run in a way that they can't be eavesdropped by the hypervisor.  The
> > effect is roughly similar to AMD SEV, although the mechanisms are
> > quite different.
> >=20
> > Most of the work of this is done between the guest, KVM and the
> > ultravisor, with little need for involvement by qemu.  However qemu
> > does need to tell KVM to allow secure VMs.
> >=20
> > Because the availability of secure mode is a guest visible difference
> > which depends on having the right hardware and firmware, we don't
> > enable this by default.  In order to run a secure guest you need to
> > create a "pef-guest" object and set the confidential-guest-support
> > property to point to it.
> >=20
> > Note that this just *allows* secure guests, the architecture of PEF is
> > such that the guest still needs to talk to the ultravisor to enter
> > secure mode.  Qemu has no directl way of knowing if the guest is in
>=20
> typo "directl" missed in V6... sorry.
>=20
> > secure mode, and certainly can't know until well after machine
> > creation time.
> >=20
> > To start a PEF-capable guest, use the command line options:
> >     -object pef-guest,id=3Dpef0 -machine confidential-guest-support=3Dp=
ef0
> >=20
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---
> >  docs/confidential-guest-support.txt |   3 +
> >  docs/papr-pef.txt                   |  30 +++++++
> >  hw/ppc/meson.build                  |   1 +
> >  hw/ppc/pef.c                        | 119 ++++++++++++++++++++++++++++
> >  hw/ppc/spapr.c                      |   6 ++
> >  include/hw/ppc/pef.h                |  25 ++++++
> >  target/ppc/kvm.c                    |  18 -----
> >  target/ppc/kvm_ppc.h                |   6 --
> >  8 files changed, 184 insertions(+), 24 deletions(-)
> >  create mode 100644 docs/papr-pef.txt
> >  create mode 100644 hw/ppc/pef.c
> >  create mode 100644 include/hw/ppc/pef.h
> >=20
> > diff --git a/docs/confidential-guest-support.txt b/docs/confidential-gu=
est-support.txt
> > index 2790425b38..f0801814ff 100644
> > --- a/docs/confidential-guest-support.txt
> > +++ b/docs/confidential-guest-support.txt
> > @@ -40,4 +40,7 @@ Currently supported confidential guest mechanisms are:
> >  AMD Secure Encrypted Virtualization (SEV)
> >      docs/amd-memory-encryption.txt
> > =20
> > +POWER Protected Execution Facility (PEF)
> > +    docs/papr-pef.txt
> > +
> >  Other mechanisms may be supported in future.
> > diff --git a/docs/papr-pef.txt b/docs/papr-pef.txt
> > new file mode 100644
> > index 0000000000..6419e995cf
> > --- /dev/null
> > +++ b/docs/papr-pef.txt
> > @@ -0,0 +1,30 @@
> > +POWER (PAPR) Protected Execution Facility (PEF)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Protected Execution Facility (PEF), also known as Secure Guest support
> > +is a feature found on IBM POWER9 and POWER10 processors.
> > +
> > +If a suitable firmware including an Ultravisor is installed, it adds
> > +an extra memory protection mode to the CPU.  The ultravisor manages a
> > +pool of secure memory which cannot be accessed by the hypervisor.
> > +
> > +When this feature is enabled in qemu, a guest can use ultracalls to
> > +enter "secure mode".  This transfers most of its memory to secure
> > +memory, where it cannot be eavesdropped by a compromised hypervisor.
> > +
> > +Launching
> > +---------
> > +
> > +To launch a guest which will be permitted to enter PEF secure mode:
> > +
> > +# ${QEMU} \
> > +    -object pef-guest,id=3Dpef0 \
> > +    -machine confidential-guest-support=3Dpef0 \
> > +    ...
> > +
> > +Live Migration
> > +----------------
> > +
> > +Live migration is not yet implemented for PEF guests.  For
> > +consistency, we currently prevent migration if the PEF feature is
> > +enabled, whether or not the guest has actually entered secure mode.
> > diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> > index ffa2ec37fa..218631c883 100644
> > --- a/hw/ppc/meson.build
> > +++ b/hw/ppc/meson.build
> > @@ -27,6 +27,7 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
> >    'spapr_nvdimm.c',
> >    'spapr_rtas_ddw.c',
> >    'spapr_numa.c',
> > +  'pef.c',
> >  ))
> >  ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
> >  ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
> > diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> > new file mode 100644
> > index 0000000000..02b9b3b460
> > --- /dev/null
> > +++ b/hw/ppc/pef.c
> > @@ -0,0 +1,119 @@
> > +/*
> > + * PEF (Protected Execution Facility) for POWER support
> > + *
> > + * Copyright David Gibson, Redhat Inc. 2020
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "qapi/error.h"
> > +#include "qom/object_interfaces.h"
> > +#include "sysemu/kvm.h"
> > +#include "migration/blocker.h"
> > +#include "exec/confidential-guest-support.h"
> > +#include "hw/ppc/pef.h"
> > +
> > +#define TYPE_PEF_GUEST "pef-guest"
> > +OBJECT_DECLARE_SIMPLE_TYPE(PefGuest, PEF_GUEST)
> > +
> > +typedef struct PefGuest PefGuest;
> > +typedef struct PefGuestClass PefGuestClass;
> > +
> > +struct PefGuestClass {
> > +    ConfidentialGuestSupportClass parent_class;
> > +};
> > +
> > +/**
> > + * PefGuest:
> > + *
> > + * The PefGuest object is used for creating and managing a PEF
> > + * guest.
> > + *
> > + * # $QEMU \
> > + *         -object pef-guest,id=3Dpef0 \
> > + *         -machine ...,confidential-guest-support=3Dpef0
> > + */
> > +struct PefGuest {
> > +    ConfidentialGuestSupport parent_obj;
> > +};
> > +
> > +#ifdef CONFIG_KVM
> > +static int kvmppc_svm_init(Error **errp)
> > +{
> > +    if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURE_GUEST)) {
> > +        error_setg(errp,
> > +                   "KVM implementation does not support Secure VMs (is=
 an ultravisor running?)");
> > +        return -1;
> > +    } else {
> > +        int ret =3D kvm_vm_enable_cap(kvm_state, KVM_CAP_PPC_SECURE_GU=
EST, 0, 1);
> > +
> > +        if (ret < 0) {
> > +            error_setg(errp,
> > +                       "Error enabling PEF with KVM");
> > +            return -1;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * Don't set error if KVM_PPC_SVM_OFF ioctl is invoked on kernels
> > + * that don't support this ioctl.
> > + */
> > +void kvmppc_svm_off(Error **errp)
> > +{
> > +    int rc;
> > +
> > +    if (!kvm_enabled()) {
> > +        return;
> > +    }
> > +
> > +    rc =3D kvm_vm_ioctl(KVM_STATE(current_accel()), KVM_PPC_SVM_OFF);
> > +    if (rc && rc !=3D -ENOTTY) {
> > +        error_setg_errno(errp, -rc, "KVM_PPC_SVM_OFF ioctl failed");
> > +    }
> > +}
> > +#else
> > +static int kvmppc_svm_init(Error **errp)
> > +{
> > +    g_assert_not_reached();
> > +}
> > +#endif
> > +
> > +int pef_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
> > +{
> > +    if (!object_dynamic_cast(OBJECT(cgs), TYPE_PEF_GUEST)) {
> > +        return 0;
> > +    }
> > +
> > +    if (!kvm_enabled()) {
> > +        error_setg(errp, "PEF requires KVM");
> > +        return -1;
> > +    }
> > +
> > +    return kvmppc_svm_init(errp);
> > +}
> > +
> > +OBJECT_DEFINE_TYPE_WITH_INTERFACES(PefGuest,
> > +                                   pef_guest,
> > +                                   PEF_GUEST,
> > +                                   CONFIDENTIAL_GUEST_SUPPORT,
> > +                                   { TYPE_USER_CREATABLE },
> > +                                   { NULL })
> > +
> > +static void pef_guest_class_init(ObjectClass *oc, void *data)
> > +{
> > +}
> > +
> > +static void pef_guest_init(Object *obj)
> > +{
> > +}
> > +
> > +static void pef_guest_finalize(Object *obj)
> > +{
> > +}
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 2c403b574e..accf7a834b 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -83,6 +83,7 @@
> >  #include "hw/ppc/spapr_tpm_proxy.h"
> >  #include "hw/ppc/spapr_nvdimm.h"
> >  #include "hw/ppc/spapr_numa.h"
> > +#include "hw/ppc/pef.h"
> > =20
> >  #include "monitor/monitor.h"
> > =20
> > @@ -2658,6 +2659,11 @@ static void spapr_machine_init(MachineState *mac=
hine)
> >      char *filename;
> >      Error *resize_hpt_err =3D NULL;
> > =20
> > +    /*
> > +     * if Secure VM (PEF) support is configured, then initialize it
> > +     */
> > +    pef_kvm_init(machine->cgs, &error_fatal);
> > +
> >      msi_nonbroken =3D true;
> > =20
> >      QLIST_INIT(&spapr->phbs);
> > diff --git a/include/hw/ppc/pef.h b/include/hw/ppc/pef.h
> > new file mode 100644
> > index 0000000000..57d4ec9fe6
> > --- /dev/null
> > +++ b/include/hw/ppc/pef.h
> > @@ -0,0 +1,25 @@
> > +/*
> > + * PEF (Protected Execution Facility) for POWER support
> > + *
> > + * Copyright David Gibson, Redhat Inc. 2020
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#ifndef HW_PPC_PEF_H
> > +#define HW_PPC_PEF_H
> > +
> > +int pef_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> > +
> > +#ifdef CONFIG_KVM
> > +void kvmppc_svm_off(Error **errp);
> > +#else
> > +static inline void kvmppc_svm_off(Error **errp)
> > +{
> > +}
> > +#endif
>=20
> The API seems a bit inconsistent. On one side, we have pef_kvm_init()
> which hides all the implementation details (including KVM stubs) in
> the C file. And on the other side, we expose kvmppc_svm_off() to
> the machine code... Especially, I was expecting to see a
> g_assert_not_reached() in the kvmppc_svm_off() stub, just like
> kvmppc_svm_init().
>=20
> Maybe introduce an intermediate pef_kvm_off() API, that matches
> what pef_kvm_init() does with kvmppc_svm_init() ?

Fair enough.  I've revised this for the next spin.

>=20
> > +
> > +
> > +#endif /* HW_PPC_PEF_H */
> > diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> > index daf690a678..0c5056dd5b 100644
> > --- a/target/ppc/kvm.c
> > +++ b/target/ppc/kvm.c
> > @@ -2929,21 +2929,3 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, i=
nt64_t tb_offset)
> >          kvm_set_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &tb_offset);
> >      }
> >  }
> > -
> > -/*
> > - * Don't set error if KVM_PPC_SVM_OFF ioctl is invoked on kernels
> > - * that don't support this ioctl.
> > - */
> > -void kvmppc_svm_off(Error **errp)
> > -{
> > -    int rc;
> > -
> > -    if (!kvm_enabled()) {
> > -        return;
> > -    }
> > -
> > -    rc =3D kvm_vm_ioctl(KVM_STATE(current_accel()), KVM_PPC_SVM_OFF);
> > -    if (rc && rc !=3D -ENOTTY) {
> > -        error_setg_errno(errp, -rc, "KVM_PPC_SVM_OFF ioctl failed");
> > -    }
> > -}
> > diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> > index 73ce2bc951..989f61ace0 100644
> > --- a/target/ppc/kvm_ppc.h
> > +++ b/target/ppc/kvm_ppc.h
> > @@ -39,7 +39,6 @@ int kvmppc_booke_watchdog_enable(PowerPCCPU *cpu);
> >  target_ulong kvmppc_configure_v3_mmu(PowerPCCPU *cpu,
> >                                       bool radix, bool gtse,
> >                                       uint64_t proc_tbl);
> > -void kvmppc_svm_off(Error **errp);
> >  #ifndef CONFIG_USER_ONLY
> >  bool kvmppc_spapr_use_multitce(void);
> >  int kvmppc_spapr_enable_inkernel_multitce(void);
> > @@ -216,11 +215,6 @@ static inline target_ulong kvmppc_configure_v3_mmu=
(PowerPCCPU *cpu,
> >      return 0;
> >  }
> > =20
> > -static inline void kvmppc_svm_off(Error **errp)
> > -{
> > -    return;
> > -}
> > -
> >  static inline void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu,
> >                                               unsigned int online)
> >  {
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATqewACgkQbDjKyiDZ
s5It5A//am9BPtbswZhHdYLJRIU8wM2+sgypIYjdoyx65CMZXniUW+RpQKGOynTl
yd/h0Kh5BqQ9unLtVTnj6QzymmTS68q98b7s2Ixt5/gOcjJRJt8h8ZZdgBtKIA8X
PbShvEXYOQiK6smt4TGoO1G0wOrPmiky2nEbKyoCoqMQny2+aoT0+wR7op2W8j8g
YtU9gvynmcN06BMC2y+A7taFEJfWshAhC90Ew1p6Ovkp/t0HkFH8dFABiRt+7gmB
V+yAqHef/vI7LtviOQ/YMU23xYUghYDnVzWTgGNo2mFL4mdrlWO2jjwQMcK72RJx
gITeBSFn3ytjTn86qpZTQJxI+bxUKew0X67rpADIxj2kTamdd7+B3E2BsRRXdN8q
tkk0W76ep00xgg9dlAyVKlrGzWc5dpUxlEZ2+at5oMQwl5GqHJfeip3/YK92ETmD
IiCef4k15ezxdpk96FrSjBmze1G5hypQy6okKYcrCxuiAw4VtG67u8GLJa2m6gAK
GCocgRnumARUJkogegREOmoutLaFz8P+eEBAV63SX9YmrHVKC5557vr9cDYxdg7k
Ykvi+msfhHTV/MnoaO9m9bV1YjbplUJYj+zKEKzLmn/HTMIxZ+8OiVpvP4gW5rR7
9fbGVWfQ8NErA/eJmchkzGo4zhYBuLIiM3yjNRS+8yEdVFAI69Y=
=WINs
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--

