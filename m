Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D834353ED
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 21:39:09 +0200 (CEST)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdHQa-0005Vi-I8
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 15:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mdGun-0002Wl-JN; Wed, 20 Oct 2021 15:06:17 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:47133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mdGul-0007Ij-3V; Wed, 20 Oct 2021 15:06:17 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5C3AB320148A;
 Wed, 20 Oct 2021 15:06:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 20 Oct 2021 15:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=u9iW6BS5kK/VlZ5YPVe7k7jZgVU
 e+VS4L7D57OsRkTI=; b=h04l50fLZeHMSfJGccCItscZqWzcdbbpQ1LvoJtmuWT
 hGDdjhV9xeEuDK2mPPh2IpIVOxpnTSZ4CpL51Blm0l9MtabYWTluH0qbYZK5f0+N
 XYXVJ3eCamyePM5t1iqzohSkqyA4af2hRCBGrABu0DRqS3DgnA4o6S7cNgZQ/+Ng
 cECF63QSCsBb2jHxPyPdrzexPO2x+6GYSOUPakVc4wqMATP+wrEZakqjFMYTnTTg
 OqanrX8c9s/WS/cX7Uw6P42/DqM4JALq6/OP35U5t7qrST9oNXsj4J3RvUczd6eU
 hIaBT52uWhSxwf6fl2nK5JxMPGU7eB2NeXmFgFZzLIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=u9iW6B
 S5kK/VlZ5YPVe7k7jZgVUe+VS4L7D57OsRkTI=; b=V/dgwoepNgbpJsDGPfCYYb
 od7xl5I5D85KpLbAu7nKK2Ugvykk0p88b0ZjWNfag5JNu7P8Hwn6TkNUW1DNsUK0
 NTlF7bw40X0wwInn3jH17Vu4g8DEQwp6z3lNaimoQNYM2B8PGjDixV6LYp7PqHPP
 4QUOn2oEb9HD5lQIymIdZQ/QDlLvlNJrg76qpCvbkjOgoA3LiQNsYCQVoC9xJC8J
 YcstD70TflCucWlSx6Pyrvr0U119GYcamdTXH+XEdh9MD31YBHCoC1knlEXVTqXJ
 uJmDhm5pAvEFpvGlkHR/m5z2GCnzoo/gKKpYQhWs0HPFq6BcE1odYQQ0t3to2KSQ
 ==
X-ME-Sender: <xms:oWhwYX-8Cu5W0Uj4x-8M6yoAOTZ0Y76P4emZM76KI8emD8nD8UjsJg>
 <xme:oWhwYTt49i7bf8hz0I3BBRIYCTdTiry6E-Q9jM8Zny2g7n0npDBZxcPCcZsUPevqf
 rRfxEhjb1YFDIjBYvE>
X-ME-Received: <xmr:oWhwYVCLumaEQ-aO0TcAyMUk-HqU4WlsrEcUxYFSt0AFviFdPfhvL1ItzzjMaiuwNlOG2GAW05JgDTB46k_hpcTFd7Un0QT3tPauD0v_Z4SVvl9FbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:oWhwYTedOmnip-MVXrtOoC-xhD52MBsWqVx0KGM2DH9-JmP2yLtJnQ>
 <xmx:oWhwYcMeLFRt_hi7JomkY8yE4twADG_GBaqjUh7ZsyYbua0yruBGJw>
 <xmx:oWhwYVnnFnFmklGsLXpQ2j14bob8BLz6vrEkBeSLb6jC168ED4s3Uw>
 <xmx:omhwYZoZaAwSG51jV5KGdlvdXeGgDVGhrqbp1K0QPmRDJr0DIGBrKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Oct 2021 15:06:07 -0400 (EDT)
Date: Wed, 20 Oct 2021 21:06:06 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 10/15] hw/nvme: Make max_ioqpairs and msix_qsize
 configurable in runtime
Message-ID: <YXBonn0gwolecWnp@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pi1+3/3vGe0Pb4Eh"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pi1+3/3vGe0Pb4Eh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct  7 18:24, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> The Nvme device defines two properties: max_ioqpairs, msix_qsize. Having
> them as constants is problematic for SR-IOV support.
>=20
> The SR-IOV feature introduces virtual resources (queues, interrupts)
> that can be assigned to PF and its dependent VFs. Each device, following
> a reset, should work with the configured number of queues. A single
> constant is no longer sufficient to hold the whole state.
>=20
> This patch tries to solve the problem by introducing additional
> variables in NvmeCtrl=E2=80=99s state. The variables for, e.g., managing =
queues
> are therefore organized as:
>=20
>  - n->params.max_ioqpairs =E2=80=93 no changes, constant set by the user.
>=20
>  - n->max_ioqpairs - (new) value derived from n->params.* in realize();
>                      constant through device=E2=80=99s lifetime.
>=20
>  - n->(mutable_state) =E2=80=93 (not a part of this patch) user-configura=
ble,
>                         specifies number of queues available _after_
>                         reset.
>=20
>  - n->conf_ioqpairs - (new) used in all the places instead of the =E2=80=
=98old=E2=80=99
>                       n->params.max_ioqpairs; initialized in realize()
>                       and updated during reset() to reflect user=E2=80=99s
>                       changes to the mutable state.
>=20
> Since the number of available i/o queues and interrupts can change in
> runtime, buffers for sq/cqs and the MSIX-related structures are
> allocated big enough to handle the limits, to completely avoid the
> complicated reallocation. A helper function (nvme_update_msixcap_ts)
> updates the corresponding capability register, to signal configuration
> changes.
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>

Instead of this, how about adding new parameters, say, sriov_vi_private
and sriov_vq_private. Then, max_ioqpairs and msix_qsize are still the
"physical" limits and the new parameters just reserve some for the
primary controller, the rest being available for flexsible resources.

--pi1+3/3vGe0Pb4Eh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFwaJoACgkQTeGvMW1P
Demp2gf+KPlS6kHj5feM4LTBUfKp3wHVdwRmWeTIf6DjQwCC/A/sibQ52wsD1lxj
wp9wWHScy6tTVE7vlyc79tOJBDUDlrTO/r46xNbHDfqsiieEg2VYxrJx93slke8z
YfzuO/19i3Uqeojlw6TMtGLmfy0hDj3RUCXVTtdR110RtSR5eEmrWC57zX4rIiYn
4r80JM45SAW+DpFIfCSDc0npTLmJkYnufXYEN5883YjXry9HMX2T8FaZqYumKu0F
4mIpGVK8gx9XYCufdA3eAl1fEhcxsbDdOMxvelqf9FyK/gEbvNadAjCU0dkzu74D
DgcXR5eJKReuovr07QcE5qbuqiHHsw==
=w+X1
-----END PGP SIGNATURE-----

--pi1+3/3vGe0Pb4Eh--

