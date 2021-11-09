Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68644AD81
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:29:00 +0100 (CET)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQFH-0000Xv-2M
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:28:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mkQ9L-0006wm-K2; Tue, 09 Nov 2021 07:22:52 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:56321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mkQ9I-0006D2-KT; Tue, 09 Nov 2021 07:22:51 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AD102580572;
 Tue,  9 Nov 2021 07:22:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 09 Nov 2021 07:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=B3/8w8plq4VuZEd06zJuyUqPPCX
 PAiTUf+TTdvTun2I=; b=LNfUiBWQAkoDmlGb36zC4uC11WuHthU1GRRJUgGJUeA
 0yuLYNQa+7HIBxtHh0qFc8WhlqrQmhMeu/gHxdY8QlJyXlbou/mblMCcXcWjsDW0
 e6Xel1C2C1bd285mvBQelRAIxM9vKm+s368thR0qhfY/vDOeHACfvyuC1nMDl+i7
 dlSzLQWgx0sPcosJ8v4KQa8r5W6ib4X5/CqCPa1LD5SCWwq2cMBt+mSBH5TW/09W
 fD9Sld/j6nAe0LAthR1ngUDc7saj+lvfJcrAVAswK4P2M7lqk530JO1lt41oMcvB
 3CVY9HQCk8cIrbjjjDahh7b5ESk4auD1iPOeNb4zK9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=B3/8w8
 plq4VuZEd06zJuyUqPPCXPAiTUf+TTdvTun2I=; b=lz4tZzD95JvZ7a2wbMiW+L
 huvODrJPUA3nGpd3J1fJDavjnPtz5+WNJYUewFc1lY4pJCQOLdt7YGKeZ2CfKYPQ
 iUIon6aCaBO6pWC8g+7vcEG8yyKwpWK2lXwNy3CoR0o8gIsLTyaW+hgxzPAD7+YA
 RioWsh52DS30yP63CpTNHAdwXgdHuEuo+5nmuefSsMOT7nLBC0UwOY3nEAdb0diC
 IZQTMvOD8a/Lr9eIqJRmWj1E2IOFisrZNbn/uakMPQrrnhzp2mwcvBOVx5MKQy3L
 G+cr/ghYGDqhzIZinlj4Hq4ltQFm3rISY7GDm+QFeZHI0xft8P0KkpQRAvHE69aw
 ==
X-ME-Sender: <xms:FGiKYUIg3m0KCeCazdCvziqmHf8ryYDjZyCT4Gw9KtREk1Z74zqFEg>
 <xme:FGiKYUIkXZl0oG3sIahwnU3l1w1vx9590jTQx-gHfIelC14QFRBItKJHhJDwk0oyQ
 Cu8fylGEgs1Vksbzgg>
X-ME-Received: <xmr:FGiKYUsUdJsJfxDqX6p37KYSxGO0MrPj2SGLaVJ1cz2kNJkPQDCwPiLr9aEmL_eugAf9gnxnQ7zc7A5yTKpIP_-My47BEIoHjLYkItbpo2YFZVk7GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeggdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueeuffeihffggfetheejieevleduhfetfffhheeigfehteejieetvddtgedvhedt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:FGiKYRZyr36bo6Ujb40xSM1XUR-4k8BAhucJSCIzOe3lct2ExIW78g>
 <xmx:FGiKYbYbvw1gzZpt083bsgBF-lx2OaAkRk1vuJmBKouZh4dmxMHKtg>
 <xmx:FGiKYdDs8m3VZNRG2-bLVrg-BcbcVFnLfBh_aN5lGVtLUhjrO-Zspg>
 <xmx:FWiKYVlEfZiG20Wfn9eFf7y6Yq9LqaYqX45JtvmWdENmFBNaTpFDGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Nov 2021 07:22:43 -0500 (EST)
Date: Tue, 9 Nov 2021 13:22:41 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <YYpoERnNgxaNWfrC@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-13-lukasz.maniak@linux.intel.com>
 <YYJ7gy185o57adWJ@apples.localdomain>
 <20211104154843.GA4639@lgieryk-VirtualBox>
 <20211105084615.GA5164@lgieryk-VirtualBox>
 <20211105140401.GA5820@lgieryk-VirtualBox>
 <YYjfFm0gJ29R5IFw@apples.localdomain>
 <20211108135704.GA7389@lgieryk-VirtualBox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wcuGFu8J6ex4RhrF"
Content-Disposition: inline
In-Reply-To: <20211108135704.GA7389@lgieryk-VirtualBox>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wcuGFu8J6ex4RhrF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  8 14:57, =C5=81ukasz Gieryk wrote:
> On Mon, Nov 08, 2021 at 09:25:58AM +0100, Klaus Jensen wrote:
> > On Nov  5 15:04, =C5=81ukasz Gieryk wrote:
> > > On Fri, Nov 05, 2021 at 09:46:28AM +0100, =C5=81ukasz Gieryk wrote:
> > > > On Thu, Nov 04, 2021 at 04:48:43PM +0100, =C5=81ukasz Gieryk wrote:
> > > > > On Wed, Nov 03, 2021 at 01:07:31PM +0100, Klaus Jensen wrote:
> > > > > > On Oct  7 18:24, Lukasz Maniak wrote:
> > > > > > > From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > > > > > >=20
> > > > > > > With two new properties (sriov_max_vi_per_vf, sriov_max_vq_pe=
r_vf) one
> > > > > > > can configure the maximum number of virtual queues and interr=
upts
> > > > > > > assignable to a single virtual device. The primary and second=
ary
> > > > > > > controller capability structures are initialized accordingly.
> > > > > > >=20
> > > > > > > Since the number of available queues (interrupts) now varies =
between
> > > > > > > VF/PF, BAR size calculation is also adjusted.
> > > > > > >=20
> > > > > >=20
> > > > > > While this patch allows configuring the VQFRSM and VIFRSM field=
s, it
> > > > > > implicitly sets VQFRT and VIFRT (i.e. by setting them to the pr=
oduct of
> > > > > > sriov_max_vi_pervf and max_vfs). Which is just setting it to an=
 upper
> > > > > > bound and this removes a testable case for host software (e.g.
> > > > > > requesting more flexible resources than what is currently avail=
able).
> > > > > >=20
> > > > > > This patch also requires that these parameters are set if sriov=
_max_vfs
> > > > > > is. I think we can provide better defaults.
> > > > > >=20
> > > > >=20
> > > > > Originally I considered more params, but ended up coding the simp=
lest,
> > > > > user-friendly solution, because I did not like the mess with so m=
any
> > > > > parameters, and the flexibility wasn't needed for my use cases. B=
ut I do
> > > > > agree: others may need the flexibility. Case (FRT < max_vfs * FRS=
M) is
> > > > > valid and resembles an actual device.
> > > > >=20
> > > > > > How about,
> > > > > >=20
> > > > > > 1. if only sriov_max_vfs is set, then all VFs get private resou=
rces
> > > > > >    equal to max_ioqpairs. Like before this patch. This limits t=
he number
> > > > > >    of parameters required to get a basic setup going.
> > > > > >=20
> > > > > > 2. if sriov_v{q,i}_private is set (I suggested this parameter i=
n patch
> > > > > >    10), the difference between that and max_ioqpairs become fle=
xible
> > > > > >    resources. Also, I'd be just fine with having sriov_v{q,i}_f=
lexible
> > > > > >    instead and just make the difference become private resource=
s.
> > > > > >    Potato/potato.
> > > > > >=20
> > > > > >    a. in the absence of sriov_max_v{q,i}_per_vf, set them to th=
e number
> > > > > >       of calculated flexible resources.
> > > > > >=20
> > > > > > This probably smells a bit like bikeshedding, but I think this =
gives
> > > > > > more flexibility and better defaults, which helps with verifyin=
g host
> > > > > > software.
> > > > > >=20
> > > > > > If we can't agree on this now, I suggest we could go ahead and =
merge the
> > > > > > base functionality (i.e. private resources only) and ruminate s=
ome more
> > > > > > about these parameters.
> > > > >=20
> > > > > The problem is that the spec allows VFs to support either only pr=
ivate,
> > > > > or only flexible resources.
> > > > >=20
> > > > > At this point I have to admit, that since my use cases for
> > > > > QEMU/Nvme/SRIOV require flexible resources, I haven=E2=80=99t pai=
d much
> > > > > attention to the case with VFs having private resources. So this =
SR/IOV
> > > > > implementation doesn=E2=80=99t even support such case (max_vX_per=
_vf !=3D 0).
> > > > >=20
> > > > > Let me summarize the possible config space, and how the current
> > > > > parameters (could) map to these (interrupt-related ones omitted):
> > > > >=20
> > > > > Flexible resources not supported (not implemented):
> > > > >  - Private resources for PF     =3D max_ioqpairs
> > > > >  - Private resources per VF     =3D ?
> > > > >  - (error if flexible resources are configured)
> > > > >=20
> > > > > With flexible resources:
> > > > >  - VQPRT, private resources for PF      =3D max_ioqpairs
> > > > >  - VQFRT, total flexible resources      =3D max_vq_per_vf * num_v=
fs
> > > > >  - VQFRSM, maximum assignable per VF    =3D max_vq_per_vf
> > > > >  - VQGRAN, granularity                  =3D #define constant
> > > > >  - (error if private resources per VF are configured)
> > > > >=20
> > > > > Since I don=E2=80=99t want to misunderstand your suggestion: coul=
d you provide a
> > > > > similar map with your parameters, formulas, and explain how to de=
termine
> > > > > if flexible resources are active? I want to be sure we are on the
> > > > > same page.
> > > > >=20
> > > >=20
> > > > I=E2=80=99ve just re-read through my email and decided that some bi=
ts need
> > > > clarification.
> > > >=20
> > > > This implementation supports the =E2=80=9CFlexible=E2=80=9D-resourc=
es-only flavor of
> > > > SR/IOV, while the =E2=80=9CPrivate=E2=80=9D also could be supported=
=2E Some effort is
> > > > required to support both, and I cannot afford that (at least I cann=
ot
> > > > commit today, neither the other Lukasz).
> > > >=20
> > > > While I=E2=80=99m ready to rework the Flexible config and prepare i=
t to be
> > > > extended later to handle the Private variant, the 2nd version of th=
ese
> > > > patches will still support the Flexible flavor only.
> > > >=20
> > > > I will include appropriate TODO/open in the next cover letter.
> > > >=20
> > >=20
> > > The summary of my thoughts, so far:
> > > - I'm going to introduce sriov_v{q,i}_flexible and better defaults,
> > >   according to your suggestion (as far as I understand your intention=
s,
> > >   please correct me if I've missed something).
> > > - The Private SR/IOV flavor, if it's ever implemented, could introduce
> > >   sriov_vq_private_per_vf.
> > > - The updated formulas are listed below.
> > >=20
> > > Flexible resources not supported (not implemented):
> > >  - Private resources for PF     =3D max_ioqpairs
> > >  - Private resources per VF     =3D sriov_vq_private_per_vf
> >=20
> > I would just keep it simple and say, if sriov_v{q,i}_flexible is not
> > set, then each VF gets max_ioqpairs private resources.
> >=20
>=20
> Since you did request more tuning knobs for the Flexible variant, the
> Private one should follow that and allow full configuration. A device
> where PF.priv=3D64 and each VF.priv=3D4 makes sense, and I couldn=E2=80=
=99t
> configure it if sriov_v{q,i}_flexible=3D0 enabled the Private mode.
>=20

It was just to simplify, I am just fine with having
`sriov_vq_private_per_vf` :)

> > >  - (error if sriov_vq_flexible is set)
> > >=20
> > > With flexible resources:
> > >  - VQPRT, private resources for PF      =3D max_ioqpairs - sriov_vq_f=
lexible
> > >  - VQFRT, total flexible resources      =3D sriov_vq_flexible (if set=
, or)
> > >                                           VQPRT * num_vfs
> > >  - VQFRSM, maximum assignable per VF    =3D sriov_max_vq_per_vf (if s=
et, or)
> > >                                           VQPRT
> >=20
> > You mean VQFRT here, right?
> >=20
>=20
> VQPRT is right, and =E2=80=93 in my opinion =E2=80=93 makes a better defa=
ult than VQFRT.
>=20
> E.g., configuring a device:
>=20
> (max_vfs=3D32, PF.priv=3DVQPRT=3DX, PF.flex_total=3DVQFRT=3D256)
>=20
> as (num_vfs=3D1, VF0.flex=3D256) doesn=E2=80=99t make much sense. Virtual=
ization is
> not needed in such case, and user should probably use PF directly. On
> the other hand, VQPRT is probably tuned to offer most (if not all) of
> the performance and functionality; thus serves as a sane default.
>=20

Alright.

> > >  - VQGRAN, granularity                  =3D #define constant
> >=20
> > Yeah, 1 seems pretty reasonable here.
> >=20
> > >  - (error if sriov_vq_private_per_vf is set)
> > >=20
> > > Is this version acceptable?
> > >=20
> >=20
> > Sounds good to me. The only one I am not too happy about is the default
> > of VQPRT * num_vfs. (i.e. max_ioqpairs * num_vfs) when vq_flexible is
> > not set. I think this is the case where we should default to private
> > resources. If you don't want to work with private resources right now,
> > can we instead have it bug out and complain that sriov_vq_flexible must
> > be set? We can then later lift that restriction and implement private
> > resources.
>=20
> I would prefer reserving sriov_v{q,i}_flexible=3D0 for now. That's my cur=
rent
> plan for V2.
>=20

Alright.

--wcuGFu8J6ex4RhrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGKaAsACgkQTeGvMW1P
Dekb5wgAmT3vnKM1ayZPYWdpUTb7Fs9K2FvRyRJ2Fex6Y62db9EAw5+MjmJnK5rp
1woLnbB+5CjneMHie+0RJNCD5KJUS4dRELBJw4TcSyMvJKncWaTQIPkwdpLTNX8Q
lNIpFktPQsIsn3gh0PQZC3BPcVMsfXsc8HeKECgPyWBbQtZT0Hbu5Z6xurztJyYD
saJhGQSfxlf/Bk6CLioIZjHEIiS2u7wuBJY9LzAgz/B3dvxXlAFgUxCW0eccLSRh
SyViGv//l7jjwMzJtQXpN0Ad3MnD8QAAKi7mkiZSR1gAnRacz11gOquZipT+hyfG
XukqWOjXZ3rlVhR9S1I7rNQcLvslsA==
=cAuO
-----END PGP SIGNATURE-----

--wcuGFu8J6ex4RhrF--

