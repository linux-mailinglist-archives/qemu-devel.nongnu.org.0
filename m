Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5123BAAC9
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 03:29:51 +0200 (CEST)
Received: from localhost ([::1]:37898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzqxC-0007zF-88
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 21:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzqw5-0007Kf-Nd
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 21:28:41 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzqw4-0004wA-0Z
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 21:28:41 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E8C83320079B;
 Sat,  3 Jul 2021 21:28:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 03 Jul 2021 21:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FVRU8/
 B7BVZgJaI0MZGcX0LZ4wp6S3KLBqUXFXXkeLQ=; b=nG55VnMG4mnVkkSVk6DIfB
 vuxj6FHW5892tu6E91CF/qpoTYd4/Rb3NhtWF1Ekl89BxUvlMPD9OAn6EH+HW6AX
 9gTtRsI6lIDuaxNd+C39yMSy83I0WXWC8+J0zgd2HcrNDmVp3RLebY4nW6Z7x57A
 LijlmgqgSdMnCvWk1wEPqgoSUJ902wDbyCMkswFxCH0JawduK8Mva+g7VbunZn0c
 hM+o4v7qZiQbnQnCsi6KHmXD3M1W3eNA9EzYObqA0yws5dFxfliocZmzK0FMfT+C
 0tOWjjmS9dXVK9oVkiUSa+WPwwcnZiK1OZiGef9rfchDDeSD5dwBzXa/eyYLabPw
 ==
X-ME-Sender: <xms:ww7hYOgqDf3SKvF523UIpVmvO27wPwR-_Z-lDNoQ4z0-5uIBkXJbrg>
 <xme:ww7hYPDQ_ZgW-DaQKJnDL6uxmknDmdjxzeO78x7m3WfFdWBBsK1mnMzk8J3iBHVB2
 fq91T39bAJTZDdUTP4>
X-ME-Received: <xmr:ww7hYGHuaeLchNr3qpeqaqKnqqeQrjciwlUYHqSJO6V0IYljcyWl1tqTf_9PDh5n_Wc-EVAKAdm9Ema6KaDXS4nXMPj8bL-EWxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:ww7hYHQRlbeOur5eX7pNNiekCJgLzQ0bnYliX0CgxmIn72OxyZWB8Q>
 <xmx:ww7hYLxqWgPTj6e9lezCNvSosE4oM97ImZrQUHoNbGQNRf1q1Ahfiw>
 <xmx:ww7hYF72mpfdq6BxuT_RchnbshA1dZib1-Vpb2qZKae-YASJvmwGCw>
 <xmx:xA7hYG-T6YSeWP7rS-o9Lg3DrhrMGtkRK6mAC3BQvH_UKn2d98vizQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Jul 2021 21:28:33 -0400 (EDT)
Date: Sun, 4 Jul 2021 11:28:28 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 0/3] dp8393x: Reviewing CRC code
In-Reply-To: <20210703150219.364582-1-f4bug@amsat.org>
Message-ID: <bc89f0f0-79bb-464f-d56d-86ee5b7729b2@linux-m68k.org>
References: <20210703150219.364582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-107405627-1625362108=:7"
Received-SPF: none client-ip=64.147.123.21; envelope-from=fthain@linux-m68k.org;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-107405627-1625362108=:7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Sat, 3 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> Hi Mark, few more patches while reviewing.
>=20
>=20
>=20
> Again, not tested (yet)... Simply compiled.
>=20
>=20
>=20
> Please tell me what you think of them.
>=20
>=20

I think these 3 patches can be reduced to this theoretical bug fix:

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index db9cfd786f..e278daebc5 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -802,7 +802,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, cons=
t uint8_t * buf,
     s->regs[SONIC_TRBA0] =3D s->regs[SONIC_CRBA0];
=20
     /* Calculate the ethernet checksum */
-    checksum =3D cpu_to_le32(crc32(0, buf, pkt_size));
+    checksum =3D crc32(0, buf, pkt_size);
=20
     /* Put packet into RBA */
     trace_dp8393x_receive_packet(dp8393x_crba(s));
@@ -812,8 +812,13 @@ static ssize_t dp8393x_receive(NetClientState *nc, con=
st uint8_t * buf,
     address +=3D pkt_size;
=20
     /* Put frame checksum into RBA */
-    address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                        &checksum, sizeof(checksum));
+    if (s->big_endian) {
+        address_space_stl_be(&s->as, address, checksum,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+    } else {
+        address_space_stl_le(&s->as, address, checksum,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+    }
     address +=3D sizeof(checksum);
=20
     /* Pad short packets to keep pointers aligned */

>=20
> Regards,
>=20
>=20
>=20
> Phil.
>=20
>=20
>=20
> Philippe Mathieu-Daud=C3=A9 (3):
>=20
>   dp8393x: Store CRC using address_space_stl_le()
>=20
>   dp8393x: Do not amend CRC if it is inhibited (CRCI bit set)
>=20
>   dp8393x: Store CRC using device configured endianess
>=20
>=20
>=20
>  hw/net/dp8393x.c | 26 ++++++++++++++++++--------
>=20
>  1 file changed, 18 insertions(+), 8 deletions(-)
>=20
>=20
>=20
> --=20
>=20
> 2.31.1
>=20
>=20
>=20
>=20
---1463811774-107405627-1625362108=:7--

