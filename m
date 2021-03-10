Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC6333AE7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:01:13 +0100 (CET)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwaW-0006Vz-Gs
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwZE-0005cP-I7; Wed, 10 Mar 2021 05:59:52 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwZC-0001Pi-Fl; Wed, 10 Mar 2021 05:59:52 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 343E5175D;
 Wed, 10 Mar 2021 05:59:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 05:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TFvOPDX98zuuB2EBID+KObG/yN+Gii1QgJMF6G76V
 CY=; b=NV0zJ47ZjwcSmaA83wzeasZFdo9J8sIK4fRcp8XSsuNObJi5d2ZEu+Dxn
 LPDGri26Thq/h0POj4MjJydMnRM+iATU6IjvremZq1LAynvPjwWu16C9bEbNTTbk
 7aBes0C14ZLl8GdwMAIVN4V8v5rSBzxReFhhBVEeNi3yfXOZmPTE210fsrLP6f8U
 LZAdUPHsQaQ2H7TORnTddBO0tC6OmEz2P5hppvfOl8WCi1OJKI8sorMnVlkOOqE6
 DA1JbKccejBhnFwCoChTqe2/XQPk/ubNVBqRtkUQbOvwQfnTRRB7BjpAQGjfannb
 /qO8RVvBnoa64q2/MiyFnSGUz2jPg==
X-ME-Sender: <xms:oqZIYMm7NoWjkK9EGsGIrRYBG_EFPZhKXzVMj-Aqx377oK6s_4pjKQ>
 <xme:oqZIYL2mRpjGa2QApW_s_7tBuXsQ_onqkhMCFD-9seSpkGgLkHJtScFj8qa4B2Zbo
 Dv1PANe511Abn-7UrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpeekiedvtdfguedttdffhfeihfeffedttdekkedt
 leduheejgfeghfdujeelveduhfenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:oqZIYKokf-MTulmhm7nu6N3UJe6cWAynTB5oGaD-MEiPgeIeNTCb5g>
 <xmx:oqZIYInErpWJ7lzKF-u2P41Nh3ROcRFhi1r0ngnRetamPoiKMZLlHQ>
 <xmx:oqZIYK2IjPjAG8mpaaywaoS2CMXMIXMtAKV1WC4ieH-UjLQw9isloQ>
 <xmx:oqZIYAPBBHu8pueSLoIRcoBY0lzoiTj8fyZAywTuqEIW1-nsjdwFTQ>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5423D108005F;
 Wed, 10 Mar 2021 05:59:45 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id bdade7b0;
 Wed, 10 Mar 2021 10:59:42 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 6/9] hw/block/pflash_cfi02: Rename register_memory(true)
 as mode_read_array
In-Reply-To: <20210309235028.912078-7-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-7-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 10:59:42 +0000
Message-ID: <m2o8frff4x.fsf@oracle.com>
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

On Wednesday, 2021-03-10 at 00:50:25 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> The same pattern is used when setting the flash in READ_ARRAY mode:
> - Set the state machine command to READ_ARRAY
> - Reset the write_cycle counter
> - Reset the memory region in ROMD
>
> Refactor the current code by extracting this pattern.
> It is used three times:
>
> - When the timer expires and not in bypass mode
>
> - On a read access (on invalid command).
>
> - When the device is initialized. Here the ROMD mode is hidden
>   by the memory_region_init_rom_device() call.
>
> pflash_register_memory(rom_mode=3Dtrue) already sets the ROM device
> in "read array" mode (from I/O device to ROM one). Explicit that
> by renaming the function as pflash_mode_read_array(), adding
> a trace event and resetting wcycle.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

Okay, I see that pflash_register_memory() was going to lose its second
argument anyway, so perhaps no need to fix it in the previous patch.

> ---
>  hw/block/pflash_cfi02.c | 18 +++++++++---------
>  hw/block/trace-events   |  1 +
>  2 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 4efbae2f0c9..2ba77a0171b 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -184,10 +184,13 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
>      pfl->rom_mode =3D true;
>  }
>=20=20
> -static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
> +static void pflash_mode_read_array(PFlashCFI02 *pfl)
>  {
> -    memory_region_rom_device_set_romd(&pfl->orig_mem, rom_mode);
> -    pfl->rom_mode =3D rom_mode;
> +    trace_pflash_mode_read_array();
> +    pfl->cmd =3D 0x00;
> +    pfl->wcycle =3D 0;
> +    pfl->rom_mode =3D true;
> +    memory_region_rom_device_set_romd(&pfl->orig_mem, true);
>  }
>=20=20
>  static size_t pflash_regions_count(PFlashCFI02 *pfl)
> @@ -249,11 +252,10 @@ static void pflash_timer(void *opaque)
>      toggle_dq7(pfl);
>      if (pfl->bypass) {
>          pfl->wcycle =3D 2;
> +        pfl->cmd =3D 0;
>      } else {
> -        pflash_register_memory(pfl, 1);
> -        pfl->wcycle =3D 0;
> +        pflash_mode_read_array(pfl);
>      }
> -    pfl->cmd =3D 0;
>  }
>=20=20
>  /*
> @@ -315,7 +317,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offs=
et, unsigned int width)
>      /* Lazy reset to ROMD mode after a certain amount of read accesses */
>      if (!pfl->rom_mode && pfl->wcycle =3D=3D 0 &&
>          ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
> -        pflash_register_memory(pfl, 1);
> +        pflash_mode_read_array(pfl);
>      }
>      offset &=3D pfl->chip_len - 1;
>      boff =3D offset & 0xFF;
> @@ -933,8 +935,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Er=
ror **errp)
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
>=20=20
>      timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0;
>      pfl->status =3D 0;
>=20=20
>      pflash_cfi02_fill_cfi_table(pfl, nb_regions);
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index d32475c3989..f16d6e90cfd 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -7,6 +7,7 @@ fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0=
x%02x val 0x%02x"
>  # pflash_cfi01.c
>  # pflash_cfi02.c
>  pflash_reset(void) "reset"
> +pflash_mode_read_array(void) "mode: read array"
>  pflash_timer_expired(uint8_t cmd) "command 0x%02x done"
>  pflash_io_read(uint64_t offset, unsigned size, uint32_t value, uint8_t c=
md, uint8_t wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x cmd:0x%02x w=
cycle:%u"
>  pflash_io_write(uint64_t offset, unsigned size, uint32_t value, uint8_t =
wcycle) "offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
> --=20
> 2.26.2

dme.
--=20
Ah, oh your hair is beautiful.

