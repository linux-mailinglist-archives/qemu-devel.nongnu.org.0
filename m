Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2F6312F53
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 11:44:59 +0100 (CET)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l942N-0006x9-0Y
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 05:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l904Z-0002T4-CL; Mon, 08 Feb 2021 01:31:08 -0500
Received: from ozlabs.org ([203.11.71.1]:33317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l904K-0006fN-G7; Mon, 08 Feb 2021 01:30:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYx3S6jMPz9sVJ; Mon,  8 Feb 2021 17:30:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612765828;
 bh=yL5gkUEvSXGorxow2WTHl8Hrb3FyQ7YteuQogpgaLIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MkEuGJwa5VmSmfgszyeo4voy+DgreILWhW+FtVGU910ilAbQJJPHIZ+xucm88LguF
 ChjqI2ncDjvfI12rnfepmbUh6DeMiiNU4r0RdoI6EnK60Q1surybtpyroVsUnkAwhX
 +VSpwBIVukqvmWvadN+47LLPnm1t7eDyNQFEjIC4=
Date: Mon, 8 Feb 2021 17:30:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 6/6] spapr: Model DR connectors as simple objects
Message-ID: <20210208063023.GB40668@yekko.fritz.box>
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-7-groug@kaod.org>
 <20201228082839.GL6952@yekko.fritz.box>
 <20210106191536.4d4c4991@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline
In-Reply-To: <20210106191536.4d4c4991@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 07:15:36PM +0100, Greg Kurz wrote:
> On Mon, 28 Dec 2020 19:28:39 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Fri, Dec 18, 2020 at 11:34:00AM +0100, Greg Kurz wrote:
> > > Modeling DR connectors as individual devices raises some
> > > concerns, as already discussed a year ago in this thread:
> > >=20
> > > https://patchew.org/QEMU/20191017205953.13122-1-cheloha@linux.vnet.ib=
m.com/
> > >=20
> > > First, high maxmem settings creates too many DRC devices.
> > > This causes scalability issues. It severely increase boot
> > > time because the multiple traversals of the DRC list that
> > > are performed during machine setup are quadratic operations.
> > > This is directly related to the fact that DRCs are modeled
> > > as individual devices and added to the composition tree.
> > >=20
> > > Second, DR connectors are really an internal concept of
> > > PAPR. They aren't something that the user or management
> > > layer can manipulate in any way. We already don't allow
> > > their creation with device_add by clearing user_creatable.
> > >=20
> > > DR connectors don't even need to be modeled as actual
> > > devices since they don't sit in a bus. They just need
> > > to be associated to an 'owner' object and to have the
> > > equivalent of realize/unrealize functions.
> > >=20
> > > Downgrade them to be simple objects. Convert the existing
> > > realize() and unrealize() to be methods of the DR connector
> > > base class. Also have the base class to inherit from the
> > > vmstate_if interface directly. The get_id() hook simply
> > > returns NULL, just as device_vmstate_if_get_id() does for
> > > devices that don't sit in a bus. The DR connector is no
> > > longer made a child object. This means that it must be
> > > explicitely freed when no longer needed. This is only
> > > required for PHBs and PCI bridges actually : have them to
> > > free the DRC with spapr_dr_connector_free() instead of
> > > object_unparent().
> > >=20
> > > No longer add the DRCs to the QOM composition tree. Track
> > > them with a glib hash table using the global DRC index as
> > > the key instead. This makes traversal a linear operation.
> >=20
> > I have some reservations about this one.  The main thing is that
> > attaching migration state to something that's not a device seems a bit
> > odd to me.  AFAICT exactly one other non-device implements
> > TYPE_VMSTATE_IF, and what it does isn't very clear to me.
> >=20
>=20
> Even with your proposal below, the current SpaprDrc type, which is
> used all over the place, will stop being a TYPE_DEVICE but we still
> need to support migration with existing machine types for which DRC
> are devices.

Ah... that's a good point.

> Implementing TYPE_VMSTATE_IF is essentially a hack that
> allows to do that without keeping the current TYPE_DEVICE based
> implementation around.

Ok, that makes things clearer.

> > As I might have mentioned to you I had a different idea for how to
> > address this problem: still use a TYPE_DEVICE, but have it manage a
> > whole array of DRCs as one unit, rather than just a single one.
> > Specifically I was thinking:
> >=20
> > * one array per PCI bus (DRCs for each function on the bus)
> > * one array for each block of memory (so one for base memory, one for
> >   each DIMM)
> > * one array for all the cpus
> > * one array for all the PHBs
> >=20
> > It has some disadvantages compared to your scheme: it still leaves
> > (less) devices which can't be user managed, which is a bit ugly.  On
> > the other hand, each of those arrays can reasonably be dense, so we
> > can use direct indexing rather than a hash table, which is a bit
> > nicer.
> >=20
> > Thoughts?
> >=20
>=20
> I find it a bit overkill to introduce a new TYPE_DEVICE (let's
> call it a DRC manager) for something that:
> - doesn't sit on a bus
> - can't be user managed
> - isn't directly represented to the guest as a full node
>   in the DT unlike all other devices, but just as indexes
>   in some properties of actual DR capable devices.
>=20
> Given that the DRC index space is global and this is what
> the guest passes to DR RTAS calls, we can't do direct
> indexing, strictly speaking. We need at least some logic
> to dispatch operations on individual DRC states to the
> appropriate DRC manager. This logic belongs to the machine
> IMHO.
>=20
> This shouldn't be too complex for CPUs and PHBs since they
> sit directly under the machine and have 1:1 relation with
> the attached device. It just boils down to instantiate
> some DRC managers during machine init:
>=20
> - range [ 0x10000000 ... 0x10000000 + ${max_cpus} [
>   for CPUs
> - range [ 0x20000000 ... 0x20000000 + 31 [
>   for PHBs
>=20
> For memory, the code currently generates DRC indexes in the range:
>=20
> [ 0x80000000 ... 0x80000000 + ${base_ram_size}/256M ... ${max_ram_size}/2=
56M [
>=20
> ie. it doesn't generate DRC indexes for the base memory AFAICT. Also
> each DIMM can be of arbitrary size, ie. consume an arbitrary amount
> of DRC indexes. So the machine would instantiate SPAPR_MAX_RAM_SLOTS (32)
> DRC managers, each capable of managing the full set of LMB DRCs, just
> in case ? Likely a lot of zeroes with high maxmem settings but I guess
> we can live with it.

Actually, I was thinking of just a single manager for all the
(pluggable) LMB DRCs, a single manager for all CPU DRCs, a single
manager for all PHB DRCs and one per bus for PCI DRCs.  I'm not
assuming a 1:1 correspondance between manager and user side hotplug
operations.

Although... actually the "manager" could be an interface rather than
an object, in which case the DRC manager would be the machine for
LMBs, CPUs, and PHBs and the parent bus for each PCI slot.

> PCI busses would need some extra care though since the machine
> doesn't know about them. This would require to be able to
> register/unregister DRC managers for SPAPR_DR_CONNECTOR_TYPE_PCI
> indexes, so that the dispatching logic know about the ranges
> they cover (PHB internals).

Right, but that wouldn't really be any different from the dynamic
creation of DRCs we do add_drcs() / remove_drcs() right now, except
that it would create /destroy one object instead of a bunch.

> And finally comes migration : I cannot think of a way to generate
> the VMState sections used by existing machine types out of a set
> of arrays of integers... We could keep the current implementation
> around and use it with older machine types, but this certainly
> looks terrible from a maintenance perspective. Did you have any
> suggestion to handle that ?

Ugh, yeah.. that could be difficult.

> I seem to remember that one of the motivation to have arrays
> of DRCs is to avoid the inflation of VMState sections that
> we currently get with high maxmem settings, and it is considered
> preferable to stream sparse arrays. This could be achieved by
> building these arrays out of the global DRC hash table in a machine
> pre-save handler and migrate them in a subsection for the default
> machine type. Older machine types would continue with the current
> VMState sections thanks to the TYPE_VMSTATE_IF hack.
>=20
> Does this seem a reasonable trade-off to be able to support
> older and newer machine types with the same implementation ?

Hrm, maybe, yeah.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAg2n8ACgkQbDjKyiDZ
s5JoZA/+Id0itRx+jasNSZOSmgNl5qOM8qkN80/JLGOhPaVqudGE84NtwRS2y4WD
BTnM/DiHFKjWL172HgCOVBXaMTOP+m0YujMwL9UKvLwRc3ujw8y1F/CqXPdmeov1
srVoKcY/45DW34rt06RliBxBMCaqd+2t8THRcgTmVgLzu2Qbnb4G9N67JHQDEYLc
tgMvsPBR2uccKA276449HMWg7ZX3wJsOiA32hC2Fg21BPYyVfInQO9IgkoTIvJVi
StaHY3bP/moPZFjeRIH31F8AF7aGKywh4scBLbZ6nvfUZDHQnOJKJVBnswF9B+/e
fMaZnzbbN13HEbFo+qEHfS/mrpZ1V2qmEhW3fm9OUeoKGmS0zwazGz7T60+Mib7f
w2cJgJ06E8BH7R1yhkw7BvHOMiEbpOOlwshvqvheuaaMNvQlAvL0GU/CNlSSZqRQ
KRW44WIlzen1+tms4DbCP8YZUxWMgvyIAMGUaF7veYi5pxh++U53BBEp2p6qZJjw
cniAzhFHSapkzHR5oQqV1mkAN5R44uTSrfyDTQ9XQxAU4TkPVwGJicmJwwPPi5Vc
dGJQ2cO+gH+V6LtK8BZm9rotv5OGp6iH0TEZtEw+Yttb8nf+/lza2qHLmkOO0QNZ
zEPkBlEEjtQDwb47yxoU3Nw3BnASkFO9ejxZ0DX+oeCGz6uMgyM=
=PGnx
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--

