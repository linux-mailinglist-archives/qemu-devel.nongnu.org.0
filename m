Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB459E15F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 14:39:48 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQTC7-0003NH-OL
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 08:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQT9P-0007St-Qa
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 08:36:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQT9L-0004pe-7b
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 08:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661258214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ihtIj/OY/NzJkcYJbW8Vcgc83JldJw6Ieq3TynW7MPE=;
 b=VAsSx0BWVhx8fO+WTrCTFbKEvgYh8Etmdt20g2bb+4bBbEjZDpQ58YDGvgyxQ8pZf0vtra
 copaJ6g/aOEpupIoBBom2oS1mxD9pGh3p3GqQ/kajpd0zQjLDjaQJ/P+5FYZFpgl2Pkq8/
 S6b9bwSECfUQ6a6lj+YpLnfxLONwWB0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-XC-XyqPUNty2Rhf0QUpBWA-1; Tue, 23 Aug 2022 08:36:50 -0400
X-MC-Unique: XC-XyqPUNty2Rhf0QUpBWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FB293810790;
 Tue, 23 Aug 2022 12:36:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EF9E40CF8E7;
 Tue, 23 Aug 2022 12:36:49 +0000 (UTC)
Date: Tue, 23 Aug 2022 08:36:47 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 qemu block <qemu-block@nongnu.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v7 6/8] config: add check to block layer
Message-ID: <YwTJ3+UGNrBrK5KH@fedora>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-7-faithilikerun@gmail.com>
 <YwQlTFHqKqjurCgb@fedora>
 <CAAAx-8LMr3wCghUMPXSJkoOXffP8OvYa9CNNs7xtr2rUaR=heQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jyL+nlvfhrwDlwP9"
Content-Disposition: inline
In-Reply-To: <CAAAx-8LMr3wCghUMPXSJkoOXffP8OvYa9CNNs7xtr2rUaR=heQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--jyL+nlvfhrwDlwP9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 12:25:23PM +0800, Sam Li wrote:
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8823=
=E6=97=A5=E5=91=A8=E4=BA=8C 08:54=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Aug 16, 2022 at 02:25:20PM +0800, Sam Li wrote:
> > > Putting zoned/non-zoned BlockDrivers on top of each other is not
> > > allowed.
> > >
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  block.c                          | 14 ++++++++++++++
> > >  block/raw-format.c               |  1 +
> > >  include/block/block_int-common.h |  5 +++++
> > >  3 files changed, 20 insertions(+)
> > >
> > > diff --git a/block.c b/block.c
> > > index bc85f46eed..affe6c597e 100644
> > > --- a/block.c
> > > +++ b/block.c
> > > @@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_b=
s, BlockDriverState *child_bs,
> > >          return;
> > >      }
> > >
> > > +    /*
> > > +     * Non-zoned block drivers do not follow zoned storage constrain=
ts
> > > +     * (i.e. sequential writes to zones). Refuse mixing zoned and no=
n-zoned
> > > +     * drivers in a graph.
> > > +     */
> > > +    if (!parent_bs->drv->supports_zoned_children &&
> > > +        child_bs->bl.zoned !=3D BLK_Z_HM) {
> >
>=20
> Should be:
> +if (!parent_bs->drv->supports_zoned_children &&
> +        child_bs->bl.zoned =3D=3D BLK_Z_HM)
>=20
> > Is this logical expression correct:
> >
> >   If the parent does not support zoned children and the child is not
> >   zoned, fail with an error.
> >
> > ?
>=20
> No. It should be:
>=20
> If the parent does not support zoned children and the child is zoned,
> fail with an error.  It should handle the case where a filter node is
> inserted above a raw block driver with a zoned_host_device child.
>=20
> There are some QEMU command-line constraints for the zoned devices. I
> was wondering where to add such support so that it can print an error
> message for users:
> 1. cache.direct=3D setting

The O_DIRECT requirement is specific to file-posix and Linux's zoned
block device implementation, so it belongs in file-posix.c's
zoned_host_device .bdrv_file_open() function.

> 2. mix zoned/non-zoned drivers

This is generic and I think bdrv_add_child() is the right place for
parent-child compatibility checks.

--jyL+nlvfhrwDlwP9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMEyd8ACgkQnKSrs4Gr
c8gx+Qf+KuORgk4oBw+cYI09m887TH5osxQltFd5IyS98EGrenhVsAolPo3BFbeq
9L7PTY3nuilGmg9KnJeEjty9kDfnhUTUBXGYF7istg/UEAhgQE5PPgsc0Q7lZc8V
ICAp057lNYiYzQfN/ZryQna4iaU2CfnXA1tQkhudX5PJnPJoDCCbRxbe2T4J16y2
yfzF60QQAiI+Pmhntumkzqqn6UWnE3YkRkSyG8iZN3xujhx1ZEUVZ44q8dkW3zAr
M+rWzP2QcymGyVyF46T7k5EGTQOUUp4PJX+gRQATUaqzn0A+uo4TqrdHibgn18kI
ksl6/HEZqtGDVoNgPhYE4tC/XYdy6A==
=3cxr
-----END PGP SIGNATURE-----

--jyL+nlvfhrwDlwP9--


