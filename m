Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D51447BD7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:31:51 +0100 (CET)
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk048-0004jl-RO
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:31:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mjzyk-0003hi-8T; Mon, 08 Nov 2021 03:26:10 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:56739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mjzyd-0004XT-SX; Mon, 08 Nov 2021 03:26:10 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 244845806FC;
 Mon,  8 Nov 2021 03:26:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 08 Nov 2021 03:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Mjd6uEMW5ypB/UL7ScLS6PNU/ip
 wvPEbuVsggYzq6Co=; b=F/XEECzCiI2F7BfwG2NkpQFtk+cgRvOAeJ6EkPEc1OH
 l8gIaZlkYFjp8n65ZLrGqF/aKJumeTxDWD370YKDZNbr/comqppJtcliLMxg4mPt
 KqPztIGfMwn/RewArsWgOQcpVRx3FJlGOHoOdDaX4fXllZJQ76NHtIeEKiVrUU1W
 PZ/MpTwPiZqOsvQw13GKusB8fa3fyip9mtOd0MRt3SgsDR1BJ8UyrddWlwYAZNVK
 7EJhuVPs4lUwquKALhwM5TjvKCH1n9MsQoF1Y3SUAs/auVkY7UwwBrAfxAUx6cdd
 KJEwpQf23R+4lAICAxBi2FHZOMIqR+52e693rzb7DtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Mjd6uE
 MW5ypB/UL7ScLS6PNU/ipwvPEbuVsggYzq6Co=; b=MA4lK9113ehfZ8z/8SU03A
 xUZ2p+FbdYi0Nm1AMljNs6buDBwHVfv1zbYTGCdGZ8dL0XAnKao7u8bAZz5l2B9C
 SciMosoKtqy4QSa0GcASqKjLDin58j/x29TddAGbADrxVQOsQ3HzRHGslLy3ycrQ
 8+376ZEVrLXzt1UJn5SSvbCEtpn5/aL5Lp5TpY4epdRgQRGy2mkABH/XCu51Lpf4
 laGSgIWQP3mAbvK54BtUD8tXOOMtmJri8R6he9SspStb7aURA/7BvFfS/a/jWRiw
 I0I4G8M3p+WDlmwfF/Dcpdeyd5I2jDxS7jEWWu5ZnfSlIPvdQXyok/RrMBKbes6w
 ==
X-ME-Sender: <xms:Gd-IYaDuUdw-LcYNFsy6lKkvSFsG7vlCBAT-eQMoH8U4vWn4u8NQGw>
 <xme:Gd-IYUh2vG6dKwh-ip2qBcA6zkNZsBYSYbrkz2TWvpmXnkfTyU02hZ1YxXYWavbN3
 oQBFkaIl8SMhTYD8g4>
X-ME-Received: <xmr:Gd-IYdlkQ-qDCSz_jvH3uWwTA6RBEFhGwF36kHPEQxDF88ueULRbkm_iGApRDfktuZA6pko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddugdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Gd-IYYxSPLaWbsDP-yQYrxfSHEfiQD5AlvWvQeXOy9H0b9IjAWEZtg>
 <xmx:Gd-IYfSxLId6557-5OA98IMkbdYEC795DSE5E7apPhqH6NKtxrdHMw>
 <xmx:Gd-IYTaZv9v0fccf7ngsK_AUJTQgvtssuPT6TDdioJ8iHKzLuQpCwA>
 <xmx:Gt-IYU8ue8I9eqLBaWPj6U2GRYXhEef01Mz6O_GH1-WqjncMtez0lA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Nov 2021 03:25:59 -0500 (EST)
Date: Mon, 8 Nov 2021 09:25:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <YYjfFm0gJ29R5IFw@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-13-lukasz.maniak@linux.intel.com>
 <YYJ7gy185o57adWJ@apples.localdomain>
 <20211104154843.GA4639@lgieryk-VirtualBox>
 <20211105084615.GA5164@lgieryk-VirtualBox>
 <20211105140401.GA5820@lgieryk-VirtualBox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ilGDJ4/JL7fEu6J2"
Content-Disposition: inline
In-Reply-To: <20211105140401.GA5820@lgieryk-VirtualBox>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ilGDJ4/JL7fEu6J2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  5 15:04, =C5=81ukasz Gieryk wrote:
> On Fri, Nov 05, 2021 at 09:46:28AM +0100, =C5=81ukasz Gieryk wrote:
> > On Thu, Nov 04, 2021 at 04:48:43PM +0100, =C5=81ukasz Gieryk wrote:
> > > On Wed, Nov 03, 2021 at 01:07:31PM +0100, Klaus Jensen wrote:
> > > > On Oct  7 18:24, Lukasz Maniak wrote:
> > > > > From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > > > >=20
> > > > > With two new properties (sriov_max_vi_per_vf, sriov_max_vq_per_vf=
) one
> > > > > can configure the maximum number of virtual queues and interrupts
> > > > > assignable to a single virtual device. The primary and secondary
> > > > > controller capability structures are initialized accordingly.
> > > > >=20
> > > > > Since the number of available queues (interrupts) now varies betw=
een
> > > > > VF/PF, BAR size calculation is also adjusted.
> > > > >=20
> > > >=20
> > > > While this patch allows configuring the VQFRSM and VIFRSM fields, it
> > > > implicitly sets VQFRT and VIFRT (i.e. by setting them to the produc=
t of
> > > > sriov_max_vi_pervf and max_vfs). Which is just setting it to an upp=
er
> > > > bound and this removes a testable case for host software (e.g.
> > > > requesting more flexible resources than what is currently available=
).
> > > >=20
> > > > This patch also requires that these parameters are set if sriov_max=
_vfs
> > > > is. I think we can provide better defaults.
> > > >=20
> > >=20
> > > Originally I considered more params, but ended up coding the simplest,
> > > user-friendly solution, because I did not like the mess with so many
> > > parameters, and the flexibility wasn't needed for my use cases. But I=
 do
> > > agree: others may need the flexibility. Case (FRT < max_vfs * FRSM) is
> > > valid and resembles an actual device.
> > >=20
> > > > How about,
> > > >=20
> > > > 1. if only sriov_max_vfs is set, then all VFs get private resources
> > > >    equal to max_ioqpairs. Like before this patch. This limits the n=
umber
> > > >    of parameters required to get a basic setup going.
> > > >=20
> > > > 2. if sriov_v{q,i}_private is set (I suggested this parameter in pa=
tch
> > > >    10), the difference between that and max_ioqpairs become flexible
> > > >    resources. Also, I'd be just fine with having sriov_v{q,i}_flexi=
ble
> > > >    instead and just make the difference become private resources.
> > > >    Potato/potato.
> > > >=20
> > > >    a. in the absence of sriov_max_v{q,i}_per_vf, set them to the nu=
mber
> > > >       of calculated flexible resources.
> > > >=20
> > > > This probably smells a bit like bikeshedding, but I think this gives
> > > > more flexibility and better defaults, which helps with verifying ho=
st
> > > > software.
> > > >=20
> > > > If we can't agree on this now, I suggest we could go ahead and merg=
e the
> > > > base functionality (i.e. private resources only) and ruminate some =
more
> > > > about these parameters.
> > >=20
> > > The problem is that the spec allows VFs to support either only privat=
e,
> > > or only flexible resources.
> > >=20
> > > At this point I have to admit, that since my use cases for
> > > QEMU/Nvme/SRIOV require flexible resources, I haven=E2=80=99t paid mu=
ch
> > > attention to the case with VFs having private resources. So this SR/I=
OV
> > > implementation doesn=E2=80=99t even support such case (max_vX_per_vf =
!=3D 0).
> > >=20
> > > Let me summarize the possible config space, and how the current
> > > parameters (could) map to these (interrupt-related ones omitted):
> > >=20
> > > Flexible resources not supported (not implemented):
> > >  - Private resources for PF     =3D max_ioqpairs
> > >  - Private resources per VF     =3D ?
> > >  - (error if flexible resources are configured)
> > >=20
> > > With flexible resources:
> > >  - VQPRT, private resources for PF      =3D max_ioqpairs
> > >  - VQFRT, total flexible resources      =3D max_vq_per_vf * num_vfs
> > >  - VQFRSM, maximum assignable per VF    =3D max_vq_per_vf
> > >  - VQGRAN, granularity                  =3D #define constant
> > >  - (error if private resources per VF are configured)
> > >=20
> > > Since I don=E2=80=99t want to misunderstand your suggestion: could yo=
u provide a
> > > similar map with your parameters, formulas, and explain how to determ=
ine
> > > if flexible resources are active? I want to be sure we are on the
> > > same page.
> > >=20
> >=20
> > I=E2=80=99ve just re-read through my email and decided that some bits n=
eed
> > clarification.
> >=20
> > This implementation supports the =E2=80=9CFlexible=E2=80=9D-resources-o=
nly flavor of
> > SR/IOV, while the =E2=80=9CPrivate=E2=80=9D also could be supported. So=
me effort is
> > required to support both, and I cannot afford that (at least I cannot
> > commit today, neither the other Lukasz).
> >=20
> > While I=E2=80=99m ready to rework the Flexible config and prepare it to=
 be
> > extended later to handle the Private variant, the 2nd version of these
> > patches will still support the Flexible flavor only.
> >=20
> > I will include appropriate TODO/open in the next cover letter.
> >=20
>=20
> The summary of my thoughts, so far:
> - I'm going to introduce sriov_v{q,i}_flexible and better defaults,
>   according to your suggestion (as far as I understand your intentions,
>   please correct me if I've missed something).
> - The Private SR/IOV flavor, if it's ever implemented, could introduce
>   sriov_vq_private_per_vf.
> - The updated formulas are listed below.
>=20
> Flexible resources not supported (not implemented):
>  - Private resources for PF     =3D max_ioqpairs
>  - Private resources per VF     =3D sriov_vq_private_per_vf

I would just keep it simple and say, if sriov_v{q,i}_flexible is not
set, then each VF gets max_ioqpairs private resources.

>  - (error if sriov_vq_flexible is set)
>=20
> With flexible resources:
>  - VQPRT, private resources for PF      =3D max_ioqpairs - sriov_vq_flexi=
ble
>  - VQFRT, total flexible resources      =3D sriov_vq_flexible (if set, or)
>                                           VQPRT * num_vfs
>  - VQFRSM, maximum assignable per VF    =3D sriov_max_vq_per_vf (if set, =
or)
>                                           VQPRT

You mean VQFRT here, right?

>  - VQGRAN, granularity                  =3D #define constant

Yeah, 1 seems pretty reasonable here.

>  - (error if sriov_vq_private_per_vf is set)
>=20
> Is this version acceptable?
>=20

Sounds good to me. The only one I am not too happy about is the default
of VQPRT * num_vfs. (i.e. max_ioqpairs * num_vfs) when vq_flexible is
not set. I think this is the case where we should default to private
resources. If you don't want to work with private resources right now,
can we instead have it bug out and complain that sriov_vq_flexible must
be set? We can then later lift that restriction and implement private
resources.

--ilGDJ4/JL7fEu6J2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGI3xMACgkQTeGvMW1P
DelDowgAwZ26gcKrhl9BOnSdcrOkEfRGpgEIoJgXh7MfT5CSa6AKKIUpmZT2ltRU
rmDA+idgvaeSxrrrVX6f9K4GA23W6XA4GdKnArt0nKEXrHOQTG5jxkENQdPs4mOD
dFQqhlbIK12c0TsgO6QfBBMlRSfuNUJtMICDNIoAzMxcEhbbkg2GDWMggxzVw8kw
+1z/0tes4+OL9e9sInlxGFAAFFhKlWL++CPqiKxF3ii73UcHFCePNVH0/hHqxd20
nGSW+84hgtVybr3bOX8XxU0ahkvO3huq5zawdROrw54RnQdMbgl66GCMy/F/7FSG
tKU5lDzaCB9boUj52aeBxU3+jpErDg==
=IGt6
-----END PGP SIGNATURE-----

--ilGDJ4/JL7fEu6J2--

