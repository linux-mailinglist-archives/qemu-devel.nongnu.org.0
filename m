Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D42444122
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 13:13:17 +0100 (CET)
Received: from localhost ([::1]:53134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miF8m-00080M-1V
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 08:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1miF3R-0006xL-8C; Wed, 03 Nov 2021 08:07:45 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1miF3M-0001v5-2Z; Wed, 03 Nov 2021 08:07:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2322358078E;
 Wed,  3 Nov 2021 08:07:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 03 Nov 2021 08:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6lm6wcNinPAIJw0Attz58znorJA
 gYeITkSMEl2I+/Kk=; b=cPgC0oGYKpedhKrH/KwbqSvL5NSkUjk7RgH1+v0L4td
 ccdm/UoujipPvZl87JYPB5aDy1bIK9n5MPG4JqSc8i9IkbWvxO884PCEK17QU1G9
 Je9a1k2J4nXf6ZbjE3eVS7nSwmuun5kziMoNFi2H4a94KXGLyApXa8lL4YJDIAs+
 3/z/dRygHDNxbnT7sbbOdR18LY0RJzrifqXLbLvn5Mdx4cMyLt4lTw8NqAYHRUSq
 itRImMT9dgCtxjfodjd6MZWrgPdHIfbXjgkIlQzopUz3ROet1Vx6TJzs1JmHFQdp
 5Q/KZvF/ylTFyENuq6oTmbI478lHf6CcSDEzXY9KhuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6lm6wc
 NinPAIJw0Attz58znorJAgYeITkSMEl2I+/Kk=; b=f3CSaSdqY+r9DKAf031X8B
 OAzKBFG3052tFyz/NqTEwe+uIcJJhBeQ5g4g1fzuADJ7fmJO73QzN3w46hBInoqV
 gH3MYMe9RWLkxVRh4ryYq+Yr2/g7r5YioqyuQHRZ2uw0LpO01QQQTfblJ4okkGIV
 9wKod7ddh/6OwGrpuZ6Lika1Hh41bNDCxgTwxg3MuQRvb4BzBB+rZq46xNlNyj5o
 HU039Cj9z/x+FXoGC4hMH6774KnRitEwVhqOVVIDiOdsl/mvwER9aFqH2AEtbcOI
 HGUCl9nWGRrOG37bfsjviLxlVCVBCS5USlG5eQOnQZcDsf6/hlBy/cPeHILpYJ3Q
 ==
X-ME-Sender: <xms:h3uCYcD89TCdR6u7Yjr0JO3iK_kYaArCp-FSqxGec4QWx7wvhClG0w>
 <xme:h3uCYeg5x6KfTYamZ1EFTk1e7DtrzsgvZJy4oecKmbTutImxJChk0K4kvAp-Ggcuh
 lI6n4t4Udna9w8fnzs>
X-ME-Received: <xmr:h3uCYflvGtb6ZS-woYB6xtx5H2FIjz-6M5gJqE5iJ1EKBcVGeJ2xkK_IkPdQTCA3avI-VeAyJ4eu1MgW3G2DyVEz7L75qwMSOupb3WSnJWUAk1aMuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:h3uCYSzPSlbjgIHyskVzY8z5wPsaFr6aCUc-IfVCLOR8tSzCe8D_Jw>
 <xmx:h3uCYRSCz1SM4azCfP6wKP1zsVfvZRfm4NFz32Td1OgnVlPpbazFkA>
 <xmx:h3uCYdb2jk4vFY7itlzVYR3L4DsYjlSnTfc5Tp3Bc5gluYFuCEIA6g>
 <xmx:iXuCYe8Sovs1YrLkeC6WHpKgbsPwM49zvywVXYdtcP8FrrxTUxHdZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 08:07:33 -0400 (EDT)
Date: Wed, 3 Nov 2021 13:07:31 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 12/15] hw/nvme: Initialize capability structures for
 primary/secondary controllers
Message-ID: <YYJ7gy185o57adWJ@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-13-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MA+j8HKlSTlWgb5+"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-13-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MA+j8HKlSTlWgb5+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct  7 18:24, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> With two new properties (sriov_max_vi_per_vf, sriov_max_vq_per_vf) one
> can configure the maximum number of virtual queues and interrupts
> assignable to a single virtual device. The primary and secondary
> controller capability structures are initialized accordingly.
>=20
> Since the number of available queues (interrupts) now varies between
> VF/PF, BAR size calculation is also adjusted.
>=20

While this patch allows configuring the VQFRSM and VIFRSM fields, it
implicitly sets VQFRT and VIFRT (i.e. by setting them to the product of
sriov_max_vi_pervf and max_vfs). Which is just setting it to an upper
bound and this removes a testable case for host software (e.g.
requesting more flexible resources than what is currently available).

This patch also requires that these parameters are set if sriov_max_vfs
is. I think we can provide better defaults.

How about,

1. if only sriov_max_vfs is set, then all VFs get private resources
   equal to max_ioqpairs. Like before this patch. This limits the number
   of parameters required to get a basic setup going.

2. if sriov_v{q,i}_private is set (I suggested this parameter in patch
   10), the difference between that and max_ioqpairs become flexible
   resources. Also, I'd be just fine with having sriov_v{q,i}_flexible
   instead and just make the difference become private resources.
   Potato/potato.

   a. in the absence of sriov_max_v{q,i}_per_vf, set them to the number
      of calculated flexible resources.

This probably smells a bit like bikeshedding, but I think this gives
more flexibility and better defaults, which helps with verifying host
software.

If we can't agree on this now, I suggest we could go ahead and merge the
base functionality (i.e. private resources only) and ruminate some more
about these parameters.

--MA+j8HKlSTlWgb5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGCe4AACgkQTeGvMW1P
DenHhQgAo3b04QG+ARAHNABbIA55mi0WKbmIrHVLsHqbs10RDL5SiQqYwJhGvd3y
Y8h6F2XO1RKQfYMrT5QBpUapVMnp6rJsQ/LTZzQpbIB8ZaxJhkLRILvbtobhnptf
WW+RPjK4slXSftbcRFC9klEr3ArI4O0IfW7VoeoIpSlAOARbMxqjJHW5zizRvzjc
j330yD7eMyWUKRXcJ46eJLeJ+YS0DNs172iHWvIT760/bsOV4kvXNyNivIUI6kYN
QQz+RxciSJyehF4jjCSIJYVN3ttfmupqbjnFWKXsdfDBMYq9fDymLqLvbhU/9DKf
XwsmPClKd8NFnardXrOhU0LdYVzr+g==
=1lih
-----END PGP SIGNATURE-----

--MA+j8HKlSTlWgb5+--

