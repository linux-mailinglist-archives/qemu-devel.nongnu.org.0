Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1644048BD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:56:52 +0200 (CEST)
Received: from localhost ([::1]:40084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHjf-00070G-CF
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mOHfj-0005s3-7B; Thu, 09 Sep 2021 06:52:47 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:46277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mOHfh-0001sP-NH; Thu, 09 Sep 2021 06:52:46 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CF34C5C00AB;
 Thu,  9 Sep 2021 06:52:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 09 Sep 2021 06:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6UNo/WDJerRFiEhIbit2GCeSvc4
 FL7Tx0N/WI/w4EL4=; b=a4ff1UIMG7jTBKM6PfbCoi4hELm56m+TDUgnhnLyCfu
 cnm5l8O23aRyq5LEXZki+5Hmo/ZdnJCHZ4PGttos71Gvur2BgRmICouEBQTHHcYZ
 Fs1FADrG6u4GOU40LQPbNkpBEkpqNlZVWqAhbOp44hzRcBZ1ozUZXURSi8+MTbmv
 /6llZH9MsFQDQHDHbcwnGqP+3Q9nI0frPco95W/YUYD6lE/jWF6y/6poTfhAzdQa
 Fl5gHbhAb0UKnPQiY5sGBwgJjiPyjvOYH7EathxFaL7Lypi+jkQr741UAUT+hp4h
 fDdhSPUsDv56ff4Elpl4UoMXOadiX9cafZ8kpRtXxVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6UNo/W
 DJerRFiEhIbit2GCeSvc4FL7Tx0N/WI/w4EL4=; b=eqD07IuGCQ91JgH26nNlBs
 gtuVBTds8F4sxrHE573hTr9nDcv9kOrRFkeHsFWZL4JQkiaCpS1Du4YxSH44HKA0
 hE0XkD8cnh5vzpYwOmoox47eSDwN2OG2a0B+L28E0mTbfsjw8q1sIz6+OLNRu5UK
 nF3NhEvG7pgnF2rY08jZgk6IFLo0axOj5SeCOKvY7VB/7WJQkA1zBvmgW/OkzC2Q
 BD1yNc/0L5SG2MzRWIvoEEfJitsBwNROJM6ukPNl67QPHYdhic/YZarTkB4VKSEW
 ARSBFaAoea08QykSwPtcXziqnd102DGsirax2BKg0qsWnz0cAnEJ/iWqwrGn9SyQ
 ==
X-ME-Sender: <xms:e-c5YaeCX6y5Ia635-nyIyHHn9Z2Lc1Gw_PQks1dEvKvxtCLipSlmg>
 <xme:e-c5YUPH9r9egk_EPlnSK2pbGhLGtMWAsilmJTw-JtOEVHhyW3W7BMQvhgtDJN9Ac
 _xL-XPjIrSHKZSkkpM>
X-ME-Received: <xmr:e-c5YbhhPTZoPKSH9q_qEBH0wiGPcv5uQ3AxmToe_x3MTkau3-zUdtWibBesrP2wIH-NoJucoKIcbv9Szz0fnke94_pZJDaFwtNpIEwjxNiZBRjaEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefledgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:e-c5YX9XcShB6yaSUDPFWHnJK_QPT5a-Crv7JrxmJPp8cBk6b94sEw>
 <xmx:e-c5YWsfNhROxg7XFuQDXgAN6oKb1x3ngD2brwkxcmDzKEtep3GhnA>
 <xmx:e-c5YeEe0HxppIloRu_p2wttNjzDrQVPjMlYLR327QrF6XTLmzGSZg>
 <xmx:fOc5YaIfL3U3m2uIwTkSArWMEacf51omUCWcBHcyhGc1SIcMKkZbXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 06:52:42 -0400 (EDT)
Date: Thu, 9 Sep 2021 12:52:39 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] hw/nvme: select first free NSID for legacy drive
 configuration
Message-ID: <YTnnd/ThFAb7OMlf@apples.localdomain>
References: <20210909095159.122174-1-hare@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UFU8u3d2QqidBmgN"
Content-Disposition: inline
In-Reply-To: <20210909095159.122174-1-hare@suse.de>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UFU8u3d2QqidBmgN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep  9 11:51, Hannes Reinecke wrote:
> If a legacy 'drive' argument is passed to the controller we cannot
> assume that '1' will be a free NSID, as the subsys might already
> have attached a namespace to this NSID. So select the first free
> one.
>=20
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  hw/nvme/ctrl.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 757cdff038..2c69031ca9 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -6546,8 +6546,15 @@ static void nvme_realize(PCIDevice *pci_dev, Error=
 **errp)
> =20
>      /* setup a namespace if the controller drive property was given */
>      if (n->namespace.blkconf.blk) {
> +        int i;
>          ns =3D &n->namespace;
> -        ns->params.nsid =3D 1;
> +        for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
> +            if (nvme_ns(n, i) || nvme_subsys_ns(n->subsys, i)) {
> +                continue;
> +            }
> +            ns->params.nsid =3D i;
> +            break;
> +        }
> =20
>          if (nvme_ns_setup(ns, errp)) {
>              return;
> --=20
> 2.26.2
>=20

Did you actually hit this?

Because then then property checking logic is bad... The device is not
supposed to allow nvme,drive=3D combined with a subsystem property. In
nvme_check_constraints():

  if (n->namespace.blkconf.blk && n->subsys) {
    /* error out */
    return;
  }



--UFU8u3d2QqidBmgN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmE553YACgkQTeGvMW1P
DemozQf+OGFyViwNy7Sn0xR8OTxRdCx4UsKNpazWzyPjTHNYE5X2WtoTJn0d/RNQ
mF8WluJNZ150Dn1Xw6Bq8px9hv9Oo9sCyWvp3aR5NccNPw7XANvJfLT87kKsmQIq
hacGhzZBeMv6WP+4PGvVL7/mApaYyeChhu4cguOAg7rE4mbFeZEbJlpA5eKe6HNu
GJOI/WNnUi/fZXVtny1LEswZy1FxikU8qviFXIlYNaaRv29uHlk8rqd4bHAEeh6D
7zU00NmxDgYia52+nKwfg/barL3bo/fVi+POlqH+zofnzF14iDsoqurq5CF4bsTx
UDDX1ggOGqI5EEb2+3DkggaF0V254w==
=Ye85
-----END PGP SIGNATURE-----

--UFU8u3d2QqidBmgN--

