Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F218587B01
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 12:47:11 +0200 (CEST)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIpQb-0004xk-OA
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 06:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oIome-0001A3-M3; Tue, 02 Aug 2022 06:05:52 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oIomc-0001Rt-3t; Tue, 02 Aug 2022 06:05:52 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2DCC5320005D;
 Tue,  2 Aug 2022 06:05:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 02 Aug 2022 06:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1659434744; x=1659521144; bh=ez
 pErSOyuunvm5SmVQpn9pe2h1dDhKh6hjmAWMETG9Q=; b=AiPVTGPVBFAjWtYoAV
 3Yf1e6/tMAqSOyUFLu3lmfY2qah+KuxZoMnQ1ZOuvUiYJxxX732nD9PI87xFwQ1D
 nZi22unwIrl4ndt9TK24LndDeZWCeHrm58An9xgvX6DSqg9hXnCXWLDn8DqHotO6
 YWcz7b86Zfj2QH+wBlssuAS8loIEY4KBzYp+mi6NeNTpaRcV5oBGRvYYfSA8Bkfg
 hGdeR5+aXZIyXE37wgXtF476GmuRA7XLlcx62JZgeut3aosrCQeKm6emG++sBp/t
 GD7Ur9sabEzph5SWseDBtjDVdHiRosyJ+MhIZ+5iTfhtzbVxxho1EmoLqfxUSu6S
 uJiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659434744; x=1659521144; bh=ezpErSOyuunvm5SmVQpn9pe2h1dD
 hKh6hjmAWMETG9Q=; b=vadhvSWiwqaYft2PgSEew5ZiQ6YgSmnJT1x/8sSdpi8R
 b0gjS9eY3IG1X8Vna03CGaTludxgR6a3Vi5001cX080mkOTmQKB6WaHiZ87resvs
 va1d/FRt5Y2HLm9hlQcdLolV35+7x3RAeN/rTwD/qp6ecVc6UdPmFkbxs4KrrsoF
 f73OA305vGSqUIUkf8qw6yoaYNoZOv9uWMs8PhrI4p20xWBzU6PsjD8FXLHZ7Qmc
 2ue7Dss6r2iVkJpnEQm9M4pHSKyCEaELoKjD1dbN2ahSx46caqcyscRmAFtfF8us
 FezcHct2fQlBoBq39W7f43F8LHKO22k6gaL/MQMuvw==
X-ME-Sender: <xms:-PboYimdOSHWou1ocnRKscfBbcvHBoqniIezQb8w3E05QkWOwTw9RQ>
 <xme:-PboYp3cfKBxx1hSJt4lxfo90DDI-6C1x1eQzLGU_irbxcwoG6Jo5AFfioZIWIzXS
 QJhwE6J-IIZpHfkcc0>
X-ME-Received: <xmr:-PboYgpVewFfZxs0HRA6RK0ABJ3bSfAgr3C1dpJoH7fqyofNaMoR17dv_itD9nY5WQVMZrJc5r9LGUSnKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvhedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-PboYmmdBcZWNto46spSHq1QYiW2sUlBYZfCsRdygEJJ_fg4QBJioA>
 <xmx:-PboYg0g4MIRBWhPw2CwfIXN6J62jajt5z9flMqkm6vCBmVGE7-bkg>
 <xmx:-PboYtvvG6l2XTUpWMkUSTiPuaGnDBLfWpBNs3VwJCYhbRXL0joVEA>
 <xmx:-PboYtxV4ruISw02w1XH97vOpX5unUxe90bdjyOmGiZvp4ugWa0N7g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 06:05:43 -0400 (EDT)
Date: Tue, 2 Aug 2022 12:05:41 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH] hw/nvme: Add helper functions for qid-db conversion
Message-ID: <Yuj29dyTTdRug1iu@apples>
References: <20220728080710.372027-1-fanjinhao21s@ict.ac.cn>
 <Yui+B7yEikNGACgq@apples>
 <46762954-5440-4C96-B39B-BCAA6C86589C@ict.ac.cn>
 <YujmUfXpFXSO8eU5@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ikDe+vAlgsr/GL6K"
Content-Disposition: inline
In-Reply-To: <YujmUfXpFXSO8eU5@apples>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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


--ikDe+vAlgsr/GL6K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug  2 10:54, Klaus Jensen wrote:
> On Aug  2 16:31, Jinhao Fan wrote:
> > at 2:02 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> >=20
> > > On Jul 28 16:07, Jinhao Fan wrote:
> > >> With the introduction of shadow doorbell and ioeventfd, we need to do
> > >> frequent conversion between qid and its doorbell offset. The original
> > >> hard-coded calculation is confusing and error-prone. Add several hel=
per
> > >> functions to do this task.
> > >>=20
> > >> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> > >> ---
> > >> hw/nvme/ctrl.c | 61 ++++++++++++++++++++++++++++++++----------------=
--
> > >> 1 file changed, 39 insertions(+), 22 deletions(-)
> > >>=20
> > >> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > >> index 533ad14e7a..6116c0e660 100644
> > >> --- a/hw/nvme/ctrl.c
> > >> +++ b/hw/nvme/ctrl.c
> > >> @@ -487,6 +487,29 @@ static int nvme_check_cqid(NvmeCtrl *n, uint16_=
t cqid)
> > >> {
> > >>     return cqid < n->conf_ioqpairs + 1 && n->cq[cqid] !=3D NULL ? 0 =
: -1;
> > >> }
> > >> +static inline bool nvme_db_offset_is_cq(NvmeCtrl *n, hwaddr offset)
> > >> +{
> > >> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> > >> +    return (offset / stride) & 1;
> > >> +}
> > >=20
> > > This can be changed morphed into `(offset >> (2 + dstrd)) & 1` if I a=
m not
> > > mistaken.
> > >=20
> >=20
> > Yes. But my current code looks more readable to me. Is it necessary to
> > change to `(offset >> (2 + dstrd)) & 1`.
> >=20
>=20
> I am unsure if the compiler will transform that division into the shift
> if it can infer that the divisor is a power of two (it most likely
> will be able to).
>=20
> But I see no reason to have a potential division here when we can do
> without and to me it is just as readable when you know the definition of
> DSTRD is `2 ^ (2 + DSTRD)`.
>=20
> > >> +
> > >> +static inline uint16_t nvme_db_offset_to_qid(NvmeCtrl *n, hwaddr of=
fset)
> > >> +{
> > >> +    hwaddr stride =3D 4 << NVME_CAP_DSTRD(ldq_le_p(&n->bar.cap));
> > >> +    return offset / (2 * stride);
> > >> +}
> > >=20
> > > Same, should be able to do `offset >> (2 * dstrd + 1)`, no?
> >=20
> > Same as above.
> >=20
>=20

I meant `offset >> (2 + dstrd + 1)` ('+', not '*') like above of course.

--ikDe+vAlgsr/GL6K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLo9vMACgkQTeGvMW1P
DenBCgf9HUMIsyMuvtbqutqx1chOVlgCkSE1sWQrulsyjl4tjVQTA/5d//cmPTcL
GXzeyFKn8ZQQAmlNc793Rl9lvK+hKU71XuVnjzArDwELjh/0w1qjrOha/2XGH5YH
bpk3FbTzAf8ch5QoocHMLc6t+xBNlVuxXOWQ0MESOa1Wnbova94Ly4g4oCa9vL5g
MdDtBrUL9A+vfuhHQoZyaok8SiN/l/nZIvx8nbTaR6PylNFFVRovrViGBg1q2cL3
zxFm4IcxH+SVVt5VXKZLHt4upImVp2lWaFn+Jk6WedSIiZtewOJs6IL3sBu16E6c
Ow6nJI/qUmZFOhKxtxqOwLix/6sx5w==
=5oA1
-----END PGP SIGNATURE-----

--ikDe+vAlgsr/GL6K--

