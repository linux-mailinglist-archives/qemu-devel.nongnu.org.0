Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2543345FF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:58:56 +0100 (CET)
Received: from localhost ([::1]:36056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK36l-0006s1-W8
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lK2gm-0007HE-I9; Wed, 10 Mar 2021 12:32:04 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lK2gk-0006pU-Pn; Wed, 10 Mar 2021 12:32:04 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D9F8D2BED;
 Wed, 10 Mar 2021 12:31:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 10 Mar 2021 12:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=au7Ta6bzKPD7+xwB3OlDBgCBrThZudorngh2osyCX
 g8=; b=U8Z/jDfErQPMY692qdnjzhiB9Z9Sni3WOlQ9vOLr1jMRzpMHeZlBaigfM
 5WwSufONR7domtXJoh3g00QSUZOu6xdeLlswfAYzZYjgP8dk7XHEddt2lU4bWeo3
 nENJeUEAXgqAQwfi6vQWMnWoi3hU37xxgIjy/t/dOyFXqEOJUqGB3Rvniy01SXXv
 3jxMadLCAsPRzazE3ceCa9m07dLaH37nA0WVAmkNt3TXsR4U4MIVCBigSlGQkNnp
 C6Mec38HwVpvxs/Nx+fkPtpfhJx11ShmJNb5kCLXahXSOAQo+iTKy9Ja4nCGeA7V
 KlYW+AIJXf4CbTpKxqM6VatGJjS/w==
X-ME-Sender: <xms:jwJJYH-JN_49iGMk9_Mr8cpX3Gpl89ldvZe7ANNVwjKLEJmrJxtiXQ>
 <xme:jwJJYDvBN07aC4_NUPy4ehpAWVTS98BtWGtTNcWO0RYcAIB6XFDYmBylAaDWYp6YG
 ttjfR1j0uwcPufr08k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtgfesthhqredttddtjeenucfhrhhomhepffgrvhhi
 ugcugfgumhhonhgushhonhcuoegurghvihgurdgvughmohhnughsohhnsehorhgrtghlvg
 drtghomheqnecuggftrfgrthhtvghrnhepkeeivddtgfeutddtfffhiefhfeeftddtkeek
 tdeludehjefggefhudejleevudfhnecukfhppeekuddrudekjedrvdeirddvfeeknecuve
 hluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugdr
 vggumhhonhgushhonhesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:jwJJYFCgHKmviPPQojUkG6CuESOnVRBGCkqUmIPef6Cc2maE8cuLWA>
 <xmx:jwJJYDeO2yf4EWbcNewvqEYvgxC2p0jl5nWjGD6bD0YywwqbHVh2pw>
 <xmx:jwJJYMO7OEOqccMJvGqrJ7Hvh7dWtK0eTduoBJrAgUhYUfgxrRGE7A>
 <xmx:jwJJYImeMHBTGSckj4q0sfAJypj8vphR9SMo6FJopa2nZpXjImtOGQ>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6CEE71080054;
 Wed, 10 Mar 2021 12:31:58 -0500 (EST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 184cebb9;
 Wed, 10 Mar 2021 17:31:57 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 08/12] hw/block/pflash_cfi02: Add DeviceReset method
In-Reply-To: <20210310170528.1184868-9-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-9-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 10 Mar 2021 17:31:57 +0000
Message-ID: <m2y2euewz6.fsf@oracle.com>
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-10 at 18:05:24 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/block/pflash_cfi02.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index aea47a99c61..c40febd2a41 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -942,6 +942,13 @@ static void pflash_cfi02_realize(DeviceState *dev, E=
rror **errp)
>      pflash_cfi02_fill_cfi_table(pfl, nb_regions);
>  }
>=20=20
> +static void pflash_cfi02_reset(DeviceState *dev)
> +{
> +    PFlashCFI02 *pfl =3D PFLASH_CFI02(dev);
> +
> +    pflash_reset_state_machine(pfl);
> +}
> +
>  static Property pflash_cfi02_properties[] =3D {
>      DEFINE_PROP_DRIVE("drive", PFlashCFI02, blk),
>      DEFINE_PROP_UINT32("num-blocks", PFlashCFI02, uniform_nb_blocs, 0),
> @@ -979,6 +986,7 @@ static void pflash_cfi02_class_init(ObjectClass *klas=
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
Stop the music and go home.

