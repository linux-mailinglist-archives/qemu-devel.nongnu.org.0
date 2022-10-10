Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C535FA2B6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:24:04 +0200 (CEST)
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwVW-0001lg-Sn
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ohwNW-0003wR-FJ; Mon, 10 Oct 2022 13:15:47 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ohwNS-0003Dw-KP; Mon, 10 Oct 2022 13:15:46 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5884F3200913;
 Mon, 10 Oct 2022 13:15:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 10 Oct 2022 13:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1665422136; x=1665508536; bh=Mm
 C3qKueAsldzX3bao2BzEqJXCmXKw9Y1dUsMJdJqRw=; b=rBWoAUsbc/LtJs2vb6
 /ujmXlFkwVBo2O9tiugZLEIJ2YRTzkCwLFzJQQOU433Vt1raUrFGdljBcoreTNk2
 YEkCX21IdoPJjCQF7uie+IHYliC2GTwp46PzfP4n9ZEFiNoK2wwrLm2V6vfXu5A8
 4cGhZxW+vS4rsHQDwKgFPRa95T4oBFTjYyzDFkVdvCX5IDl3mkcA9m/THa2eGpT0
 qEjByB/yq39btsQTQCylzu7daceszZLT2q8ow2afxkx5ZVUZpBSOwF3yj0NOBLw3
 gki9Z/+sJOjyEDjCGEiJKB8t/8cgTzh6CMXEWb0Z42AK6RPRhbvOQsZks6xvMWu0
 Gl8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665422136; x=1665508536; bh=MmC3qKueAsldzX3bao2BzEqJXCmX
 Kw9Y1dUsMJdJqRw=; b=I7C6FY57o2qQP+vTu7+Ud0iT1D9rX+XSejVvXWeAGagf
 VaIJa4b4r2+NtP/6raa++t+iNwfEoPK98IzRBf3j3A8WM3GOkX6lOKtKRtpMdaLF
 H9ElpSwrbMCqsBQxCpwPKMKUVbwXF8WydVzqsgZhEQQTZveKOCuvpIUYx4H3xr/u
 sh8uXwzTBQnpvFRolrmFpkSGH3x38dweQDkGHAlUehvTfCq7I/sH1Qh/2TtqW7lV
 J8PRCNT6IFSk8PITV+p4qraZRL6FWYV19A4WUCxUG+Qxy1V1hTpCaHV8ko7tX2CA
 eCBxm69qlMrRISs+bRGF/CpKPZFFPbUo4ArDli0H+w==
X-ME-Sender: <xms:OFNEYxZhMSkxDZwHVz1JbMjriOU-Ex8HtZ7RrgEIkFQRlIzsLtJNxw>
 <xme:OFNEY4Y2fsPgV7nvmkLWzM8sH5BjPwkP5sau0-8f_nBbkZzTIzpunX1k9wLOuliOT
 T6gT62V2u1UyocgMp4>
X-ME-Received: <xmr:OFNEYz_zoRBvub_SCiEG4SBfeSDzikc1ZG1jGW8Pmz5OtyikkibOhFfBYNkEqKbf_wcS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OFNEY_qXdrqa2ALngs1ayvvuItI_PkguPE13fchWRcSrGPsmiLrEag>
 <xmx:OFNEY8oVxRPEs5fp_ct4nAbPEm7yCFTtSSm3GR6qO11lfIi2YHUPww>
 <xmx:OFNEY1RfnD914z8ejwoaO6M4Rk70NMbwWamb8V5po1DxDWTAWqchbQ>
 <xmx:OFNEYxCodfQE_Z0fbQAEpWhYDiLUTUpMf4RB3g50--8sH2rPFTUOBw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 13:15:34 -0400 (EDT)
Date: Mon, 10 Oct 2022 19:15:08 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Daniel Wagner <wagi@monom.org>
Cc: Hannes Reinecke <hare@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <Y0RTHArVOWN2Tg2K@cormorant.local>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
 <YJqImppDvOKSbgh2@apples.localdomain>
 <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
 <YJqq6rTRTL3mxMK6@apples.localdomain>
 <7f4c0a64-582b-edc7-7362-2da45c137702@suse.de>
 <20221010170100.o326gwco547y3qrz@carbon.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TrwXkwPHFNO2JGks"
Content-Disposition: inline
In-Reply-To: <20221010170100.o326gwco547y3qrz@carbon.lan>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TrwXkwPHFNO2JGks
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Okt 10 19:01, Daniel Wagner wrote:
> On Tue, May 11, 2021 at 06:12:47PM +0200, Hannes Reinecke wrote:
> > On 5/11/21 6:03 PM, Klaus Jensen wrote:
> > > On May 11 16:54, Hannes Reinecke wrote:
> > > > On 5/11/21 3:37 PM, Klaus Jensen wrote:
> > > > > On May 11 15:12, Hannes Reinecke wrote:
> > > > > > On 5/11/21 2:22 PM, Klaus Jensen wrote:
> > > > [ .. ]
> > > > > > > The hotplug fix looks good - I'll post a series that
> > > > > > > tries to integrate
> > > > > > > both.
> > > > > > >=20
> > > > > > Ta.
> > > > > >=20
> > > > > > The more I think about it, the more I think we should be lookin=
g into
> > > > > > reparenting the namespaces to the subsystem.
> > > > > > That would have the _immediate_ benefit that 'device_del' and
> > > > > > 'device_add' becomes symmetric (ie one doesn't have to do a sep=
arate
> > > > > > 'device_add nvme-ns'), as the nvme namespace is not affected by=
 the
> > > > > > hotplug event.
> > > > > >=20
> > > > >=20
> > > > > I have that working, but I'm struggling with a QEMU API technical=
ity in
> > > > > that I apparently cannot simply move the NvmeBus creation to the
> > > > > nvme-subsys device. For some reason the bus is not available for =
the
> > > > > nvme-ns devices. That is, if one does something like this:
> > > > >=20
> > > > > =C2=A0 -device nvme-subsys,...
> > > > > =C2=A0 -device nvme-ns,...
> > > > >=20
> > > > > Then I get an error that "no 'nvme-bus' bus found for device 'nvm=
e'ns".
> > > > > This is probably just me not grok'ing the qdev well enough, so I'=
ll keep
> > > > > trying to fix that. What works now is to have the regular setup:
> > > > >=20
> > > > _Normally_ the 'id' of the parent device spans a bus, so the syntax
> > > > should be
> > > >=20
> > > > -device nvme-subsys,id=3Dsubsys1,...
> > > > -device nvme-ns,bus=3Dsubsys1,...
> > >=20
> > > Yeah, I know, I just oversimplified the example. This *is* how I want=
ed
> > > it to work ;)
> > >=20
> > > >=20
> > > > As for the nvme device I would initially expose any namespace from =
the
> > > > subsystem to the controller; the nvme spec has some concept of 'act=
ive'
> > > > or 'inactive' namespaces which would allow us to blank out individu=
al
> > > > namespaces on a per-controller basis, but I fear that's not easy to
> > > > model with qdev and the structure above.
> > > >=20
> > >=20
> > > The nvme-ns device already supports the boolean 'detached' parameter =
to
> > > support the concept of an inactive namespace.
> > >=20
> > Yeah, but that doesn't really work if we move the namespace to the
> > subsystem; the 'detached' parameter is for the controller<->namespace
> > relationship.
> > That's why I meant we have to have some sort of NSID map for the contro=
ller
> > such that the controller knows with NSID to access.
> > I guess we can copy the trick with the NSID array, and reverse the oper=
ation
> > we have now wrt subsystem; keep the main NSID array in the subsystem, a=
nd
> > per-controller NSID arrays holding those which can be accessed.
> >=20
> > And ignore the commandline for now; figure that one out later.
> >=20
> > Cheers,
> >=20
> > Hannes
> > > > > =C2=A0 -device nvme-subsys,...
> > > > > =C2=A0 -device nvme,...
> > > > > =C2=A0 -device nvme-ns,...
> > > > >=20
> > > > > And the nvme-ns device will then reparent to the NvmeBus on nvme-=
subsys
> > > > > (which magically now IS available when nvme-ns is realized). This=
 has
> > > > > the same end result, but I really would like that the namespaces =
could
> > > > > be specified as children of the subsys directly.
> > > > >=20
> > > > Shudder.
> > > > Automatic reparenting.
> > > > To my understanding from qdev that shouldn't even be possible.
> > > > Please don't.
> > > >=20
> > >=20
> > > It's perfectly possible with the API and used to implement stuff like
> > > failover. We are not changing the parent object, we are changing the
> > > parent bus. hw/sd does something like this (but does mention that its=
 a
> > > bit of a hack). In this case I'd say we could argue to get away with =
it
> > > as well.
> > > Allowing the nvme-ns device to be a child of the controller allows the
> > > initially attached controller of non-shared namespaces to be easily
> > > expressible. But I agree, the approach is a bit wacky, which is why I
> > > havnt posted anything yet.
> >=20
> > Yep, I did try to implement multipathing for SCSI at one point, and that
> > became patently horrible as it would run against qdev where everything =
is
> > ordered within a tree.
>=20
> Sorry to ask but has there been any progress on this topic? Just run
> into the same issue that adding nvme device during runtime is not
> showing any namespace.
>=20

This is all upstream. Namespaces with 'shared=3Don' *should* all be
automatically attached to any hotplugged controller devices.

With what setup is this not working for you?

--TrwXkwPHFNO2JGks
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNEUxsACgkQTeGvMW1P
DekX8wgArWH5dzw3f4/INhRdBHJEOitBrdRo/MlHcYfgiB0VjIk46osLDV+gWGns
sQIJ2BjogRu8oNQUUFlyGLZtFAJl5PxTDShITjH+ClK4501nFbXTVVCJ/yIO4w+M
gw8qInB3WCYSlApEwWSnbzyVCBx3RvwKjp6KDdTuLdaaxB32x5CESoCtUwwFwStk
R0oCKxxsDFS8HKKwCYGqWir2lST/X2s3mHQ15HNrIXu6mIR9na7AUN/oAqwTiZVS
9JVyEmPGb6fbMVEBuUedVqJdt1GXjhgG3n0KC1B7L2I5H3+v9yGjk7XD8AULH/9J
A7G9982j0pWMHBpmh6qLl72oB+pzdw==
=5bEY
-----END PGP SIGNATURE-----

--TrwXkwPHFNO2JGks--

