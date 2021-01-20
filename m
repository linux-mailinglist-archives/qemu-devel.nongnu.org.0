Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C312FD283
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:22:26 +0100 (CET)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ENN-0000Oe-0t
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l2EJ2-00060C-Fd; Wed, 20 Jan 2021 09:17:58 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l2EIo-0003XV-3k; Wed, 20 Jan 2021 09:17:52 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B9EA5C010F;
 Wed, 20 Jan 2021 09:17:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 20 Jan 2021 09:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=6O5hlcPi2j67qRshIVzMMaPJlFS
 EPehOFpusvLLJcuQ=; b=O37cZfVqsQVOxM2ZtL57iTdj1Yvu7zw0r5ch/n2s6b5
 kIuwfWSFmwFk8VtchRvy4U8TT1FffxEZVQTR1BPI6zEkoyUseNz7u1RCLvkUVU2Q
 i1gnITc2hGtAzOW2ZDCcGd+L4eLgE1ipBDhfScR7U3KA62ShFWJSP2rCc5enrNkP
 MVLdqeCruH3odxc5dd6AxTIitiPkCmP5u0mNTVdC5x+Cbswl46vcJ4BPqZLHCIIE
 0tkKuocfp5h7WYF/o8Ulv8BK+rzMccM6KwQEFwOm9Q0E47OPZhAxS5gEP0uPyNWC
 +yI5w0FrRH4MHAy8bCUxcusBK+Q4LLnlYE6RTIIBQCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6O5hlc
 Pi2j67qRshIVzMMaPJlFSEPehOFpusvLLJcuQ=; b=orjeVkvetVZmX7KNJ5I5U4
 l3sj4nm/kO/YufpI7lcZALSMoi5j3azwK141i2hKjcBSVPHhKklCo584PKOIc159
 ffACtW2SbrnZ9RBa0Ra+WoVMr5HVl6pJ4Fgvo78yHAU+YAqhOSWvYFBfGjd+FM3G
 KBtulFEhEjzBhZOCZRpY8BchUW/v+R2ueONTRL0Y0all4jbwnPavT1vHRjDDbTEI
 W/5K59Z9l3upeEY3UMNi22OPwbBtE71La+G2kdahT5mGZpfy3h572fl0m5DqoXMj
 I61CN+iLWaRuIqn0WM2RAA4Aas//jOrjx1gUfj5DjnBMo+MZauViyhI5ZPLXJhvw
 ==
X-ME-Sender: <xms:gjsIYK5Hc9s3_WPeDwL7NPEZxFMVmDU7SwzBODXEu-FG_rNuswhGhQ>
 <xme:gjsIYD1aWWOYpKEUGkOUa-wEUbENP_tbDrvadpAhTJLicgRaptk-5_A2clnRGFnvP
 Xe9Fhg4EvDD2CjWiG4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdelkeeftdeujeeuheeltdduuefguddtieeggeeihefhvdettdegteefgffgudek
 necuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepkedtrdduieejrdelkedrud
 eltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:gjsIYGUvf0vY3f8nVnncOnQExgrkkPiLUhx-FfOTRNRcpnwSdLDVeQ>
 <xmx:gjsIYO7YgnKhXqoUBkg3e74mQY5ZAWspiXKp5p8nTBVTvWhNimBJ6Q>
 <xmx:gjsIYNI6A7_ndgLNE3kCe7IbSakf-PeY_kp0gpzyjHQAojF6O5D-Ew>
 <xmx:gzsIYFE7U3_XPkB5UuL_gF9AIFq834LHgSbGmwLZjq728ZzHu8V-TQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14D75240065;
 Wed, 20 Jan 2021 09:17:36 -0500 (EST)
Date: Wed, 20 Jan 2021 15:17:34 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [RFC PATCH V3 8/8] hw/block/nvme: Add Identify Active Namespace
 ID List
Message-ID: <YAg7fsMmZ8f7JSAL@apples.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <20210119170147.19657-9-minwoo.im.dev@gmail.com>
 <20210120140718.GA130091@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="phwWV4IIX0OkCNn5"
Content-Disposition: inline
In-Reply-To: <20210120140718.GA130091@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--phwWV4IIX0OkCNn5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 20 14:07, Niklas Cassel wrote:
> On Wed, Jan 20, 2021 at 02:01:47AM +0900, Minwoo Im wrote:
> > Spec v1.4b 6.1.4 "Active and Inactive NSID Types" says:
> >=20
> > "Active NSIDs for a controller refer to namespaces that are attached to
> > that controller. Allocated NSIDs that are inactive for a controller ref=
er
> > to namespaces that are not attached to that controller."
> >=20
> > This patch introduced for Identify Active Namespace ID List (CNS 02h).
> >=20
> > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > ---
> >  hw/block/nvme.c | 39 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 34 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 2b2c07b36c2b..7247167b0ee6 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -2883,6 +2883,39 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n=
, NvmeRequest *req)
> >      return NVME_INVALID_FIELD | NVME_DNR;
> >  }
> > =20
> > +static uint16_t nvme_identify_nslist_active(NvmeCtrl *n, NvmeRequest *=
req)
> > +{
> > +    NvmeNamespace *ns;
> > +    NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> > +    uint32_t min_nsid =3D le32_to_cpu(c->nsid);
> > +    uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
> > +    static const int data_len =3D sizeof(list);
> > +    uint32_t *list_ptr =3D (uint32_t *)list;
> > +    int i, j =3D 0;
> > +
> > +    if (min_nsid >=3D NVME_NSID_BROADCAST - 1) {
> > +        return NVME_INVALID_NSID | NVME_DNR;
> > +    }
> > +
> > +    for (i =3D 1; i <=3D n->num_namespaces; i++) {
> > +        ns =3D nvme_ns(n, i);
> > +        if (!ns || ns->params.nsid <=3D min_nsid) {
> > +            continue;
> > +        }
> > +
> > +        if (!nvme_ns_is_attached(n, ns)) {
> > +            continue;
> > +        }
> > +
> > +        list_ptr[j++] =3D cpu_to_le32(ns->params.nsid);
> > +        if (j =3D=3D data_len / sizeof(uint32_t)) {
> > +            break;
> > +        }
> > +    }
> > +
> > +    return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
> > +}
> > +
> >  static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
> >  {
> >      NvmeNamespace *ns;
> > @@ -2914,10 +2947,6 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n=
, NvmeRequest *req)
> >              continue;
> >          }
> > =20
> > -        if (!nvme_ns_is_attached(n, ns)) {
> > -            continue;
> > -        }
> > -
> >          list_ptr[j++] =3D cpu_to_le32(ns->params.nsid);
> >          if (j =3D=3D data_len / sizeof(uint32_t)) {
> >              break;
> > @@ -3045,7 +3074,7 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRe=
quest *req)
> >      case NVME_ID_CNS_CS_CTRL:
> >          return nvme_identify_ctrl_csi(n, req);
> >      case NVME_ID_CNS_NS_ACTIVE_LIST:
> > -         /* fall through */
> > +         return nvme_identify_nslist_active(n, req);
> >      case NVME_ID_CNS_NS_PRESENT_LIST:
> >          return nvme_identify_nslist(n, req);
> >      case NVME_ID_CNS_CS_NS_ACTIVE_LIST:
> > --=20
> > 2.17.1
> >=20
> >=20
>=20
> Hello Minwoo,
>=20
> By introducing a detached parameter,
> you are also implicitly making the following
> NVMe commands no longer be spec compliant:
>=20
> NVME_ID_CNS_NS, NVME_ID_CNS_CS_NS,
> NVME_ID_CNS_NS_ACTIVE_LIST, NVME_ID_CNS_CS_NS_ACTIVE_LIST
>=20
> When these commands are called on a detached namespace,
> they should usually return a zero filled data struct.
>=20
> Dmitry and I had a patch on V8 on the ZNS series
> that tried to fix some the existing NVMe commands
> to be spec compliant, by handling detached namespaces
> properly. In the end, in order to make it easier to
> get the ZNS series accepted, we decided to drop the
> detached related stuff from the series.
>=20
> Feel free to look at that patch for inspiration:
> https://github.com/dmitry-fomichev/qemu/commit/251c0ffee5149c739b1347811f=
a7e32a1c36bf7c
>=20
> I'm not sure if you want to modify all the functions that
> our patch modifies, but I think that you should at least
> modify the following nvme functions:
>=20
> nvme_identify_ns()
> nvme_identify_ns_csi()
> nvme_identify_nslist()
> nvme_identify_nslist_csi()
>=20
> So they handle detached namespaces correctly for both:
> NVME_ID_CNS_NS, NVME_ID_CNS_CS_NS,
> NVME_ID_CNS_NS_ACTIVE_LIST, NVME_ID_CNS_CS_NS_ACTIVE_LIST
> as well as for:
> NVME_ID_CNS_NS_PRESENT, NVME_ID_CNS_CS_NS_PRESENT,
> NVME_ID_CNS_NS_PRESENT_LIST, NVME_ID_CNS_CS_NS_PRESENT_LIST
>=20

Definitely - it makes sense to reintroduce your patch here, with a
replacement of `ns->attached` with `nvme_ns_is_attach()`. Looks like
that should be sufficient.

--phwWV4IIX0OkCNn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAIO30ACgkQTeGvMW1P
Deko0wf/ZPlb7IbECtPDrLBBgeAeP9+6O/umi7y0ZBqwp13kbU3M1ARj5yMRBuh6
fLPl07jUGkhUGuGqFOkdJexZe7Zgq+ZmE9KJFpuALleTXnkrBzpK0dCg1cVL/sx6
MaiidwOvwhh8ch4pmh2eLnNUu3lQTFycIIForNvGoAc6Acj68ALhBgKbPRTcfhDz
LjRy8ertJe00IJikRJnFk/NAD18e3utnZPH0v8JSGoLieR8pbchTPkw8IDD3/DB0
pweEAluHDxUMCjM7W2eJHB+OQ/SlZ9tfcM+l1gVjD1hjOut7eL07/Dps4Xw/6LKt
pjKSmMx1QzF0RKaTnhF8lRoRMxyebQ==
=OiUW
-----END PGP SIGNATURE-----

--phwWV4IIX0OkCNn5--

