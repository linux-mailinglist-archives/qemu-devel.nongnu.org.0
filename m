Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E5333AE2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:59:47 +0100 (CET)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwZ8-0004sM-K4
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>)
 id 1lJwXy-0003tG-0k; Wed, 10 Mar 2021 05:58:34 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:39975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>)
 id 1lJwXu-0000cO-C9; Wed, 10 Mar 2021 05:58:33 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F13AD1740;
 Wed, 10 Mar 2021 05:58:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 05:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=PNPkoOVJkRlgNDLz4OYprqd8fT7fbF22R4LkPE2zv
 iY=; b=SRKwhPc3MKKv2qf9Q6lB9iq0+pdYyaSmIi5eUkkOxMmL5vbIcSO6qvHoF
 WPirOCThToCayW+HaUH3/rE5FQ2pRxPappRLz9FA0/AKp8yDG7c7ZTszXI0ezVro
 aUGrhMkXyLV1dxDd4Vgcjai3JAdU9AgPcAabSgiku4cl/LZRRLDyLM9r8zIPvPl7
 a0JlwDzeqK8KQsTTDDWirpaMA25Tdyw/ugJ2xbU985vgWdPcskpNZ2KczdX7HyFP
 q/2SuRBqQbGti97JAAdj56wOx2SJmY0M//8FuwC1rIy/fbzOGEUzB6uRe0CeiCl0
 cMu+Y5uyDkIy3EBYQtZmRRlTdtlnw==
X-ME-Sender: <xms:UqZIYCS3-o59Ok-EIcxWmQfpLj6z2Axv6EltePtvdq9P_IXKCMGExA>
 <xme:UqZIYHxucHav3mxiYz2NB9KtnDzDeTKAcMEx1lgRcZM0FRBJ-u0Mwwp61LAlAgKYH
 tbCKWzF-LWLeDzPETA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnh
 epteevgeeuvedvjefhkefffeffveekvdekffehueeludfgteefheeljeetuddvkefhnecu
 kfhppeekuddrudekjedrvdeirddvfeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepughmvgesughmvgdrohhrgh
X-ME-Proxy: <xmx:UqZIYP3K0sqZeWBppj6ltwxIkAeEUPYTtezILhvNsf9V1ZAzLKSeJw>
 <xmx:UqZIYOAnP4qjMx2lewP1aLtCuOC04RWsti5K-t6KDxFIeeCy_dTJTQ>
 <xmx:UqZIYLj-etlvPx5PeZ0Ic5f7DwnqoIJH_m4BVTmQXuwcDoYYO0B4Ig>
 <xmx:U6ZIYGUt1GordseRXMi8qymDQumwsFDXxouA5xrFZz5T-dPGgfsZ8A>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0336B24005A;
 Wed, 10 Mar 2021 05:58:25 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 06823673;
 Wed, 10 Mar 2021 10:58:25 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 4/9] hw/block/pflash_cfi02: Set rom_mode to true in
 pflash_setup_mappings()
In-Reply-To: <20210309235028.912078-5-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-5-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 10 Mar 2021 10:58:24 +0000
Message-ID: <m2r1knff73.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=64.147.123.20; envelope-from=dme@dme.org;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

On Wednesday, 2021-03-10 at 00:50:23 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> There is only one call to pflash_setup_mappings(). Convert 'rom_mode'
> to boolean and set it to true directly within pflash_setup_mappings().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 845f50ed99b..5f949b4c792 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -108,7 +108,7 @@ struct PFlashCFI02 {
>      MemoryRegion mem;
>      MemoryRegion *mem_mappings;    /* array; one per mapping */
>      MemoryRegion orig_mem;
> -    int rom_mode;
> +    bool rom_mode;

Given this, doesn't the second argument to pflash_register_memory() need
to change to bool, affecting its callers?

>      int read_counter; /* used for lazy switch-back to rom mode */
>      int sectors_to_erase;
>      uint64_t erase_time_remaining;
> @@ -181,6 +181,7 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
>                                   "pflash-alias", &pfl->orig_mem, 0, size=
);
>          memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappi=
ngs[i]);
>      }
> +    pfl->rom_mode =3D true;
>  }
>=20=20
>  static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
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
And you can't hold me down, 'cause I belong to the hurricane.

