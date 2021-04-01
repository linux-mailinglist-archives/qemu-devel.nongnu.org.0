Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8EA350CFB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 05:08:40 +0200 (CEST)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnhI-0000mZ-1w
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 23:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRnd1-0005iZ-TW; Wed, 31 Mar 2021 23:04:15 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36887 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRncq-00083T-87; Wed, 31 Mar 2021 23:04:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9p1C1wbkz9sXV; Thu,  1 Apr 2021 14:03:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617246239;
 bh=yiERlw+zPdzLXE8jH7EUkgS8yNVqKQSg6WLAwCXm8ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fGG4b/p+GwEm96QoYM0K7gLp6kNwctpyWsN0nX43nOsCRS/6Uj5/IDgddqZDkrKb2
 R9kNCJPmbPHq3FApTj7ddpUfHdz8I3fUH9dxGo8tlmE26wmwa4OvrbgQX+M23/YwO4
 p9IqOMg2CbqNxAO7aHlBKJ+9LbDbJCRaXXmJiqTU=
Date: Thu, 1 Apr 2021 13:59:16 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
Message-ID: <YGU3BPTJK5qE+iNG@yekko.fritz.box>
References: <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
 <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
 <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
 <YGPI5vgoI8JDO1HN@yekko.fritz.box>
 <1e16fe5e-f20a-f882-d18a-113cf48c934c@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CEgy40WHtvwFg/xu"
Content-Disposition: inline
In-Reply-To: <1e16fe5e-f20a-f882-d18a-113cf48c934c@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CEgy40WHtvwFg/xu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 05:18:45PM +0200, C=E9dric Le Goater wrote:
> On 3/31/21 2:57 AM, David Gibson wrote:
> > On Mon, Mar 29, 2021 at 03:32:37PM -0300, Daniel Henrique Barboza wrote:
> >>
> >>
> >> On 3/29/21 12:32 PM, C=E9dric Le Goater wrote:
> >>> On 3/29/21 6:20 AM, David Gibson wrote:
> >>>> On Thu, Mar 25, 2021 at 09:56:04AM +0100, C=E9dric Le Goater wrote:
> >>>>> On 3/25/21 3:10 AM, David Gibson wrote:
> >>>>>> On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza =
wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 3/22/21 10:03 PM, David Gibson wrote:
> >>>>>>>> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboz=
a wrote:
> >>>>>>>>> Kernel commit 4bce545903fa ("powerpc/topology: Update
> >>>>>>>>> topology_core_cpumask") cause a regression in the pseries machi=
ne when
> >>>>>>>>> defining certain SMP topologies [1]. The reasoning behind the c=
hange is
> >>>>>>>>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop upd=
ating
> >>>>>>>>> cpu_core_mask"). In short, cpu_core_mask logic was causing trou=
bles with
> >>>>>>>>> large VMs with lots of CPUs and was changed by cpu_cpu_mask bec=
ause, as
> >>>>>>>>> far as the kernel understanding of SMP topologies goes, both ma=
sks are
> >>>>>>>>> equivalent.
> >>>>>>>>>
> >>>>>>>>> Further discussions in the kernel mailing list [2] shown that t=
he
> >>>>>>>>> powerpc kernel always considered that the number of sockets wer=
e equal
> >>>>>>>>> to the number of NUMA nodes. The claim is that it doesn't make =
sense,
> >>>>>>>>> for Power hardware at least, 2+ sockets being in the same NUMA =
node. The
> >>>>>>>>> immediate conclusion is that all SMP topologies the pseries mac=
hine were
> >>>>>>>>> supplying to the kernel, with more than one socket in the same =
NUMA node
> >>>>>>>>> as in [1], happened to be correctly represented in the kernel by
> >>>>>>>>> accident during all these years.
> >>>>>>>>>
> >>>>>>>>> There's a case to be made for virtual topologies being detached=
 from
> >>>>>>>>> hardware constraints, allowing maximum flexibility to users. At=
 the same
> >>>>>>>>> time, this freedom can't result in unrealistic hardware represe=
ntations
> >>>>>>>>> being emulated. If the real hardware and the pseries kernel don=
't
> >>>>>>>>> support multiple chips/sockets in the same NUMA node, neither s=
hould we.
> >>>>>>>>>
> >>>>>>>>> Starting in 6.0.0, all sockets must match an unique NUMA node i=
n the
> >>>>>>>>> pseries machine. qtest changes were made to adapt to this new
> >>>>>>>>> condition.
> >>>>>>>>
> >>>>>>>> Oof.  I really don't like this idea.  It means a bunch of fiddly=
 work
> >>>>>>>> for users to match these up, for no real gain.  I'm also concern=
ed
> >>>>>>>> that this will require follow on changes in libvirt to not make =
this a
> >>>>>>>> really cryptic and irritating point of failure.
> >>>>>>>
> >>>>>>> Haven't though about required Libvirt changes, although I can say=
 that there
> >>>>>>> will be some amount to be mande and it will probably annoy existi=
ng users
> >>>>>>> (everyone that has a multiple socket per NUMA node topology).
> >>>>>>>
> >>>>>>> There is not much we can do from the QEMU layer aside from what I=
've proposed
> >>>>>>> here. The other alternative is to keep interacting with the kerne=
l folks to
> >>>>>>> see if there is a way to keep our use case untouched.
> >>>>>>
> >>>>>> Right.  Well.. not necessarily untouched, but I'm hoping for more
> >>>>>> replies from C=E9dric to my objections and mpe's.  Even with socke=
ts
> >>>>>> being a kinda meaningless concept in PAPR, I don't think tying it =
to
> >>>>>> NUMA nodes makes sense.
> >>>>>
> >>>>> I did a couple of replies in different email threads but maybe not
> >>>>> to all. I felt it was going nowhere :/ Couple of thoughts,
> >>>>
> >>>> I think I saw some of those, but maybe not all.
> >>>>
> >>>>> Shouldn't we get rid of the socket concept, die also, under pseries
> >>>>> since they don't exist under PAPR ? We only have numa nodes, cores,
> >>>>> threads AFAICT.
> >>>>
> >>>> Theoretically, yes.  I'm not sure it's really practical, though, sin=
ce
> >>>> AFAICT, both qemu and the kernel have the notion of sockets (though
> >>>> not dies) built into generic code.
> >>>
> >>> Yes. But, AFAICT, these topology notions have not reached "arch/power=
pc"
> >>> and PPC Linux only has a NUMA node id, on pseries and powernv.
> >>>
> >>>> It does mean that one possible approach here - maybe the best one - =
is
> >>>> to simply declare that sockets are meaningless under, so we simply
> >>>> don't expect what the guest kernel reports to match what's given to
> >>>> qemu.
> >>>>
> >>>> It'd be nice to avoid that if we can: in a sense it's just cosmetic,
> >>>> but it is likely to surprise and confuse people.
> >>>>
> >>>>> Should we diverged from PAPR and add extra DT properties "qemu,..."=
 ?
> >>>>> There are a couple of places where Linux checks for the underlying
> >>>>> hypervisor already.
> >>>>>
> >>>>>>> This also means that
> >>>>>>> 'ibm,chip-id' will probably remain in use since it's the only pla=
ce where
> >>>>>>> we inform cores per socket information to the kernel.
> >>>>>>
> >>>>>> Well.. unless we can find some other sensible way to convey that
> >>>>>> information.  I haven't given up hope for that yet.
> >>>>>
> >>>>> Well, we could start by fixing the value in QEMU. It is broken
> >>>>> today.
> >>>>
> >>>> Fixing what value, exactly?
> >>>
> >>> The value of the "ibm,chip-id" since we are keeping the property under
> >>> QEMU.
> >>
> >> David, I believe this has to do with the discussing we had last Friday.
> >>
> >> I mentioned that the ibm,chip-id property is being calculated in a way=
 that
> >> promotes the same ibm,chip-id in CPUs that belongs to different NUMA n=
odes,
> >> e.g.:
> >>
> >> -smp 4,cores=3D4,maxcpus=3D8,threads=3D1 \
> >> -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=3Dram-node0 \
> >> -numa node,nodeid=3D1,cpus=3D2-3,cpus=3D6-7,memdev=3Dram-node1
> >>
> >>
> >> $ dtc -I dtb -O dts fdt.dtb | grep -B2 ibm,chip-id
> >> 			ibm,associativity =3D <0x05 0x00 0x00 0x00 0x00 0x00>;
> >> 			ibm,pft-size =3D <0x00 0x19>;
> >> 			ibm,chip-id =3D <0x00>;
> >=20
> >> We assign ibm,chip-id=3D0x0 to CPUs 0-3, but CPUs 2-3 are located in a
> >> different NUMA node than 0-1. This would mean that the same socket
> >> would belong to different NUMA nodes at the same time.
> >=20
> > Right... and I'm still not seeing why that's a problem.  AFAICT that's
> > a possible, if unexpected, situation under real hardware - though
> > maybe not for POWER9 specifically.
> The ibm,chip-id property does not exist under PAPR. PAPR only has
> NUMA nodes, no sockets nor chips.=20
>=20
> And the property value is simply broken under QEMU. Try this  :
>=20
>    -smp 4,cores=3D1,maxcpus=3D8 -object memory-backend-ram,id=3Dram-node0=
,size=3D2G -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=3Dram-node0 -=
object memory-backend-ram,id=3Dram-node1,size=3D2G -numa node,nodeid=3D1,cp=
us=3D2-3,cpus=3D6-7,memdev=3Dram-node1
>=20
> # dmesg | grep numa
> [    0.013106] numa: Node 0 CPUs: 0-1
> [    0.013136] numa: Node 1 CPUs: 2-3
>=20
> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
> 		ibm,chip-id =3D <0x01>;
> 		ibm,chip-id =3D <0x02>;
> 		ibm,chip-id =3D <0x00>;
> 		ibm,chip-id =3D <0x03>;

Not seeing the problem here.  You've specified 8 (possible) cpus, 1
core-per-socket, therefore there are 4 sockets, hence 4 chip-ids.
Again, I don't see where this assumption that the chip-id is somehow
related to the NUMA topology is coming from.

> >> I believe this is what Cedric wants to be addressed. Given that the
> >> property is called after the OPAL property ibm,chip-id, the kernel
> >> expects that the property will have the same semantics as in OPAL.>
> > Even on powernv, I'm not clear why chip-id is tied into the NUMA
> > configuration, rather than getting all the NUMA info from
> > associativity properties.
>=20
> It is the case.=20

What exactly is the case?

> The associativity properties are built from chip-id in OPAL though.

Ok, so?  Why do we care how OPAL builds the associativity properties
once we *have* the associativity properties its built?

> The chip-id property is only used in low level PowerNV drivers, VAS,
> XSCOM, LPC, etc.

Which AFAIK, really *do* need to know which chip they're on, not the
NUMA toplogy.

> It's also badly used in the common part of the XIVE driver, what I am
> trying to fix to introduce an IPI per node on all platforms.  =20

See comments on other thread.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CEgy40WHtvwFg/xu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlNwQACgkQbDjKyiDZ
s5Jy7RAA5DxAAc6tFAPxTTchT/58FlMzBESmj1TDtZemlQFdZRlKUJWpEKyWwukq
3GLsFZJvZ0anXtPea7wn+QsEHNAkM71F24W1pDEyqGxbIyqerN9Rv0/9yP5+bW0l
Co414Ozl0eRkpguoOoWhNoqQH4IQ/a4HqEPcBWreNa0UT/eWQkxQEfdSG4y/T8Jm
RwQxhq28HgIFgNO1OLrO5DJqEXMPdGitb/irX/YTAkRmIf/D+BAoXa3hrmAzJehE
SHC4OadziRJaUttf072A2JJWaFV2/VCfu3q0IoF74zPQX1UpLOvgFopqeruPWRKc
aBs//d47rMtAg+tAAV7NkBzQFa8qu7S3/i7LWb8i+EAVQUnvMnP/bjMZfvZJqcDS
Xi9GjKLPrRJS0B+lcHCyqRk0CRpK7lV5alX+6lgxCRkWtcQmO9lZJS46Rc7DeBLv
mIeyUOCcb6SZSziJOgRLcC03FFhmtwoYjDed31ueV4CEzgaEUsGCS9Zm6W+BLgzs
3DIfcAzGpNPY52w/63HpVEyIb9B0+kqsjuoqN55z5+4jo1FhPRUC8/u+/7pRUl/e
Zg8BDEwb5sduQlENSlryDMxoAvPhAF2SDAWrl8Yjab0HlbHJXKilUsGxIyxJ+tJy
m/UkpY2tfYn++9yTk5dmYfz3yUoH3PaezJQ4fm/9yc2NDOPy1wI=
=unxI
-----END PGP SIGNATURE-----

--CEgy40WHtvwFg/xu--

