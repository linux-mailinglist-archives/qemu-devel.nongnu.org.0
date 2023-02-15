Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A910697775
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSCL7-00085h-Es; Wed, 15 Feb 2023 02:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pSCKr-0007sp-8A
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:36:15 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pSCKk-0004aI-KX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:36:11 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 46F14320016F;
 Wed, 15 Feb 2023 02:36:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 15 Feb 2023 02:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1676446561; x=1676532961; bh=Dt
 NZb165SSa5kLwPb15rbQT+tFEJ+jyo6B4ZRd+UgyM=; b=cehpvdtpB271ymD0BX
 7HN0aZ8XR33+IuNN+LF/2DLap2bl3wA7VCR+9RtOBicdu+yiHHkNAnPCtbWKgl5w
 VrxbqcGkyxTzaKzzYpjygkZhN8gTMNbgrgTdSBGh6gg2L+SfssyVs51MLn8DpyKi
 zMojok2x+OMi2XLxQaEOkFzcyBus2Ezc7pbHofMVySFAULua7H95hBori1aCXaDH
 cU7GUY8MHFCiKrzz2Ak4bbv4bXjPMKnbk3D5JDX7Dj7PszSrhS0n70lo10pWPexv
 PVCfnsSDx5anrOT/1UK97KzaTHFtY0Ip3jAUlfnciHuRQu2sHI4/yBzFMqYF3O3+
 Pozw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1676446561; x=1676532961; bh=DtNZb165SSa5kLwPb15rbQT+tFEJ
 +jyo6B4ZRd+UgyM=; b=aOHwr59KhX+aDRir2JbIWKioNzZWiKioYAXaDhU12m/0
 8Rv2LEcYPIyefA6s2Nupbs3UxYslTtmsZUmvcZaD+nEvhhHbhT9psi3muj0Paio+
 BWLiSSN/Ph60JAQZ9YQdjMzu72Kri6q9EFRptJJHBXQCsFVL/v9YCsVwWkLctdv5
 0/ZEpM+8G52zjSvcvdGDuY14wEcFzm8OmNkua0xYvFZ04uU5IZyq/ym7yq4MGvBj
 qPLN2kRhFyrszTlOs1APiC1MRN6u2u7Gx1+AB507xwjw634vy9SYpgxTM6U2j4eh
 bPv6QqUzIaUZ4Mzr9TMmeSq8fB97JmOviMcJ+nPAZw==
X-ME-Sender: <xms:YYvsYy9OnDbmEcHizRpzwT-IkuG8FrTxaqoA_G_ct-slAVRagozpFQ>
 <xme:YYvsYyugFcym9PNueopizCv_JS2ngvnFRE1qwHq0_EtEo0hEGATiMOBzk0zXAWMZ9
 1NbG2cpRLjDCN6Zv6o>
X-ME-Received: <xmr:YYvsY4AsIDzCq0AkHQWjtTHpzAcUzVgSZQNqbiBQTQa-8WUVSps4ru8iz10L3BdGpyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YYvsY6dekcz9-Qw57FkqUgRlmycLtkE8xr-XzkmMYFwKaDcYNO_ADA>
 <xmx:YYvsY3MbJwUbUxESK3FMTVluB5voxObiGAxOOErOOeV4DCiGRqSI4g>
 <xmx:YYvsY0meOt1BV4ei3pvx93jn1Q169j9qJGFe5TZ5ESSvv9WE5Kk51g>
 <xmx:YYvsY4Fwp73kh2_RbaVN_JFNa2v5JTUpuCZ0Lle35DAq5HvQYQsfZQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Feb 2023 02:35:59 -0500 (EST)
Date: Wed, 15 Feb 2023 08:35:57 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Major Saheb <majosaheb@gmail.com>
Cc: Peter Xu <peterx@redhat.com>, k.jensen@samsung.com, philmd@linaro.org,
 armbru@redhat.com, mst@redhat.com, lukasz.gieryk@linux.intel.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Subject: Re: DMAR fault with qemu 7.2 and Ubuntu 22.04 base image
Message-ID: <Y+yLXRW9LmE03fHZ@cormorant.local>
References: <CANBBZXMpWOj5fE2YF8XGvWmBtbc=9YKiMCSfUKC7AoP5Ros9QA@mail.gmail.com>
 <Y+q3+eXdYz0qOtDT@x1n>
 <CANBBZXOtEF6Ao+Nxznf6dGOSTMX3F7iJvfOiWWngs79Bjy_YEQ@mail.gmail.com>
 <Y+uHMm1hvP7N6sKD@cormorant.local>
 <Y+uhL77aBFVEWsJd@cormorant.local>
 <CANBBZXOos3JUkq7zqjNqr39wiU4-zptBq1Jr3KwzWddW1jj-5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DGnujQ7o+5kwf2E2"
Content-Disposition: inline
In-Reply-To: <CANBBZXOos3JUkq7zqjNqr39wiU4-zptBq1Jr3KwzWddW1jj-5Q@mail.gmail.com>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--DGnujQ7o+5kwf2E2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 15 12:01, Major Saheb wrote:
> > Assuming you are *not* explicitly configuring shadow doorbells, then I
> > think you might have a broken driver that does not properly reset the
> > controller before using it (are you tripping CC.EN?). That could explain
> > the admin queue size of 32 (default admin queue depth for the Linux nvme
> > driver) as well as the db/ei_addrs being left over. And behavior wrt.
> > how the Linux driver disables the device might have changed between the
> > kernel version used in Ubuntu 20.04 and 22.04.
>=20
> Thanks Klaus, I didn't had the driver source, so I acquired it and
> looked into it, the driver was not toggling the cc.en nor waiting for
> csts.ready the right way. So I implemented it and it started working
> perfectly.
> - R
>=20
> On Tue, Feb 14, 2023 at 8:26 PM Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > On Feb 14 14:05, Klaus Jensen wrote:
> > > On Feb 14 17:34, Major Saheb wrote:
> > > > Thanks Peter for the reply. I tried to connect gdb to qemu and able=
 to
> > > > break 'vtd_iova_to_slpte()', I dumped the following with both Ubuntu
> > > > 20.04 base image container which is the success case and Ubuntu 22.=
04
> > > > base image container which is failure case
> > > > One thing I observed is the NvmeSQueue::dma_addr is correctly set to
> > > > '0x800000000', however in failure case this value is 0x1196b1000. A
> > > > closer look indicates more fields in NvmeSQueue might be corrupted,
> > > > for example we are setting admin queue size as 512 but in failure c=
ase
> > > > it is showing 32.
> > > >
> > >
> > > Hi Major,
> > >
> > > It's obviously pretty bad if hw/nvme somehow corrupts the SQ structur=
e,
> > > but it's difficult to say from this output.
> > >
> > > Are you configuring shadow doorbells (the db_addr and ei_addr's are
> > > set in both cases)?
> > >
> > > > > > Following is the partial qemu command line that I am using
> > > > > >
> > > > > > -device intel-iommu,intremap=3Don,caching-mode=3Don,eim=3Don,de=
vice-iotlb=3Don,aw-bits=3D48
> > > > > >
> > >
> > > I'm not sure if caching-mode=3Don and device-iotlb=3Don leads to any =
issues
> > > here? As far as I understand, this is mostly used with stuff like vho=
st.
> > > I've tested and developed vfio-based drivers against hw/nvme excessiv=
ely
> > > and I'm not using anything besides `-device intel-iommu`.
> > >
> > > Do I undestand correctly that your setup is "just" a Ubuntu 22.04 gue=
st
> > > with a container and a user-space driver to interact with the nvme
> > > devices available on the guest? No nested virtualization with vfio
> > > passthrough?
> >
> > Assuming you are *not* explicitly configuring shadow doorbells, then I
> > think you might have a broken driver that does not properly reset the
> > controller before using it (are you tripping CC.EN?). That could explain
> > the admin queue size of 32 (default admin queue depth for the Linux nvme
> > driver) as well as the db/ei_addrs being left over. And behavior wrt.
> > how the Linux driver disables the device might have changed between the
> > kernel version used in Ubuntu 20.04 and 22.04.

Awesome. Occam's Razor strikes again ;)

--DGnujQ7o+5kwf2E2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPsi10ACgkQTeGvMW1P
DemKXAgAopySI+Y+VSnzLrB+Mx051AoTDojlKIhVLnhGZfIoMcn9gll5O1GNp4my
YsKMrOsqTyjakXkuifpMi8fnQU9tW6PXUYy4Lsy85KlZDzAkh/sRz3DCyWNvndHY
uopIjYsHVxLExL7Imm37sDcCcjq749K5rEZhTd+FszxsPxztWXou9J1A9u097m/0
otHQtOgpwV43xN5Jk/WVGvMBIIrqwzzXv98LJHhM8S/qFfyndmfzMYgMVdrlPbic
FCsNFSY6wu3g7DPV+PP2poUeTH/L4ZAsI+qz6Ry4Kyb21FuLy+AaHeM3OiR+XiX9
aKAfdg2VgLD1/kJ83Hutxh4vWWJ/6w==
=Bosf
-----END PGP SIGNATURE-----

--DGnujQ7o+5kwf2E2--

