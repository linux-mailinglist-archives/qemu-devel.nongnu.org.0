Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F4318B8B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:09:47 +0100 (CET)
Received: from localhost ([::1]:43830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABj8-0005r3-Kz
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABUv-00049o-Rd; Thu, 11 Feb 2021 07:55:05 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lABUu-0006W2-7s; Thu, 11 Feb 2021 07:55:05 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B0C05C0175;
 Thu, 11 Feb 2021 07:55:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 07:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UlqOj2OElK7o74A+CL2UhPendDz
 ULXoV/KvH+uZJZW4=; b=GIJvQUOJQEtpik/IDji1AAnG8KEiOBogxbl08vBNtUC
 na+PzBJexqPFsOI8Zwi49Z5eSAssOqwDMcMWTJbZ3FLkUZmfnCqh9/MKheKJNfDa
 tl9PZB1palRR8cb7pBUMksoEv0qZm7fChTZMnHCnmaeJC/REXVlcCOXGDt7AnASi
 qr2vp1CAs+MIOpQt8L+yazPDXg+Ow8zb+5uVO7VKTh5zcQwZV6J5hb3CDE4c3FrJ
 i/dWRujFbM0A2dphd2rGbRi19lt3suc3k7h7HCZ4L2naRaJ2ZQllLbOg/eNRFMMw
 3TxY408JW9zodTdv8iPA+UPamyT+QqDvr1n0LAJRq4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UlqOj2
 OElK7o74A+CL2UhPendDzULXoV/KvH+uZJZW4=; b=cQTSzsArakoTT1aoquKVl7
 1yCfJ9tnsg6qJO13VIK/k0n2RPHNWsBGWcRuIZPZ6BJBdgICMfa9HabOzfOl13w7
 V3fqGbw82I0AxFL367FTtqrSqzl7Z831yLNnGVw8QFYzXiphZ8ekPz8iMI9KWC5M
 P8uQEuP4JNtTdZ+sJ+zdHyjFQlMYdSGdO/IJ218Nw7Dn5lZtMSiF32vmq6JZkZi6
 +PDp8SS79uawz7ggYgPQLlmVkfZ5a18Jt30F9jQ/8y9GGkjY33fLIVF4NKVp8SWd
 XxdCmeI+115RjqT+R2OxyipNqdiH08SjDhUYT6u2GtP0D2WXw+ptC8+BGT424Qrw
 ==
X-ME-Sender: <xms:JiklYPVjPLT8bxad7DJ-Vo8lH6fhUR0Ay2zt5JrKqEANRVUJda-4pA>
 <xme:JiklYHnJVuM1l3tJtj3Ld_DP2JxUh0iP7dUG1mN9HFnhgvvtn4vbkciBVT0iJXBxK
 OhvXWv6YEK26r4ZDX8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:JiklYLbW4mUVf_X6QJ1oR78hGy10pwmyTZiGM0LV4B844a4yL0leZg>
 <xmx:JiklYKVbKDcYD3qX63JawTJ8o3TuZaEtZM8jDBkbSQXYMMtz3_pS-g>
 <xmx:JiklYJkH5YyluD1x18UKjHXBv12Yqs6VAZ07z2Y9cThHGTysEfi9HA>
 <xmx:JyklYPWj2QOVzDdPUuk71AiaPKFhaMcRxtPByYO72RAAPb909UVV-Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B944524005C;
 Thu, 11 Feb 2021 07:55:00 -0500 (EST)
Date: Thu, 11 Feb 2021 13:54:59 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 1/2] hw/block/nvme: fix legacy namespace registration
Message-ID: <YCUpI3fw7mX97vI6@apples.localdomain>
References: <20210211125215.985593-1-its@irrelevant.dk>
 <20210211125215.985593-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cnj6LEeV70nVjPON"
Content-Disposition: inline
In-Reply-To: <20210211125215.985593-2-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cnj6LEeV70nVjPON
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 13:52, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Moving namespace registration to the nvme-ns realization function had
> the unintended side-effect of breaking legacy namespace registration.
> Fix this.
>=20
> Fixes: 15d024d4aa9b ("hw/block/nvme: split setup and register for namespa=
ce")
> Reported-by: Alexander Graf <agraf@csgraf.de>
> Cc: Minwoo Im <minwoo.im.dev@gmail.com>
> Tested-by: Alexander Graf <agraf@csgraf.de>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 5ce21b7100b3..d36e14fe13e2 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4507,6 +4507,12 @@ static void nvme_realize(PCIDevice *pci_dev, Error=
 **errp)
>          if (nvme_ns_setup(ns, errp)) {
>              return;
>          }
> +
> +        if (nvme_register_namespace(n, ns, errp)) {
> +            error_propagate_prepend(errp, local_err,
> +                                    "could not register namespace: ");
> +            return;
> +        }
>      }
>  }
> =20

Argh, sorry Peter.

I just spotted a mistake here. Please ignore until v2...

--cnj6LEeV70nVjPON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAlKR8ACgkQTeGvMW1P
DemdMQf+JhJQt9ZbzloWPXSqCw3PF1dWq+xRbLIG7QRwQCEAkCe7ZhFusC5h9X08
OetmpAiLWEqXAKU6Pm/ILNfK+7ZcUXeWnVSh+9/TctpYKtZga3oBY52pt4TaJWNa
aHDtzb8rkp8tD1UsnrmTic4V2K8yz2kYm0EvI446DhfDWs/4BQInm2BJ1TS2drGf
LF4YyCkZDMaraqiufV6FliaCbJKcbXf+S38tWLJDSTffTRUBacl18XiUViUSryAN
jMOW6dXCff3xYj7eQ+Qa77BwbCmeZal+3qKMV61JXrXAMerMQ8jjx3CHjJOCuP5a
RwV174/kaGqvGj0TBbsDyust2nXubw==
=W63C
-----END PGP SIGNATURE-----

--cnj6LEeV70nVjPON--

