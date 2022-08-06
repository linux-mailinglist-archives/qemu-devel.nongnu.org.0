Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B918958C9DD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:56:19 +0200 (CEST)
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3Ew-00025Y-Tw
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL3BY-00053D-Ob
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL3BV-00035C-St
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659966764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1yBr8zTnRVqlzM04bynxW4HvOAdaJUjO1oS6O6O7MUM=;
 b=cLvWa/9I/gCmUNOnpAZ+lY3J36dUGIuo6jE51qnSOxbdeq6+Pu/2vA6H8ct+YlHSTVGbke
 O3+jNJ5bBMs8EdevANp2yxEr2npcfpDOzDnLAMQQ5spMTats0YBR2a0vj1moiGxOweFNNs
 uBKJaedJLFv7hFORLvijw+ZAJkXfEhU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-jmSDTsMUO9qk9V9_68MOrQ-1; Mon, 08 Aug 2022 09:52:41 -0400
X-MC-Unique: jmSDTsMUO9qk9V9_68MOrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCB1C1C05137;
 Mon,  8 Aug 2022 13:52:40 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A60C18ECC;
 Mon,  8 Aug 2022 13:52:40 +0000 (UTC)
Date: Sat, 6 Aug 2022 08:23:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, hare@suse.de,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v6 6/8] config: add check to block layer
Message-ID: <Yu5dOK5UZZzuUeVt@fedora>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
 <20220805075751.77499-7-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i6amJz6Sfy6YYklT"
Content-Disposition: inline
In-Reply-To: <20220805075751.77499-7-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--i6amJz6Sfy6YYklT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 03:57:49PM +0800, Sam Li wrote:
> Putting zoned/non-zoned BlockDrivers on top of each other is not
> allowed.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block.c                          | 13 +++++++++++++
>  block/file-posix.c               |  1 +
>  block/raw-format.c               |  1 +
>  include/block/block_int-common.h | 10 ++++++++++
>  4 files changed, 25 insertions(+)
>=20
> diff --git a/block.c b/block.c
> index bc85f46eed..8a259b158c 100644
> --- a/block.c
> +++ b/block.c
> @@ -7947,6 +7947,19 @@ void bdrv_add_child(BlockDriverState *parent_bs, B=
lockDriverState *child_bs,
>          return;
>      }
> =20
> +    /*
> +     * Non-zoned block drivers do not follow zoned storage constraints
> +     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zo=
ned
> +     * drivers in a graph.
> +     */
> +    if (!parent_bs->drv->supports_zoned_children && child_bs->drv->is_zo=
ned) {
> +        error_setg(errp, "Cannot add a %s child to a %s parent",
> +                   child_bs->drv->is_zoned ? "zoned" : "non-zoned",
> +                   parent_bs->drv->supports_zoned_children ?
> +                   "support zoned children" : "not support zoned childre=
n");
> +        return;
> +    }

This doesn't handle the case where a filter node (like I/O throttling)
is inserted above a raw block driver with a zoned_host_device child.

Can we replace child_bs->drv->is_zoned with child_bs->bl.zoned =3D=3D
BLK_Z_HM? I think the is_zoned field is unnecessary.

That way the block/raw-format.c .bdrv_refresh_limits() function can
propagate its child's zone block limits (including the zone model) and
this check will work correctly.

Stefan

--i6amJz6Sfy6YYklT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLuXTgACgkQnKSrs4Gr
c8g4SQf8Cj4MxZZUsU+srKJRd9Qa4nqDJ7syJ2Gj4hZFpK8o1suHeC9rnzL6Craw
z5D2GfT2bpvVWden/WeQb9kYHrf28Wq5NTTulIWfgGz8VORftL4shOEafu4YDhIv
kCEpMbBg8rXiF+U8cc6E3owRczNmOKhn7djSiz+GwXOLPO9DVM3e+x5UMWlLxSzL
WUMOTibXxz2qRFWbfzAuXBB1nnel1MwbOpXcmPrm6ckFA6CJZ6UPxfA5lGuq0fr1
r3qoqZojWFLftOTCjkZqJXsAF6hTy13raJ+Y5/xulAE7Gw8saY7gNXl5Jih82Tmm
MIaH3psvB6Ormlh0ktfXIaQ41dNwvQ==
=a3FL
-----END PGP SIGNATURE-----

--i6amJz6Sfy6YYklT--


