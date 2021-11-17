Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C9D455180
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 01:09:52 +0100 (CET)
Received: from localhost ([::1]:46948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnUzu-0000A4-Hw
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 19:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mnUwJ-0007Ke-KZ; Wed, 17 Nov 2021 19:06:07 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=45267
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mnUwD-0005ys-PB; Wed, 17 Nov 2021 19:06:07 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Hvg7436tcz4xdX; Thu, 18 Nov 2021 11:05:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1637193952;
 bh=aT7kl5keXap2lESCe6exW0IbqBdR9tcVztWYXYVM67w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hH93eDupQqM8rrXclw9XRYNi33wHKPEtj7N6B25/H5k4it8EyfqVZuriGj2t1mYuX
 sAZH2JHt81HfPbt0p/Nw9etIfObcpTWH6FfBpYgUNbC7RaknPhNMMpJ/HA+9vsQik1
 HNFLoeu+ks8YbDHcJVaeAqEszFUe+FO+n7dbKniM=
Date: Thu, 18 Nov 2021 10:30:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: lagarcia@linux.ibm.com
Subject: Re: [PATCH] docs: Introducing pseries documentation.
Message-ID: <YZWQr7QqZoGXDWjZ@yekko>
References: <26442e7dd425bb4feca0adb54d3787fd135fffb7.1637180039.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DSOC8Njuq9HLMgt8"
Content-Disposition: inline
In-Reply-To: <26442e7dd425bb4feca0adb54d3787fd135fffb7.1637180039.git.lagarcia@br.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, Leonardo Garcia <lagarcia@br.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DSOC8Njuq9HLMgt8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 05:14:30PM -0300, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
>=20
> The purpose of this document is to substitute the content currently
> available in the QEMU wiki at [0]. This initial version does contain
> some additional content as well. Whenever this documentation gets
> upstream and is reflected in [1], the QEMU wiki will be edited to point
> to this documentation, so that we only need to keep it updated in one
> place.
>=20
> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
> 1. https://qemu.readthedocs.io/en/latest/system/ppc/pseries.html
>=20
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>

LGTM,

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Couple of minor points below.

> ---
>  docs/system/ppc/pseries.rst | 185 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 185 insertions(+)
>=20
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index 932d4dd17d..2de3fb4d51 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -1,12 +1,197 @@
>  pSeries family boards (``pseries``)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> +The Power machine virtualized environment described by the `Linux on Pow=
er
> +Architecture Reference document (LoPAR)
> +<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-202006=
11.pdf>`_
> +is called pseries. This environment is also known as sPAPR, System p gue=
sts, or
> +simply Power Linux guests (although it is capable of running other opera=
ting
> +systems, such as AIX).
> +
> +Even though pseries is designed to behave as a guest environment, it is =
also
> +capable of acting as a hypervisor OS, providing, on that role, nested
> +virtualization capabilities.
> +
>  Supported devices
>  -----------------
> =20
> + * Multi processor support for many Power processors generations: POWER5=
+,
> +   POWER7, POWER7+, POWER8, POWER8NVL, Power9, and Power10 (there is no =
support
> +   for POWER6 processors).

I wouldn't trust the POWER5+ cpu emulation with pseries; only POWER7
and later has been tested at all.  Actually.. I wouldn't trust the
POWER5+ CPU emulation much at all, if it's been tested, it's not for a
long, long time.

> + * Interrupt Controller, XICS (POWER8) and XIVE (Power9 and Power10)
> + * vPHB PCIe Host bridge.
> + * vscsi and vnet devices, compatible with the same devices available on=
 a
> +   PowerVM hypervisor with VIOS managing LPARs.
> + * Virtio based devices.
> + * PCIe device pass through.
> +
>  Missing devices
>  ---------------
> =20
> + * SPICE support.
> =20
>  Firmware
>  --------
> +
> +`SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
> +implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
> +Configuration) Firmware: Core Requirements and Practices
> +<https://standards.ieee.org/standard/1275-1994.html>`_.
> +
> +QEMU includes a prebuilt image of SLOF which is updated when a more rece=
nt
> +version is required.
> +
> +Build directions
> +----------------
> +
> +.. code-block:: bash
> +
> +  ./configure --target-list=3Dppc64-softmmu && make
> +
> +Running instructions
> +--------------------
> +
> +Someone can select the pseries machine type by running QEMU with the fol=
lowing
> +options:
> +
> +.. code-block:: bash
> +
> +  qemu-system-ppc64 -M pseries <other QEMU arguments>
> +
> +sPAPR devices
> +-------------
> +
> +The sPAPR specification defines a set of para-virtualized devices, which=
 are
> +also supported by the pseries machine in QEMU and can be instantiated wi=
th the
> +`-device` option:
> +
> +* spapr-vlan : A virtual network interface.
> +* spapr-vscsi : A virtual SCSI disk interface.
> +* spapr-rng : A pseudo-device for passing random number generator data t=
o the
> +  guest (see the `H_RANDOM hypercall feature
> +  <https://wiki.qemu.org/Features/HRandomHypercall>`_ for details).
> +
> +These are compatible with the devices historically available for use when
> +running the IBM PowerVM hypervisor with LPARs.
> +
> +However, since these devices have originally been specified with another
> +hypervisor and non-Linux guests in mind, you should use the virtio count=
erparts
> +(virtio-net, virtio-blk/scsi and virtio-rng) if possible instead, since =
they
> +will most probably give you better performance with Linux guests in a QE=
MU
> +environment.
> +
> +The pseries machine in QEMU is always instantiated with a NVRAM device
> +(``spapr-nvram``), so it is not needed to add this manually. However, if=
 someone
> +wants to make the contents of the NVRAM device persistent, they will nee=
d to
> +specify a PFLASH device when starting QEMU, i.e. either use
> +``-drive if=3Dpflash,file=3D<filename>,format=3Draw`` to set the default=
 PFLASH
> +device, or specify one with an ID
> +(``-drive if=3Dnone,file=3D<filename>,format=3Draw,id=3Dpfid``) and pass=
 that ID to the
> +NVRAM device with ``-global spapr-nvram.drive=3Dpfid``.
> +
> +Switching between the KVM-PR and KVM-HV kernel module
> +-----------------------------------------------------
> +
> +Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` =
and
> +``kvm_pr.ko``.
> +
> +
> +If a host supports both KVM modes, and both KVM kernel modules are loade=
d, it is
> +possible to switch between the two modes with the ``kvm-type`` parameter:
> +
> +* Use ``qemu-system-ppc64 -M pseries,accel=3Dkvm,kvm-type=3DPR`` to use =
the
> +  ``kvm_pr.ko`` kernel module.
> +* Use ``qemu-system-ppc64 -M pseries,accel=3Dkvm,kvm-type=3DHV`` to use =
``kvm_hv.ko``
> +  instead.
> +
> +KVM-PR
> +^^^^^^
> +
> +KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run the=
 guests,
> +i.e. the virtual machine is run in user mode and all privileged instruct=
ions
> +trap and have to be emulated by the host. That means you can run KVM-PR =
inside
> +a pseries guest (or a PowerVM LPAR for that matter), and that is where i=
t has
> +originated, as historically (prior to POWER7) it was not possible to run=
 Linux
> +on hypervisor mode on a Power processor (this function was restricted to
> +PowerVM, the IBM proprietary hypervisor).
> +
> +Because all privileged instructions are trapped, guests that use a lot of
> +privileged instructions run quite slow with KVM-PR. On the other hand, b=
ecause
> +of that, this kernel module can run on pretty much every PPC hardware, a=
nd is
> +able to emulate a lot of guests CPUs. This module can even be used to ru=
n other
> +PowerPC guests like an emulated PowerMac.
> +
> +As KVM-PR can be run inside a pseries guest, it can also provide nested
> +virtualization capabilities (i.e. running a guest from within a guest).

Might be worth mentioning that KVM-PR is barely maintained now, and it
doesn't support all the privileged instructions of the later
processors (I'm pretty sure POWER9 doesn't work there, for example).

> +KVM-HV
> +^^^^^^
> +
> +KVM-HV uses the hypervisor mode of more recent Power processors, that al=
low
> +access to the bare metal hardware directly. Although POWER7 had this cap=
ability,
> +it was only starting with POWER8 that this was officially supported by I=
BM.
> +
> +Originally, KVM-HV was only available when running on a powernv platform=
 (a.k.a.
> +Power bare metal). Although it runs on a powernv platform, it can only b=
e used
> +to start pseries guests. As the pseries guest doesn't have access to the
> +hypervisor mode of the Power CPU, it wasn't possible to run KVM-HV on a =
guest.
> +This limitation has been lifted, and now it is possible to run KVM-HV in=
side
> +pseries guests as well, making nested virtualization possible with KVM-H=
V.
> +
> +As KVM-HV has access to privileged instructions, guests that use a lot o=
f these
> +can run much faster than with KVM-PR. On the other hand, the guest CPU h=
as to be
> +of the same type as the host CPU this way, e.g. it is not possible to sp=
ecify an
> +embedded PPC CPU for the guest with KVM-HV. However, there is at least t=
he
> +possibility to run the guest in a backward-compatibility mode of the pre=
vious
> +CPUs generations, e.g. you can run a POWER7 guest on a POWER8 host by us=
ing
> +``-cpu POWER8,compat=3Dpower7`` as parameter to QEMU.
> +
> +Modules support
> +---------------
> +
> +As noticed in the sections above, each module can run in a different
> +environment. The following table shows with which environment each modul=
e can
> +run. As long as you are in a supported environment, you can run KVM-PR o=
r KVM-HV
> +nested. Combinations not shown in the table are not available.
> +
> ++--------------+------------+------+-------------------+----------+-----=
---+
> +| Platform     | Host type  | Bits | Page table format | KVM-HV   | KVM-=
PR |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+
> +| powernv      | bare metal | 32   | hash              | no       | yes =
   |
> +|              |            |      +-------------------+----------+-----=
---+
> +|              |            |      | radix             | N/A      | N/A =
   |
> +|              |            +------+-------------------+----------+-----=
---+
> +|              |            | 64   | hash              | yes      | yes =
   |
> +|              |            |      +-------------------+----------+-----=
---+
> +|              |            |      | radix             | yes      | no  =
   |
> ++--------------+------------+------+-------------------+----------+-----=
---+
> +| pseries [*]_ | powernv    | 32   | hash              | no       | yes =
   |
> +|              |            |      +-------------------+----------+-----=
---+
> +|              |            |      | radix             | N/A      | N/A =
   |
> +|              |            +------+-------------------+----------+-----=
---+
> +|              |            | 64   | hash              | no       | yes =
   |
> +|              |            |      +-------------------+----------+-----=
---+
> +|              |            |      | radix             | yes [*]_ | no  =
   |
> +|              +------------+------+-------------------+----------+-----=
---+
> +|              | PowerVM    | 32   | hash              | no       | yes =
   |
> +|              |            |      +-------------------+----------+-----=
---+
> +|              |            |      | radix             | N/A      | N/A =
   |
> +|              |            +------+-------------------+----------+-----=
---+
> +|              |            | 64   | hash              | no       | yes =
   |
> +|              |            |      +-------------------+----------+-----=
---+
> +|              |            |      | radix [*]_        | no       | yes =
   |
> ++--------------+------------+------+-------------------+----------+-----=
---+
> +
> +.. [*] On POWER9 DD2.1 processors, the page table format on the host and=
 guest
> +   must be the same.
> +
> +.. [*] KVM-HV cannot run nested on POWER8 machines.
> +
> +.. [*] Introduced on Power10 machines.
> +
> +Maintainer contact information
> +------------------------------
> +
> +C=E9dric Le Goater <clg@kaod.org>
> +
> +Daniel Henrique Barboza <danielhb413@gmail.com>
> \ No newline at end of file

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DSOC8Njuq9HLMgt8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGVkK0ACgkQbDjKyiDZ
s5KmMxAA2cmRGUVw2hDH0cC3mswoKp6YpqUQ7eZ27W0d04EEYlieAAUXnqDfNYFU
B/9E2O2splNaiRe4RBGfZquSFF5w+VCBMSKNwOzsTu9/uynSisXvhK0nQCFt05wz
5M2ZpR9mL2VZEHixm1leepXIPPk4wE9HtTY+p1/m7H/ghYUO0Bpms9OQ6vGIlHkj
QDO9KPDdedCeTMUUTYXv3Dleq7BtpI/dW8VKksa60IkCrvLbmyZAYigFspN9wKKE
VETdsa5O7HpOzwaapCEjgQkf82wJ0Idx62aqms4TOcS/amI9Z9yi3dWC6v/O/YeH
7+EpCKok8TlEy3LyHWa+VsfQEaELXBa1MTOAvar+VoACOyQ6Aa7cynb1NHdy7YW6
YepXYIDbIMDd05R1U7FKYdRMzmTOzXU0+JxTPalW1oHqrscy+3VSXrqx7KsWMj0V
AcEbjDMlzQdxtQzCX5qod4MneokX2HREJlVWtkFZyhOnYDE/2oYqF7JusWRVWf58
zP7mw8o86C7r2ZxaLxyfTJozcwOyu2ukM9GRx1KX9Ll285YzB/3tQf9cfG8YDT+m
7h9ZjjjKWIEbyvhZqa8oJrgOpU5bfaPKbgCRCMPIp22ypXIeVaRdYPFo9JfhcFCs
Sd+dP8CXYwpVio/O+z8WDL0R3L8mV91ar1KGNFEN0byaVQPO2Ng=
=GFKB
-----END PGP SIGNATURE-----

--DSOC8Njuq9HLMgt8--

