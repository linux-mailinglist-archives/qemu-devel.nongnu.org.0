Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4113345C2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:54:40 +0100 (CET)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK32d-0001r2-PV
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lK2fb-0006lT-N0; Wed, 10 Mar 2021 12:30:56 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lK2fZ-0006cH-Ob; Wed, 10 Mar 2021 12:30:51 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7FC392F07;
 Wed, 10 Mar 2021 12:30:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 12:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=DsllWM25Xi5GY+KTxy3+6Ttkln9HBIgcAKjb3qeeU
 cA=; b=oUJCJg5WZSGgWjpL03oX/hXlSnueK9U54UrOYGaTwd5rAlgVlED90HJFJ
 pI330v1C4cGAsQ4ErSIShQPxriSjSn9QAQ0IHDA6Coba7XYWeWLygUVq73wx02jj
 bq7GpebTCh7YdK479dHeoqUUnjopRaPFOo6Yx4OKcTO1Z6SrOMhScmdcvtjamgRZ
 NdpzN9wIfl2NXBky2GcfFFrXUq9Ch4f0dJ9pO1uASt2Ac6vcD+VcpW/U6GcZdUIT
 dDz4gGmZ+3gU/ekN/6bzgYNXUGAycpt/hAx1qHmgvXTZyKkMM9Rm0Ng5oCAO5GbA
 yBZn8a+TwUF6gWIcZQZ3vqzFBMQdA==
X-ME-Sender: <xms:QwJJYIuU59_Y0b1TH7yZ5PvdysekzTbOkGwSrFCCsf8n9tY8JXEXTw>
 <xme:QwJJYFc9KSf80rrUTBJF7l6O5pMJcLRlS3plMQRZwYjrJ7WPpHoIlhA5QVrYOMNhl
 M7IRfMKh66Fe8wHTDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtgfesthhqredttddtjeenucfhrhhomhepffgrvhhi
 ugcugfgumhhonhgushhonhcuoegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvg
 drtghomheqnecuggftrfgrthhtvghrnhepkeeivddtgfeutddtfffhiefhfeeftddtkeek
 tdeludehjefggefhudejleevudfhnecukfhppeekuddrudekjedrvdeirddvfeeknecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugdr
 vggumhhonhgushhonhesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:QwJJYDygP69y4UHauVwAesw6c_ToxU4KtbFEyFGBsK7J2TA8ZqZYfQ>
 <xmx:QwJJYLONQMwpevhNtY_p6koJrjXZ-TuY-R1sz7SOWobs2Ws0uWTqyg>
 <xmx:QwJJYI_rEg40sqBG_AIFlE8n_vYzKA5sVsPptwCMkeuWpN0PxL53Gw>
 <xmx:RAJJYCdUyXhN10Rglj-VMGNiUSClK40ExnrK5j0pVVyO36t6zzw9WA>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A09724005C;
 Wed, 10 Mar 2021 12:30:42 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 874c4f40;
 Wed, 10 Mar 2021 17:30:41 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 04/12] hw/block/pflash_cfi02: Set rom_mode to true in
 pflash_setup_mappings()
In-Reply-To: <20210310170528.1184868-5-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-5-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 17:30:40 +0000
Message-ID: <m27dmegblr.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=64.147.123.25;
 envelope-from=david.edmondson@oracle.com; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-10 at 18:05:20 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> There is only one call to pflash_setup_mappings(). Convert 'rom_mode'
> to boolean and set it to true directly within pflash_setup_mappings().
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
> v2: Convert to bool in pflash_register_memory (David)
> ---
>  hw/block/pflash_cfi02.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 845f50ed99b..0eb868ecd3d 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -108,7 +108,7 @@ struct PFlashCFI02 {
>      MemoryRegion mem;
>      MemoryRegion *mem_mappings;    /* array; one per mapping */
>      MemoryRegion orig_mem;
> -    int rom_mode;
> +    bool rom_mode;
>      int read_counter; /* used for lazy switch-back to rom mode */
>      int sectors_to_erase;
>      uint64_t erase_time_remaining;
> @@ -181,12 +181,13 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
>                                   "pflash-alias", &pfl->orig_mem, 0, size=
);
>          memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappi=
ngs[i]);
>      }
> +    pfl->rom_mode =3D true;
>  }
>=20=20
>  static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
>  {
>      memory_region_rom_device_set_romd(&pfl->orig_mem, rom_mode);
> -    pfl->rom_mode =3D rom_mode;
> +    pfl->rom_mode =3D !!rom_mode;
>  }
>=20=20
>  static size_t pflash_regions_count(PFlashCFI02 *pfl)
> @@ -927,7 +928,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->sector_erase_map =3D bitmap_new(pfl->total_sectors);
>=20=20
>      pflash_setup_mappings(pfl);
> -    pfl->rom_mode =3D 1;
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
>=20=20
>      timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
> --=20
> 2.26.2

dme.
--=20
Everyone I know, goes away in the end.

