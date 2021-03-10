Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C98333B0A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:07:48 +0100 (CET)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwgt-0002a3-8x
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwed-0000xJ-BM; Wed, 10 Mar 2021 06:05:28 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:33987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJweZ-0004gb-M7; Wed, 10 Mar 2021 06:05:26 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2F6F81776;
 Wed, 10 Mar 2021 06:05:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 10 Mar 2021 06:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=f9HtnkMiYFin5GnhOqoLBOTgix88mg+8Zu6/QJA5z
 pY=; b=mNSkkJrCNI08fv6jz+vh7dPKg1uJ7wrxgHph69PcWldea+Cnd7IDUF4Se
 QsPB9Ez3MfQPXx7ZHgeDWEy9eGnX73xDf7nEtliVhDCHKCxffIYZTEAkszrwRIWj
 o/UC/L0uNBOIATbq2QAHpyNwxRs6eonuX+oISjUYzU8qrdnutca6ySmyl2Zj6KLg
 bt4RIFAfY8TfFvkXTsj37DasPYzhma/aw5Vm3GEto/27GX8wd9P4al6f+PqN3iUY
 VdVBShYWzfUyukZE49/lQ7aUKYBL1dNJQjh2FbACQ7es5hIfvHLKCKTtEQJhvZRw
 mN75OdE+U/RzSlJocsIGaFk4Bsv6g==
X-ME-Sender: <xms:66dIYKxVsUCi_sjDeF-Ptiqv36z-3AKxgkQ4UETBPelzHznvm1slaw>
 <xme:66dIYBtQoE9uqAEtCHxSiwpRvPQPDJlUy_7dtuLjbsQeABBOO384M6jB35fRf1Ex8
 7fxfg86fyNrhEsuI2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpeekiedvtdfguedttdffhfeihfeffedttdekkedt
 leduheejgfeghfdujeelveduhfenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:66dIYP1wCboRhfwBUZAw-b2-aYsx46yjRMV6y796u2jC0bXplj2wDw>
 <xmx:66dIYE9Q8Vv0jlup2PinRNiad-x-BRx4pgJUi3OzljrJFmQmCfwzJw>
 <xmx:66dIYIO-zCFCp14RBpHTPG4mRXarTiJ5GFaA-HuPy9FOFOUiIMqDig>
 <xmx:7KdIYCexJDR18IESNgcCfZe8DjScU4IeZOgalfKDp6bX8C-WQEDj-A>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB3F51080059;
 Wed, 10 Mar 2021 06:05:14 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 6260bc61;
 Wed, 10 Mar 2021 11:05:14 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 9/9] hw/block/pflash_cfi01: Extract
 pflash_mode_read_array()
In-Reply-To: <20210309235028.912078-10-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-10-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 11:05:13 +0000
Message-ID: <m2ft13fevq.fsf@oracle.com>
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

On Wednesday, 2021-03-10 at 00:50:28 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> The same pattern is used when setting the flash in READ_ARRAY mode:
> - Set the state machine command to READ_ARRAY
> - Reset the write_cycle counter
> - Reset the memory region in ROMD
>
> Refactor the current code by extracting this pattern.
> It is used three times:
>
> - On a read access (on invalid command).
>
> - On a write access (on command failure, error, or explicitly asked)
>
> - When the device is initialized. Here the ROMD mode is hidden
>   by the memory_region_init_rom_device() call.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi01.c | 40 +++++++++++++++++-----------------------
>  1 file changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 2618e00926d..32c9b289715 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -115,6 +115,19 @@ static const VMStateDescription vmstate_pflash =3D {
>      }
>  };
>=20=20
> +static void pflash_mode_read_array(PFlashCFI01 *pfl)
> +{
> +    trace_pflash_mode_read_array();
> +    /*
> +     * The command 0x00 is not assigned by the CFI open standard,
> +     * but QEMU historically uses it for the READ_ARRAY command (0xff).
> +     */
> +    trace_pflash_mode_read_array();
> +    pfl->cmd =3D 0x00;
> +    pfl->wcycle =3D 0;
> +    memory_region_rom_device_set_romd(&pfl->mem, true);
> +}
> +
>  /*
>   * Perform a CFI query based on the bank width of the flash.
>   * If this code is called we know we have a device_width set for
> @@ -283,12 +296,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr=
 offset,
>      default:
>          /* This should never happen : reset state & treat it as a read */
>          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
> -        pfl->wcycle =3D 0;
> -        /*
> -         * The command 0x00 is not assigned by the CFI open standard,
> -         * but QEMU historically uses it for the READ_ARRAY command (0xf=
f).
> -         */
> -        pfl->cmd =3D 0x00;
> +        pflash_mode_read_array(pfl);
>          /* fall through to read code */
>      case 0x00: /* This model reset value for READ_ARRAY (not CFI complia=
nt) */
>          /* Flash area read */
> @@ -663,10 +671,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr of=
fset,
>                    "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
>=20=20
>   mode_read_array:
> -    trace_pflash_mode_read_array();
> -    memory_region_rom_device_set_romd(&pfl->mem, true);
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0x00; /* This model reset value for READ_ARRAY (not CFI=
) */
> +    pflash_mode_read_array(pfl);
>  }
>=20=20
>=20=20
> @@ -872,13 +877,8 @@ static void pflash_cfi01_realize(DeviceState *dev, E=
rror **errp)
>          pfl->max_device_width =3D pfl->device_width;
>      }
>=20=20
> -    pfl->wcycle =3D 0;
> -    /*
> -     * The command 0x00 is not assigned by the CFI open standard,
> -     * but QEMU historically uses it for the READ_ARRAY command (0xff).
> -     */
> -    pfl->cmd =3D 0x00;
>      pfl->status =3D 0x80; /* WSM ready */
> +    pflash_mode_read_array(pfl);
>      pflash_cfi01_fill_cfi_table(pfl);
>  }
>=20=20
> @@ -887,13 +887,7 @@ static void pflash_cfi01_system_reset(DeviceState *d=
ev)
>      PFlashCFI01 *pfl =3D PFLASH_CFI01(dev);
>=20=20
>      trace_pflash_reset();
> -    /*
> -     * The command 0x00 is not assigned by the CFI open standard,
> -     * but QEMU historically uses it for the READ_ARRAY command (0xff).
> -     */
> -    pfl->cmd =3D 0x00;
> -    pfl->wcycle =3D 0;
> -    memory_region_rom_device_set_romd(&pfl->mem, true);
> +    pflash_mode_read_array(pfl);
>      /*
>       * The WSM ready timer occurs at most 150ns after system reset.
>       * This model deliberately ignores this delay.
> --=20
> 2.26.2

dme.
--=20
Would you offer your throat to the wolf with the red roses?

