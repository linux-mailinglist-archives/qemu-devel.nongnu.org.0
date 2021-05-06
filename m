Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C73374F69
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:33:55 +0200 (CEST)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXa6-00063W-Rz
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1leXUF-0005EO-Vi; Thu, 06 May 2021 02:27:52 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1leXU9-0002xC-9W; Thu, 06 May 2021 02:27:51 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1E12E58073F;
 Thu,  6 May 2021 02:27:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 06 May 2021 02:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=B6+sJwprFXC2/h/cOyeLm5WE/1D
 rWLASxEWyXnenq1o=; b=P/LmtxcMGhypr8dG/T/BrFUton5ippGZXdMDxuMFx0j
 jNARIe6cJSRg8gEIBsZAjnch+s6klarv+8ri8whpjsMzjYkn74jmCwteuSH9bvjZ
 wwe9r5hsdVQfVvgray0Sjqu0aGq+m5jVQhIm221MbqMZtWGBkchuXLnIrCYavqFl
 d6MzPOD5P0tMEyB55s0X/QF7aRm2W3nMgxR6ozPXGZqsVO+m3CiVbddFUThiX02d
 iAskbXkdEuBsLO5sGA3GhwK3wWEAueQUbknEP65+wqC/6FxHxuhwZT6+7sv72zSS
 vR8SL8g7ksKc9lHzB1fefHCEMEHgJoNdqnBTE8wct4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B6+sJw
 prFXC2/h/cOyeLm5WE/1DrWLASxEWyXnenq1o=; b=FwCiko1gQPCdZT1WQfCqaU
 kbUy3yBgGcXsBCcmcSdKwTxjccm8g4vaUI0jmaVhV1xwy6GfkgKuEsyj4RZ+Nxhi
 H02sUlx4TkbxVDakhRx60evb6EHP7Izix8bfQnVottppLCQ9Y6BMj2qkRTrak+8x
 K4C7yCqzq8T9dWcMJPoQql0XsbluXDL+S/p0b02RqcqA9Hkzds0ukqx6S+fLUaLn
 Y88h+216SPaKbhc2dGSWKVSlbKhmIrf4x0OLzBW+ARoc/dXJ8UPzL0ayoE9SF/kY
 /bXSbyW6QAYXTa4VyiEP4G6vjHjSpTIFbpMtl+EkRMEi6LT9Re6NiIgVbOkZQBKA
 ==
X-ME-Sender: <xms:XIyTYAu4uGH6-Ck1gX2sYw1jYOIbrMEcrGugCS0i991n6zecwF3tTQ>
 <xme:XIyTYNdaGg2sVRM7cQZgGZ0WE7qnXSBWlFOqokoKONhaBcr5myYjPB_Ge23jDQ4Ci
 k6EBw_cG3L9pRo5arE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefledguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueeuffeihffggfetheejieevleduhfetfffhheeigfehteejieetvddtgedv
 hedtnecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XIyTYLwvammQmWUj6-gs-Q5lZGepyPyGieGrZ5UdIKdKz2BbN74rog>
 <xmx:XIyTYDOnTJeGcu7IsHYZ0T-MTC2h9VfMPGNrdIA4t5bjWo7IHzGeCg>
 <xmx:XIyTYA_HIuPGwQ0v5kdhDy6a7RKmObJfG5RnAB4x3_DDqJsogFoPEQ>
 <xmx:XYyTYB07lVQgO-rCda8UiEx671qol1L9jm0djD6YMCLFOKYiDRYEsw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 02:27:38 -0400 (EDT)
Date: Thu, 6 May 2021 08:27:37 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
Message-ID: <YJOMWfEjUoewLrRo@apples.localdomain>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vCKLpbnvxaQ3Ambk"
Content-Disposition: inline
In-Reply-To: <20210505211047.1496765-8-philmd@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vCKLpbnvxaQ3Ambk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May  5 23:10, Philippe Mathieu-Daud=C3=A9 wrote:
>The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
>a constant! Help it by using a definitions instead.
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>---
> hw/block/nvme.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 5fe082ec34c..2f6d4925826 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -812,7 +812,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, =
NvmeSglDescriptor sgl,
>      * descriptors and segment chain) than the command transfer size, so =
it is
>      * not bounded by MDTS.
>      */
>-    const int SEG_CHUNK_SIZE =3D 256;
>+#define SEG_CHUNK_SIZE 256
>
>     NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
>     uint64_t nsgld;
>--=20
>2.26.3
>
>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--vCKLpbnvxaQ3Ambk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCTjFUACgkQTeGvMW1P
Dekhwwf+PQ6KEfhoYcUN9a/47asHOQVP2XOTqhgLnttJcmTeNbg3/0+ztCPwEkaC
MLGCgtr7qLegbhEXKm2CNs8bnVkLndbBS8GR+YaHGqGqcbTU8XczTyznkOHxvns8
a0+2cl7qEJ720QueOKdwOtvb7SyjIG/0EcRhDtRegcrtZ2L9DKNAk0KQ4jn5n9fr
DOiSZbx+/H7HiUJjNmoZwjzcl0dWL82us67VFytMQ3rXRWPc/EclDb1rm/JxDcni
5YXgOKqEA39Kdjq8tJV3kGq9ryHvEADNOievxgUkU+PTE9nYAPOQ6vbsjId+HZpG
SCJ3dZwmsUGWUwDU8ex/ZN9r6w1Xrg==
=kcYT
-----END PGP SIGNATURE-----

--vCKLpbnvxaQ3Ambk--

