Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B002333AEA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:03:19 +0100 (CET)
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwcY-0008HN-KH
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwbC-0007Dz-QX; Wed, 10 Mar 2021 06:01:54 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:55041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJwb7-0002dL-2i; Wed, 10 Mar 2021 06:01:54 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B33A61733;
 Wed, 10 Mar 2021 06:01:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 06:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=lBDU4ntHHsdJrXXxO3axzRNUPeRqrGhoo/0rwHYPr
 Mc=; b=GNoOIp/IjoTy4NRjcvEsOqLyuGiPlakj9uRTOAb0zdp/srbJwcBAqVRru
 WtSPDs97Iozq3pK+cUNJXhJouS6ASsVoDcSoBMEXpoA4645k5J2eM/6AT8k4KoiQ
 jKgoyyQEMpZi0HwY08Uq2BOKZ1hbIGiOemELpF7bQ/zjwGJOrE4cVSfklbTutfSR
 KQ2lHWeoTnEWC/9jGFC8F+NbssnWdvx+F4mI0gLIwMFNC38WKAR47xnN6j4lw87Y
 K7WRhEuxdPTi4msJefeB41oKUOJFrrZpN6m3MFCfec2VLC1ods0Rf5dPmqvpnIXF
 6LzuggmfUrqh82Z7DGX/lPQc3zZrw==
X-ME-Sender: <xms:GqdIYKE7XjyyyBQJRDWSX-J_ZFQwy5lYR0nOXOe3L9OYD7N7YNX8ng>
 <xme:GqdIYLUlFDwvwJIFhnFxSUFXFsdWU-i8SdzeAqK87gM8QQKlwNTQFeJlRL4W3T6os
 vQzSJ5fpQ8XCKrS27I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrd
 gtohhmqeenucggtffrrghtthgvrhhnpeekiedvtdfguedttdffhfeihfeffedttdekkedt
 leduheejgfeghfdujeelveduhfenucfkphepkedurddukeejrddviedrvdefkeenucevlh
 hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgurdgv
 ughmohhnughsohhnsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:GqdIYEIEsV7tONEGXgqshwul93eObVF6lsmqd9zriQ5txIITrHFPpQ>
 <xmx:GqdIYEGI7cgg2GhS6JCApbQAKN5k7zmSHAWDqSYEy2MUofAN2ylhkg>
 <xmx:GqdIYAUuvSteqw3CMrg8vKX4xpX0aqa_K_ZRQNg6ttZ_H5VFB7-14w>
 <xmx:GqdIYBt4IC1rCvM0ZTiQXesEA0GJIJ46TMekTcOk4-z0tnJ6hRnpWQ>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 493B71080066;
 Wed, 10 Mar 2021 06:01:45 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id e4058847;
 Wed, 10 Mar 2021 11:01:44 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 8/9] hw/block/pflash_cfi01: Clarify trace events
In-Reply-To: <20210309235028.912078-9-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-9-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 11:01:44 +0000
Message-ID: <m2im5zff1j.fsf@oracle.com>
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

On Wednesday, 2021-03-10 at 00:50:27 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> Use the 'mode_read_array' event when we set the device in such
> mode, and use the 'reset' event in DeviceReset handler.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi01.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 03472ea5b64..2618e00926d 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -663,7 +663,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>                    "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
>=20=20
>   mode_read_array:
> -    trace_pflash_reset();
> +    trace_pflash_mode_read_array();
>      memory_region_rom_device_set_romd(&pfl->mem, true);
>      pfl->wcycle =3D 0;
>      pfl->cmd =3D 0x00; /* This model reset value for READ_ARRAY (not CFI=
) */
> @@ -886,6 +886,7 @@ static void pflash_cfi01_system_reset(DeviceState *de=
v)
>  {
>      PFlashCFI01 *pfl =3D PFLASH_CFI01(dev);
>=20=20
> +    trace_pflash_reset();
>      /*
>       * The command 0x00 is not assigned by the CFI open standard,
>       * but QEMU historically uses it for the READ_ARRAY command (0xff).
> --=20
> 2.26.2

dme.
--=20
At least they're not lonely.

