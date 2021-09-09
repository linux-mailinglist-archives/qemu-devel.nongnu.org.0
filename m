Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096B54048B7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:52:56 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHfq-0005Fu-Rk
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mOHb9-0004Ff-O1; Thu, 09 Sep 2021 06:48:03 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mOHb6-0006IA-T4; Thu, 09 Sep 2021 06:48:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 413E05C00E0;
 Thu,  9 Sep 2021 06:47:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 09 Sep 2021 06:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ljmTmj8DRTCyxsNnIAII70NT8Rc
 nVvbHHvNdVSyQxZo=; b=V5vCRxVSrscZUNCyq5kYjeEdFCk+aVx8SYOP+8vr1yZ
 5xMENdWKnspIcVMHk1+2RSrh0SVfpCWJNNeuC0S+dhzKEp1zwU5qRX5NPZCc4wc5
 nnsj7HzNxmMHYhT7FYf+4pW1mFnTQM5ZUF/BQnBelukxHj4HXv09NkPnFG4MFmEw
 4pk3CtjqhCGnUoJKl/dfLamNVNh+zYClhEPbcJxM19E5tLc9m5Bluvg60mcJ088F
 dC5Ejn6l5fNgkR/eSlqF+J+wvPXqf2QVuhWbsXk6VJSBIR/uaXJhIMpIrG+vASgF
 qA86W5NFw0R1USkPmSdNznuulioOUFUJwrtAlZ7DEiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ljmTmj
 8DRTCyxsNnIAII70NT8RcnVvbHHvNdVSyQxZo=; b=to8nYM7GTj7IYWyWFXnZBa
 GLsmGWmhBAzJ1Nldlm+HztKfstaBNEqa5STJjRPg7scqIaMMKQmY40vqv5XDJULC
 CWtvXuAURqR1LQqfC+2Izb6bTYt7JzRD9MTzObfG9KIBYyCGnbA01OI9BzZl2gQ/
 xddZpjjIL7YV9WyKtK/1wVZffC03UoYlsqmd934mESGAIUbspq+0ARBGa5X3Axze
 lW60C/LtMVQkXfU1Ef58DtUuyhHHjsE3zYR2K/YDgif1H6ii6fSwPSCcRBNvhobi
 KwTSymz9RgfYOgr34Fe/SXOiDqXtxveD0nyJDrxI3aWmDLlXkwvAdtM+VVXWlNtA
 ==
X-ME-Sender: <xms:XOY5YZVeiVW8kRBx_QgBd_NJhvcXSxggqNw8jP8N2nacpYWt7pFFdQ>
 <xme:XOY5YZk_yYVRzOGQT2nD6KyRlbgJauyOFI5xY6XmdOL2-Ke3tzaks_H0OpivdnBxw
 bdfbK_7s3AgJUH5k74>
X-ME-Received: <xmr:XOY5YVbiPwxFyqn2ZbJHiAbjE4PmMKzE4MkBDS_onktkocmXsH6qMPu67gaIshY6242zfktSmOdwHxWdRJQ-Zf0Gpz7joUkEUEyYcE3bjOTVYFp0Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefledgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:XeY5YcUOuBxJcHEyHyHgxZtwrEgFkH9wcoRTcNTjLHdjcipPhj4yDw>
 <xmx:XeY5YTkMg0fOkcFbvBGzKRwIdUJJ_BCtx0MdChjWBs44sm2jj8GKVw>
 <xmx:XeY5YZcGOmODeJ7EHCkVCcc_MrT1DZCWfzRBChGk-jCKVtNrGhWmdQ>
 <xmx:XuY5YRgIDndw_L33HwvmCheXwnESl7IWRB_XLPd1QirJpZynzQsXlA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 06:47:56 -0400 (EDT)
Date: Thu, 9 Sep 2021 12:47:53 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] hw/nvme: reattach subsystem namespaces on hotplug
Message-ID: <YTnmWUKhtlR2j3yI@apples.localdomain>
References: <20210909094308.122038-1-hare@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ElSVLhtUfD5FLMsU"
Content-Disposition: inline
In-Reply-To: <20210909094308.122038-1-hare@suse.de>
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


--ElSVLhtUfD5FLMsU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep  9 11:43, Hannes Reinecke wrote:
> With commit 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
> namespaces get moved from the controller to the subsystem if one
> is specified.
> That keeps the namespaces alive after a controller hot-unplug, but
> after a controller hotplug we have to reconnect the namespaces
> from the subsystem to the controller.
>=20
> Fixes: 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
> Cc: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  hw/nvme/subsys.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> index 93c35950d6..a9404f2b5e 100644
> --- a/hw/nvme/subsys.c
> +++ b/hw/nvme/subsys.c
> @@ -14,7 +14,7 @@
>  int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
>  {
>      NvmeSubsystem *subsys =3D n->subsys;
> -    int cntlid;
> +    int cntlid, nsid;
> =20
>      for (cntlid =3D 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
>          if (!subsys->ctrls[cntlid]) {
> @@ -29,12 +29,18 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **er=
rp)
> =20
>      subsys->ctrls[cntlid] =3D n;
> =20
> +    for (nsid =3D 0; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
> +        if (subsys->namespaces[nsid]) {
> +            nvme_attach_ns(n, subsys->namespaces[nsid]);
> +        }

Thanks Hannes! I like it, keeping things simple.

But we should only attach namespaces that have the shared property or
have ns->attached =3D=3D 0. Non-shared namespaces may already be attached to
another controller in the subsystem.

However...

The spec says that "The attach and detach operations are persistent
across all reset events.". This means that we should track those events
in the subsystem and only reattach namespaces that were attached at the
time of the "reset" event. Currently, we don't have anything mapping
that state. But the device already has to take some liberties with
regard to stuff that is considered persistent by the spec (SMART log
etc.) since we do not have any way to store stuff persistently across
qemu invocations, so I think the above is an acceptable compromise.

A potential (as good as it gets) fix would be to keep a map/list of
"persistently" attached controllers on the namespaces and re-attach
according to that when we see that controller joining the subsystem
again. CNTLID would be the obvious choice for the key here, but problem
is that we cant really use it since we assign it sequentially from the
subsystem, which now looks like a pretty bad choice. CNTLID should have
been a required property of the nvme device when subsystems are
involved. Maybe we can fix up the CNTLID assignment to take the serial
into account (we know that is defined and *should* be unique) and not
reuse CNTLIDs. This limits the subsystem to NVME_MAX_CONTROLLERS unique
controllers, but I think that is fair enough.

Sigh. Need to think this through.

Bottomline I think I'm partial to just accepting your patch (with the
addition of taking the shared property into account) and documenting the
limitation wrt. persistency of attach/detach events. No matter how
spec-compliant we do it on a live system, we still break compliance
across QEMU invocations.

--ElSVLhtUfD5FLMsU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmE55lcACgkQTeGvMW1P
DelqawgAlQ6BTHfklnimlFvVJsb9lK/t0TG4Yqm5kiFQzMlr1cgGdtwHtfSvZUL3
E8pr+KEvGL4OgU8QdCEclZpMreS/MUG0mbmpH+s0ugrPHpMbkr0gJxwijS6WK1eO
3zo4YSkFhNGryZEr/ni49bz/79UGzURfODN4fcMpbhuG2sDwvIDnznP7qBOO0ljI
Yb3x4Mo+5tH/MFZ6FnfQM8WfoQXWEQ/rz0WQUU4N1JumVU/GGjgnBYnd2JcJjVu3
1VaPX4WDzoZu70881Dft+TmdszZK3Zwm/dXOINoDdQl8kZPZ1/rW0CFMZGecjmmM
uM/LRj7GSXLCgFgvhzs7f94+MkJXMQ==
=BPQB
-----END PGP SIGNATURE-----

--ElSVLhtUfD5FLMsU--

