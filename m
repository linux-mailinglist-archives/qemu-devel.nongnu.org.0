Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81D3C2217
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 12:13:13 +0200 (CEST)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1nVP-0005ou-Jw
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 06:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1nQo-0004r4-KW; Fri, 09 Jul 2021 06:08:26 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1nQl-0007ea-H2; Fri, 09 Jul 2021 06:08:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A1314320091B;
 Fri,  9 Jul 2021 06:08:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 09 Jul 2021 06:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PQnknlQNEPznRRXMqjMiqpHXk4v
 peOAqOACEzBTiHQo=; b=T9TF212JrxtU0bm19T9FfTYZlRIBUa1xfcYjsun6u7p
 XE5QHlJy8mzv+ti3+541DD1lOgqoKPpxhUVBR6zueX5vAleTUO+qGq5fKcsEjv1p
 r9YrD3uJPHtUucNmNgQjbAX/o1a+vAuegSag6GxrT9S7SWbvBaEGGUYzAlLbYP4h
 bL1evVC26hW3/BW6AMT30fHiMO4VcgzQZ8lrcaxFfaPz2Hs52xxKcMpiUxQBeRsI
 P5igFZb28qgvtXKzNq6WQqq8kP7mRyknkgZJHVBSg/QAHqyaQboRp7hvuMpJPgAP
 BtZrv/Q2sN3IsbTojT1s1hy1XXz+vve/B7FYFkuv71g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PQnknl
 QNEPznRRXMqjMiqpHXk4vpeOAqOACEzBTiHQo=; b=A9N/4ele7dP6jFzFWo5n41
 o6vex3yzjBiP/wyJToZUld0uy/6dG2nSGH/BRUQbVx9dq41CTwbitFVjbZBl980L
 KqV6cYjPoTigoCBE63rQZZa2TPuMGX0Jjs8zL4qQo8CBecQxKiMN4DvtMWNhZrjr
 PZtUwCxgP/K5h+AqIcLzCSj84sJtKG4Zpx9H2nGIK4whC39WMN8Tq0XIjy9SFf7Z
 TkNTi7lOMYQpC367nw8PS3LJ9MXEG/Aq7Sw7tDdkxOVwwnd0PyTuDNgBZn1CmPgo
 KsuSVZVsbbmuTpQiPrluMDNUaihTZejxMXMnVrGtsAuv4clh8yRMUw315WmnfEAg
 ==
X-ME-Sender: <xms:EyDoYHVi7_qAFqY6DpgrzZubonRFTY3NiqhKsFx5jxacOsSw3Pz2sQ>
 <xme:EyDoYPklNGyKH5o2mBlXAb-z3aReTMleqDSwjeDrvK8Qtx6Zy98OVbsLh3gTa7JjM
 6z9Z7XXEujCFtwLu5s>
X-ME-Received: <xmr:EyDoYDY5PtNfPO2dB99DGaWhgo2jIMSDKSOgn-vqhXqbcu-sZG2xlAnOEtLXJsGKHiFGMNU53P0dNawHr0AXREoyP5qKjBJS-cuJkhqjwPBezipDPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeigddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:EyDoYCVMkK9IrioJ_GBqYwT1cPdVi8b8PmYPqIyPJH1IsV1I0xHaOw>
 <xmx:EyDoYBluOek7D5Q8h5jIb558ALgTk_j6RPuspEJ7xUiHGumKd7w9ZA>
 <xmx:EyDoYPfyUJQoJOTG9p0YI1o7a37Uc56LAo4lcVaj9hP2683KnNIgyQ>
 <xmx:FCDoYKBCNyn5_hkeKEyeEn5pjsGRVLiidlp-eJRPzs6-hwVm0N58Ow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 06:08:18 -0400 (EDT)
Date: Fri, 9 Jul 2021 12:08:15 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v2 0/4] hw/nvme: fix controller hotplugging
Message-ID: <YOggD+rcP5Tt9HWH@apples.localdomain>
References: <20210707154936.200166-1-its@irrelevant.dk>
 <YOfnDBwya58drDZk@apples.localdomain>
 <4366b9c6-8b8a-a682-9213-740c3088f1b1@suse.de>
 <YOfy/tt/5jgi48uU@apples.localdomain>
 <770d94fe-305c-e38f-8c5a-c4bd41d6e84f@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hy5KyIBmHFc0049N"
Content-Disposition: inline
In-Reply-To: <770d94fe-305c-e38f-8c5a-c4bd41d6e84f@suse.de>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Hy5KyIBmHFc0049N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  9 10:51, Hannes Reinecke wrote:
> On 7/9/21 8:55 AM, Klaus Jensen wrote:
> > On Jul=C2=A0 9 08:16, Hannes Reinecke wrote:
> > > On 7/9/21 8:05 AM, Klaus Jensen wrote:
> > > > On Jul=C2=A0 7 17:49, Klaus Jensen wrote:
> > > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > > >=20
> > > > > Back in May, Hannes posted a fix[1] to re-enable NVMe PCI hotplug=
=2E We
> > > > > discussed a bit back and fourth and I mentioned that the core iss=
ue was
> > > > > an artifact of the parent/child relationship stemming from the qd=
ev
> > > > > setup we have with namespaces attaching to controller through a q=
dev
> > > > > bus.
> > > > >=20
> > > > > The gist of this series is the fourth patch "hw/nvme: fix
> > > > > controller hot
> > > > > unplugging" which basically causes namespaces to be reassigned to=
 a bus
> > > > > owned by the subsystem if the parent controller is linked to one.=
 This
> > > > > fixes `device_del/add nvme` in such settings.
> > > > >=20
> > > > > Note, that in the case that there is no subsystem involved,
> > > > > nvme devices
> > > > > can be removed from the system with `device_del`, but this *will*=
 cause
> > > > > the namespaces to be removed as well since there is no place (i.e=
=2E no
> > > > > subsystem) for them to "linger". And since this series does not a=
dd
> > > > > support for hotplugging nvme-ns devices, while an nvme device can=
 be
> > > > > readded, no namespaces can. Support for hotplugging nvme-ns devic=
es is
> > > > > present in [1], but I'd rather not add that since I think '-device
> > > > > nvme-ns' is already a bad design choice.
> > > > >=20
> > > > > Now, I do realize that it is not "pretty" to explicitly change the
> > > > > parent bus, so I do have a an RFC patch in queue that replaces the
> > > > > subsystem and namespace devices with objects, but keeps -device s=
hims
> > > > > available for backwards compatibility. This approach will solve t=
he
> > > > > problems properly and should be a better model. However, I
> > > > > don't believe
> > > > > it will make it for 6.1 and I'd really like to at least fix the
> > > > > unplugging for 6.1 and this gets the job done.
> > > > >=20
> > > > > =C2=A0[1]: 20210511073511.32511-1-hare@suse.de
> > > > >=20
> > > > > v2:
> > > > > - added R-b's by Hannes for patches 1 through 3
> > > > > - simplified "hw/nvme: fix controller hot unplugging"
> > > > >=20
> > > > > Klaus Jensen (4):
> > > > > =C2=A0hw/nvme: remove NvmeCtrl parameter from ns setup/check func=
tions
> > > > > =C2=A0hw/nvme: mark nvme-subsys non-hotpluggable
> > > > > =C2=A0hw/nvme: unregister controller with subsystem at exit
> > > > > =C2=A0hw/nvme: fix controller hot unplugging
> > > > >=20
> > > > > hw/nvme/nvme.h=C2=A0=C2=A0 | 18 +++++++++-------
> > > > > hw/nvme/ctrl.c=C2=A0=C2=A0 | 14 ++++++------
> > > > > hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0 | 55 +++++++++++++++++++++++=
++++++++-----------------
> > > > > hw/nvme/subsys.c |=C2=A0 9 ++++++++
> > > > > 4 files changed, 63 insertions(+), 33 deletions(-)
> > > > >=20
> > > > > --=20
> > > > > 2.32.0
> > > > >=20
> > > >=20
> > > > Applied patches 1 through 3 to nvme-next.
> > >=20
> > > So, how do we go about with patch 4?
> > > Without it this whole exercise is a bit pointless, seeing that it
> > > doesn't fix anything.
> > >=20
> >=20
> > Patch 1-3 are fixes we need anyway, so I thought I might as well apply
> > them :)
> >=20
> > > Shall we go with that patch as an interim solution?
> > > Will you replace it with your 'object' patch?
> > > What is the plan?
> > >=20
> >=20
> > Yes, if acceptable, I would like to use patch 4 as an interim solution.
> > We have a bug we need to fix for 6.1, and I believe this does the job.
> >=20
> Oh, yes, it does. But it's ever so slightly ugly with the reparenting stu=
ff.
> But if that's considered an interim solution I'm fine with it.
>=20

Definitely interim.

> You can add my 'Reviewed-by: Hannes Reinecke <hare@suse.de>' tag if you
> like.
>=20

Thanks mate!

> > I considered changing the existing nvme-bus to be on the main system
> > bus, but then we break the existing behavior that the namespaces attach
> > to the most recently defined controller in the absence of the shared
> > parameter or an explicit bus parameter.
> >=20
> Do we?

Yes, I believe so. Right now there is an implicit and documented
behavior that an nvme-ns device attaches to the most recently defined
nvme device (due to the implicit bus attachment). If we move the bus
=66rom the controller so that the namespace plugs into the subsystem when
realized, then we break existing setups since the namespace won't know
what controller to "attach to" without an additional parameter. Right
now, this is determined by inspecting the parent of the bus it plugged
into.

> My idea was to always attach a namespace to a subsystem (and, if not
> present, create one). The controller would then 'link' to that subsystem.
> The subsystem would have a 'shared' attribute, which would determine if m=
ore
> than one controller can be 'linked' to it.
>=20

Hmm, why would we want to have a subsystem restricted to one controller?
Or do you mean namespace? Because we already have a 'shared' parameter
for that.

> That way we change the relationship between the controller and the
> namespace, as then the namespace would be a child of the subsystem,
> and the namespace would need to be detached separately from the controlle=
r.
>=20
> But it fits neatly into the current device model, except the slightly
> awkward 'link' thingie.
>=20
> > Wrt. "the plan", right now, I see two solutions going forward:
> >=20
> > 1. Introduce new -object's for nvme-nvm-subsystem and nvme-ns
> >  =C2=A0=C2=A0 This is the approach that I am taking right now and it wo=
rks well.
> > It allows many-to-many relationships and separates the life times of
> > subsystems, namespaces and controllers like you mentioned.
> >=20
>=20
> Ah. Would like to see that path, then.
>=20
> >  =C2=A0=C2=A0 Conceptually, I also really like that the subsystem and n=
amespace
> > are not "devices". One could argue that the namespace is comparable to a
> > SCSI LUN (-device scsi-hd, right?), but where the SCSI LUN actually
> > "shows up" in the host, the nvme namespace does not.
> >=20
>=20
> Well, 'devices' really is an abstraction, and it really depends on what y=
ou
> declare a device is. But yes, in the QDEV sense with its strict inheritan=
ce
> the nvme topology is not a good fit, agreed.
>=20
> As for SCSI: the namespace is quite comparable to a SCSI LUN; the NVMe
> controller is roughly equivalent to the 'initiator' on SCSI, and the
> subsystem would match up to the SCSI target.
>=20
> The problem for NVMe is that the whole NVMe-over-Fabrics stuff was layered
> on top of the existing NVMe-PCI spec, so that the 'subsystem' only truly
> exists for NVMe-over-Fabrics; for PCI you don't actually need it, and ind=
eed
> some NVMe PCI devices don't even fill out these values.
> And it makes things tricky for qemu, as the nvme emulation is actually ba=
sed
> on the pre-fabrics spec, hence subsystem concept was never implemented
> properly.
>=20
> >  =C2=A0=C2=A0 My series handles backwards compatibility by keeping -dev=
ice "shims"
> > =C2=A0=C2=A0 around that just wraps the new objects but behaves like it=
 used to.
> > =C2=A0=C2=A0 The plan would be to deprecate these devices.
> >=20
>=20
> Or keeping the '-device' shims around for just nvme-pci, and require -obj=
ect
> specification if one would want to use nvme-over-fabrics.
>=20

I actually hadn't considered that, but you are right that moving
functionality into the objects has the additional advantage of maybe
better supporting the implementation of non-pci devices down the road.

> >  =C2=A0=C2=A0 The downside to this approach is that it moves the subsys=
tem and
> > namespaces out of the "qdev tree (info qtree)" and into the pure QOM
> > "/objects" tree. Instead of qtree, we can have QMP and HMP commands
> > for introspection.
> >=20
>=20
> Serves them right for introducing tons of different abstractions.
> Not a problem from my side.
>=20
> > 2. Make the subsystem a "system bus device"
> >  =C2=A0=C2=A0 This way we add an "nvme-nvm-subsystems" bus as a direct =
child of
> > the main system bus, and we can possibly get rid of the explicit -device
> > nvme-subsys as well. We change the namespace device to plug into that
> > instead. The nvme controller device still needs to plug into the PCI
> > bus, so it cannot be a child of the subsystems bus, but can keep using a
> > link parameter to hook into the subsystem and attach to any namespaces
> > it would like.
> >=20
>=20
> I don't think we can or should do away with the subsystem; that's quite a
> central structure in the nvme-oF spec, and trying to create an abstraction
> without it will just lead to lots of duplicated identification, not to
> mention the increased complexity during lookup
> (As per spec, the controller connects to a subsystem, and the subsystem
> presents the namespaces. Abstracting away the subsystem would mean that y=
ou
> have to have lots of tracking in the individual namespace, with lots of
> possibilities to get it wrong.)
>=20

I tend to agree, having the subsystem explicit is preferable.

> But from my perspective it should be perfectly feasible to have the
> subsystem a child of the main/system bus, and the controller a child of t=
he
> PCI bus.
>=20
> As mentioned above, that would break the implicit destruction of the
> namespace when detaching the controller, but one could argue that that's
> exactly the point, seeing that several controllers can have access to the
> same namespace.
>=20
> >  =C2=A0=C2=A0 I'm unsure if we can do this without deprecating the exis=
ting
> > namespace device, just like option 1.
> >=20
> >  =C2=A0=C2=A0 I have not implemented this, so I need to look more into =
it. It
> > seems like the main thing that this gives us compared to 1) is `info
> > qtree`support and we still end up just "wiring" namespace attachment
> > with backlinks anyway.
> >=20
>=20
> Yeah, we'll have to do wiring one way or other.
>=20
> > I'm not sure what I would prefer, but I've found that implementing it as
> > -object's is a breath of fresh air and as I mentioned, conceptually, I
> > like option 1 because namespaces are -objects and not -devices.
> >=20
>=20
> Sure. I just tend leave the infrastructure questions to those actively
> working with the qemu community. I've found the qemu development process =
to
> be too unwieldy for me to make more than the random contribution.
>=20
> > And, by the way, thanks for chipping in on this Hannes, I had sort of
> > crossed off option 2 before you showed up and threw some ideas in the
> > air ;)
>=20
> Sure.
> I could give it a go at option 2); patch 4 should be a good starting poin=
t.
> And shouldn't be too hard to implement, either.
>=20
> Then we can compare results and make a judgement call.
>=20

Yeah, basically the "unattached" bus that I create explicitly in patch 4
now would now be rooted on the System bus. But I still can't see how not
to break the existing behavior of how namespaces attaches to controllers
implicitly without keeping the reparenting in place.

--Hy5KyIBmHFc0049N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDoIA4ACgkQTeGvMW1P
Dek7+wgAuQW85AFvdKme9tAw0w5LGgKMBfQTavizmsPM2XuFewEIF5Rw58tObKbj
KWE/B0qTQgMjMppEzOrqtBTzpK67pNmeZlWxc4rEu3UyBw8svSM9bjIJX/PnIuSk
8I56WP4Y2tSZfSarI8vItkFI6CkW2QI+qWyb95EKUD8rNXSn7gNQXCUndNUmTZ+p
nAhih82fIaXhQRUKjHtRhuUqGpCwG7nLukOCv7TJfWjU5uUa3Ma5AhaOeE3LOrP9
GnL5VAIYiaJJif2januqRmC+DyZIiLqSCPvHB6EXa5rN5qqIwS5+iJsOPtxxQrMm
hUDXZzuLgkZ1PrWcP4Sk2c1h+00pug==
=daJL
-----END PGP SIGNATURE-----

--Hy5KyIBmHFc0049N--

