Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8466AC176
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:37:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAzo-00039A-GQ; Mon, 06 Mar 2023 08:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZAxk-0001Wj-9g; Mon, 06 Mar 2023 08:33:31 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pZAxZ-0007t1-P9; Mon, 06 Mar 2023 08:33:05 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F16555C0079;
 Mon,  6 Mar 2023 08:32:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 06 Mar 2023 08:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1678109578; x=
 1678195978; bh=yA/ZWtt02TJ77joeyoGjC/ar7fQE5CIQJfUnK8ZX2ec=; b=R
 uSBp5U9S6J/xjG+XB9G4N7wpGV6K2MVullTysfIcIoj9eZUuKvwUL3ydYbjlYFzF
 RGcXMettZvIaMmWAcBWIeS2DzFYdZ82hyO3iyc76rlRhCAqa1EDbPbYTiLnVTCll
 Pr4f9RTtRIDTsnGt/bDq/kLkhxHJWc8wqBZ6WwPVko4qSWxnG+yC9TlfW3B4guxy
 yhM75hpVPhZ86y4ly2pIGa99sV2lSgScfaUwCCIbqQq5d0jQChpsN0I/HH4gzirx
 l6UwNyJNOnJS3DsxTErko9EmH7TLy2kAiUOky+3ZdQcwOY8+Yn01UGQi6+2/Wfk8
 Em/y2/XilgKrfQRPiRuNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1678109578; x=1678195978; bh=yA/ZWtt02TJ77
 joeyoGjC/ar7fQE5CIQJfUnK8ZX2ec=; b=nth/VL6DMMOF/M9XbOLIwyn5A1Mwp
 GfcieRC9TUnFIOVCcI8mJN26D7H8+h7T0aN11URZFUOpqQVa02vF7NgSDIzAXKKr
 iMYhtLijetozZ4PKK6atwaU+C3gC4X5Y3s1KvHdA+fWQ6QtdHbuIvR+V6q1T0S6t
 vs/DV0whZlmuu22x0D0m9ksBMrl6oWQ/mSxeyU/jjAi9T01isoOe1EpW2j5NJ2S7
 UJOZlZPPz4BW7xjCbrOMRvQa4qgnA73DMBf9l10gRzKdkG1/dv6HC/2gajZ/ACB9
 3baj/8oKeqO5GjfVRoNDUbWb36mRxhJ/M+cOaUGwgQPgIxjEqtwNzEASg==
X-ME-Sender: <xms:iesFZIJOh6b9IcctaOwia1vDKdeYyjqDmyFwvczOen4cAJeAuh6gfQ>
 <xme:iesFZIJV89tRg6Y7jkkdXz2-dd0IxyOemgEQOnshNck1J6cxyHNW7igtCLVjkjmyr
 BV-QRSs91T6Oj1YhXM>
X-ME-Received: <xmr:iesFZIuMpsz8B2-CyeZI_njAJo-6tnDL_wupXHCUG_BpGzGO64wdSin6NcqsAoj9h4sdJzlPDQyVg3ChKece4PEegaQWcOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtkedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepvefhheeuveegkeekueefteejhfelhfetgeeigeehudelhfeuffetuddvheeh
 udejnecuffhomhgrihhnpehnvhhmvgigphhrvghsshdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghn
 thdrughk
X-ME-Proxy: <xmx:iesFZFYlNiSOTwfPDLRlcpNIIUAXtYpeVpDHxjh68vtGQrZY6Pp3cg>
 <xmx:iesFZPbtJEzO78MiIzGUKY1c74YQUCTWD2Hi5yyRyB2vkaLCAugxLQ>
 <xmx:iesFZBDyMs1Bp5G9pq-Qnip8_-Z14E5ZWnE1VTg7e6ZB0vgwO6xZ8w>
 <xmx:iusFZJlHF-YKEhy77fIYYQKsabw_95JsESVQ-DFE3Oc2vxtiB409iQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 08:32:55 -0500 (EST)
Date: Mon, 6 Mar 2023 14:32:54 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Jesper Devantier <jwd@defmacro.it>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Jesper Wendel Devantier <j.devantier@samsung.com>
Subject: Re: [PATCH v3 0/5] Support Flexible Data Placement (FDP)
Message-ID: <ZAXrhqU01mg9vBMx@cormorant.local>
References: <20230220115926.54623-1-jwd@defmacro.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mMAghlzmTXOLvAsW"
Content-Disposition: inline
In-Reply-To: <20230220115926.54623-1-jwd@defmacro.it>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--mMAghlzmTXOLvAsW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 20 12:59, Jesper Devantier wrote:
> From: Jesper Wendel Devantier <j.devantier@samsung.com>
>=20
> Flexible Data Placement (FDP) is a newly introduced enhancement
> of the NVM command set introduced by the NVM Express, Inc.
> organization as TP 4146. FDP aims to extend the NVM command set
> to enable host-guided data placement. FDP-enabled namespaces
> can be used as before, but writes may now reference a specific
> placement id which in turn points to a reclaim unit (RU). RUs
> are defined as some amount of physical, non-volatile storage which
> can be erased/reused/repurposed without disturbing any other
> reclaim units.
>=20
> For further details on FDP, consult the specification, which is
> available as "TP4146 Flexible Data Placement 2022.11.30 Ratified.pdf"
> in the following link:
> https://nvmexpress.org/wp-content/uploads/NVM-Express-2.0-Ratified-TPs_20=
230111.zip
>=20
> The FDP work builds on 4 preparatory patches, chiefly to add support for
> endurance groups and directives.
> The final patch adds FDP support itself.
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * v2 -> v3:
>   - remove unused trace points (Keith)
>   - style nit - place '||' on preceding line (Keith)
> * v1 -> v2:
>   - "hw/nvme: add fleible...": check that max 128 placement handles
>     are being created (Keith)
>   - removed unused NVMe directives struct (Keith)
>=20
> Gollu Appalanaidu (1):
>   hw/nvme: basic directives support
>=20
> Jesper Devantier (1):
>   hw/nvme: flexible data placement emulation
>=20
> Joel Granados (1):
>   hw/nvme: move adjustment of data_units{read,written}
>=20
> Klaus Jensen (1):
>   hw/nvme: add basic endurance group support
>=20
> Niklas Cassel (1):
>   hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace
>=20
>  hw/nvme/ctrl.c       | 798 ++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/ns.c         | 147 ++++++++
>  hw/nvme/nvme.h       |  92 ++++-
>  hw/nvme/subsys.c     |  94 ++++-
>  hw/nvme/trace-events |   1 +
>  include/block/nvme.h | 236 ++++++++++++-
>  6 files changed, 1341 insertions(+), 27 deletions(-)
>=20

Thanks,

applied to nvme-next.

I took the liberty of fixing up the commit message and adding the
missing DIV_ROUND_UP()'s.

--mMAghlzmTXOLvAsW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmQF64UACgkQTeGvMW1P
Del52QgAliH0o1cj/PJsRSsVT5EcryUqzocsZRT/AK0KRd5UMb2vCC7bQ4T/dSsd
d/Hjdlt62cGAqWchJBTmWfQOAfufFpjAiriAMh3vKgsG43Jqm8r2K/+I2mxpiSol
+e+AnTheLXQwZ1/IkivNf6D4fDEdUi7neTdCFtvXUnfmBlTSIz8jPKLyBP1qVzt0
fI8GbYfj6DwQuBSoFDK73wfA1dEuZZazWnLhhPfpNR6HTq4TEkNWjM69BD3aGRsD
wH8WMVHqzwUWcIVMbwYNt7VHZ7fPZIwLCiTIY32XuNWNUTmXvzhtaixcrcJa8oYh
gwLk5D5VKwekWH9Gk55OWaiyJNTFYA==
=6+gZ
-----END PGP SIGNATURE-----

--mMAghlzmTXOLvAsW--

