Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C76B6E59B2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 08:52:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pofBp-00063f-V3; Tue, 18 Apr 2023 02:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pofBm-00063R-QS; Tue, 18 Apr 2023 02:51:42 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pofBi-0005oY-41; Tue, 18 Apr 2023 02:51:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 203C55C0079;
 Tue, 18 Apr 2023 02:51:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 18 Apr 2023 02:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681800695; x=
 1681887095; bh=GQATokZxCQMENbOrFc6bac2aPHAdok84LG107OhOWzY=; b=v
 lVQxZPskqjTbxGKmaEem5+Mus/bj1RxaYlNrKGaPG6zkVTi2TkFwmGeqgWpGBLOm
 D9MCsbh8gTc0FvV5y1Lf6GBuVZj2ebwah4fPgK+DGQWYrRH7J2PCdIOY4T0U9dbw
 U0fKqcHIpkll+wIlhXxFGNtQFWtdFYXucdxYItThPzlXEPnuJ5fUc5J8yNTntVCp
 /0WlKMjML0JTnoOlbW6NOwt2ow6OJ3uA5Tawf9kQIGAJfAlSTiQGhkPZjDET79oH
 sHzmN02SYO3BiPs2cFT4DO0Gcec1Sq+EYhxwHc6Ey0O2R04Bo9L6/5/vzdu6Bo6h
 zVwpL6dJO01hQERiOKv8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681800695; x=1681887095; bh=GQATokZxCQMEN
 bOrFc6bac2aPHAdok84LG107OhOWzY=; b=DRK0svYkhRSoyPdXpmNdI4ln1cdAZ
 ahfpBtDcKEbnrjmKnKEkG2q4ikRUXkiN+bR6XSGqUPfVgD9YbDCCzKc+LiUx24AI
 X4/AAqEicI9kct8JQ1+xnXsZm8h6TeOuHrLdkMihqNT7pvvmEWCBADZPiViloQpr
 vOTKbmPQOS9MxAMiAJFYTkgGWz3+YjMMIWlHCBmwIH/Up0sZy2qPx3qzcaZdOvG/
 RW28h95zjz2P4RxKHOkpuYKm+xXqgVdqQOgIM0r28jq/3iM7/38BsG01wfFw7M9i
 KQsRz3X+21krFNIGW6fFRw6t9eMjWake3HopyMqsgW8/CNz0TAcw6zQ7g==
X-ME-Sender: <xms:9j0-ZDKOs7gz1HlqLS1tigpxzzQT785i8mcsBwHx1sYfrSV_AZ9q3Q>
 <xme:9j0-ZHKTQrA25_yZ7dRr0OhqD_lep2pCDuVlBawdlZUYcLowVjb5oMQiqVlTwCMaI
 V1uwRkZWAxehe6TVzk>
X-ME-Received: <xmr:9j0-ZLuLSZ0xhLpgGJ-9USusH4mnBtPD-EHfML4M1lD3c3ZN4mnU6gAixCjmKu6AnnQqAcuqYX5vEGtmAfJSFry4OZJr9Dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeljedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:9j0-ZMbsIUuDbyRXxUen0O7m6etoSxYIKHTQ3KDcUew-GoeR4OVuSQ>
 <xmx:9j0-ZKZ4964LsvnXMAEIWU7QGpII69Vj9jwlRIHm121kbIab4rpyKg>
 <xmx:9j0-ZAAfsoO-mFv0hsSGiuNxedXT8N99sN3GC9GIGhnQWd_a9kdHdQ>
 <xmx:9z0-ZByjxgbjR2rpL3sU-RkpSbJkzAE0P2QDppvNY2CHblAFSszz5w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Apr 2023 02:51:32 -0400 (EDT)
Date: Tue, 18 Apr 2023 08:51:31 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: add comment for nvme-ns properties
Message-ID: <ZD49850d0lgN6PuG@cormorant.local>
References: <20230418002025.29232-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zWTtYKCpx1WlpPGf"
Content-Disposition: inline
In-Reply-To: <20230418002025.29232-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--zWTtYKCpx1WlpPGf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 18 09:20, Minwoo Im wrote:
> From: Minwoo Im <minwoo.im@samsung.com>
>=20
> Add more comments of existing properties for nvme-ns device.
>=20
> Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 8b7be14209..87c07f5dbb 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -43,7 +43,14 @@
>   *              subsys=3D<subsys_id>
>   *      -device nvme-ns,drive=3D<drive_id>,bus=3D<bus_name>,nsid=3D<nsid=
>,\
>   *              zoned=3D<true|false[optional]>, \
> - *              subsys=3D<subsys_id>,detached=3D<true|false[optional]>
> + *              subsys=3D<subsys_id>,shared=3D<true|false[optional]>, \
> + *              detached=3D<true|false[optional]>, \
> + *              zoned.zone_size=3D<N[optional]>, \
> + *              zoned.zone_capacity=3D<N[optional]>, \
> + *              zoned.descr_ext_size=3D<N[optional]>, \
> + *              zoned.max_active=3D<N[optional]>, \
> + *              zoned.max_open=3D<N[optional]>, \
> + *              zoned.cross_read=3D<true|false[optional]>
>   *
>   * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
>   * offset 0 in BAR2 and supports only WDS, RDS and SQS for now. By defau=
lt, the
> --=20
> 2.34.1
>=20

Thanks,

Applied to nvme-next!

--zWTtYKCpx1WlpPGf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmQ+PfIACgkQTeGvMW1P
DelOZQf/Q7OKbFN453Y8pakb6ljitAr6zIQzlBzP0GmyP75JdR+07KZg6bWAn7wD
nT6fxKdzDpNEOoCftu+GtZBhpsEZMCC/tDi7n7Nxjv/EPgXe56wkqLexmenmYQSg
5gVKIng1FFdnNHEtIP4IK6TF0b+GnSb43QosTsiUemD1RiPHDPhk6N0pLSq/SvOR
fb8NyAqU/i8LqjXrktujl9kiMVw9K3yjicllSnsSOD5cTG4HjOoQO+sipEt+LuYE
fAymC87xtOMeIOsDL8hRNDoPPIu/TSUE8WCmwZMNQZ0QBqnsBa8TmMi97tqWccSX
L3C3+c9CBSTHWZlTKCRLnq7Ac5gdXg==
=sxYl
-----END PGP SIGNATURE-----

--zWTtYKCpx1WlpPGf--

