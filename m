Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB436AF70
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 10:07:46 +0200 (CEST)
Received: from localhost ([::1]:51224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lawHR-0003fT-0e
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 04:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lawCg-0002rQ-Uc; Mon, 26 Apr 2021 04:02:51 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lawCa-0005gd-PQ; Mon, 26 Apr 2021 04:02:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9618B4B7;
 Mon, 26 Apr 2021 04:02:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 26 Apr 2021 04:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=81QywRSu88SqOD9hJahG9buoOEt
 g7Oa1YxEVAjXh0aU=; b=K1pyKOtT/j3LUojsHMzs1rLc/gEafkx+T+38VlN3Ays
 aEn+4bG7S4foUyVguJEQTGZbhyhGYP/yXnOqdjoBZs2+L+tle9hE75qAxsukb9M6
 YDVrBj6UujusEGfWoFB6ZiQe5789zfikoPR68qpbSMHprnGX06ic/5HMIq8wqUYt
 PUyTeaN9qP6KiCOhVdIC6kGb8nQCU+PdgEaBw5tkToyraEoSSPIRBoDzZmNk7fm4
 fUMw/MVK76PQnub9MlBq7g7i7W3h5bX/oCAZnbI6p5OcjkXfejrLIFsoLooz2PD9
 hVFTSGrSL+gEiS49j+3YyAIa9+frgEuTh/fzpmwnapg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=81QywR
 Su88SqOD9hJahG9buoOEtg7Oa1YxEVAjXh0aU=; b=d9SySJJUttzfnXoCd0ICpQ
 5fcHmi7AhiL6e1t+cGasTxxvm5Z21LmRHQZ6GtLwfLVdsCyQ7u5RQ0q7yeB5REah
 5cN+oDQyofS1J0eREmQEhg3jv+DLuls4B/F9hBtA2f9TJ43sDUAu50rhnWqlSfgS
 bJaYF1HKm5j2tty7i3FtQkb0ss6izC5aCmNPZIdwwkqROwqFAmoH5fYpMERHYUQZ
 Oi5r1jFp/GY0W27yYFMfBhcAgLWcsvuQrRGDfJgTSvZqdxJwt1Z9dnkTIfan0CBK
 w9QrHseRxajS4c27qOjiZ88x2IyME43g2jN7McCQh8sNcHZn2ZdunduhRpcp7cmw
 ==
X-ME-Sender: <xms:oHOGYInJ5hN8bpY5HWcvV2qOYwu-OqiglFjkF5mz1SNWHLR-Q2-ZDA>
 <xme:oHOGYH0Bl7L72Vg7067V1HLZ3le0V1WML2_obwZn7GXR2xDqOTR7qqaoDFZsFROWx
 HUIQ9H2Vd58pfRMTVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddujedguddviecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:oHOGYGpIPnIMt3qU3P3tgERL3Q-_6snVNzBxvty1OTN4vc79qDf8vQ>
 <xmx:oHOGYEl9L4w7USayStzqcEyETyqoj22xqIG4SZjV6F8gbTVD2PUDAQ>
 <xmx:oHOGYG2yV2T6igOggkum3BzPQK-0iZswHSQkwQMEZuUksxemA1X6OA>
 <xmx:oXOGYJRr9Fev338Fg6W4Mo0u7ptOW5G9P8ed-iYijvl5jjzCEUdxzQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39B661080066;
 Mon, 26 Apr 2021 04:02:39 -0400 (EDT)
Date: Mon, 26 Apr 2021 10:02:36 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/14] hw(/block/)nvme: spring cleaning
Message-ID: <YIZznLkjWpnwr2cl@apples.localdomain>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qdYKZBnzXhXenCiZ"
Content-Disposition: inline
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qdYKZBnzXhXenCiZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 19 21:27, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>This series consists of various clean up patches.
>
>The final patch moves nvme emulation from hw/block to hw/nvme.
>
>Klaus Jensen (14):
>  hw/block/nvme: rename __nvme_zrm_open
>  hw/block/nvme: rename __nvme_advance_zone_wp
>  hw/block/nvme: rename __nvme_select_ns_iocs
>  hw/block/nvme: consolidate header files
>  hw/block/nvme: cleanup includes
>  hw/block/nvme: remove non-shared defines from header file
>  hw/block/nvme: replace nvme_ns_status
>  hw/block/nvme: cache lba and ms sizes
>  hw/block/nvme: add metadata offset helper
>  hw/block/nvme: streamline namespace array indexing
>  hw/block/nvme: remove num_namespaces member
>  hw/block/nvme: remove irrelevant zone resource checks
>  hw/block/nvme: move zoned constraints checks
>  hw/nvme: move nvme emulation out of hw/block
>
> meson.build                               |   1 +
> hw/block/nvme-dif.h                       |  63 ---
> hw/block/nvme-ns.h                        | 229 ---------
> hw/block/nvme-subsys.h                    |  59 ---
> hw/block/nvme.h                           | 266 -----------
> hw/nvme/nvme.h                            | 547 ++++++++++++++++++++++
> hw/nvme/trace.h                           |   1 +
> hw/{block/nvme.c =3D> nvme/ctrl.c}          | 204 ++++----
> hw/{block/nvme-dif.c =3D> nvme/dif.c}       |  57 +--
> hw/{block/nvme-ns.c =3D> nvme/ns.c}         | 104 ++--
> hw/{block/nvme-subsys.c =3D> nvme/subsys.c} |  13 +-
> MAINTAINERS                               |   2 +-
> hw/Kconfig                                |   1 +
> hw/block/Kconfig                          |   5 -
> hw/block/meson.build                      |   1 -
> hw/block/trace-events                     | 206 --------
> hw/meson.build                            |   1 +
> hw/nvme/Kconfig                           |   4 +
> hw/nvme/meson.build                       |   1 +
> hw/nvme/trace-events                      | 204 ++++++++
> 20 files changed, 928 insertions(+), 1041 deletions(-)
> delete mode 100644 hw/block/nvme-dif.h
> delete mode 100644 hw/block/nvme-ns.h
> delete mode 100644 hw/block/nvme-subsys.h
> delete mode 100644 hw/block/nvme.h
> create mode 100644 hw/nvme/nvme.h
> create mode 100644 hw/nvme/trace.h
> rename hw/{block/nvme.c =3D> nvme/ctrl.c} (98%)
> rename hw/{block/nvme-dif.c =3D> nvme/dif.c} (90%)
> rename hw/{block/nvme-ns.c =3D> nvme/ns.c} (87%)
> rename hw/{block/nvme-subsys.c =3D> nvme/subsys.c} (85%)
> create mode 100644 hw/nvme/Kconfig
> create mode 100644 hw/nvme/meson.build
> create mode 100644 hw/nvme/trace-events
>
>--=20
>2.31.1
>
>

Applied to nvme-next.

--qdYKZBnzXhXenCiZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCGc5oACgkQTeGvMW1P
DenmAAf/ZlA7MPtRbV2QPqqpAFfJxKnTfHuK77jjXmzfd7HgHqxLbuZVI5Bbtk1d
rPihY48461dDdSanROgbCMJlYr4lmTsgvdXCr5CukAJqIW6tu3n9ICxdjZ3zpVKQ
I8W79ubNyCgAdf8ulNpXIKh6v2W8d3fpwvi2LDzMwrUGPfBuKYgFR0+V2klxox9v
QEXqKOvE1QRz2rIY3asu5p9IRWWm4szQ1k/Kju7QcVFBV9V0RGL2a4Fnx3DK7dj9
d7UppPQD9H1GmFysTtUyTM78LJOKjkG9Lbiirk4/mZB/ePzHPXhK5Hon1XT1WWw2
1WIapWlzmXakt5yUZERoRHTB0zZFJw==
=NHb+
-----END PGP SIGNATURE-----

--qdYKZBnzXhXenCiZ--

