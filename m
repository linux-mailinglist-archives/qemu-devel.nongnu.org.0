Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2134C2B2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 06:26:11 +0200 (CEST)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQjTe-0006Gb-UW
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 00:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQjOY-0007rH-Hr; Mon, 29 Mar 2021 00:20:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:32961 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lQjOV-00005s-EN; Mon, 29 Mar 2021 00:20:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F7zs94zqTz9sW1; Mon, 29 Mar 2021 15:20:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616991645;
 bh=vFMsSFWaRK5x/SQHzfdTuJeLkTjvHRJTo/CMCPtSIFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mrdB1zP6BfwW4pMnXqIK2DRYSz0YvT2W4/RDRuzawgaCKqXg5Ph6CDxB+DbUEcTQT
 pB8kKc4T6Nsxtv/Tx67lexWdTwvQI5ngP0AHasYC+byNSQIsq6aE/BRlBug6QhB+8u
 hGcTPMOrAEh/m8BC7qGjqquh6bN68NCMa85w2LTE=
Date: Mon, 29 Mar 2021 15:20:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
Message-ID: <YGFVc2lBhvzm5CSa@yekko.fritz.box>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TycEa0V0pv7Sj2sF"
Content-Disposition: inline
In-Reply-To: <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
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
 Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TycEa0V0pv7Sj2sF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 09:56:04AM +0100, C=E9dric Le Goater wrote:
> On 3/25/21 3:10 AM, David Gibson wrote:
> > On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza wrote:
> >>
> >>
> >> On 3/22/21 10:03 PM, David Gibson wrote:
> >>> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wro=
te:
> >>>> Kernel commit 4bce545903fa ("powerpc/topology: Update
> >>>> topology_core_cpumask") cause a regression in the pseries machine wh=
en
> >>>> defining certain SMP topologies [1]. The reasoning behind the change=
 is
> >>>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
> >>>> cpu_core_mask"). In short, cpu_core_mask logic was causing troubles =
with
> >>>> large VMs with lots of CPUs and was changed by cpu_cpu_mask because,=
 as
> >>>> far as the kernel understanding of SMP topologies goes, both masks a=
re
> >>>> equivalent.
> >>>>
> >>>> Further discussions in the kernel mailing list [2] shown that the
> >>>> powerpc kernel always considered that the number of sockets were equ=
al
> >>>> to the number of NUMA nodes. The claim is that it doesn't make sense,
> >>>> for Power hardware at least, 2+ sockets being in the same NUMA node.=
 The
> >>>> immediate conclusion is that all SMP topologies the pseries machine =
were
> >>>> supplying to the kernel, with more than one socket in the same NUMA =
node
> >>>> as in [1], happened to be correctly represented in the kernel by
> >>>> accident during all these years.
> >>>>
> >>>> There's a case to be made for virtual topologies being detached from
> >>>> hardware constraints, allowing maximum flexibility to users. At the =
same
> >>>> time, this freedom can't result in unrealistic hardware representati=
ons
> >>>> being emulated. If the real hardware and the pseries kernel don't
> >>>> support multiple chips/sockets in the same NUMA node, neither should=
 we.
> >>>>
> >>>> Starting in 6.0.0, all sockets must match an unique NUMA node in the
> >>>> pseries machine. qtest changes were made to adapt to this new
> >>>> condition.
> >>>
> >>> Oof.  I really don't like this idea.  It means a bunch of fiddly work
> >>> for users to match these up, for no real gain.  I'm also concerned
> >>> that this will require follow on changes in libvirt to not make this a
> >>> really cryptic and irritating point of failure.
> >>
> >> Haven't though about required Libvirt changes, although I can say that=
 there
> >> will be some amount to be mande and it will probably annoy existing us=
ers
> >> (everyone that has a multiple socket per NUMA node topology).
> >>
> >> There is not much we can do from the QEMU layer aside from what I've p=
roposed
> >> here. The other alternative is to keep interacting with the kernel fol=
ks to
> >> see if there is a way to keep our use case untouched.
> >=20
> > Right.  Well.. not necessarily untouched, but I'm hoping for more
> > replies from C=E9dric to my objections and mpe's.  Even with sockets
> > being a kinda meaningless concept in PAPR, I don't think tying it to
> > NUMA nodes makes sense.
>=20
> I did a couple of replies in different email threads but maybe not=20
> to all. I felt it was going nowhere :/ Couple of thoughts,

I think I saw some of those, but maybe not all.

> Shouldn't we get rid of the socket concept, die also, under pseries=20
> since they don't exist under PAPR ? We only have numa nodes, cores,=20
> threads AFAICT.

Theoretically, yes.  I'm not sure it's really practical, though, since
AFAICT, both qemu and the kernel have the notion of sockets (though
not dies) built into generic code.

It does mean that one possible approach here - maybe the best one - is
to simply declare that sockets are meaningless under, so we simply
don't expect what the guest kernel reports to match what's given to
qemu.

It'd be nice to avoid that if we can: in a sense it's just cosmetic,
but it is likely to surprise and confuse people.

> Should we diverged from PAPR and add extra DT properties "qemu,..." ?
> There are a couple of places where Linux checks for the underlying=20
> hypervisor already.
>=20
> >> This also means that
> >> 'ibm,chip-id' will probably remain in use since it's the only place wh=
ere
> >> we inform cores per socket information to the kernel.
> >=20
> > Well.. unless we can find some other sensible way to convey that
> > information.  I haven't given up hope for that yet.
>=20
> Well, we could start by fixing the value in QEMU. It is broken
> today.

Fixing what value, exactly?

> This is all coming from some work we did last year to evaluate our HW=20
> (mostly for XIVE) on 2s, 4s, 16s systems on baremetal, KVM and PowerVM.=
=20
> We saw some real problems because Linux did not have a clear view of the=
=20
> topology. See the figures here :=20
>=20
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210303174857.176=
0393-9-clg@kaod.org/
>=20
> The node id is a key parameter for system resource management, memory=20
> allocation, interrupt affinity, etc. Linux scales much better if used
> correctly.

Well, sure.  And we have all the ibm,associativity stuff to convey the
node ids to the guest (which has its own problems, but not that are
relevant here).  What's throwing me is why getting node IDs correct
has anything to do with socket numbers.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TycEa0V0pv7Sj2sF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBhVXMACgkQbDjKyiDZ
s5LGxg/+Ib22T2nP40+G0HL6vwSe23egD/QIseN6FDJbpdgZZxSKH3aIj5eSWSS7
Mo2ILkFFLq2L3XCvG3ogp7geHyMxqQFAcpyjwN2Btp8hFcbxZL8R1fvPHAsRhL1S
wjgIXv/ZDmQr5BOhkno7pZXAGN7CbgCIWhWKFctNd1H4VJzeFpovsCZj9YClTsLw
JZ4cmPm55cHC3xE7GmC/9mhwFUJKJIcRdsh1fLLllh/7XgmqqHeqpCYd2SkWT7K0
eegrTGxIfb7acttkwwdCSAkwjsMkI77Ip9YMZYOY14GsPAMe+D3O7q+cpOPA5s5a
9bQPX/nFF5gK1/TYQoPAoojtU174E6hlSo2PDN+vv1EL3t68CHI/M8dpJBsKw3La
Apt1FGNjGQ+y7CkEe/JQaTmQNNe++n6mq2pk4G4QfRFi9IGS4sn+BYAxrXoC+Sq3
SohNEL13461ZfPsHjDexLs37sEMLxZyop0Fqy+X0Zb8vhP8GIXHvklNjpzxXubNC
v8Vd0GVUhuzCySAnnwv4LMsK8QjhnpaJMAz7fVHe6IVD7jpe3Lq2wJd5Yk2m4XyI
ESPoWlcW89iAmP+TM6wTAD/aVpfEeqJX5vHetDGOzauBHpPfx7hZP792TfhDmtWC
WSB08cifDiX8Kl04my9W1qOdfqDyTyLt8zjMmL44wMHlkVp+0NE=
=HF0E
-----END PGP SIGNATURE-----

--TycEa0V0pv7Sj2sF--

