Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B87144DB76
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:14:14 +0100 (CET)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlEaS-0003Ml-Mc
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mlEV7-0001GZ-FW; Thu, 11 Nov 2021 13:08:41 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mlEV5-0004fR-ER; Thu, 11 Nov 2021 13:08:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B47315C0143;
 Thu, 11 Nov 2021 13:08:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 11 Nov 2021 13:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3N3X4M46KaoEm+rl7bc2SpYmkGz
 xw3ZPaducmOSVCYI=; b=MYq5DObpldHeMm/MFxm016/JSeI/wy0Fy3yG952CNvm
 z1okmqZ98QLQYewWEjeEr7XRDGMPITKe17lbrFmmX6Tz85HFoliTtzvqGY9wFuM0
 e8eF2d7UgstdWXBb6GbqnTr4zgn3jc8jfxQRHAwsDEXhXUboNpAeLgv+XALR+I8o
 9S09IRk3kJKI6y/i/Oze5ZUXnufnpYqc3yr7e7pjroD4lRK7roYngGsal3G7sZQh
 3TXp8F28ndDTF6EbYMQTY8r7OhRAodiLDbJGR8qOAu3uIY6TnReXYHtQIfZ8zELe
 yk/+OthKLPGmv8KB3PrkoKo9RVLmJEGlW+vjhCOB4pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3N3X4M
 46KaoEm+rl7bc2SpYmkGzxw3ZPaducmOSVCYI=; b=D5tQz4w8S8ghBXjlgQ0Hsz
 mwogNF5SoMvLw7x4+N4izw2QxCb3G0pC38WR6lXpYPuktcMsrq/j56cor5Nc9g/p
 hxiWUsbmyR+hNe9MoeGt0NTSb0jmiwCWe/KIYvGxHwMommiuz+kIm+vgKZEkYoTN
 u9V4mQHgI50kShyIRMcA0jABxKfXxuV5uPxya/oIq6lvt8Bk9PQNdtO4O0XR+1nO
 U87gz7VIdGWPAx/55+uTFRLoGpxVzWJUuPcmp10UMDuWG2hZhofxWCfPgnEzNTzQ
 gV5WtZTRWcOnbjXLEOqlj/1Olrod7IBkvQgjQN3d2DQ8+II7rkdVhdN8yRZymzsQ
 ==
X-ME-Sender: <xms:IlyNYXS3rIp3sfEBtFYfY0Othlj54i42-ozp8CoNtLjhSJExlbEeFA>
 <xme:IlyNYYxwQjdkp53wqb9PavAvlnIBZyX0YcUWCZ9GnDj5KFchWnQVqayTrQ7iV-qhQ
 ZMxy8TYhJ4owmb37OM>
X-ME-Received: <xmr:IlyNYc0L2FiZ6u72CCbt7uBNY7l0cOfYerAA4sJ_vM3hPqdUtlG7nSC4pYBMe2uHFlMWFsTOiZYXT2ajrf-C--ZpRD0FZJGa8P7zjMsf_VSQ3vYrMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvddugddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:IlyNYXCgdtoJfZDS5iUGcOOVXD6plLojwL65H3sC8csGpNvZmGaQng>
 <xmx:IlyNYQi0Ktz-0IfLz3ap57FpYWLXHRTKmQv6xtoxcHTlVWEra-DFsg>
 <xmx:IlyNYbpzNIQ-WB3uOEXApt_oOWrWttHWLFw1m4j5sYbMWjNEKU3mUA>
 <xmx:I1yNYbXhRtvzDnsuJZn1yacbtMesxFalxQS6C_eztrd4TPuLSrV87w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Nov 2021 13:08:33 -0500 (EST)
Date: Thu, 11 Nov 2021 19:08:31 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2] hw/nvme/ctrl: Fix buffer overrun (CVE-2021-3947)
Message-ID: <YY1cH52EbS1sEUDn@apples.localdomain>
References: <20211111153125.2258176-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jeh2Oa3I6of18xAP"
Content-Disposition: inline
In-Reply-To: <20211111153125.2258176-1-philmd@redhat.com>
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jeh2Oa3I6of18xAP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 11 16:31, Philippe Mathieu-Daud=C3=A9 wrote:
> Both 'buf_len' and 'off' arguments are under guest control.
> Since nvme_c2h() doesn't check out of boundary access, the
> caller must check for eventual buffer overrun on 'trans_len'.
>=20
> Cc: qemu-stable@nongnu.org
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Fixes: f432fdfa121 ("support changed namespace asynchronous event")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvme/ctrl.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 6a571d18cfa..634b290e069 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4072,7 +4072,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_=
t rae, uint32_t buf_len,
>      NvmeNamespace *ns;
>      time_t current_ms;
> =20
> -    if (off >=3D sizeof(smart)) {
> +    trans_len =3D MIN(sizeof(smart) - off, buf_len);
> +    if (trans_len >=3D sizeof(smart)) {
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
> =20
> @@ -4094,7 +4095,6 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_=
t rae, uint32_t buf_len,
>          }
>      }
> =20
> -    trans_len =3D MIN(sizeof(smart) - off, buf_len);
>      smart.critical_warning =3D n->smart_critical_warning;
> =20
>      smart.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units_re=
ad,

Uhm. Hehe.

This "fix" breaks all log pages. Take smart_info as an example. Say the
offset is zero and the buffer length is 512. The transfer length
(trans_len) then becomes 512 and it ends up returning Invalid Field in
Command because trans_len equals sizeof(smart).

Worse, this "fix" actually *introduce* oob's all over the place if

    off > sizeof(smart) && buf_len < sizeof(smart)


Example

   sizeof(smart) =3D 512
   off =3D 516 (must be dword aligned to get to this spot)
   buf_len =3D 4 (same, but is always aligned)
   =3D> trans_len =3D min(512 - 516, 4) =3D 4
   if (1 >=3D 512) =3D> false

And we end up with

   nvme_c2h(n, &smart + 516, 4, req);



I suggest that we only fix nvme_changed_nslist ;)

--jeh2Oa3I6of18xAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGNXB0ACgkQTeGvMW1P
DemOjAf+LL5K4DD6Nvc6ms/AkFKYsYHsvGTqgRmzeqJ1sNWxUO/YvAthZDEWK4jh
T/1PnWS6IU3JbAMtn/4rvC9JEte1Q8pCudt9Rc66FmZt9acABofxYdhHm/Ab9gQI
qdUgyT3FztMKp8wjgqXWCsegC0DCGy0fhraU7jw8XCMmIrD3zLcq4ItD/KpKXiQC
ItEDpUqEWXUjX4BmS9HtDE76SKq/579xBF4P3WrusS9TRx+3lxn237y/5RI2byGF
cwWvGHttr+9iK0uMb8O88plL3cju4uJjyLFJLnWjbG+tHdRZBQgCNn/xlLOrKkjl
E2Pxx2pHibVEtTxbhbc/mwtRJcqnbw==
=vSah
-----END PGP SIGNATURE-----

--jeh2Oa3I6of18xAP--

