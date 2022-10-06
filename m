Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB975F645D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 12:31:47 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogOAL-0007cq-Nj
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 06:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogNE6-0008FH-8s
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 05:31:35 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:40817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogNE0-0006Bg-Aw
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 05:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=20Vd+Je+1nDL48M/1hSPdnbb1Wx1ZLbELpzZA8EfiKc=; b=DHhNLaBNRCn8/nCPdAVrjmSbiP
 E10i6Eo0MMsxLsnX3QGDglqH89AyGuNKGfQVSBw2fgxGbRNFbqFmfYXJPg6MpupnB/hAIQ09AEsUT
 Z2FmbOUO68ZRGN/BOoa51JnG0sFjbWyEMVkJ7wCLVQBFM7uWvzYSKbiidJVuJM9QpSm965+fc+scg
 AUt+9cE7c7qFdFDNpJadOgl0k/zWS+9xU+X/4hbbH2tIMHNtgXazOfo0nDCTK++tfYSLrx81WcP+U
 Sh5POSHaSSQ5W6mXHfbJge61luGM5f7fZpwvugDB6J02mcg9KynBCOwG22ormhhbmjn3ZvppV7KCe
 M0m8H3XSt1kT4B5hmRKnCOdEtstglaFSdri8hQH97mEvHw04XPcfvNXLF9VStYkbw+jK49bSLsuaW
 6FasjPvPnpydrAuLxOPBT88Omn0Fm8BO32wY7e/LMfNRsQzlOcRfUmrhLXMmAVjj5ayuw/0MYbvGG
 iG+JdaH2au6ChKlIcvY3FvdSBLdx8O6JiopTRvnvpI8RLFmn6aNShDVAloy348crtVz7/3alGnkUJ
 QTXvHTt0YsPlWdvMRjHF5Ryil+QWXL14RXqgnqlL3pmScK3SPVGKRhTiVsjWcA21T3DMI26nY6l18
 kYhgxKLZbftmDqpE2SYPjnnhmO91fO127HwIiON8Y=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: jb-gnumlists@wisemo.com, thuth@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH v2] build-sys: error when slirp is not found and not
 disabled
Date: Thu, 06 Oct 2022 11:31:17 +0200
Message-ID: <2012415.IhVtOWKhAM@silver>
In-Reply-To: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
References: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Donnerstag, 6. Oktober 2022 10:33:22 CEST marcandre.lureau@redhat.com=20
wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> This is an alternative configure-time solution to "[PATCH] net:
> print a more actionable error when slirp is not found".
>=20
> See also "If your networking is failing after updating to the latest git
> version of QEMU..." ML thread.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meson.build b/meson.build
> index 4321b8f8da..b05080b051 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -690,6 +690,13 @@ if not get_option('slirp').auto() or have_system
>    endif
>  endif
>=20
> +# Remove this error after QEMU 8.1 has been released.
> +if not get_option('slirp').disabled() and not slirp.found()
> +  error('libslirp is not explicitely disabled and was not found. ' +

"explicitly", except of that:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> +        'Since qemu 7.2, libslirp is no longer included as a submodule '=
 +
> +        'fallback, you must install it on your system or --disable-slirp=
=2E')
> +endif
> +
>  vde =3D not_found
>  if not get_option('vde').auto() or have_system or have_tools
>    vde =3D cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],




