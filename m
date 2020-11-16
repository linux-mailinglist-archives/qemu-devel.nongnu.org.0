Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DCF2B4337
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:00:33 +0100 (CET)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedBQ-0008Kf-NM
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ked40-0005vi-1L; Mon, 16 Nov 2020 06:52:52 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ked3x-0000Z6-Ly; Mon, 16 Nov 2020 06:52:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 69C585C0071;
 Mon, 16 Nov 2020 06:52:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 16 Nov 2020 06:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+xIC9G/v+cVzrXBc3tJyurRR/aQ
 ohrLO+ewXqZtXmgI=; b=VhWvgGqiKENDZecJL7Pam0CZbQKTR6GPP5KBNf5qnE1
 e57w2BEw7yA+1DyzCl73Ad7Fm0G7ErFGC1EHcd8FtPqgsZ2RlkPRkS7SyANA32qB
 E2g/fuJASBf763jaIJB1La8JW0qCqkfLUQLcbaHL/T+Jo+SBn6WIFLJAikw483Zw
 Pf4tdTF79XxFmJtHoDy1hRpPqGUP+KFUmSXhgpjC1q+ZFxJrAIqUGcUBO/YT75vC
 0QPTu9a4rmb1LWk8XhIWEVlRrZoPWoIJvBbkDmvF0YtGTeTmQZAgMLbWokbLO0JY
 Wj+NZK6fS7cLGyjL3TMQn7xp/TqgSIDh7uYvMXMdhiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+xIC9G
 /v+cVzrXBc3tJyurRR/aQohrLO+ewXqZtXmgI=; b=O5j4Wge6X7D5kOQCX94i3g
 LUDKpZexRgidcqANHHHU9n3ZjuJi180HoQ/s0OGt9pT07dC1ZtxOqPmy/oZ+jMtq
 Dq45kJjqpBDYf4zqYl1DgzP+5EIb6K6JveSRCCezixn5qVGTxupzBOpWauPa24n4
 U/LqSjuD9sboZX7TkvRjY/lP9WLP8/3G99T16/NlQWFKFj2zNPGH2JvgQF2qE+yH
 Yn+8C73/md8nBE4O/9jzvDfXbFPBFWWnlR9sYfvrjJmZOJKIXFb3Z8YvKsCfw7AO
 XoUN4pL8PqjZx03fA5HvF3ZdTkpuEoQpDpQyU/UkoAgBx4hAyiKB/yhEJ2tz8lWg
 ==
X-ME-Sender: <xms:DWiyX03oJGY0tQzqUgPOsjP2wApGMt6AFHUw8DWz81kS1_nGJvpI3A>
 <xme:DWiyX_EyXttzlnnm9a1MPbJwI-G0JTTH0yzq1LR6HyjBkI7m4UB0YOKypUCbsl2Em
 BfMcZN012TJtyUxkjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DWiyX86ObPQoK_JvObX_bWsZlij1i2o51YvkrYC-xIZXeDripBrK-w>
 <xmx:DWiyX91NUSlm7qdDvGnXe7UqaLSHQQRj6E4jgvsiu4FVLd7nYiOpsw>
 <xmx:DWiyX3F5kk3GhHI7qzvYnPdV8TgJ0cCEuLLufp_s5g2_QZiRHljmmw>
 <xmx:DmiyX876gAeCvNJO46EYyiWeD_rkqxt75h_GaHqHJCJtGnlkrc_62Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 581513064AB4;
 Mon, 16 Nov 2020 06:52:44 -0500 (EST)
Date: Mon, 16 Nov 2020 12:52:42 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v8 2/5] hw/block/nvme: pull aio error handling
Message-ID: <20201116115242.GB982821@apples.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-3-its@irrelevant.dk>
 <20201116113654.GB7308@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <20201116113654.GB7308@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 06:52:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 20:36, Minwoo Im wrote:
> On 11/12 20:59, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add a new function, nvme_aio_err, to handle errors resulting from AIOs
> > and use this from the callbacks.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.c | 61 +++++++++++++++++++++++++++++--------------------
> >  1 file changed, 36 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 51f35e8cf18b..a96a996ddc0d 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -878,6 +878,41 @@ static inline uint16_t nvme_check_bounds(NvmeNames=
pace *ns, uint64_t slba,
> >      return NVME_SUCCESS;
> >  }
> > =20
> > +static void nvme_aio_err(NvmeRequest *req, int ret)
> > +{
> > +    uint16_t status =3D NVME_SUCCESS;
> > +    Error *local_err =3D NULL;
> > +
> > +    switch (req->cmd.opcode) {
> > +    case NVME_CMD_READ:
> > +        status =3D NVME_UNRECOVERED_READ;
> > +        break;
> > +    case NVME_CMD_FLUSH:
> > +    case NVME_CMD_WRITE:
> > +    case NVME_CMD_WRITE_ZEROES:
> > +        status =3D NVME_WRITE_FAULT;
> > +        break;
> > +    default:
> > +        status =3D NVME_INTERNAL_DEV_ERROR;
> > +        break;
> > +    }
> > +
> > +    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
> > +
> > +    error_setg_errno(&local_err, -ret, "aio failed");
> > +    error_report_err(local_err);
> > +
> > +    /*
> > +     * Set the command status code to the first encountered error but =
allow a
> > +     * subsequent Internal Device Error to trump it.
> > +     */
> > +    if (req->status && status !=3D NVME_INTERNAL_DEV_ERROR) {
> > +        return;
> > +    }
>=20
> Are we okay with the trace print up there in case that this if is taken?
> I guess if this if is taken, the trace print may not that matter.
>=20

Yeah, I was thinking we always print the error that corresponds to the
AIO that we are handling right now.

But maybe we should not include the "translated" nvme error in the trace
at all. That might make more sense.

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl+yaAgACgkQTeGvMW1P
Dem6cAf/YDmlbvL7T7gq3CTekmewWEFm+oZmIjdrp4wR9NCeuhWKy22sT6BI7btt
1C3vSRlgZz2BKn34vbQPKY7+DJC0gWHBK/8tBZHtpmD8utKumNINATmeaBIbky9Z
ETg4epVsPXFFHYCqX3/Hv3kHDEfscXjehxKxnCyxMUCWW2hXhCZDn09TiYZnUkqE
cGOeIHBzLjCAPJdyGHj0yX0Zveaeq33I+uXsXU83zPIXfrQtd8edeKJO3VYr8dHo
alqU2D+JJTEceymVrAzwGIbjDGtX2oJp7PWAqhbavcYSZDyKB1HCuoAG9zaTVGvD
4tu5P2ULhfBBl4WzrzSyjsuMxCb4Yg==
=UPl9
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--

