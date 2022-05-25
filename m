Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08456533792
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 09:43:02 +0200 (CEST)
Received: from localhost ([::1]:39808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntlfY-0004Hy-Mx
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 03:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ntlY0-0000oc-Er; Wed, 25 May 2022 03:35:12 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ntlXx-000661-Ol; Wed, 25 May 2022 03:35:11 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EBDDC5C021C;
 Wed, 25 May 2022 03:35:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 25 May 2022 03:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1653464106; x=1653550506; bh=4p
 07rUpRzDcPNwe/EHrwavgfFz3YYtBgk+ZTkIWMYhM=; b=PZqgtsoxdPklaTLVIN
 MhBl0xYPnoubugDuA8N5MR8cRzys/1g1sEEBIl+n8zXZwq5LCTi7rk82Iyii1Q9B
 KVySbuuNlwc7U71CxOmu43xREsV0nRhTIiOhQvPmDlodJrzD81FoIughuVtUrR2d
 MnX5SgPLPsECLOpds76HacgdVd5XzZ/Fhc3CHYRHNBT/winNjAjmantNqig/YW3d
 ytJZmhbiZm+wQ75DmysMlIS5GEuM/nS6o2uWpveonGhl3/mr13Obn/IvFUNPaiIY
 xrBFVYnKr3Li3of0MEOi1lQdUK+ir6rRh06XalBsPt6WoeYxXi2ymFZHNu9BrFzS
 9KpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653464106; x=1653550506; bh=4p07rUpRzDcPNwe/EHrwavgfFz3Y
 YtBgk+ZTkIWMYhM=; b=VTxC2CAZO5fugKMT0rpodw3MUsI1mBLrkSu40v8CkjLu
 6CFJYlVZ1iISdNt0vRij2GkoM3qsvKM14Ngs8CHTNNlaogTVWaQJqqyiqFvJQEfj
 dmj6HZARFL9D6APw0Ik39EhajvxxdnmGSDtuaxJP8L+fVUKdjaRuA3tX9Z5nHnaJ
 XxGHoLPVUtMy/Rg4xCoQSQrWFHBuNZR+zdZzf+HuNjy5KtU57CE5skFXRGM7LcCc
 r9mIzLOEzDE66VoyI3siONRJQX8AagxxQAN2l5oaXSY6oK0tvDdeHdXO/VZX0uaS
 Av/4CRtthUMTOVg4BZpRp3JUTy521aVSrk+qYls4NQ==
X-ME-Sender: <xms:KdyNYspmJr5CuWVtTplNYnPmzdVVw74Ex2QG5esOsQb2Zg0Xfn19tg>
 <xme:KdyNYipc4awhRvhCy791dzzI3jwP6NdwCQtgC0S8MoQO_VGg25DMiVsKnMMsBu7c4
 fngzo7ZUl4xkZGWCKc>
X-ME-Received: <xmr:KdyNYhNS2m6R_G4fx2OGHxr6_qOk43QAHDYc8sWRsoiSIxsjTtssFdlL3yXS2K9WTgxjwHX5k5mY6FDmOlc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeeggdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:KdyNYj5wGcGpUlid_0yU3sy4piB_QsBChEextLuB8F5Kzw2NyNCbjw>
 <xmx:KdyNYr5CGIyYJDJOAZOvMLKkrZpFSikBeha59U5E71UHzLaflaA49g>
 <xmx:KdyNYji7WT6xMOX1YxQ5n7exoiKp2bVg3Ag3PZm8YMFG73LjOlJVVA>
 <xmx:KtyNYhRNOLhtW0s2f9-_buSsk_c4q5siW2GdGdy0uYbb3LVibV54Gw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 May 2022 03:35:04 -0400 (EDT)
Date: Wed, 25 May 2022 09:35:02 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>, lukasz.gieryk@linux.intel.com
Subject: Re: [PATCH] hw/nvme: clean up CC register write logic
Message-ID: <Yo3cJsbCPST0zKcW@apples>
References: <20220517111605.1494647-1-its@irrelevant.dk>
 <YoYziE8v2reg5kQ7@kpiekosz-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2kLj/7KrrvsLrX1+"
Content-Disposition: inline
In-Reply-To: <YoYziE8v2reg5kQ7@kpiekosz-mobl.ger.corp.intel.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--2kLj/7KrrvsLrX1+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 19 14:11, Lukasz Maniak wrote:
> On Tue, May 17, 2022 at 01:16:05PM +0200, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The SRIOV series exposed an issued with how CC register writes are
> > handled and how CSTS is set in response to that. Specifically, after
> > applying the SRIOV series, the controller could end up in a state with
> > CC.EN set to '1' but with CSTS.RDY cleared to '0', causing drivers to
> > expect CSTS.RDY to transition to '1' but timing out.
> >=20
> > Clean this up.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >=20
> > Note, this applies on top of nvme-next with v8 of Lukasz's sriov series.
> >=20
> >  hw/nvme/ctrl.c | 35 +++++++++++------------------------
> >  1 file changed, 11 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 658584d417fe..47d971b2404c 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -6190,9 +6190,8 @@ static void nvme_ctrl_reset(NvmeCtrl *n, NvmeRese=
tType rst)
> > =20
> >      if (pci_is_vf(pci_dev)) {
> >          sctrl =3D nvme_sctrl(n);
> > +
> >          stl_le_p(&n->bar.csts, sctrl->scs ? 0 : NVME_CSTS_FAILED);
> > -    } else {
> > -        stl_le_p(&n->bar.csts, 0);
>=20
> Are you sure the registers do not need to be cleared for a reset type that
> does not involve a CC register i.e. FLR?
> Will these registers be zeroed out elsewhere during FLR?
>=20

Indeed you are right. Posting a v2.

--2kLj/7KrrvsLrX1+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKN3CQACgkQTeGvMW1P
DelGRwgAmCCq5srGeaw2j9gPisvbRlRp1CmwKcbmZNB6O/C6S5gkW4Zk6zpwoc9t
jc3QL79x20si5bkMJyIQReGuoUaGZoTLd3ECukzOMBBxaa8evCaEp5ODXUFfC6bt
J3g+/zrOoU/HvHjyURU/Ft2rtdnNZ8dnq3AenHTbuRUIjVzVRVyuK2G73DclzG6S
V4pofRE9HHqUMXZNO/1PXK6aSnxKHdYDjUXpk3/mjETHTtLtN4mkq3C5yow3buyH
0GR9rhn+7xx5JJ7QeiQt2eHXubUGvBYmFqIOt8xHiQJDH41zmPwz5zC7S/tkqPy4
aN6ZODNG/Xn1o2ZP+jnE7Rcf7IHkOw==
=jmeO
-----END PGP SIGNATURE-----

--2kLj/7KrrvsLrX1+--

