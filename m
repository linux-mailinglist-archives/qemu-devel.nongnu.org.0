Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481AF569A3B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 08:06:42 +0200 (CEST)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Keu-0004jr-Ke
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 02:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o9Kaz-0003ts-TV; Thu, 07 Jul 2022 02:02:37 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o9Kaw-0007kf-4G; Thu, 07 Jul 2022 02:02:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C54AC5C01B1;
 Thu,  7 Jul 2022 02:02:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Jul 2022 02:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657173749; x=1657260149; bh=XO
 yXpXuBO2wf1DruMjlMnJ8V0p8lGKbR3tkZ911wh4w=; b=OMC6ABKOAyTEQixcL5
 A6/OJsDKq4CiQjxcbnk+naVmNhsWKwjZlLTBt9f8PGRtkaNGDGNHpcp05au+TSmg
 pKLEqw0Rfl1VGm4j85DhQYJPcDt2vQ2xIjasHqEXAioDV67gXM8zpXU4IQFd7g5K
 e0XMBf0bZ5awTqtBfkuHwGra5KfROdDcpa9zDb/c7n0Bpmv+vubx3chJCyDq6Zny
 Kt1ugWw/gfXfwdyrLUTPEkorahmJac+Xaun1/ACHRdn3+sgbtuoZulVhFGNUafvq
 z7/v11JrTJaSM6+d6rOR6auQMn3mvy7ECq3lemaXyK0MPNprqW2O8yu9aXkH3ETX
 5vMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657173749; x=1657260149; bh=XOyXpXuBO2wf1DruMjlMnJ8V0p8l
 GKbR3tkZ911wh4w=; b=T9dDFS7aeTxjF9O4qgpUUca/RRlXr09HiIOyy9/acHsA
 PHvztebKtrDGhbYeRYd7d5xzrRPnqvx7ZM5yeAdkCwVUVl9OXiVhWQS9E13jLcRR
 YUNJ/c8R0fx+kj4TuwCHW2mG6Dkc85msT4v9IiWt4TNY1raRXUOKV1U0dpLjGmc+
 LaJAnomf5jeN1c7RVoRYrXEvkw769FfVMJhUsn9UMV6KeK2v26lxEZRNLxr9r7Vw
 grfqTC0xiLvzQgnMBZH6QF73xj8WfEFdZLq0aXzJkOYvrjBDdtdSptp3xhO9M8K4
 cME8wke6rdR3Bx9t6i2wKKvCOU5lRi8nohIo+OP9/w==
X-ME-Sender: <xms:9XbGYk4_0jI168IkZFhBRL4fsPggf0q0dOGz9xuAnsLjQ9AB9KZgkg>
 <xme:9XbGYl4kQ9AWckTZo1H2-1PMpEcYgZyimz2kuWa20BSE6sxieDB0naVG8KLyVnfJE
 UshKr743CL0t-S3kPs>
X-ME-Received: <xmr:9XbGYjdISwFolKrlUF95iLRmOLlwoIlLkED4TiJ-jL0Wu0vFFqJ9YLjIeBbo66r18xlsdHLXMSTjl0O2CYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:9XbGYpKVhrlJo5tGKUnCeLKNAcquNOa89UJk7u5VR4lAmkgeY0RJ6A>
 <xmx:9XbGYoKfiqMG3Cf9j2uKpLfNnvjgVX7UUuA_57IK7uAhEWjaI1YyVw>
 <xmx:9XbGYqxSE3ZrRCMlLel-zJcU4J1QDyncSssb0avDipez5FFZdMgH7A>
 <xmx:9XbGYtHxHxZ--4flccnwxy70l26JgluBjtfjDDW9bxM0QEaFztSyTw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 02:02:28 -0400 (EDT)
Date: Thu, 7 Jul 2022 08:02:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 hch@infradead.org
Subject: Re: [PATCH] hw/nvme: force nvme-ns param 'shared' to false if no
 nvme-subsys node
Message-ID: <YsZ28nGMPfQTt9h5@apples>
References: <20220628122209.415725-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U/aGW40Z5BNhc9k4"
Content-Disposition: inline
In-Reply-To: <20220628122209.415725-1-niklas.cassel@wdc.com>
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


--U/aGW40Z5BNhc9k4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 28 14:22, Niklas Cassel wrote:
> Since commit 916b0f0b5264 ("hw/nvme: change nvme-ns 'shared' default")
> the default value of nvme-ns param 'shared' is set to true, regardless
> if there is a nvme-subsys node or not.
>=20
> On a system without a nvme-subsys node, a namespace will never be able
> to be attached to more than one controller, so for this configuration,
> it is counterintuitive for this parameter to be set by default.
>=20
> Force the nvme-ns param 'shared' to false for configurations where
> there is no nvme-subsys node, as the namespace will never be able to
> attach to more than one controller anyway.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  hw/nvme/ns.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index 870c3ca1a2..62a1f97be0 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -546,6 +546,8 @@ static void nvme_ns_realize(DeviceState *dev, Error *=
*errp)
>      int i;
> =20
>      if (!n->subsys) {
> +        /* If no subsys, the ns cannot be attached to more than one ctrl=
=2E */
> +        ns->params.shared =3D false;
>          if (ns->params.detached) {
>              error_setg(errp, "detached requires that the nvme device is "
>                         "linked to an nvme-subsys device");
> --=20
> 2.36.1
>=20

Thanks Niklas,

Applied to nvme-next.

--U/aGW40Z5BNhc9k4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLGdvAACgkQTeGvMW1P
Dem5dgf/XCwn2SYhjyQWL21UHuAvmSlkkT6Fx8GaV5Q0swHx+pcuxKBXSRGvi0hS
Xy6czLfLv7LzW+gwhleMTIhKDBIupGI1PuOzu5fUoVYxCpyN6D87+WFq/1AwaZNm
0b1zjJFh6AcfQRsDiqSyGkYJ/Yo4Bbn6bcfSCMluqDIbKZHFhGk9X45Gyj84znD+
3zQoI2FwB7xxzI0TLz/A0JOsnZvJm3kWJ63eOqzKgh0UNEL81BSSQkVgC5y1acq/
hmvCJlu3V2k9pnQwde4j3HJKDZ+joOFbEUIKgWRk5w86azUXqv1Gcm3ykIP63hSc
DIISsdaiHBTYyrvyTy3wJ+XLQYP51A==
=xaHS
-----END PGP SIGNATURE-----

--U/aGW40Z5BNhc9k4--

