Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E88F454708
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:17:51 +0100 (CET)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKos-0000LY-4C
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnKgE-00061x-SZ; Wed, 17 Nov 2021 08:08:51 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnKg6-0000w7-SN; Wed, 17 Nov 2021 08:08:50 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3BF865C0213;
 Wed, 17 Nov 2021 08:08:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 17 Nov 2021 08:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=On09XTpGNE/xjDB7ez4i6FVvL1w
 wVWs8TJRbUD7caLU=; b=QF9b7RXcebnH2vkl+oStYWAvxkcUVb8JW4aRos5GNG3
 cn8od6gFc/G/ifu7uV0S0SfwAiSRiqc9xza21noIjnBh9jRdCj3Kqx+bTCdkyS67
 1wmrjN/VuXqecRmQkZ4g9wbgJIPgdOduf7yc4L3HbwiNbOBThQ+0nzt7rJawVVZj
 b9ryk7FIkTWzB67r+sGYwDFq2WXUk7jjw0oFEUz/CXyr7o88C3OBK3saZsdLAEDe
 GJZjEx1LDgkbpB6tPQoUED9rIopFH1E3edAGUSTBDoaTTr2pQtqPK/5+DC+iK0sp
 cY9Y+ZqrZy8LlYWt1WtwEbm7NBqlgkzteDOnEKitNFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=On09XT
 pGNE/xjDB7ez4i6FVvL1wwVWs8TJRbUD7caLU=; b=L/eQBybWF+Sxx/Rt+7M5HY
 3ujOUQNSanx5rFjjvh4apuD/jb/Q/bAzDWECoqGemF6VvsKHRlbpLQoE6Zti/W4N
 Iqrl1agu8abNpB3UuKAI/BjmtA+XGMSFCWZJ+T7Re5DZTrOIGJxjEM8IkQJ7re4t
 pyUCIyVv5kgw2UzoP4EQyENBa9se9F7/0VSiqXz6GocdZRCzY60j+O0haSh/F0OM
 m3I6pLS+a78w/fnVQns9i3u1DP0Te8AszxX5+nBj8pQK9/KBLzuo+jsJSk7TpuKr
 hU/Nud91onFpGOQ8fio1cq8/hp4gB7ayyYb3XQPAidVtDyIAK1rCg3B1siv15qHg
 ==
X-ME-Sender: <xms:1f6UYTnX0cUu9C28lEFJBuZUn9k4h-YKbJ5uq358Ni5aNgXu-MIr0w>
 <xme:1f6UYW31N-C8SzvK7xSK9e-rHHc--tKdAGa1gPBvdB85EBOyBcZZk9NyftccOwGlN
 dtPCItFoVSBt0GCB5A>
X-ME-Received: <xmr:1f6UYZrFL3xRGnQcxCIJtEt9dh5sJcJblIMgp9dTPYW42trbFbuNN49aJ9TpHizAvubOiIn0BD5jQdR4p2E2Yl6X4we8wsdpR-MiFcDjx9P_hgwACQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:1f6UYbnqusYv4IEgnKJORW-hw5waoS2mfjG418qvgpXJwjEbnv1pdg>
 <xmx:1f6UYR3rR5nVV9YH16VGgJjqxG41MTp72NgRF049xDVaidykMO6NMw>
 <xmx:1f6UYavFfUYziL4xlnliNSm2MXBdLgdTSj5TBIyxerezYCmGcaV8VA>
 <xmx:1v6UYbp8N2-k7KAijVNS_G9SO94TPD89ZC6wH0J7g1jc0ifnvdg43w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 08:08:36 -0500 (EST)
Date: Wed, 17 Nov 2021 14:08:34 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2 v2 1/2] hw/nvme/ctrl: Fix buffer overrun in
 nvme_changed_nslist (CVE-2021-3947)
Message-ID: <YZT+0uJ//3zX7vvv@apples.localdomain>
References: <20211117123534.2900334-1-philmd@redhat.com>
 <20211117123534.2900334-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="voez05PM5+8jqKlB"
Content-Disposition: inline
In-Reply-To: <20211117123534.2900334-2-philmd@redhat.com>
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


--voez05PM5+8jqKlB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17 13:35, Philippe Mathieu-Daud=C3=A9 wrote:
> Both 'buf_len' and 'off' arguments are under guest control.
> Since nvme_c2h() doesn't check out of boundary access, the
> caller must check for eventual buffer overrun on 'trans_len'.
>=20
> Cc: qemu-stable@nongnu.org
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Fixes: f432fdfa121 ("support changed namespace asynchronous event")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvme/ctrl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 6a571d18cfa..93a24464647 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4168,8 +4168,11 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, u=
int8_t rae, uint32_t buf_len,
>      int i =3D 0;
>      uint32_t nsid;
> =20
> -    memset(nslist, 0x0, sizeof(nslist));
>      trans_len =3D MIN(sizeof(nslist) - off, buf_len);
> +    if (trans_len >=3D sizeof(nslist)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +    memset(nslist, 0x0, sizeof(nslist));
> =20
>      while ((nsid =3D find_first_bit(n->changed_nsids, NVME_CHANGED_NSID_=
SIZE)) !=3D
>              NVME_CHANGED_NSID_SIZE) {

The issue I mentioned with off > sizeof(nslist). I'll send a fix that
just deals with it like all the other log pages.

There is probably a better way to do these checks, but I'm not sure how
right now.

--voez05PM5+8jqKlB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGU/s4ACgkQTeGvMW1P
DekWTgf+JM0/sALZE4Nean/iU4xGrNj4WSBBp79nIWfd0TTArnjgX1YrDbcMHaeg
d6ycpdmHeAiw9cXj7jYcxJGFLNWW136e3rbGmlJMEquGlkgfPTXWbJdITYadA733
ODP+xYOOk0TMA+6Vi0EeQK2di87yayn6b8vEy/q55wg+1h/RzAp2HdxIKQvx8YSD
ZKW5SimcJ6QfoZy3V3A654yuydH9S0e0fpCBlknORV+IQn9tPrAhsp8A+Bp1UFw+
lsQx/d+NyI0j7H3rQTR6wEarbF5tiXm1b2MyHXDBLf4FwuGI2piSuxp66bEeBJY9
FKSszdcq+7UXNcynZech36n4Ss/eMg==
=UJOz
-----END PGP SIGNATURE-----

--voez05PM5+8jqKlB--

