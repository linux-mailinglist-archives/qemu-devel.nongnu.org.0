Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E166B3BDFD8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:49:29 +0200 (CEST)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uoi-0008NO-Dk
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0uns-0007j2-Cz
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:48:36 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:32975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0unp-0006Qv-Ny
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:48:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8251F5C00C4;
 Tue,  6 Jul 2021 19:48:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 06 Jul 2021 19:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-id:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Mo1ou33PjZ7XntOfJzjuu4VpLbJu2s3NUydf7BbYhoU=; b=hR3+jnXO
 hjky21d6w3/XD87s2RLtQRKnEYf6vT6Ypng2Nzc36yQjbb7gYaG3NnFLvcTTcFUi
 GxfaNIg2FmpqmHAhqjY0/XmwAxHYeRe+MXr3uz6JYS5/rOb88NoftmR9N3TbqU5e
 oyHs4oXhFbIxNDz4wRj8vLm8a4YQqiHLJ0v7AY983ZksxQQ1Kw+L1idy23IN/CiW
 k8n6ewC+hwz6KB2Eg7GKQ1RGxXs/j0ZzWCgmZfW+MvrseQ29Ktn/iiZiRQV1LqLY
 tFDvkeGeg2+zsuA38oY0C0jOwDS/27bHnF5NdMlGY19Omj3JeRjVTLoPBwg6hTD2
 ZLp8HFJsol2iLw==
X-ME-Sender: <xms:zuvkYPR6hM9H-Oiy2NlgT5bIlvUk4EGvsS_7HiY7AkDhMm6tJy5P1Q>
 <xme:zuvkYAyuxZpuzOXHGXw8uJ02hzo0Q2BbaaN-plFklqw92i9Ds7IT3mynsQItQSNhz
 ltGGIFXnwOyzdB3bVI>
X-ME-Received: <xmr:zuvkYE07-lJjDOQq0ekpH2GZI1pRpSpyszAceVp9lbRXvS8ageqWfaFJvEHilnQ5LdfOZNi1cZ2W3E_74NwHxH_jDlhvwqBzbEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeefffejiefgheevheefvefhteeggfeijeeiveeihfffffdugfefkeelfffhgfeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:zuvkYPDZsdsN9K0u12CzUzPqFKZLfCYa735ipoK9m2IbdRTnt6S9LQ>
 <xmx:zuvkYIgvC5o5QZyttp8LuRgPRdfO6GmCZJOXcH-Mg4MekqpeaHzcBA>
 <xmx:zuvkYDoJvuXDoUzMMbw5DEDgKD-VVayS5q6oXNzB7hOOe8xyLQRIpw>
 <xmx:z-vkYLulaeGT8x07RngyA2eGpL7KJG7Gtz38Xj3PYeAtbv7qLU5k_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 19:48:28 -0400 (EDT)
Date: Wed, 7 Jul 2021 09:48:10 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/4] dp8393x: Store CAM registers as 16-bit
In-Reply-To: <20210705214929.17222-4-mark.cave-ayland@ilande.co.uk>
Message-ID: <687af4d-a483-c7ff-b89c-59c0e442141@linux-m68k.org>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
 <20210705214929.17222-4-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-204753470-1625614741=:6"
Content-ID: <d05d5c88-3b-e7a-1e80-37996177168@nippy.intranet>
Received-SPF: none client-ip=66.111.4.26; envelope-from=fthain@linux-m68k.org;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-204753470-1625614741=:6
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <274ecaa-16b-62b2-6523-976944d8a714@nippy.intranet>

On Mon, 5 Jul 2021, Mark Cave-Ayland wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> Per the DP83932C datasheet from July 1995:
>=20
>   4.0 SONIC Registers
>   4.1 THE CAM UNIT
>=20
>     The Content Addressable Memory (CAM) consists of sixteen
>     48-bit entries for complete address filtering of network
>     packets. Each entry corresponds to a 48-bit destination
>     address that is user programmable and can contain any
>     combination of Multicast or Physical addresses. Each entry
>     is partitioned into three 16-bit CAM cells accessible
>     through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
>     CAP0 corresponding to the least significant 16 bits of
>     the Destination Address and CAP2 corresponding to the
>     most significant bits.
>=20
> Store the CAM registers as 16-bit as it simplifies the code.
> There is no change in the migration stream.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/net/dp8393x.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>=20
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index cc7c001edb..22ceea338c 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -157,7 +157,7 @@ struct dp8393xState {
>      MemoryRegion mmio;
> =20
>      /* Registers */
> -    uint8_t cam[16][6];
> +    uint16_t cam[16][3];
>      uint16_t regs[0x40];
> =20
>      /* Temporaries */
> @@ -280,15 +280,13 @@ static void dp8393x_do_load_cam(dp8393xState *s)
>          address_space_read(&s->as, dp8393x_cdp(s),
>                             MEMTXATTRS_UNSPECIFIED, s->data, size);
>          index =3D dp8393x_get(s, width, 0) & 0xf;
> -        s->cam[index][0] =3D dp8393x_get(s, width, 1) & 0xff;
> -        s->cam[index][1] =3D dp8393x_get(s, width, 1) >> 8;
> -        s->cam[index][2] =3D dp8393x_get(s, width, 2) & 0xff;
> -        s->cam[index][3] =3D dp8393x_get(s, width, 2) >> 8;
> -        s->cam[index][4] =3D dp8393x_get(s, width, 3) & 0xff;
> -        s->cam[index][5] =3D dp8393x_get(s, width, 3) >> 8;
> -        trace_dp8393x_load_cam(index, s->cam[index][0], s->cam[index][1]=
,
> -                               s->cam[index][2], s->cam[index][3],
> -                               s->cam[index][4], s->cam[index][5]);
> +        s->cam[index][0] =3D dp8393x_get(s, width, 1);
> +        s->cam[index][1] =3D dp8393x_get(s, width, 2);
> +        s->cam[index][2] =3D dp8393x_get(s, width, 3);
> +        trace_dp8393x_load_cam(index,
> +                               s->cam[index][0] >> 8, s->cam[index][0] &=
 0xff,
> +                               s->cam[index][1] >> 8, s->cam[index][1] &=
 0xff,
> +                               s->cam[index][2] >> 8, s->cam[index][2] &=
 0xff);
>          /* Move to next entry */
>          s->regs[SONIC_CDC]--;
>          s->regs[SONIC_CDP] +=3D size;
> @@ -591,8 +589,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr add=
r, unsigned int size)
>      case SONIC_CAP1:
>      case SONIC_CAP0:
>          if (s->regs[SONIC_CR] & SONIC_CR_RST) {
> -            val =3D s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - r=
eg) + 1] << 8;
> -            val |=3D s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - =
reg)];
> +            val =3D s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - r=
eg)];
>          }
>          break;
>      /* All other registers have no special contraints */

This patch incorrectly alters the behaviour of the jazzsonic.c driver=20
which reads the MAC address from the CAP registers in sonic_probe1().

With mainline QEMU, the driver reports:
SONIC ethernet @e0001000, MAC 00:00:00:44:33:22, IRQ 28

With this patch:
SONIC ethernet @e0001000, MAC 00:00:33:22:00:00, IRQ 28

> @@ -990,7 +987,7 @@ static const VMStateDescription vmstate_dp8393x =3D {
>      .version_id =3D 0,
>      .minimum_version_id =3D 0,
>      .fields =3D (VMStateField []) {
> -        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
> +        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
>          VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
>          VMSTATE_END_OF_LIST()
>      }
>=20
---1463811774-204753470-1625614741=:6--

