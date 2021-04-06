Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B953F354DEA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:33:24 +0200 (CEST)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgDD-0005SJ-Jm
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTg8J-0004GK-Jf; Tue, 06 Apr 2021 03:28:21 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTg8G-0000O1-Ar; Tue, 06 Apr 2021 03:28:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id ADE735804BF;
 Tue,  6 Apr 2021 03:28:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Apr 2021 03:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=x1SHnBZq4AqYeArKkK3xvJsiyf0
 9SKxsXwmbHbd5cDE=; b=EijLh0N6LYs0sJRa95X+J1qRxyVkjqIeHzYTVS8WXCl
 W1aFPnRUJVT2mFY70kWprEwlqcpohInvI9YAcG1VQZaQpRftustC6P7pk+CmGKQq
 Q9TVRp85ntmxL0gsJCt0bfFjN6nfB66k4LtC0K5CwWMAISt6g2Cyxgclo+OCFF5y
 Z8JwYYXZd65lz7RpLKd43t99q0v5cSle8nYrXYj9G7f22cawLxAmcQZtrN0yFu4q
 IZTlkA1Z4vYvI6z3ROxZeq6H+9Dw3w8uRZQ/PAsKNNwQqyc6HT2qYPwkx577LsCq
 IhW+OVUcWCk/YmzW+oE+oMX1Iw+kPpfP6xXht70gpkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x1SHnB
 Zq4AqYeArKkK3xvJsiyf09SKxsXwmbHbd5cDE=; b=g5KsdgPQVQTNDDeNWNXsdK
 w7+RJSvAZVOsGbR5f0yYF0sl8WNFVcemG2hPKJ8LxeGZCiaH9hpGglZr+jcF2Vpp
 GvqmEEy8WnT0hy8kEBGsptDNSYkQhDa8rrO/8iyK0ZfsL7c2g+p9JOZYFU8PDkm1
 S6QmdnR2eSKu6UNoImv4sLpvkNdgjg6GeYDsZjUiDEMSmht53us2+u0PazTv9DSL
 c6L/Ng7CtoTK7bjPaV3CmIIud8YSmxzrStejxuzdgIDcZRVM8bV+of024HPW2k8p
 mkqHIEsp60r3JgbS4nEVQw1xYVNc/Y4XF9N+OCuC68GOiI5Dka7vYG+FaWFehgVg
 ==
X-ME-Sender: <xms:jQ1sYIWPs9Sx-Vswst1ZbcN2JoysMCCwU9a9KL7sHI9MugKv8-NxCw>
 <xme:jQ1sYMm1988KuVixfHAAW1fX2yVHYXhkQ8j5vK6dfVcl-EwyHg8U6UY15JuoMjxki
 Eh4a74JOp28O1ZMj0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejfedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jQ1sYMZUd_TtVivTGxrQmOHT8njuCFUQ5lCZ8x-MDNj0KlrnPeTSXw>
 <xmx:jQ1sYHVoZGxjpwrdrm0RHQAAgescRiIcGqWQM1e1qMVLT8SHl4EozA>
 <xmx:jQ1sYClcuVrhTfwz0PO6bE6jT7WbPzBGQftrw2HMbteZDA-ibdvY-w>
 <xmx:jg1sYM76XOJZJ3rln9hbWSnUGPTNFR3_k9aW4d3fOHgWQesWEh_rmA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 155791080057;
 Tue,  6 Apr 2021 03:28:11 -0400 (EDT)
Date: Tue, 6 Apr 2021 09:28:10 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH for-6.0 v2 4/8] hw/block/nvme: fix controller namespaces
 array indexing
Message-ID: <YGwNipvKFR94iUvq@apples.localdomain>
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-5-its@irrelevant.dk>
 <e9f266a2-f12e-6dca-805e-4f70a4ffc248@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k70j5LcHPtpyW0zQ"
Content-Disposition: inline
In-Reply-To: <e9f266a2-f12e-6dca-805e-4f70a4ffc248@redhat.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--k70j5LcHPtpyW0zQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  6 09:01, Philippe Mathieu-Daud=C3=A9 wrote:
> On 4/5/21 7:54 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The controller namespaces array being 0-indexed requires 'nsid - 1'
> > everywhere. Something that is easy to miss. Align the controller
> > namespaces array with the subsystem namespaces array such that both are
> > 1-indexed.
>=20
> TBH I don't understand the justification.

Justification is mostly to align with the subsystem device. I like the
'1-indexed' approach better. And the -1 causes Coverity to complain
before the assert was added.

> Assuming you hit a
> bug and try to protect yourself, maybe now you should also
> check for
>=20
>   assert(n->namespaces[0] =3D=3D NULL);
>=20
> somewhere. In nvme_ns() maybe?
>=20

That is definitely a state that should always hold, I guess we can do
that, but we do already guard all "insertions" into the namespace array
by an assert on the nsid. Then again, asserting here makes sure that we
don't introduce something else that inserts on this invalid position.

So, good point, I'll add it.

> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > ---
> >  hw/block/nvme.h | 8 ++++----
> >  hw/block/nvme.c | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index 9edc86d79e98..c610ab30dc5c 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -217,7 +217,7 @@ typedef struct NvmeCtrl {
> >       * Attached namespaces to this controller.  If subsys is not given=
, all
> >       * namespaces in this list will always be attached.
> >       */
> > -    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
> > +    NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
> >      NvmeSQueue      **sq;
> >      NvmeCQueue      **cq;
> >      NvmeSQueue      admin_sq;
> > @@ -232,7 +232,7 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, u=
int32_t nsid)
> >          return NULL;
> >      }
> > =20
> > -    return n->namespaces[nsid - 1];
> > +    return n->namespaces[nsid];
> >  }
> > =20
> >  static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
> > @@ -253,7 +253,7 @@ static inline void nvme_ns_attach(NvmeCtrl *n, Nvme=
Namespace *ns)
> >      uint32_t nsid =3D nvme_nsid(ns);
> >      assert(nsid && nsid <=3D NVME_MAX_NAMESPACES);
> > =20
> > -    n->namespaces[nsid - 1] =3D ns;
> > +    n->namespaces[nsid] =3D ns;
> >  }
> > =20
> >  static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
> > @@ -261,7 +261,7 @@ static inline void nvme_ns_detach(NvmeCtrl *n, Nvme=
Namespace *ns)
> >      uint32_t nsid =3D nvme_nsid(ns);
> >      assert(nsid && nsid <=3D NVME_MAX_NAMESPACES);
> > =20
> > -    n->namespaces[nsid - 1] =3D NULL;
> > +    n->namespaces[nsid] =3D NULL;
> >  }
> > =20
> >  static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index c54ec3c9523c..6d31d5b17a0b 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -5915,7 +5915,7 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeName=
space *ns, Error **errp)
> >              return -1;
> >          }
> >      } else {
> > -        if (n->namespaces[nsid - 1]) {
> > +        if (n->namespaces[nsid]) {
> >              error_setg(errp, "namespace id '%d' is already in use", ns=
id);
> >              return -1;
> >          }
> >=20
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--k70j5LcHPtpyW0zQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBsDYkACgkQTeGvMW1P
Dek1PAf/bmdKGdFiDwWRLz3mATRHEkbgfJKEB6p/7QJUZz8xlJaO89Lv8ldqUVde
M6PwHn53NA9knoj6AzDV9nXa7FAVd1CnXEljTouqs2wv3YDg/0P9c/jqqtD5HMvD
jk29lCU56MTArMsEP1GZh1gtzXSIGCouCZlj91855UbNdm+6GJLemMZXYPinzJJU
aq3uY8MZkzdWknsg3VkDMZ1CIdus1NlGDEuAei81v0xXyMO2XFTIj1ruCqxm4T6g
Q7zRrDJqyNZv6xvQnmoc/NxQNkz/F7kKkb+/QnjwZBEby7xiw51WavZV63VgSvhT
KHFcNSeZ67fLCArfIhCQVvunDOo7iQ==
=IQkX
-----END PGP SIGNATURE-----

--k70j5LcHPtpyW0zQ--

