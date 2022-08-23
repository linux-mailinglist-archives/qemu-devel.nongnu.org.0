Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2F59E7DA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 18:51:04 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQX7F-0002Ay-Jf
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 12:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQX3z-0000F5-SM; Tue, 23 Aug 2022 12:47:39 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:58617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQX3e-0005Ed-Lx; Tue, 23 Aug 2022 12:47:20 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F31973200920;
 Tue, 23 Aug 2022 12:47:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 23 Aug 2022 12:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661273234; x=1661359634; bh=c/
 v98b0Ev3olJJlw8tgBki1v3ORZ2EfUnxPttFcvdFY=; b=UyC7nMO/Haq1JamQ5h
 aew4uNTyhmzn20pXmEbNAPlAhv5MzZKtPXmmDQKsB2lomh+iTKCdvZj6SLAJsM7o
 MoOU4KutDRCGZt6HxlUXq9WurpDF4dFJOqmbMO8Mqv8GlCFH9YvQ3KaPd2m05QP4
 9T4O0ryBfbZoJjXOGQ0tn4pcmNNAVhuKa8j7p/sdD1k8KHJkq+SO3kjW/NWXjqXb
 vnHShR+ZO18kPAOhtR2KI80xzonjXz/JJ2cYvJVpWuBYe3gsrmDiSnMJAjxtB2bI
 TsKzbUUAlfD6Bz4N+ZOZg4ssYRohhVsJLwT5inxpWh2NRrS/4pjh/XMkE7gncGTm
 S13Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661273234; x=1661359634; bh=c/v98b0Ev3olJJlw8tgBki1v3ORZ
 2EfUnxPttFcvdFY=; b=SSLmhIyVFtpGsMuNHNhaXFRdh5j9/v5PNOSKIKolBAfR
 P+VysSA/YCoDkOEUF4E6TJ3b6iKmD52peohHNn+w3LPEPfPwpnErgUeZHgm2V91o
 Yp1vhWazV1SyFYXVDPMOm05px1cBxPK+Pb/zOKNflOL1IHQOhjXFDAGAGAtdN2nl
 Fz5Nl0RcGWIR+doi9N1rtqcU9l51L7T/WRM2hfKF2XJ37qgAq2ahl4JFzopRZmMp
 aD8IjuJC8bVVM2P7v5PdiucgbO2HEgQkX/aXACZ7cnf3QCcBqGH53X24uHC7HbSQ
 qtX2XZblezafr+evlT6DyCAKzYU/3tyS9Z/AwhQfKA==
X-ME-Sender: <xms:kgQFY5WQaPN4gMwGQKxUL_wz_RpqjYPVE1wv6xQIFT6LDKOWuXgUmQ>
 <xme:kgQFY5mJvVykFxv_utAM2BbJsf-ICEgbBZRdHRshTaN7Qc1LTq0Hm7SBNybaZhDvK
 9hIMW2jYCD-oy2_3W4>
X-ME-Received: <xmr:kgQFY1Zkv0RRvNI8HRsl0BSuzItm-tZJI7vvn-2vvxEgSX7ZQ5pOH8r4jWfQd6zZhMpNm_Dr0j1Z1uP5iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiledguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:kgQFY8VozpH5EX-vz0Xur72fsgDEL-RfU1BGSWfzCvDkmhyQtswkzw>
 <xmx:kgQFYzle4y4LvN5nEO0sCQeB6_IGRpqm5CvHtgNTsOwMJomCw2mfUg>
 <xmx:kgQFY5fw6Ai2EAwM0Q7x_XQgZT4dz7KG6oGfTiCMUvT5lroo0yAcaQ>
 <xmx:kgQFY8CD-kTPEv2w-QJYtrFwzjO9lrzugBcn5PE25KmgpY61ApshIQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 12:47:13 -0400 (EDT)
Date: Tue, 23 Aug 2022 18:47:11 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Francis Pravin Antony Michael Raj <francis.michael@solidigm.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kbusch@kernel.org,
 Jonathan Derrick <jonathan.derrick@solidigm.com>
Subject: Re: [PATCH] hw/nvme: Abort copy command when format is one while pif
 is zero
Message-ID: <YwUEj3E9HInZx03T@apples>
References: <20220826025359.124312-1-francis.michael@solidigm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/ilgfkuW7mQBbT2T"
Content-Disposition: inline
In-Reply-To: <20220826025359.124312-1-francis.michael@solidigm.com>
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


--/ilgfkuW7mQBbT2T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 22:53, Francis Pravin Antony Michael Raj wrote:
> As per the NVMe command set specification section-3.2.2,
> If:
>     i) The namespace is formatted to use 16b Guard Protection Information=
 (i.e., pif =3D 0) and
>     ii) The Descriptor Format is not cleared to 0h
> Then the copy command should be aborted with the status code of Invalid N=
amespace or Format
>=20
> Signed-off-by: Francis Pravin Antony Michael Raj <francis.michael@solidig=
m.com>
> Signed-off-by: Jonathan Derrick <jonathan.derrick@solidigm.com>
> ---
>  hw/nvme/ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 87aeba0564..cb4c0f80bc 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -3040,7 +3040,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest =
*req)
>          goto invalid;
>      }
> =20
> -    if (ns->pif && format !=3D 0x1) {
> +    if ((ns->pif =3D=3D 0x0 && format !=3D 0x0) || (ns->pif && format !=
=3D 0x1)) {
>          status =3D NVME_INVALID_FORMAT | NVME_DNR;
>          goto invalid;
>      }
> --=20
> 2.25.1
>=20

Thanks, looks good.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--/ilgfkuW7mQBbT2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMFBI0ACgkQTeGvMW1P
Dem+Sgf9EabWahVJjFBjfv44kJqekOrtdXwUJpDYK124gN+FyekJJz/W+tXCqwrN
Nn1eT20o6mmV671lBJVCxifMQaMO8qIldZaWumC0mVvNCdSa/963rz7pmdx/AhHH
75uQhDY2+Kl+Dz8BKgkvLpEFqJg9Mr/R583a08A8/60fipKKwx26qavgsLGxDaAT
Cfo6O4NUpNfg+C1uuBzeesTTf4tFFSrtYArz4u75FWrmRo6V/VWPwym8guNmk9T0
IxeqMyOHrcGsLXHTcqQgEciwJoNndt8z3OGeFu27Pp7dhDl6qNdX1mO3r0B4UWC0
EXjUI+XdGLWepXgcrdI9OqCFACE7kA==
=c00/
-----END PGP SIGNATURE-----

--/ilgfkuW7mQBbT2T--

