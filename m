Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B57034E232
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 09:29:01 +0200 (CEST)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR8o8-00055R-10
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 03:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lR8kO-0003yC-34; Tue, 30 Mar 2021 03:25:08 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:55175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lR8kL-0002Y9-LO; Tue, 30 Mar 2021 03:25:07 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 15E255C01A2;
 Tue, 30 Mar 2021 03:25:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 Mar 2021 03:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=A3SIAvwqj7jN6YneIlD/qJxjJFs
 ujnRtjf/2nL2zkfI=; b=KxEc6txrOCjuOG4hGO3VypwnqFEU6bDiKha1qVbJDt8
 d4H5cExLoX6oyQwA13Xiu+qdpF3hOn4vpq+T26L2aa9/sy7QDnVKMSXzYCqCo6tg
 3lV93khrnV2KC4flMDnct6N+/iEN2wP2KrJ5shY9C7Mu9iXRpFuinWTKRToQQ39z
 a6MwxZKdyXdtb6Z0XMekAKlR/WussNB1+azNT90YxRqgQe+dUpkLuZR28QpKuph8
 UsCcqTQvvTexRhRzlcIgoqx6sf8be9zcIe+CQGFRhqHncgT39gIQYTjNxnS62sDB
 6sJSuwMDONc4rgr2S8Ry25aH+T+gMG8UJoG+P2AkzTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=A3SIAv
 wqj7jN6YneIlD/qJxjJFsujnRtjf/2nL2zkfI=; b=IUqC/MPOOd2eMNOwrEOI+M
 bBeDhyva9u++9MuyuyLrhaGhofaf/7hSKtFeVx6ZFsxA1srt23JYNBLgO36pqePB
 PagHnUqGlpifDI3nOKkM5woehF0r4jI58XkPBV2t/bf6CiSXQmSD30f2ZMgt1+aa
 N00H7Ph5IDRS6lauM/xr/if6iGNQfsHaSfp/lTaA0A9KSkxA5N0bEu8HkA6nEWfn
 px+8690qLk2HdmXdFcIcBJL3RyUTng43XJ/s0dKJmtBFVbNnTQAQ2Jk1yHU0o/Kt
 rU+UU+x3ys7y3cGO6ue9TgpPSMRAE2bBghKi22cTtRBB1SRTAWu8zx4NerhpMXWg
 ==
X-ME-Sender: <xms:TtJiYCE10ocbBA2Wa6iYMbtycLr23PHPsspXy2mOEPEh9YEuX6VuJQ>
 <xme:TtJiYDVhnpAtxAqDV-90MsnOUEHwohIKLQdT5HxqulK4ILhB1-q9pFqgLhO075Rnf
 _XY6JHC7zEMHxiBzEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehledguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:TtJiYMJZAWkKRO0RD9b5w-3fkRE5xshqndnZCjdU-3lhyUgI7g5HZg>
 <xmx:TtJiYMHv8ivipaHFkXuSEbjadMOI0SkC6WjsXzislkJdYViBsOlICA>
 <xmx:TtJiYIU_B5rw0Nlj9G6ptpzO6LZjlAZ3mQoeSmOaMP1fWkmQHbMhlQ>
 <xmx:UNJiYLGiZtMH2aIWuhoJ50ZTE23_2-VhAt4GeYUMF5UCAK6raCx1LQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C85924005A;
 Tue, 30 Mar 2021 03:25:01 -0400 (EDT)
Date: Tue, 30 Mar 2021 09:24:59 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH for-6.0 1/7] hw/block/nvme: fix pi constraint check
Message-ID: <YGLSS4LFLLHHqnKD@apples.localdomain>
References: <20210324200907.408996-1-its@irrelevant.dk>
 <20210324200907.408996-2-its@irrelevant.dk>
 <CGME20210329142606epcas5p45c24d24ea384e7bd68c368f1083c1b84@epcas5p4.samsung.com>
 <20210329142258.GA23272@2030045822>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fwm1DJuAffHslFuE"
Content-Disposition: inline
In-Reply-To: <20210329142258.GA23272@2030045822>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fwm1DJuAffHslFuE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 29 19:52, Gollu Appalanaidu wrote:
> On Wed, Mar 24, 2021 at 09:09:01PM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Protection Information can only be enabled if there is at least 8 bytes
> > of metadata.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> > hw/block/nvme-ns.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> > index 7f8d139a8663..ca04ee1bacfb 100644
> > --- a/hw/block/nvme-ns.c
> > +++ b/hw/block/nvme-ns.c
> > @@ -394,7 +394,7 @@ static int nvme_ns_check_constraints(NvmeNamespace =
*ns, Error **errp)
> >         return -1;
> >     }
> >=20
> > -    if (ns->params.pi && !ns->params.ms) {
> > +    if (ns->params.pi && ns->params.ms < 8) {
> and also it is good check that "metadata size" is power of 2 or not?
>=20

While I don't expect a lot of real-world devices having metadata sizes
that are not power of twos, there is no requirement in the spec for
that.

And the implementation here also does not require it :)

--fwm1DJuAffHslFuE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBi0kkACgkQTeGvMW1P
Dek5NAf+Lu+h22R1d5LgHek+ZQ7alpZ7mX2nHKcG0+hBE5jOmFvLpdW69qwpk7RR
Y5xd3baor4HdvlLgZeH1vlMIE3a+tmyBbdfSKZvUMMbzRVYqXBa+P7G5ULiYq+wX
0z0u7IVfW2K2kqb+84kl0vg2b0okTmstEWfz1r9HnGeDmzENg3MGNcC4mRaYZOtP
8WDm56OQ/EwzszKyeTElvwNHV76zYx8BjhcfGXK9SaAabE95ynCwJbeL4hzQ4dzt
yVbUMc/v6bI1dIsrGSonWjj/kbnWAeClnzSGMVpH+EeV++Yxf2sa5s9Sp0PBjF8C
09hv93yalkaTy5SC+OWDl7N4ZJCf5Q==
=Nt2R
-----END PGP SIGNATURE-----

--fwm1DJuAffHslFuE--

