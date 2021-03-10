Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FAE333ABC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:54:32 +0100 (CET)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwU3-0000r3-38
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwSq-0000MP-VQ; Wed, 10 Mar 2021 05:53:17 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:54217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwSo-0005sr-E0; Wed, 10 Mar 2021 05:53:16 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 35A85173E;
 Wed, 10 Mar 2021 05:53:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 10 Mar 2021 05:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=xKmd+BzZ+IxN/+hJbv62wkX64x5Bqa9U55ceeICln
 W0=; b=D++jfy6ReoiAHB8PLCttuDUH2IvUhfV8480ab+M4JX7qzKUMxrWjJCOZ5
 okm7sUm6wjQMiDP9BEYWABS8qZTWt2l2YeBQIx0Dz0lKlG4t+Avio6eV40ma81Ml
 7mjGHRsaCT/6Gms9O9LS9DX+vXVHIOzcXPvaGo2SJkKBiCE9yrt3kHdUegD1ZMmA
 HUTjZKFB6IK5PbwhTFHfea6XLjwtpletWB5puGaMUnlQnvMwm/30+WlfG6ogql8q
 Q6Fb2BVzh6b9bIAEVHEz1iz+QuYCGGz/xJVBI5e5BYAFX74LCTZ88opYDexRGoC2
 XxnW+FaGKaSuGAB3gr86mrTSgoWAA==
X-ME-Sender: <xms:FaVIYGpLdFh_UspDtbktTZ7jh_a9pm8EUunYMm22NLG-14RhNrzlSw>
 <xme:FaVIYA9FqFi4VqHAD1GZIEgYsQHijbGB-FTGCCQzE39KcDcCxrqVdOorX1IKjA0mP
 hp37DKcmIUc8eUrppQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpeekiedvtdfguedttdffhfeihfeffedttdekkedt
 leduheejgfeghfdujeelveduhfenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:FaVIYN_qg6hfWuYUdoivKadHzMXCn06qeYon3b6n90jrvXV71ReZQw>
 <xmx:FaVIYHv6VgXfte88JuJHRR7u7XZiUJ6rKg0LyjQbGeBBgUyJ8ZMQJQ>
 <xmx:FaVIYIoewDJtL5h5-5DlqLWrlLwjjLCTDVXUWeOON-8OMoylAav9jA>
 <xmx:FaVIYAhUsUpc4KUa2BoJNImgE-503p8M-c-QvnUHlVJC2su-8imfeg>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6173D240064;
 Wed, 10 Mar 2021 05:53:08 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 80d7d3ea;
 Wed, 10 Mar 2021 10:53:06 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 3/9] hw/block/pflash_cfi02: Extract
 pflash_cfi02_fill_cfi_table()
In-Reply-To: <20210309235028.912078-4-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-4-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 10:53:06 +0000
Message-ID: <m2v99zfffx.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=64.147.123.20;
 envelope-from=david.edmondson@oracle.com; helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_SOFTFAIL=0.665,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-10 at 00:50:22 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> Fill the CFI table in out of DeviceRealize() in a new function:
> pflash_cfi02_fill_cfi_table().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi02.c | 193 +++++++++++++++++++++-------------------
>  1 file changed, 99 insertions(+), 94 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index fa981465e12..845f50ed99b 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -724,6 +724,104 @@ static const MemoryRegionOps pflash_cfi02_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>  };
>=20=20
> +static void pflash_cfi02_fill_cfi_table(PFlashCFI02 *pfl, int nb_regions)
> +{
> +    /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
> +    const uint16_t pri_ofs =3D 0x40;
> +    /* Standard "QRY" string */
> +    pfl->cfi_table[0x10] =3D 'Q';
> +    pfl->cfi_table[0x11] =3D 'R';
> +    pfl->cfi_table[0x12] =3D 'Y';
> +    /* Command set (AMD/Fujitsu) */
> +    pfl->cfi_table[0x13] =3D 0x02;
> +    pfl->cfi_table[0x14] =3D 0x00;
> +    /* Primary extended table address */
> +    pfl->cfi_table[0x15] =3D pri_ofs;
> +    pfl->cfi_table[0x16] =3D pri_ofs >> 8;
> +    /* Alternate command set (none) */
> +    pfl->cfi_table[0x17] =3D 0x00;
> +    pfl->cfi_table[0x18] =3D 0x00;
> +    /* Alternate extended table (none) */
> +    pfl->cfi_table[0x19] =3D 0x00;
> +    pfl->cfi_table[0x1A] =3D 0x00;
> +    /* Vcc min */
> +    pfl->cfi_table[0x1B] =3D 0x27;
> +    /* Vcc max */
> +    pfl->cfi_table[0x1C] =3D 0x36;
> +    /* Vpp min (no Vpp pin) */
> +    pfl->cfi_table[0x1D] =3D 0x00;
> +    /* Vpp max (no Vpp pin) */
> +    pfl->cfi_table[0x1E] =3D 0x00;
> +    /* Timeout per single byte/word write (128 ms) */
> +    pfl->cfi_table[0x1F] =3D 0x07;
> +    /* Timeout for min size buffer write (NA) */
> +    pfl->cfi_table[0x20] =3D 0x00;
> +    /* Typical timeout for block erase (512 ms) */
> +    pfl->cfi_table[0x21] =3D 0x09;
> +    /* Typical timeout for full chip erase (4096 ms) */
> +    pfl->cfi_table[0x22] =3D 0x0C;
> +    /* Reserved */
> +    pfl->cfi_table[0x23] =3D 0x01;
> +    /* Max timeout for buffer write (NA) */
> +    pfl->cfi_table[0x24] =3D 0x00;
> +    /* Max timeout for block erase */
> +    pfl->cfi_table[0x25] =3D 0x0A;
> +    /* Max timeout for chip erase */
> +    pfl->cfi_table[0x26] =3D 0x0D;
> +    /* Device size */
> +    pfl->cfi_table[0x27] =3D ctz32(pfl->chip_len);
> +    /* Flash device interface (8 & 16 bits) */
> +    pfl->cfi_table[0x28] =3D 0x02;
> +    pfl->cfi_table[0x29] =3D 0x00;
> +    /* Max number of bytes in multi-bytes write */
> +    /*
> +     * XXX: disable buffered write as it's not supported
> +     * pfl->cfi_table[0x2A] =3D 0x05;
> +     */
> +    pfl->cfi_table[0x2A] =3D 0x00;
> +    pfl->cfi_table[0x2B] =3D 0x00;
> +    /* Number of erase block regions */
> +    pfl->cfi_table[0x2c] =3D nb_regions;
> +    /* Erase block regions */
> +    for (int i =3D 0; i < nb_regions; ++i) {
> +        uint32_t sector_len_per_device =3D pfl->sector_len[i];
> +        pfl->cfi_table[0x2d + 4 * i] =3D pfl->nb_blocs[i] - 1;
> +        pfl->cfi_table[0x2e + 4 * i] =3D (pfl->nb_blocs[i] - 1) >> 8;
> +        pfl->cfi_table[0x2f + 4 * i] =3D sector_len_per_device >> 8;
> +        pfl->cfi_table[0x30 + 4 * i] =3D sector_len_per_device >> 16;
> +    }
> +    assert(0x2c + 4 * nb_regions < pri_ofs);
> +
> +    /* Extended */
> +    pfl->cfi_table[0x00 + pri_ofs] =3D 'P';
> +    pfl->cfi_table[0x01 + pri_ofs] =3D 'R';
> +    pfl->cfi_table[0x02 + pri_ofs] =3D 'I';
> +
> +    /* Extended version 1.0 */
> +    pfl->cfi_table[0x03 + pri_ofs] =3D '1';
> +    pfl->cfi_table[0x04 + pri_ofs] =3D '0';
> +
> +    /* Address sensitive unlock required. */
> +    pfl->cfi_table[0x05 + pri_ofs] =3D 0x00;
> +    /* Erase suspend to read/write. */
> +    pfl->cfi_table[0x06 + pri_ofs] =3D 0x02;
> +    /* Sector protect not supported. */
> +    pfl->cfi_table[0x07 + pri_ofs] =3D 0x00;
> +    /* Temporary sector unprotect not supported. */
> +    pfl->cfi_table[0x08 + pri_ofs] =3D 0x00;
> +
> +    /* Sector protect/unprotect scheme. */
> +    pfl->cfi_table[0x09 + pri_ofs] =3D 0x00;
> +
> +    /* Simultaneous operation not supported. */
> +    pfl->cfi_table[0x0a + pri_ofs] =3D 0x00;
> +    /* Burst mode not supported. */
> +    pfl->cfi_table[0x0b + pri_ofs] =3D 0x00;
> +    /* Page mode not supported. */
> +    pfl->cfi_table[0x0c + pri_ofs] =3D 0x00;
> +    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
> +}
> +
>  static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -837,100 +935,7 @@ static void pflash_cfi02_realize(DeviceState *dev, =
Error **errp)
>      pfl->cmd =3D 0;
>      pfl->status =3D 0;
>=20=20
> -    /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
> -    const uint16_t pri_ofs =3D 0x40;
> -    /* Standard "QRY" string */
> -    pfl->cfi_table[0x10] =3D 'Q';
> -    pfl->cfi_table[0x11] =3D 'R';
> -    pfl->cfi_table[0x12] =3D 'Y';
> -    /* Command set (AMD/Fujitsu) */
> -    pfl->cfi_table[0x13] =3D 0x02;
> -    pfl->cfi_table[0x14] =3D 0x00;
> -    /* Primary extended table address */
> -    pfl->cfi_table[0x15] =3D pri_ofs;
> -    pfl->cfi_table[0x16] =3D pri_ofs >> 8;
> -    /* Alternate command set (none) */
> -    pfl->cfi_table[0x17] =3D 0x00;
> -    pfl->cfi_table[0x18] =3D 0x00;
> -    /* Alternate extended table (none) */
> -    pfl->cfi_table[0x19] =3D 0x00;
> -    pfl->cfi_table[0x1A] =3D 0x00;
> -    /* Vcc min */
> -    pfl->cfi_table[0x1B] =3D 0x27;
> -    /* Vcc max */
> -    pfl->cfi_table[0x1C] =3D 0x36;
> -    /* Vpp min (no Vpp pin) */
> -    pfl->cfi_table[0x1D] =3D 0x00;
> -    /* Vpp max (no Vpp pin) */
> -    pfl->cfi_table[0x1E] =3D 0x00;
> -    /* Timeout per single byte/word write (128 ms) */
> -    pfl->cfi_table[0x1F] =3D 0x07;
> -    /* Timeout for min size buffer write (NA) */
> -    pfl->cfi_table[0x20] =3D 0x00;
> -    /* Typical timeout for block erase (512 ms) */
> -    pfl->cfi_table[0x21] =3D 0x09;
> -    /* Typical timeout for full chip erase (4096 ms) */
> -    pfl->cfi_table[0x22] =3D 0x0C;
> -    /* Reserved */
> -    pfl->cfi_table[0x23] =3D 0x01;
> -    /* Max timeout for buffer write (NA) */
> -    pfl->cfi_table[0x24] =3D 0x00;
> -    /* Max timeout for block erase */
> -    pfl->cfi_table[0x25] =3D 0x0A;
> -    /* Max timeout for chip erase */
> -    pfl->cfi_table[0x26] =3D 0x0D;
> -    /* Device size */
> -    pfl->cfi_table[0x27] =3D ctz32(pfl->chip_len);
> -    /* Flash device interface (8 & 16 bits) */
> -    pfl->cfi_table[0x28] =3D 0x02;
> -    pfl->cfi_table[0x29] =3D 0x00;
> -    /* Max number of bytes in multi-bytes write */
> -    /*
> -     * XXX: disable buffered write as it's not supported
> -     * pfl->cfi_table[0x2A] =3D 0x05;
> -     */
> -    pfl->cfi_table[0x2A] =3D 0x00;
> -    pfl->cfi_table[0x2B] =3D 0x00;
> -    /* Number of erase block regions */
> -    pfl->cfi_table[0x2c] =3D nb_regions;
> -    /* Erase block regions */
> -    for (int i =3D 0; i < nb_regions; ++i) {
> -        uint32_t sector_len_per_device =3D pfl->sector_len[i];
> -        pfl->cfi_table[0x2d + 4 * i] =3D pfl->nb_blocs[i] - 1;
> -        pfl->cfi_table[0x2e + 4 * i] =3D (pfl->nb_blocs[i] - 1) >> 8;
> -        pfl->cfi_table[0x2f + 4 * i] =3D sector_len_per_device >> 8;
> -        pfl->cfi_table[0x30 + 4 * i] =3D sector_len_per_device >> 16;
> -    }
> -    assert(0x2c + 4 * nb_regions < pri_ofs);
> -
> -    /* Extended */
> -    pfl->cfi_table[0x00 + pri_ofs] =3D 'P';
> -    pfl->cfi_table[0x01 + pri_ofs] =3D 'R';
> -    pfl->cfi_table[0x02 + pri_ofs] =3D 'I';
> -
> -    /* Extended version 1.0 */
> -    pfl->cfi_table[0x03 + pri_ofs] =3D '1';
> -    pfl->cfi_table[0x04 + pri_ofs] =3D '0';
> -
> -    /* Address sensitive unlock required. */
> -    pfl->cfi_table[0x05 + pri_ofs] =3D 0x00;
> -    /* Erase suspend to read/write. */
> -    pfl->cfi_table[0x06 + pri_ofs] =3D 0x02;
> -    /* Sector protect not supported. */
> -    pfl->cfi_table[0x07 + pri_ofs] =3D 0x00;
> -    /* Temporary sector unprotect not supported. */
> -    pfl->cfi_table[0x08 + pri_ofs] =3D 0x00;
> -
> -    /* Sector protect/unprotect scheme. */
> -    pfl->cfi_table[0x09 + pri_ofs] =3D 0x00;
> -
> -    /* Simultaneous operation not supported. */
> -    pfl->cfi_table[0x0a + pri_ofs] =3D 0x00;
> -    /* Burst mode not supported. */
> -    pfl->cfi_table[0x0b + pri_ofs] =3D 0x00;
> -    /* Page mode not supported. */
> -    pfl->cfi_table[0x0c + pri_ofs] =3D 0x00;
> -    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
> +    pflash_cfi02_fill_cfi_table(pfl, nb_regions);
>  }
>=20=20
>  static Property pflash_cfi02_properties[] =3D {
> --=20
> 2.26.2

dme.
--=20
You took the words right out of my mouth.

