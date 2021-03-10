Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EC4334541
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:38:02 +0100 (CET)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2mX-0002DE-VM
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:38:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lK2fs-0006xI-CH; Wed, 10 Mar 2021 12:31:11 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:42049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lK2fq-0006dM-LW; Wed, 10 Mar 2021 12:31:08 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E41EE1611;
 Wed, 10 Mar 2021 12:31:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 12:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=SSgcrOAHH1vvMhYe1D4AeLLU+MO/F8SAcEvVwwnnz
 DQ=; b=TpOIHbm8SAWkgxU/u2awUA680lbhkzPORWMN+kZMUpBZ2oftlj2u/Jgab
 K9W6AXP1XFxyMflTO1kLbM3PYV/zSLVcwgspRqr5vJqZ+Qxvu1CA/dwSSr5pBP3h
 LbG6ppajjIdTratLzlzShOtpMGUqc9R+T8EOtVn+JG2r3K8/d24R4brblOmewTUh
 NMpur0+Cd6JXdVYhwFc7/sR+OAU+6rNTXJSv07mNJ/zz3HaI7dyXwL+XEFFClsQF
 Ei466moJVRTLa4jtkjyxTNvqJQ0osKHD2uTxVeYTN07KJKgQnDLmZtN0Xk3bz9NN
 afRvgQ9IMphLz3V+YJlo7n/W6LQuQ==
X-ME-Sender: <xms:VwJJYJDwz5_cYiLc8if61lRN7xJIjTuvHYFZ7f-X8MwRH-qRHdZg6w>
 <xme:VwJJYHjpYMpu-6i40QEaLzjjkLLecMqbuAsKfpdYfdcoSK2SWz-dcppyy4olv30U-
 U8eDUWaUhIC6n3Yn4k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtgfesthhqredttddtjeenucfhrhhomhepffgrvhhi
 ugcugfgumhhonhgushhonhcuoegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvg
 drtghomheqnecuggftrfgrthhtvghrnhepkeeivddtgfeutddtfffhiefhfeeftddtkeek
 tdeludehjefggefhudejleevudfhnecukfhppeekuddrudekjedrvdeirddvfeeknecuve
 hluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugdr
 vggumhhonhgushhonhesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:VwJJYEmQBX-e_xod-9fBRBNtqbVASzPpY5_Bv9fpuJD3ANOUSMDG3w>
 <xmx:VwJJYDxxL6sqp5HJE8lZQS6VCfokbQV_OQytbrMD0pEm1ugKhd1azg>
 <xmx:VwJJYOTigiof2aOyo9vnc2Sb3t61bdyW5nbqtijwUAwz4Fk9slvbJA>
 <xmx:VwJJYIA_GacQkcdLCxCvVc72P78jnyeX9E3bLR-oxgJKkpGybIyOtw>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54D781080054;
 Wed, 10 Mar 2021 12:31:02 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id fc2da8b7;
 Wed, 10 Mar 2021 17:31:01 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 05/12] hw/block/pflash_cfi02: Open-code
 pflash_register_memory(rom=false)
In-Reply-To: <20210310170528.1184868-6-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-6-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 17:31:01 +0000
Message-ID: <m24khigbl6.fsf@oracle.com>
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

On Wednesday, 2021-03-10 at 18:05:21 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> There is only one call to pflash_register_memory() with
> rom_mode =3D=3D false. As we want to modify pflash_register_memory()
> in the next patch, open-code this trivial function in place for
> the 'rom_mode =3D=3D false' case.
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi02.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 0eb868ecd3d..897b7333222 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -467,8 +467,10 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>      switch (pfl->wcycle) {
>      case 0:
>          /* Set the device in I/O access mode if required */
> -        if (pfl->rom_mode)
> -            pflash_register_memory(pfl, 0);
> +        if (pfl->rom_mode) {
> +            pfl->rom_mode =3D false;
> +            memory_region_rom_device_set_romd(&pfl->orig_mem, false);
> +        }
>          pfl->read_counter =3D 0;
>          /* We're in read mode */
>      check_unlock0:
> --=20
> 2.26.2

dme.
--=20
And you're standing here beside me, I love the passing of time.

