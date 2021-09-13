Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2F94083DB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 07:37:55 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPefB-000571-Ux
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 01:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mPea2-0002tq-H2; Mon, 13 Sep 2021 01:32:34 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mPea0-0005HO-5S; Mon, 13 Sep 2021 01:32:34 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D987F5C007A;
 Mon, 13 Sep 2021 01:32:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 13 Sep 2021 01:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=8GqNEPk+VFVvbex0s5C9c2VXchf
 H/ICRLWYFG7TwqzE=; b=WqfNwNDQRkDxbOnBC6Bufuk8obTZGs/VyhTJanI/O7w
 LCG8v6M6WsxrjLMqt5FOPHY9FJ2bMuu3vkYYgCFPPD7i+J/DHJ8tyrs1UY68mp7P
 RCiPDaldMKIS+C9KZSmxLWfBJ1D2bjnfSxf54GODVJX1X6jN9E77AchQTgSLOITQ
 dWwElmwQXJyTY5LHHfpXQBvRZwgAU+z0V6+AZMrYSqnYBiymlIRRdaI51qrtOhxr
 mP3966cJYtlLg/dbZ8Zo0bhyQAd9H0Ay2ot1S7b6Xid2XfU44+89Xdm5qcUMPIxe
 uP78vTTLcgdwrIHzpTk4AepWjzkYb81joxg/neb76vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8GqNEP
 k+VFVvbex0s5C9c2VXchfH/ICRLWYFG7TwqzE=; b=eKQH1s7c6XNpTkkogHmn9b
 TBJYeCgLpsIqbWHPR9daFVvfGbLqQZWqRD02tZ2XbAWAMY09//qiMBbR+xgiC0/l
 Z/ZdIXxVRSEl2pPSLo9ESGRRhsr0YaPivkBRa1zmhs5iXzPr8B7nowoAOTAojPYQ
 N+XXQ3i2axBmjvf3ms+F31wApeviiMcExbHdaXQt6w0NVcrsLKAIKV0ObjJSjECo
 HcRuEbPKf7GOCWtTybjD+FNZVZhGEu+OYKS0hUKn7YQUQiAE2Lq18/LgQ0Ho/BrD
 CrtNt4VsDraxR5UdKfvHoa01QvTIWEAXJ6dZMkm6ISwUWhWGwYTT3yzGlQVw9qJQ
 ==
X-ME-Sender: <xms:bOI-YSLZvb7EB6S1REG_VTi-5lK5V1yDyfezTghfFCDF489eY8_CbA>
 <xme:bOI-YaIbOLeCzcMmyqG3Z5cvrmS0JqsFop2yl_4AJ2VuRPZoVhuYRuwDjkCRB69cS
 BqkQr5NdG8tfdVxJ8k>
X-ME-Received: <xmr:bOI-YSuob1h-EMW69CbncNO4MYs-55C6cqqwNVNbFlMAO3Fc59Tf8MhPCvGVHmP8Xfd7nccgJrxdszITMlewnZ_XthIPClZRZxXBA8Svw4dKvN8mlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:bOI-YXaoKI8KiWFglmzruryFpfy-bL4LrodK1yFT3hibCOQdt_3GZQ>
 <xmx:bOI-YZaCtVi60t5-CWkUXwwklLXgFBjlNzu0wlyiLe6DRAAtK8bKEg>
 <xmx:bOI-YTD6yc9rsPJ4L3KsSIs77BLHbrSwCNaGRc_PvMI7hXfs33hy4A>
 <xmx:bOI-YdF1BRroeUNKEh-TRPnPrfO-J9ni1R4sj-oHMBKVR6RSOicPXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 01:32:27 -0400 (EDT)
Date: Mon, 13 Sep 2021 07:32:25 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH] hw/nvme: Return error for fused operations
Message-ID: <YT7iadORFR1e5lfU@apples.localdomain>
References: <CGME20210910145020eucas1p223f51e73b525fc3c592f994416b57167@eucas1p2.samsung.com>
 <c9186dd4-01bd-b143-8708-41b03caadde7@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MuYGg8a4HbsebJfT"
Content-Disposition: inline
In-Reply-To: <c9186dd4-01bd-b143-8708-41b03caadde7@samsung.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MuYGg8a4HbsebJfT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 10 16:50, Pankaj Raghav wrote:
> Currently, FUSED operations are not supported by QEMU. As per the 1.4 SPE=
C,
> controller should abort the command that requested a fused operation with=
=20
> an INVALID FIELD error code if they are not supported.
>=20
>=20
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  hw/nvme/ctrl.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index dc0e7b0030..d15a80a054 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -3893,6 +3893,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeReque=
st *req)
>          return ns->status;
>      }
> =20
> +    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
> +        return NVME_INVALID_FIELD;
> +    }
> +
>      req->ns =3D ns;
> =20
>      switch (req->cmd.opcode) {
> --=20
> 2.25.1
>=20

I think this should be done in nvme_admin_cmd() as well?

You could hoist this to nvme_process_sq(), but I don't think it belongs
there. So better to just copy it.

--MuYGg8a4HbsebJfT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmE+4mUACgkQTeGvMW1P
DekP2gf+L8vFsFob0jXdTkuu90tG2t4gitYfgyjAdLXgbi9Civ8ue5WlveoXRkOY
sSBa4Lp14ocJBxnQ4h8n/zYNUmVBaAIrt5ufjYiaceOk7E9ifrNydwCpieCsxhKE
LdWbQZoMH4At+HljfcnD8gikVYf+bJeMM802LwdmlKJjQ03cRW6fBNh9Nw7XIfKQ
yN7av+zyfYWuqqW0NeLT8VKybcIgvzdT/bT9JK9G00773HiI4gafrFfVDCBJewZD
B0rr16ssREpWyNPuc9zQNfjQZmC1qwXO2C2W79PLEc5vnJhnHcNkczBHJ2tycQ22
CnuOXfJeSlV0QauqVr98HY6rIyVE9g==
=KaCv
-----END PGP SIGNATURE-----

--MuYGg8a4HbsebJfT--

