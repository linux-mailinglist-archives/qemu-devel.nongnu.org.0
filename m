Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749B3F9431
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:08:31 +0200 (CEST)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJV2U-000058-6K
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUrt-00031H-4e; Fri, 27 Aug 2021 01:57:33 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:51723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUrq-0004U5-Sr; Fri, 27 Aug 2021 01:57:32 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 9288332009AE;
 Fri, 27 Aug 2021 01:57:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 27 Aug 2021 01:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=GqccO5aPBGSm5p3zv/2+jgs5/6l
 M7/IAZeJwVHqPWrA=; b=QAvD0HMFESpu9VwZlm9oP8jJw4k38sWjYa79M/IzZs5
 HluRI5zuHZlj6MOMdWVaalxesK+hsN7KjCCZJAamHu1+sLRFu4N7tw8WtsykQowa
 UeUdt3PZLS3FdwaRFtZ5aKZjapZYi/L1f844P62Qp7ReBROpaI1o/ZFUzn0qJHbE
 LWLrnDehetB9qiZYRYYdckrAxLX9uCknLGrNygtnHBzf33dGNKPxfRc2xPI/Ez7e
 rJ+CQg3WG24FhEFj37HpkuPPkEEoeqI22FcyBwtI1oUDXBOH6MjuFf33JndTzg/Z
 30rFSG78ssUazEBrqB4uBmAwCt5djp/9KBmrdg/5CIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GqccO5
 aPBGSm5p3zv/2+jgs5/6lM7/IAZeJwVHqPWrA=; b=fk0PHKSXGbuBwA8ybr/yNU
 QO3h0z0985X3NKua+wRAkZ4a2D+puX/iScBI0BtXewDrROYbvt1G6EQuRb6TRcO9
 J3NqGUs0eNgLSJAKyPmPWtG/JvnAxHoADrEdW1uum4bsDpK4X3hXGyEUw2oKShK3
 JC1YUsEYj557rhSftc0EczitH7KnB4OLqZdVRzQX6wClf5u4N0Fl2LBVx/yajuzx
 pm+0b2qq186kHuDkoLxjP9Be/Jp4KD9Ckt9svsSy2FxSPE+oCiIGuSNux2MkMuz/
 gdBUUm4cpdqASifuxcZDIwqo0SjwrZ8KIP73h1I+0TwW6dUchAd2sUP57+bA5MaQ
 ==
X-ME-Sender: <xms:x34oYT17qC9gg03FsAJFKHOCdnPr9hRzQ7nfxgLubDepUyWQvAhcXg>
 <xme:x34oYSFjp3NGZCxKok4HvnPK9cAnT3OA-SyB-Hu4gjIdStxcHLF_2vvLIGSgtMAPD
 FBuTWLnDq6snLNuzO0>
X-ME-Received: <xmr:x34oYT4zIZl3k5Jauu8LaOQ_c7J9b1dP2Vd7g2-KvgOreh1JfuoV1QUbJpVo3gI30mRNF8e-65wYMqOJ9J0diNMbI8U_YD3odEF7FcE-1HdH1t4r3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:x34oYY3xN03j72x8RuaqnK9TmMCXMUEWb8tyJFc8zo8j8420gmz3ZA>
 <xmx:x34oYWFLFlSTdQ5XHQM2eOdFf1nRAcsOa66F-eOEwNL237JcG__3Gg>
 <xmx:x34oYZ_aifEqKF5l3ptNyK0gWNazU9yZTPFWw4IByROU22eH_kE1NA>
 <xmx:yH4oYUZnm9NXd9C-y4lPJ7X3L60-KBHWQM0qR3VwT7Z81NXeu5IEnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 01:57:25 -0400 (EDT)
Date: Fri, 27 Aug 2021 07:57:23 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 08/11] util/vfio-helpers: Use error_setg in
 qemu_vfio_find_[fixed/temp]_iova
Message-ID: <YSh+w0Avk/vUu7zE@apples.localdomain>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-9-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1xTUR4vjF68xOCsn"
Content-Disposition: inline
In-Reply-To: <20210826195014.2180369-9-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1xTUR4vjF68xOCsn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
> Have qemu_vfio_find_fixed_iova() and qemu_vfio_find_temp_iova()
> propagate eventual errors to callers.
>=20
> Suggested-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  util/vfio-helpers.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index 306b5a83e48..7de5081dbd3 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -678,7 +678,8 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState *=
s)
>  }
> =20
>  static int
> -qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
> +qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t size, uint64_t *iova,
> +                          Error **errp)
>  {
>      int i;
> =20
> @@ -696,11 +697,14 @@ qemu_vfio_find_fixed_iova(QEMUVFIOState *s, size_t =
size, uint64_t *iova)
>              return 0;
>          }
>      }
> +    error_setg(errp, "fixed iova range not found");
> +
>      return -ENOMEM;
>  }
> =20
>  static int
> -qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova)
> +qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t size, uint64_t *iova,
> +                         Error **errp)
>  {
>      int i;
> =20
> @@ -718,6 +722,8 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t siz=
e, uint64_t *iova)
>              return 0;
>          }
>      }
> +    error_setg(errp, "temporary iova range not found");
> +
>      return -ENOMEM;
>  }
> =20
> @@ -762,7 +768,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, s=
ize_t size,
>              goto out;
>          }
>          if (!temporary) {
> -            if (qemu_vfio_find_fixed_iova(s, size, &iova0)) {
> +            if (qemu_vfio_find_fixed_iova(s, size, &iova0, errp) < 0) {
>                  ret =3D -ENOMEM;
>                  goto out;
>              }
> @@ -776,7 +782,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, s=
ize_t size,
>              }
>              qemu_vfio_dump_mappings(s);
>          } else {
> -            if (qemu_vfio_find_temp_iova(s, size, &iova0)) {
> +            if (qemu_vfio_find_temp_iova(s, size, &iova0, errp)) {
>                  ret =3D -ENOMEM;
>                  goto out;
>              }

Not related to this patch, but it is slightly confusing that these
functions actually already return a negative errno, but then we
overwrite it.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--1xTUR4vjF68xOCsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEofsEACgkQTeGvMW1P
DemJoggAwtmMCF/MnOsdPDK2PqUhD7iWl3ciA5JsEugaT48uHzEkua6yr28LsmZb
/Nspmm7FJxS6rdrNdbnFrss11KCLIb15I4vilqu0lRsISQCggMbS1fDktDnnQ0lx
2ulqYduCvbR/+4p8qkEUK2qpV7ivu/ISvf/lSpIttFBPIYyoRIE9+5LxqZbgblQY
pswHya05Eru3Ef4IhMcRcAhShgcZGiJUeznSPW9sj7jTnQVKTl5FuMKfxDM3GkhC
Sv7jEL4CBS11mDG1fHXsbxEj4bkDzKtfoMQujMfnCWVaBxEfyFNPPgY440vh9UBz
to1XvAI6rNHgZhYiEhTNA9UCjhHIGg==
=NIaS
-----END PGP SIGNATURE-----

--1xTUR4vjF68xOCsn--

