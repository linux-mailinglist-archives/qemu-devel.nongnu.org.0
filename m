Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198ED34F5B4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 03:05:37 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRPId-0004QX-LP
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 21:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRPH4-0003TX-Fw; Tue, 30 Mar 2021 21:03:58 -0400
Received: from ozlabs.org ([203.11.71.1]:45729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRPH1-00047t-5Y; Tue, 30 Mar 2021 21:03:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F97P15t6Hz9sW0; Wed, 31 Mar 2021 12:03:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617152629;
 bh=9u6yl5PeWO8HwpxvGKg0IllVvWDkYQ6guhzozoQ5KWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bsbp9Vhmkauw7brnBzGMFkcRWF2NoMrQQvCEWgdgHiA+nsGsEPAwPrfIg7tKiAdmf
 0vEuGZVi2WwRsOnd5aI8WX6CpVSgg1NUI4X0sp4l9qd5+fDysw9Lyl5gXObitgdpq9
 rM1k1o/zd95xwhfyNZMTqCeaou4QsLEbil2TNNI8=
Date: Wed, 31 Mar 2021 11:57:10 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
Message-ID: <YGPI5vgoI8JDO1HN@yekko.fritz.box>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
 <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
 <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TmByOVgTraLexm/f"
Content-Disposition: inline
In-Reply-To: <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
 Michael Ellerman <mpe@ellerman.id.au>, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TmByOVgTraLexm/f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 03:32:37PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/29/21 12:32 PM, C=E9dric Le Goater wrote:
> > On 3/29/21 6:20 AM, David Gibson wrote:
> > > On Thu, Mar 25, 2021 at 09:56:04AM +0100, C=E9dric Le Goater wrote:
> > > > On 3/25/21 3:10 AM, David Gibson wrote:
> > > > > On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza=
 wrote:
> > > > > >=20
> > > > > >=20
> > > > > > On 3/22/21 10:03 PM, David Gibson wrote:
> > > > > > > On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Bar=
boza wrote:
> > > > > > > > Kernel commit 4bce545903fa ("powerpc/topology: Update
> > > > > > > > topology_core_cpumask") cause a regression in the pseries m=
achine when
> > > > > > > > defining certain SMP topologies [1]. The reasoning behind t=
he change is
> > > > > > > > explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop=
 updating
> > > > > > > > cpu_core_mask"). In short, cpu_core_mask logic was causing =
troubles with
> > > > > > > > large VMs with lots of CPUs and was changed by cpu_cpu_mask=
 because, as
> > > > > > > > far as the kernel understanding of SMP topologies goes, bot=
h masks are
> > > > > > > > equivalent.
> > > > > > > >=20
> > > > > > > > Further discussions in the kernel mailing list [2] shown th=
at the
> > > > > > > > powerpc kernel always considered that the number of sockets=
 were equal
> > > > > > > > to the number of NUMA nodes. The claim is that it doesn't m=
ake sense,
> > > > > > > > for Power hardware at least, 2+ sockets being in the same N=
UMA node. The
> > > > > > > > immediate conclusion is that all SMP topologies the pseries=
 machine were
> > > > > > > > supplying to the kernel, with more than one socket in the s=
ame NUMA node
> > > > > > > > as in [1], happened to be correctly represented in the kern=
el by
> > > > > > > > accident during all these years.
> > > > > > > >=20
> > > > > > > > There's a case to be made for virtual topologies being deta=
ched from
> > > > > > > > hardware constraints, allowing maximum flexibility to users=
=2E At the same
> > > > > > > > time, this freedom can't result in unrealistic hardware rep=
resentations
> > > > > > > > being emulated. If the real hardware and the pseries kernel=
 don't
> > > > > > > > support multiple chips/sockets in the same NUMA node, neith=
er should we.
> > > > > > > >=20
> > > > > > > > Starting in 6.0.0, all sockets must match an unique NUMA no=
de in the
> > > > > > > > pseries machine. qtest changes were made to adapt to this n=
ew
> > > > > > > > condition.
> > > > > > >=20
> > > > > > > Oof.  I really don't like this idea.  It means a bunch of fid=
dly work
> > > > > > > for users to match these up, for no real gain.  I'm also conc=
erned
> > > > > > > that this will require follow on changes in libvirt to not ma=
ke this a
> > > > > > > really cryptic and irritating point of failure.
> > > > > >=20
> > > > > > Haven't though about required Libvirt changes, although I can s=
ay that there
> > > > > > will be some amount to be mande and it will probably annoy exis=
ting users
> > > > > > (everyone that has a multiple socket per NUMA node topology).
> > > > > >=20
> > > > > > There is not much we can do from the QEMU layer aside from what=
 I've proposed
> > > > > > here. The other alternative is to keep interacting with the ker=
nel folks to
> > > > > > see if there is a way to keep our use case untouched.
> > > > >=20
> > > > > Right.  Well.. not necessarily untouched, but I'm hoping for more
> > > > > replies from C=E9dric to my objections and mpe's.  Even with sock=
ets
> > > > > being a kinda meaningless concept in PAPR, I don't think tying it=
 to
> > > > > NUMA nodes makes sense.
> > > >=20
> > > > I did a couple of replies in different email threads but maybe not
> > > > to all. I felt it was going nowhere :/ Couple of thoughts,
> > >=20
> > > I think I saw some of those, but maybe not all.
> > >=20
> > > > Shouldn't we get rid of the socket concept, die also, under pseries
> > > > since they don't exist under PAPR ? We only have numa nodes, cores,
> > > > threads AFAICT.
> > >=20
> > > Theoretically, yes.  I'm not sure it's really practical, though, since
> > > AFAICT, both qemu and the kernel have the notion of sockets (though
> > > not dies) built into generic code.
> >=20
> > Yes. But, AFAICT, these topology notions have not reached "arch/powerpc"
> > and PPC Linux only has a NUMA node id, on pseries and powernv.
> >=20
> > > It does mean that one possible approach here - maybe the best one - is
> > > to simply declare that sockets are meaningless under, so we simply
> > > don't expect what the guest kernel reports to match what's given to
> > > qemu.
> > >=20
> > > It'd be nice to avoid that if we can: in a sense it's just cosmetic,
> > > but it is likely to surprise and confuse people.
> > >=20
> > > > Should we diverged from PAPR and add extra DT properties "qemu,..."=
 ?
> > > > There are a couple of places where Linux checks for the underlying
> > > > hypervisor already.
> > > >=20
> > > > > > This also means that
> > > > > > 'ibm,chip-id' will probably remain in use since it's the only p=
lace where
> > > > > > we inform cores per socket information to the kernel.
> > > > >=20
> > > > > Well.. unless we can find some other sensible way to convey that
> > > > > information.  I haven't given up hope for that yet.
> > > >=20
> > > > Well, we could start by fixing the value in QEMU. It is broken
> > > > today.
> > >=20
> > > Fixing what value, exactly?
> >=20
> > The value of the "ibm,chip-id" since we are keeping the property under
> > QEMU.
>=20
> David, I believe this has to do with the discussing we had last Friday.
>=20
> I mentioned that the ibm,chip-id property is being calculated in a way th=
at
> promotes the same ibm,chip-id in CPUs that belongs to different NUMA node=
s,
> e.g.:
>=20
> -smp 4,cores=3D4,maxcpus=3D8,threads=3D1 \
> -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=3Dram-node0 \
> -numa node,nodeid=3D1,cpus=3D2-3,cpus=3D6-7,memdev=3Dram-node1
>=20
>=20
> $ dtc -I dtb -O dts fdt.dtb | grep -B2 ibm,chip-id
> 			ibm,associativity =3D <0x05 0x00 0x00 0x00 0x00 0x00>;
> 			ibm,pft-size =3D <0x00 0x19>;
> 			ibm,chip-id =3D <0x00>;
> --
>                       ibm,associativity =3D <0x05 0x00 0x00 0x00 0x00 0x0=
1>;
>                       ibm,pft-size =3D <0x00 0x19>;
>                       ibm,chip-id =3D <0x00>;
> --
>                       ibm,associativity =3D <0x05 0x01 0x01 0x01 0x01 0x0=
2>;
>                       ibm,pft-size =3D <0x00 0x19>;
>                       ibm,chip-id =3D <0x00>;
> --
>                       ibm,associativity =3D <0x05 0x01 0x01 0x01 0x01 0x0=
3>;
>                       ibm,pft-size =3D <0x00 0x19>;
>                       ibm,chip-id =3D <0x00>;

> We assign ibm,chip-id=3D0x0 to CPUs 0-3, but CPUs 2-3 are located in a
> different NUMA node than 0-1. This would mean that the same socket
> would belong to different NUMA nodes at the same time.

Right... and I'm still not seeing why that's a problem.  AFAICT that's
a possible, if unexpected, situation under real hardware - though
maybe not for POWER9 specifically.

> I believe this is what Cedric wants to be addressed. Given that the
> property is called after the OPAL property ibm,chip-id, the kernel
> expects that the property will have the same semantics as in OPAL.

Even on powernv, I'm not clear why chip-id is tied into the NUMA
configuration, rather than getting all the NUMA info from
associativity properties.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TmByOVgTraLexm/f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBjyOMACgkQbDjKyiDZ
s5IXKw//ecbYeLvqGYGWQNcuo+r1b3zxV9MPeMoHSLYWK+tc6dTQJ644aaC27Wlh
Lb0jXNI6Mcgrz5aXc+BFT7WfW3+g1eYI2OygvKru+3HLsSy1/Z58sZplnr1eeLMW
ouE6PBd4sm1FUVeO1zlnNGWo1MY/McllfIxW+OSLaeAaEUacPevNWWGXeRf1MAo0
iHCFW6DaYN9Fx0IuwOeZ5lNnbnrku+pWdHXIbYEUZIaPmbLH+AQnNK3/KMVhh3s7
MOt5ILer79gJmgmFe1H3+zicQy6oFDGQQriVDGQ7iZSc2vOxTWAuXzaiGJeOCOwN
fw2f0XIBIGJEzK7U86RJazjn1tYk96nkVMq62r+fOB4bjd0v66KlXO9MFzQiXCgn
Wu0kPpCZUwookMvHX3Fw5CMNzDs4t0QypBPrF3834JPrKx1HB03cYyoYQg2UU+8a
M8PZ4zmTDB/lqpCHfpCLpnMK2Monah5lLOaXzCTjzjL0dtgWOF9WiHpy94wZX+T5
HBNJPNM6jb1MlbozMbCgqg/2FzhQ3bcByvmQ9Pq21PcDE7dVigImD/QiczS5dfUl
DVubLe8YUyykPDH1ZBkstKozp86qeQfhX4LLpyelsa5URnGFhRW6FqLyZNiEuJj1
bdKbgseHoV01zWFllTALA+DvNKmGNHFSm0ak7u2TKXDenTlI1QA=
=Zte5
-----END PGP SIGNATURE-----

--TmByOVgTraLexm/f--

