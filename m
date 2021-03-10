Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFEB3338D8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:34:31 +0100 (CET)
Received: from localhost ([::1]:50844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvEc-0001kz-86
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJvCJ-00087D-3q; Wed, 10 Mar 2021 04:32:07 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:56583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJvCH-0008JB-7x; Wed, 10 Mar 2021 04:32:06 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A79F81672;
 Wed, 10 Mar 2021 04:32:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 04:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=KqfnxmjImoX2i+kFTSYlcFR2sivKRmeg979zRUgY6
 tM=; b=W03Xphr/pSSNsRftEdz4jryjeh803rfdcXBjI5/zr5v+37IWQLTGI0v7v
 M52CzW50+1qaEYzgnMyMUy53h+1zknJiwTVysGnrnpkdLAmopn9qkM0HiqhEf6+E
 fHVAw/whoWS16MPt0DEAgpgAeuerOtpol9mnwRxJFFm8VZkEexbAVvl5h47EJ0G/
 3Lvicph61X1rMJQCP7oOZn6vVgUPEtHZuz+vLfRyZjS7jmOjPWoujaQUD0M0TwpL
 p6mm0Mm79PerqQlKnL/Wg2XsTXJf5k6dEVULZ3lgK7j/hZl/KD2oNervW7TE9Gj/
 ZvxU0FMbTX/ymSLEQk5SoPYkcp+3A==
X-ME-Sender: <xms:EZJIYEytWwXm2yOGQLQc1OJzQat_ZLFyEHpuWXWMzfQKqx_lFHG53A>
 <xme:EZJIYIQtwZci03Wj_hnW60EvH7ySt0H7DBh9rfOAAoo03KwjhZhTk3ej470HWmOqu
 9flZoaymJ5UGgzxnds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpeekiedvtdfguedttdffhfeihfeffedttdekkedt
 leduheejgfeghfdujeelveduhfenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:EZJIYGVRNZFWnds6sqFTgOA4jQzWMq2HbfshQADZkDlg2feZxskteg>
 <xmx:EZJIYCjS0557d9MjP6xukWfz3d2WSd2PKQCggeEyHbqMBJ--on_jOw>
 <xmx:EZJIYGAvJJg5tc60FhO0an85gvHYbAhZQowEYTUbLuBpG6eIhCYgOg>
 <xmx:EpJIYC5PqZK4dNx-zQLfJ2j99UxQ_uR5zA0npqByydEmUi2jNTllZA>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 607A624005C;
 Wed, 10 Mar 2021 04:32:00 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 5cf4bae4;
 Wed, 10 Mar 2021 09:31:59 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/9] hw/block/pflash_cfi01: Extract
 pflash_cfi01_fill_cfi_table()
In-Reply-To: <20210309235028.912078-3-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-3-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 09:31:59 +0000
Message-ID: <m2zgzbfj74.fsf@oracle.com>
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

On Wednesday, 2021-03-10 at 00:50:21 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> Fill the CFI table in out of DeviceRealize() in a new function:
> pflash_cfi01_fill_cfi_table().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
>  1 file changed, 73 insertions(+), 67 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index b6919bbe474..03472ea5b64 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -704,30 +704,11 @@ static const MemoryRegionOps pflash_cfi01_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>  };
>=20=20
> -static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
> +static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
>  {
> -    ERRP_GUARD();
> -    PFlashCFI01 *pfl =3D PFLASH_CFI01(dev);
> -    uint64_t total_len;
> -    int ret;
>      uint64_t blocks_per_device, sector_len_per_device, device_len;
>      int num_devices;
>=20=20
> -    if (pfl->sector_len =3D=3D 0) {
> -        error_setg(errp, "attribute \"sector-length\" not specified or z=
ero.");
> -        return;
> -    }
> -    if (pfl->nb_blocs =3D=3D 0) {
> -        error_setg(errp, "attribute \"num-blocks\" not specified or zero=
.");
> -        return;
> -    }
> -    if (pfl->name =3D=3D NULL) {
> -        error_setg(errp, "attribute \"name\" not specified.");
> -        return;
> -    }
> -
> -    total_len =3D pfl->sector_len * pfl->nb_blocs;
> -
>      /*
>       * These are only used to expose the parameters of each device
>       * in the cfi_table[].
> @@ -742,53 +723,6 @@ static void pflash_cfi01_realize(DeviceState *dev, E=
rror **errp)
>      }
>      device_len =3D sector_len_per_device * blocks_per_device;
>=20=20
> -    memory_region_init_rom_device(
> -        &pfl->mem, OBJECT(dev),
> -        &pflash_cfi01_ops,
> -        pfl,
> -        pfl->name, total_len, errp);
> -    if (*errp) {
> -        return;
> -    }
> -
> -    pfl->storage =3D memory_region_get_ram_ptr(&pfl->mem);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> -
> -    if (pfl->blk) {
> -        uint64_t perm;
> -        pfl->ro =3D !blk_supports_write_perm(pfl->blk);
> -        perm =3D BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRIT=
E);
> -        ret =3D blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
> -        if (ret < 0) {
> -            return;
> -        }
> -    } else {
> -        pfl->ro =3D 0;
> -    }
> -
> -    if (pfl->blk) {
> -        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_l=
en,
> -                                         errp)) {
> -            vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
> -            return;
> -        }
> -    }
> -
> -    /*
> -     * Default to devices being used at their maximum device width. This=
 was
> -     * assumed before the device_width support was added.
> -     */
> -    if (!pfl->max_device_width) {
> -        pfl->max_device_width =3D pfl->device_width;
> -    }
> -
> -    pfl->wcycle =3D 0;
> -    /*
> -     * The command 0x00 is not assigned by the CFI open standard,
> -     * but QEMU historically uses it for the READ_ARRAY command (0xff).
> -     */
> -    pfl->cmd =3D 0x00;
> -    pfl->status =3D 0x80; /* WSM ready */
>      /* Hardcoded CFI table */
>      /* Standard "QRY" string */
>      pfl->cfi_table[0x10] =3D 'Q';
> @@ -876,6 +810,78 @@ static void pflash_cfi01_realize(DeviceState *dev, E=
rror **errp)
>      pfl->cfi_table[0x3f] =3D 0x01; /* Number of protection fields */
>  }
>=20=20
> +static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    PFlashCFI01 *pfl =3D PFLASH_CFI01(dev);
> +    uint64_t total_len;
> +    int ret;
> +
> +    if (pfl->sector_len =3D=3D 0) {
> +        error_setg(errp, "attribute \"sector-length\" not specified or z=
ero.");
> +        return;
> +    }
> +    if (pfl->nb_blocs =3D=3D 0) {
> +        error_setg(errp, "attribute \"num-blocks\" not specified or zero=
.");
> +        return;
> +    }
> +    if (pfl->name =3D=3D NULL) {
> +        error_setg(errp, "attribute \"name\" not specified.");
> +        return;
> +    }
> +
> +    total_len =3D pfl->sector_len * pfl->nb_blocs;
> +
> +    memory_region_init_rom_device(
> +        &pfl->mem, OBJECT(dev),
> +        &pflash_cfi01_ops,
> +        pfl,
> +        pfl->name, total_len, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    pfl->storage =3D memory_region_get_ram_ptr(&pfl->mem);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
> +
> +    if (pfl->blk) {
> +        uint64_t perm;
> +        pfl->ro =3D !blk_supports_write_perm(pfl->blk);
> +        perm =3D BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRIT=
E);
> +        ret =3D blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
> +        if (ret < 0) {
> +            return;
> +        }
> +    } else {
> +        pfl->ro =3D 0;
> +    }
> +
> +    if (pfl->blk) {
> +        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_l=
en,
> +                                         errp)) {
> +            vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * Default to devices being used at their maximum device width. This=
 was
> +     * assumed before the device_width support was added.
> +     */
> +    if (!pfl->max_device_width) {
> +        pfl->max_device_width =3D pfl->device_width;
> +    }
> +
> +    pfl->wcycle =3D 0;
> +    /*
> +     * The command 0x00 is not assigned by the CFI open standard,
> +     * but QEMU historically uses it for the READ_ARRAY command (0xff).
> +     */
> +    pfl->cmd =3D 0x00;
> +    pfl->status =3D 0x80; /* WSM ready */
> +    pflash_cfi01_fill_cfi_table(pfl);
> +}
> +
>  static void pflash_cfi01_system_reset(DeviceState *dev)
>  {
>      PFlashCFI01 *pfl =3D PFLASH_CFI01(dev);
> --=20
> 2.26.2

dme.
--=20
She's as sweet as Tupelo honey, she's an angel of the first degree.

