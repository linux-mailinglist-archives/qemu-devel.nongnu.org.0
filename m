Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4212333AE9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:03:03 +0100 (CET)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwcI-0007sx-VJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwan-0006xj-8M; Wed, 10 Mar 2021 06:01:29 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwah-0002Qj-Pj; Wed, 10 Mar 2021 06:01:28 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 13C6F5C4;
 Wed, 10 Mar 2021 06:01:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 06:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=5gvmH0L9vL5I8RHByJZ8jZOIQ2LwPZFpULr0ZEME3
 44=; b=ZRFpsv/k0tpsYhLoxaba2riNbr+lZZueqAB5/2EsET1JxBygDwwOwVmMs
 RaEDMSCDLEnrtlm/m5M/SjawLPZb7WypnibhM3N11wFbaj/txjggM99Rqe7hAhAI
 LZBrtpizsDaeSQ/HinX7LLEruW+zqLIycsxtpakCavbLUoo7D9hBxRWpDFmiZt0g
 nT9XCg4auoIvYXFywOtKi7IVDFAnbnEYyqNjZJDuDdsjsvL6rCYqtYz7oNty/VIl
 JiBX7E/RMcNLnk3Ig6QEwn5viagwUaf9YQccPQQyW8bUAPTtUBO5cMBFPldmWYop
 KCewukJcO2nLC+DgQm+k5FtZgg+xw==
X-ME-Sender: <xms:_6ZIYOg-GC_LJm5BYTm4_0-C_VoKZ0C3oRZmbpDOwsLHAEbRVAxuNg>
 <xme:_6ZIYPBUrUsXpGSKWG4xUmh0kLq1oLAztTEFwZlwoASqtkZskWdIskOPG3XpIKykF
 Xm33ss-rAiednR_t2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpeekiedvtdfguedttdffhfeihfeffedttdekkedt
 leduheejgfeghfdujeelveduhfenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:_6ZIYGEivVfzIXdWFsavLbjdJgaaYnjlWXIW_SX4mlPQ6p-sRfYUPw>
 <xmx:_6ZIYHQ1ulz8cPdo17EVIavHrw7w-OLyKIfSkhn94XCZ8JbwBcpPJQ>
 <xmx:_6ZIYLy-guJmJclfWb2JwyRUJxnzJqyVsQ1WocA6fz3jLMOHMk92QQ>
 <xmx:AKdIYOpaHlr1ZhSnG8Of-tnw5MAY8T9o42Sy1q2Xsr5Seee3v9FmgQ>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B023240057;
 Wed, 10 Mar 2021 06:01:19 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 5ca0da1a;
 Wed, 10 Mar 2021 11:01:18 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 7/9] hw/block/pflash_cfi02: Factor out DeviceReset method
In-Reply-To: <20210309235028.912078-8-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-8-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 11:01:18 +0000
Message-ID: <m2lfavff29.fsf@oracle.com>
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

On Wednesday, 2021-03-10 at 00:50:26 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> There is multiple places doing a device reset. Factor that
> out in a common method which matches the DeviceReset prototype,
> so we can also remove the reset code from the DeviceRealize()
> handler. Explicit the device is set in "read array" mode on
> reset.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi02.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 2ba77a0171b..484b056b898 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -193,6 +193,14 @@ static void pflash_mode_read_array(PFlashCFI02 *pfl)
>      memory_region_rom_device_set_romd(&pfl->orig_mem, true);
>  }
>=20=20
> +static void pflash_cfi02_reset(DeviceState *dev)
> +{
> +    PFlashCFI02 *pfl =3D PFLASH_CFI02(dev);
> +
> +    trace_pflash_reset();
> +    pflash_mode_read_array(pfl);
> +}
> +
>  static size_t pflash_regions_count(PFlashCFI02 *pfl)
>  {
>      return pfl->cfi_table[0x2c];
> @@ -330,8 +338,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offs=
et, unsigned int width)
>      default:
>          /* This should never happen : reset state & treat it as a read*/
>          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
> -        pfl->wcycle =3D 0;
> -        pfl->cmd =3D 0;
> +        pflash_cfi02_reset(DEVICE(pfl));
>          /* fall through to the read code */
>      case 0x80: /* Erase (unlock) */
>          /* We accept reads during second unlock sequence... */
> @@ -710,10 +717,8 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>=20=20
>      /* Reset flash */
>   reset_flash:
> -    trace_pflash_reset();
>      pfl->bypass =3D 0;
> -    pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0;
> +    pflash_cfi02_reset(DEVICE(pfl));
>      return;
>=20=20
>   do_bypass:
> @@ -977,6 +982,7 @@ static void pflash_cfi02_class_init(ObjectClass *klas=
s, void *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>=20=20
>      dc->realize =3D pflash_cfi02_realize;
> +    dc->reset =3D pflash_cfi02_reset;
>      dc->unrealize =3D pflash_cfi02_unrealize;
>      device_class_set_props(dc, pflash_cfi02_properties);
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> --=20
> 2.26.2

dme.
--=20
The band is just fantastic, that is really what I think.

