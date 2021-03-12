Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D98339103
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:18:38 +0100 (CET)
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjYi-0000Fk-2l
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKjQd-0002rX-Sc; Fri, 12 Mar 2021 10:10:15 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:50577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKjQa-0006ix-SZ; Fri, 12 Mar 2021 10:10:15 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0CCED1A74;
 Fri, 12 Mar 2021 10:10:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 12 Mar 2021 10:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=v+9Rxum35oBZlqxIDCQU0rV/lBf
 9eDGJ3KTzryUVvNU=; b=Ayvyryj31IR0gETAmMnVmr0PJC18zz/bNDAg4I9Cifo
 uHcGMKXyrQDYHLvkA2rWlsLcezcxE9ffwxgc3sltpmP+ieIfHxDhuuPdnu/+qq9M
 B7nyHLjQxSA5kczkUxb7Nk9qPVRZuyMHN0Whuabff1aDRZ6A3EneFGAhVQdvAqjg
 arPmdfQbeQIOI7CeuY8N9EwEGq9MsqDmh2Z2eRykZTwMXWo/LKt5+xkSIV5KBDup
 8oeINOZh9ljWj3Kd0mXS0ZTmYXmMGBxRS3ENQjq2d5/Bc5FKnUa4QvA68jm/OrrH
 ZX/cs+SiykR+y4iAhyLiEpTFusKf/iWSkeiwSJknL4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=v+9Rxu
 m35oBZlqxIDCQU0rV/lBf9eDGJ3KTzryUVvNU=; b=uX8maqX8Mw6cENWR6ZvpjU
 SzWBRnwVBKj8a50ZuERLx4ddGM+xGckbswT1KMV0xjQJyuphbHIj9Z6RP3v+L6BB
 neVBp0QGDibWBkewz0H/6k1x8vXW2Q/k9ODmz8LurxYATb3g/CUVtCl+ODN6MkY7
 GnZl+vFOAVFNNtYkiPyOlWh80OdRbVeVTLZqN7dC/eC2cUN4aPVHLWNmRj8AZOMY
 fiS1AYVgVeyolJooaRtZWr7ENmqj3LKZxwhvFqNMV1FGXm7KSI3xywuPHp3BHOP9
 SevT2oOYv824f5P7IyqA5M7NY/XwT3hLgRM0UxQezRYmnh27a/1NOsnfxSpQkyWQ
 ==
X-ME-Sender: <xms:ToRLYDxNuNa_H3dznM8aGqt6mZdg4xh3GyVNSzwlJdr--ahcnPSm-w>
 <xme:ToRLYLTmIoXizkbRAOocX4z69tVbfpzE5zUkrpUe9HulHqxmB709stJ3955NK3p59
 fIo_nRBUZol6jVNcUs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ToRLYNVKcsiAGJ3x5QMR0QRlaauylNTGmIAKHW42-BsWXANf9CvWYQ>
 <xmx:ToRLYNimJP-QkLgbhsngaKVOK2cpG8VAwHsigxpKnwrU9JzFwycmcQ>
 <xmx:ToRLYFDe5OvyCPxl-5jypZBKY62j23rUoRVk9x1G8mUqD6S0fw9P_w>
 <xmx:T4RLYJ2Szck-q6McInb4kgj5dqPnpp4L1RLqzrXUb-ccuWromw-ue7OTyKw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D65F108005C;
 Fri, 12 Mar 2021 10:10:04 -0500 (EST)
Date: Fri, 12 Mar 2021 16:10:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 36/38] hw/block/nvme: support namespace attachment
 command
Message-ID: <YEuESYmwkbr+aGMz@apples.localdomain>
References: <20210309114512.536489-1-its@irrelevant.dk>
 <20210309114512.536489-37-its@irrelevant.dk>
 <CAFEAcA8TiJQJaamiVZbzbnxtzmfYTkVd3HEJUU6mrd8dyWnSug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IkTtX5oO9i7cFOYg"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8TiJQJaamiVZbzbnxtzmfYTkVd3HEJUU6mrd8dyWnSug@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IkTtX5oO9i7cFOYg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 12 13:12, Peter Maydell wrote:
> On Tue, 9 Mar 2021 at 11:46, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Minwoo Im <minwoo.im.dev@gmail.com>
> >
> > This patch supports Namespace Attachment command for the pre-defined
> > nvme-ns device nodes.  Of course, attach/detach namespace should only be
> > supported in case 'subsys' is given.  This is because if we detach a
> > namespace from a controller, somebody needs to manage the detached, but
> > allocated namespace in the NVMe subsystem.
> >
> > As command effect for the namespace attachment command is registered,
> > the host will be notified that namespace inventory is changed so that
> > host will rescan the namespace inventory after this command.  For
> > example, kernel driver manages this command effect via passthru IOCTL.
>=20
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index 85a7b5a14f4e..1287bc2cd17a 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -235,6 +235,11 @@ static inline void nvme_ns_attach(NvmeCtrl *n, Nvm=
eNamespace *ns)
> >      n->namespaces[nvme_nsid(ns) - 1] =3D ns;
> >  }
> >
> > +static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
> > +{
> > +    n->namespaces[nvme_nsid(ns) - 1] =3D NULL;
> > +}
>=20
> Hi; Coverity complains about a possible array overflow both here
> in nvme_ns_detach() (CID 1450757) and in nvme_ns_attach() (CID 1450758):
> nvme_nsid() can return -1, but this code does not check for that.
>=20
> If these functions both assume that their ns argument is non-NULL,
> then adding an "assert(ns)" would probably placate Coverity and also
> would mean that any bugs elsewhere resulting in accidentally passing
> a NULL pointer would result in a clean assertion failure rather than
> memory corruption. (Or you could directly assert that the array index
> is in-bounds, I guess.)
>=20

Hi Peter,

Thanks!

As far as I can tell, we never reach this without nsid being a valid
value or ns being NULL, but as you say, future misuse would be bad. I
will post a fix to make sure such misuse does not happen in the future.

--IkTtX5oO9i7cFOYg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBLhEgACgkQTeGvMW1P
DenFIQf8CD+5hw9bUE16PgC2IfhSXVz5OVsDcN4UfChs9O1a+aOKkAdeG9wVUjiE
NJVUDtsTfHbRzbZnUcn2BvW6XydfPE01okWc8E0DSdspoAblRthNKoBbQzPBDudp
pZrUHLoh610YcRprerZ5Nn8TVkxkV+CflGe1yRMm8zvExhvJnkq/PbmTMkEyruro
H7Zi6sXy7VYoCdrh3IxOgNBTnZ8em8WJ+2mn+W5yXXdxmBxj/UvNpI68a5Ui6Vo/
bAXG3hDsQ4S/F94rKGQ8uECDFAuXmK6HBiv+jPUuZEUXLd2ViZW3WtVRYuLEIZAX
zi82YOBd6yhaYBY+RScGEnFK6gUpMA==
=jw7K
-----END PGP SIGNATURE-----

--IkTtX5oO9i7cFOYg--

