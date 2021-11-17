Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C9454756
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:33:18 +0100 (CET)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnL3s-0000xR-Nj
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:33:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnKhr-0006n0-Kl; Wed, 17 Nov 2021 08:10:32 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnKho-0001BX-G4; Wed, 17 Nov 2021 08:10:31 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 186035C020E;
 Wed, 17 Nov 2021 08:10:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 17 Nov 2021 08:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=OPqZkhGV/sUmBsvtxzOgZw69N2L
 4Mc+fIAl8BEIhopw=; b=FNdpItQXu2Nbj6r4gZ7exa+b9NrgWGt6DO9P+2ahl99
 0qcdDBJZ7z7N/c0odDveeoX1Hm0nJwvwafVAirty9th+v/9miturG3AOSalVSJC+
 RIKSxUCIRSrL1geb5c7EEq7pkPtVR+wxFeaFajWl478AWHEJbUTtrgMXTweAl5gS
 poUAuO3ShZ4HT7AxqBxZo5Q/yMbAxO8ux2c76tXNScYPrRtukNoAPbKd+vv4maRE
 TyKCIiR3OmZw0gTG4zNu+asp3CqXutm8F3LXJWeE1PptLeFM8YcP6Iti+RlGY8t6
 BaqXTsuTNdaTlmTdZ6kGPl8yW3saqHi3iWaj0jq6L8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OPqZkh
 GV/sUmBsvtxzOgZw69N2L4Mc+fIAl8BEIhopw=; b=hw9Aw9yBuAPwjYmQnzFj7t
 4NmKkE5niFigWRM0ENGFfUdEIWvHgLOI1JQCAwZZs10+kGyqqIhuN8wJbd+uHE1w
 iHvKmntJV+09gNuoHF2VWsIhaAKSXnbZvJH/PenoFYLT+NuXt2LXyYIO/+VQA0D7
 aWRn4FGSftdzHf553AjbbSRfVyzBPWR8o+mhfkvFT/F4Sva0xGMZL64sCjfVA4B+
 XLQ6Gnw8psOuWSvbf5gh+iiE1lHHPK5q7T/QSVB6aDh+AhSGYmL1bmAlSiSZGz36
 PMcjSyal5A2wMwqEo1Cl8Lh9ppuHdDHJ0aHud84xUhunmNceMjhFlFO/JdC7Ly2w
 ==
X-ME-Sender: <xms:Qv-UYbGqK753zjbDey7KJhXPyoUCrUvPACE7T10pF6dyw6OBCVHxQQ>
 <xme:Qv-UYYXPFFXivQHjsPlFBSUnmZ925fKt4goMG0a7_afhcoee2wJDbFKA7yL5Uk7Bt
 uuopjdCx7xktf0dbnE>
X-ME-Received: <xmr:Qv-UYdIxSoj0yKCCVnAPAtqTqVseISnkLE49X8YxvK89F9wnzFjdGGQtOglrUQjQ-_7F4Ej17niFsJilP-eqR_jP4yICb8ngY-hvlgRQ1ewyr2ewqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Qv-UYZFO1f6rQtjw0AQAYYd1Y4zkq2nG8yH08csoJ7bQk8_K9z3ZoA>
 <xmx:Qv-UYRV-WI0lB_5aGCsxaFBlDdzA7Scao_ofosNvcVZSx4FLf-MTXA>
 <xmx:Qv-UYUMpN6LmPjN7_YBHwG1hZ0XWU5I1ETUUdgt9TlHyS8pbQ0kaiQ>
 <xmx:Q_-UYTIeDQQBC6ltO1VFS0KW-suFHMU8Mid--fu5MxltVFK79TybDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 08:10:25 -0500 (EST)
Date: Wed, 17 Nov 2021 14:10:24 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2 v2 2/2] hw/nvme/ctrl: Prevent buffer overrun in
 nvme_error_info()
Message-ID: <YZT/QFji3gxmED31@apples.localdomain>
References: <20211117123534.2900334-1-philmd@redhat.com>
 <20211117123534.2900334-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="impAO+nVACg3Hmjp"
Content-Disposition: inline
In-Reply-To: <20211117123534.2900334-3-philmd@redhat.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Gaurav Kamathe <gkamathe@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--impAO+nVACg3Hmjp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17 13:35, Philippe Mathieu-Daud=C3=A9 wrote:
> Both 'buf_len' and 'off' arguments are under guest control.
> Since nvme_c2h() doesn't check out of boundary access, the
> caller must check for eventual buffer overrun on 'trans_len'.
>=20
> Cc: qemu-stable@nongnu.org
> Fixes: 94a7897c41d ("add support for the get log page command")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvme/ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 93a24464647..7414f3b4dd1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4146,7 +4146,8 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_=
t rae, uint32_t buf_len,
>      uint32_t trans_len;
>      NvmeErrorLog errlog;
> =20
> -    if (off >=3D sizeof(errlog)) {
> +    trans_len =3D MIN(sizeof(errlog) - off, buf_len);
> +    if (trans_len >=3D sizeof(errlog)) {
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
> =20
> @@ -4155,7 +4156,6 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_=
t rae, uint32_t buf_len,
>      }
> =20
>      memset(&errlog, 0x0, sizeof(errlog));
> -    trans_len =3D MIN(sizeof(errlog) - off, buf_len);
> =20
>      return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
>  }
> --=20
> 2.31.1
>=20

I don't see any buffer overrun issue prior to this patch. However, there
is a functional bug since the offset is not added in the c2h.

--impAO+nVACg3Hmjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGU/z4ACgkQTeGvMW1P
DelCPgf+Lp1hwR+MAu6TBP7nQTs+fPipVvrd3B2KCsMK282eCMJjUtH9ATCfIB/Q
gPxnw/JOceghIV1yKf2Z9sPxN1iB0uuIXrIGiWt+TtkRixdkos40yidBmq49f80B
zXLWF8mlAvDSxYZAAo8mwi21t+QYJ1OpdaVup8qMyRyathlexfYe23cpYlB+TIjy
CncK5AJlBpllXlH2sktWFIQpZBxUWIl9AJNq6s1uaCxB5MvpqtrJOv6xD0LrFnJN
xviSy16RjZ6Vc18DqY7MmbZKcsfbACVqm5LUCLTjf0/6mJe24uP08rIXoghLMao/
u4aB6jDzB4BKG8mXaAm6BX+BPzceQw==
=deOJ
-----END PGP SIGNATURE-----

--impAO+nVACg3Hmjp--

