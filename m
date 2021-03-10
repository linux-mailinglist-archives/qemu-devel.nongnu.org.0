Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9628E3338C1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:32:57 +0100 (CET)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvD6-0008Mh-Fs
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJvAT-0007Jg-M7; Wed, 10 Mar 2021 04:30:13 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:56345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJvAR-0007IJ-0Z; Wed, 10 Mar 2021 04:30:13 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0A37F16AE;
 Wed, 10 Mar 2021 04:30:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 04:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=uEHEwiOVWDXs1Yei7ffgIDM7hxONDGtyFwqkCRS79
 VA=; b=SngsHkjYXSoS5bybACcP4Kn2ckMTp4DjJs+pGBLnE5W+6zfLEC0DcCgj3
 kzj4z4slqaXviqbKqRxuN2tyqHHmwEesI3JuJ2E9JLErdohKJqIKGlfO1j97a28b
 NzC/lw9F50lx8ev2sEYJRWZ41nTDk556pG/pvV33GtDbqAMAMZPfIq+5X0g8P/bn
 f61Va56w4G11dCP67KSMZZJFbiskaIQ3J1BajCkg3xGVhDdZ1nUJ2aYYZB0w2CMt
 EzHLuGqNUzBzNaYsAW73lwzjheppVUXdv8ZuYPcr3Twy5N1rvGVofC8V4qMth25e
 fMCwbhufGdUDcEQ8GEXt3boNlakRg==
X-ME-Sender: <xms:nZFIYMqzHB6Qy5Ru8psqIpsVMYZ8ixLpH4-UuSVd8vyiYQcTcHjlQA>
 <xme:nZFIYCol7s2hSZ47dbDh-9TBzoKdhETh5v2wmkj4ZPB_ZGIIPM68mzkjT4B7wZ6yZ
 so0NXP7YXd_Yhih-N0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpeekiedvtdfguedttdffhfeihfeffedttdekkedt
 leduheejgfeghfdujeelveduhfenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:nZFIYBPn4Uk5S0Ubl2xPCwVaz2eUVVH81MlbqcIpHqRSUw-o2x1u3Q>
 <xmx:nZFIYD7hMS_HP6A1FeA19AmENRTamNTbtSzfahX9Z7zIsroM3DgMqg>
 <xmx:nZFIYL5fBo44dFFFcC18Zo2VlSXspAR3i3bUinR119dGB_DlyiPUaQ>
 <xmx:npFIYDyRUHOLv7PVrrZCz9BBjBKM1iXtdzMYJSWKqSQl3KOnBoHe5Q>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE558108006E;
 Wed, 10 Mar 2021 04:30:04 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 47e06211;
 Wed, 10 Mar 2021 09:30:01 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/9] hw/block/pflash_cfi: Fix code style for checkpatch.pl
In-Reply-To: <20210309235028.912078-2-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-2-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 09:30:01 +0000
Message-ID: <m235x3gxuu.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=64.147.123.24;
 envelope-from=david.edmondson@oracle.com; helo=wout1-smtp.messagingengine.com
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

On Wednesday, 2021-03-10 at 00:50:20 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> We are going to move this code, fix its style first.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi01.c | 36 ++++++++++++++++++++++++------------
>  hw/block/pflash_cfi02.c |  9 ++++++---
>  2 files changed, 30 insertions(+), 15 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 22287a1522e..b6919bbe474 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -115,7 +115,8 @@ static const VMStateDescription vmstate_pflash =3D {
>      }
>  };
>=20=20
> -/* Perform a CFI query based on the bank width of the flash.
> +/*
> + * Perform a CFI query based on the bank width of the flash.
>   * If this code is called we know we have a device_width set for
>   * this flash.
>   */
> @@ -125,7 +126,8 @@ static uint32_t pflash_cfi_query(PFlashCFI01 *pfl, hw=
addr offset)
>      uint32_t resp =3D 0;
>      hwaddr boff;
>=20=20
> -    /* Adjust incoming offset to match expected device-width
> +    /*
> +     * Adjust incoming offset to match expected device-width
>       * addressing. CFI query addresses are always specified in terms of
>       * the maximum supported width of the device.  This means that x8
>       * devices and x8/x16 devices in x8 mode behave differently.  For
> @@ -141,7 +143,8 @@ static uint32_t pflash_cfi_query(PFlashCFI01 *pfl, hw=
addr offset)
>      if (boff >=3D sizeof(pfl->cfi_table)) {
>          return 0;
>      }
> -    /* Now we will construct the CFI response generated by a single
> +    /*
> +     * Now we will construct the CFI response generated by a single
>       * device, then replicate that for all devices that make up the
>       * bus.  For wide parts used in x8 mode, CFI query responses
>       * are different than native byte-wide parts.
> @@ -185,7 +188,8 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, =
hwaddr offset)
>      uint32_t resp;
>      hwaddr boff;
>=20=20
> -    /* Adjust incoming offset to match expected device-width
> +    /*
> +     * Adjust incoming offset to match expected device-width
>       * addressing. Device ID read addresses are always specified in
>       * terms of the maximum supported width of the device.  This means
>       * that x8 devices and x8/x16 devices in x8 mode behave
> @@ -198,7 +202,8 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl, =
hwaddr offset)
>      boff =3D offset >> (ctz32(pfl->bank_width) +
>                        ctz32(pfl->max_device_width) - ctz32(pfl->device_w=
idth));
>=20=20
> -    /* Mask off upper bits which may be used in to query block
> +    /*
> +     * Mask off upper bits which may be used in to query block
>       * or sector lock status at other addresses.
>       * Offsets 2/3 are block lock status, is not emulated.
>       */
> @@ -297,7 +302,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
>      case 0x60: /* Block /un)lock */
>      case 0x70: /* Status Register */
>      case 0xe8: /* Write block */
> -        /* Status register read.  Return status from each device in
> +        /*
> +         * Status register read.  Return status from each device in
>           * bank.
>           */
>          ret =3D pfl->status;
> @@ -308,7 +314,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
>                  shift +=3D pfl->device_width * 8;
>              }
>          } else if (!pfl->device_width && width > 2) {
> -            /* Handle 32 bit flash cases where device width is not
> +            /*
> +             * Handle 32 bit flash cases where device width is not
>               * set. (Existing behavior before device width added.)
>               */
>              ret |=3D pfl->status << 16;
> @@ -340,7 +347,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
>                  break;
>              }
>          } else {
> -            /* If we have a read larger than the bank_width, combine mul=
tiple
> +            /*
> +             * If we have a read larger than the bank_width, combine mul=
tiple
>               * manufacturer/device ID queries into a single response.
>               */
>              int i;
> @@ -367,7 +375,8 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
>                  ret =3D 0;
>              }
>          } else {
> -            /* If we have a read larger than the bank_width, combine mul=
tiple
> +            /*
> +             * If we have a read larger than the bank_width, combine mul=
tiple
>               * CFI queries into a single response.
>               */
>              int i;
> @@ -544,7 +553,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>=20=20
>              break;
>          case 0xe8:
> -            /* Mask writeblock size based on device width, or bank width=
 if
> +            /*
> +             * Mask writeblock size based on device width, or bank width=
 if
>               * device width not specified.
>               */
>              /* FIXME check @offset, @width */
> @@ -718,7 +728,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>=20=20
>      total_len =3D pfl->sector_len * pfl->nb_blocs;
>=20=20
> -    /* These are only used to expose the parameters of each device
> +    /*
> +     * These are only used to expose the parameters of each device
>       * in the cfi_table[].
>       */
>      num_devices =3D pfl->device_width ? (pfl->bank_width / pfl->device_w=
idth) : 1;
> @@ -763,7 +774,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>          }
>      }
>=20=20
> -    /* Default to devices being used at their maximum device width. This=
 was
> +    /*
> +     * Default to devices being used at their maximum device width. This=
 was
>       * assumed before the device_width support was added.
>       */
>      if (!pfl->max_device_width) {
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 7962cff7455..fa981465e12 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -100,7 +100,8 @@ struct PFlashCFI02 {
>      uint16_t unlock_addr1;
>      uint8_t cfi_table[0x4d];
>      QEMUTimer timer;
> -    /* The device replicates the flash memory across its memory space.  =
Emulate
> +    /*
> +     * The device replicates the flash memory across its memory space.  =
Emulate
>       * that by having a container (.mem) filled with an array of aliases
>       * (.mem_mappings) pointing to the flash memory (.orig_mem).
>       */
> @@ -884,8 +885,10 @@ static void pflash_cfi02_realize(DeviceState *dev, E=
rror **errp)
>      pfl->cfi_table[0x28] =3D 0x02;
>      pfl->cfi_table[0x29] =3D 0x00;
>      /* Max number of bytes in multi-bytes write */
> -    /* XXX: disable buffered write as it's not supported */
> -    //    pfl->cfi_table[0x2A] =3D 0x05;
> +    /*
> +     * XXX: disable buffered write as it's not supported
> +     * pfl->cfi_table[0x2A] =3D 0x05;
> +     */
>      pfl->cfi_table[0x2A] =3D 0x00;
>      pfl->cfi_table[0x2B] =3D 0x00;
>      /* Number of erase block regions */
> --=20
> 2.26.2

dme.
--=20
You're like my yo-yo, that glowed in the dark.

