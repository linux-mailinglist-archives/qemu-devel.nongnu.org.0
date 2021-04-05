Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5D354288
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:02:58 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTPoe-0004ii-VJ
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTPiO-0003Y5-C9; Mon, 05 Apr 2021 09:56:28 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:54121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTPiM-0005ER-27; Mon, 05 Apr 2021 09:56:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 73EAC580307;
 Mon,  5 Apr 2021 09:56:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 09:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=1cAfhSqAEB02MkwiWPfL//SNh8s
 mbh2Yij2IVeGcX2E=; b=LdQlFYpS+Q70FsDRoPdK8FeTnD2rznJhxr2/MenJp7+
 /jemsyQyE0RrH/t6mXYDYBGGO7Sv7Y2bTlKPWDuveki2SP0BZMa8AmQLUqTMxEPX
 fudMzPKrVzMuWe1RRsfHPYIxuUmVr/h/crLhjY8d0AgaBOOEN96aePRzyJUe0lv/
 Dh7WZy9Ks+/+VrzRTYjMc/xHYFpSpngCZdLB6fw3aW7/ketDd6Z0AJz7OneoYAwQ
 Xd4J6FqOZQ0fSauuppO8jGwz9xlTGRYhsg2ukRTdJ7DxCO5iYU7r4eeV9jqhd3Fk
 zcMbzNHgCzr4xOgm1qL6NViAt+zijJxZ2EWms1R+vxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1cAfhS
 qAEB02MkwiWPfL//SNh8smbh2Yij2IVeGcX2E=; b=nackDopdwerke3Av9d0I7T
 kEa8AoeIrjEIJIHWUNJzkUd+SeMN9uR6Fu8OSe5DGoX3PqWM/9VW3HqSPZpVFYcW
 piZ/WCawXuk7XfhAOOtokukVo0BBw4Bd1UgvCtgd02mQcxlneZaoxKaVn8sz19Wf
 R/XOChGbF6W7RcybfjEUmmzvhaYkAPnbjV8F2rXJUj9OpVJAo+69tPvo5Ya0D4lg
 9Um0g/QjqpyhKjAM81yQEACKLZY29iWkHKxkxlA5jlqZGNuyThY6TwENJnZvcLaY
 cqiUrf9z/82pfRHjfr0S+XSb5Vc2zlDzg0C4LNQIWqkcJmIJhWIsHpj80WxZp3qA
 ==
X-ME-Sender: <xms:BhdrYKelptTkRSIwPclyNrHc4Wsz5IOSn09TeWgBQ5nWA7whX6jBxw>
 <xme:BhdrYEOushMFfYj-Xl_xVQBu3OviOkdyiqWZOe_wcZmcm_bdru5z7wbHH9vFpOs5L
 ahLZffOhKUVMT03ZKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:BhdrYLi8yKLF6cBW8xHC7Exbp7k-ZA44hyO7rtzZgGFxV7iRBDceBg>
 <xmx:BhdrYH8WiXcljAodn19QZ2HPlr9gQxKChe1X7JiHTWTRk00Q94MdtQ>
 <xmx:BhdrYGty7CoK5Sm3nX_H3y-sEjQakIuYPwsbTEglb4X07DA1fk75oQ>
 <xmx:CBdrYEBDgKG1aSaDKHF0JHlbk2KzI4WJGTTKd5L2dEsGR02k-qj4Gg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6749424005E;
 Mon,  5 Apr 2021 09:56:20 -0400 (EDT)
Date: Mon, 5 Apr 2021 15:56:17 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH for-6.0 7/7] hw/block/nvme: fix handling of private
 namespaces
Message-ID: <YGsXAZ8Sn9vaMeol@apples.localdomain>
References: <20210324200907.408996-1-its@irrelevant.dk>
 <20210324200907.408996-8-its@irrelevant.dk>
 <CGME20210405123541epcas5p21088333e3cbaa1b40e10e7c20ab889aa@epcas5p2.samsung.com>
 <20210405123239.GA1248@2030045822>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jWUpviYXMmtu2MK7"
Content-Disposition: inline
In-Reply-To: <20210405123239.GA1248@2030045822>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jWUpviYXMmtu2MK7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  5 18:02, Gollu Appalanaidu wrote:
> On Wed, Mar 24, 2021 at 09:09:07PM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Prior to this patch, if a private nvme-ns device (that is, a namespace
> > that is not linked to a subsystem) is wired up to an nvme-subsys linked
> > nvme controller device, the device fails to verify that the namespace id
> > is unique within the subsystem. NVM Express v1.4b, Section 6.1.6 ("NSID
> > and Namespace Usage") states that because the device supports Namespace
> > Management, "NSIDs *shall* be unique within the NVM subsystem".
> >=20
> > Additionally, prior to this patch, private namespaces are not known to
> > the subsystem and the namespace is considered exclusive to the
> > controller with which it is initially wired up to. However, this is not
> > the definition of a private namespace; per Section 1.6.33 ("private
> > namespace"), a private namespace is just a namespace that does not
> > support multipath I/O or namespace sharing, which means "that it is only
> > able to be attached to one controller at a time".
> >=20
> > Fix this by always allocating namespaces in the subsystem (if one is
> > linked to the controller), regardsless of the shared/private status of
> > the namespace. Whether or not the namespace is shareable is controlled
> > by a new `shared` nvme-ns parameter.
> >=20
> > Finally, this fix allows the nvme-ns `subsys` parameter to be removed,
> > since the `shared` parameter now serves the purpose of attaching the
> > namespace to all controllers in the subsystem upon device realization.
> > It is invalid to have an nvme-ns namespace device with a linked
> > subsystem without the parent nvme controller device also being linked to
> > one and since the nvme-ns devices will unconditionally be "attached" (in
> > QEMU terms that is) to an nvme controller device through an NvmeBus, the
> > nvme-ns namespace device can always get a reference to the subsystem of
> > the controller it is explicitly (using 'bus=3D' parametr) or implicitly
> > attaching to.
> >=20
> > Fixes: e570768566b3 ("hw/block/nvme: support for shared namespace in su=
bsystem")
> > Cc: Minwoo Im <minwoo.im.dev@gmail.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> > hw/block/nvme-ns.h     |  10 ++--
> > hw/block/nvme-subsys.h |   7 ++-
> > hw/block/nvme.h        |  39 +-------------
> > include/block/nvme.h   |   1 +
> > hw/block/nvme-ns.c     |  74 +++++++++++++++++++++++----
> > hw/block/nvme-subsys.c |  28 -----------
> > hw/block/nvme.c        | 112 +++++++++++++----------------------------
> > hw/block/trace-events  |   1 -
> > 8 files changed, 106 insertions(+), 166 deletions(-)
> >=20

<snip>

> >=20
> > static Property nvme_ns_props[] =3D {
> >     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
> > -    DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
> > -                     NvmeSubsystem *),
> >     DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
> > +    DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false)i,
>=20
> Nice change point, hope we need update the usage, removing "subsys" from
> nvme-ns device params and adding "shared" param?
>=20

Good catch, thanks. Fixing that up for a v2.

--jWUpviYXMmtu2MK7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBrFv8ACgkQTeGvMW1P
DeliLgf/VRJkxOsuc5zsVtsBdsNiwbRgXBPQx0QZ7ICUNXGW4U8zrjF2R+nzR9N0
P0TnqbXmMHHCQLxfhkV1cAKtlSR5O70sL0mp1VjnKqgfsHHusqMIt6mTt1CLRt9K
2n1Nnj9QXbo3dY7ruT8oTpzXJRXhAvbtcXRcbai9eLVYDaI2QU7Xdb+TL2QoDt1o
QZTsFWw8Ts7kJRmi11SgtYlJyqHy+IiPSeZjLLP/lEBLzHwi2MP1thzrAh0A6gt4
LEMYJ/NRHbjrwLRZUtJ2wznce3zjEaU1rSmPkaBsJ311czlzOI9zjbP60HeQNj/H
/EwZMDl5Ltu3uLQb+DGsl4Q1vHmWEw==
=6oGl
-----END PGP SIGNATURE-----

--jWUpviYXMmtu2MK7--

