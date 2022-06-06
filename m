Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82753E42A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 13:11:29 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAdo-0001YO-QB
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 07:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nyAYQ-00072x-R6
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:05:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nyAYO-0004PZ-35
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:05:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654513547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FxQ6shirY2jBGrkmhz0peCZObUxEbPhVGp+FHAXv3jk=;
 b=OYneOpZ1lDqDSvLfogoAQIPW/pckQIelLeYxF3n0amlbSx+0hhwypbUM1VfGkYdEDfYzdV
 IE8eIPwgn4C9UsmibmTVGFTkgqXLKHCrIhkua60kALlG6yEtUarDgFgYfIXExLuDP6uwwe
 5lXK/s0AzPQFGn5GjH55twmT7DSNscU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-_EOjGxaxOvywcR3ggWCnwA-1; Mon, 06 Jun 2022 07:05:43 -0400
X-MC-Unique: _EOjGxaxOvywcR3ggWCnwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 893021C08965;
 Mon,  6 Jun 2022 11:05:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F1A1121314;
 Mon,  6 Jun 2022 11:05:42 +0000 (UTC)
Date: Mon, 6 Jun 2022 12:05:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] vduse-blk: Add name option
Message-ID: <Yp3fhbvlXqeJwA9L@stefanha-x1.localdomain>
References: <20220531095221.114-1-xieyongji@bytedance.com>
 <Ypdjr4UO+XrBbM09@stefanha-x1.localdomain>
 <CACycT3vR4rb+R5Z-SYMW1q1S1hhFZPPDJAVb82_5vnxgVr7WiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zEqZxxT3Uv1y5IPH"
Content-Disposition: inline
In-Reply-To: <CACycT3vR4rb+R5Z-SYMW1q1S1hhFZPPDJAVb82_5vnxgVr7WiA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--zEqZxxT3Uv1y5IPH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2022 at 09:10:58PM +0800, Yongji Xie wrote:
> On Wed, Jun 1, 2022 at 9:03 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >
> > On Tue, May 31, 2022 at 05:52:21PM +0800, Xie Yongji wrote:
> > > Currently we use 'id' option as the name of VDUSE device.
> > > It's a bit confusing since we use one value for two different
> > > purposes: the ID to identfy the export within QEMU (must be
> > > distinct from any other exports in the same QEMU process, but
> > > can overlap with names used by other processes), and the VDUSE
> > > name to uniquely identify it on the host (must be distinct from
> > > other VDUSE devices on the same host, but can overlap with other
> > > export types like NBD in the same process). To make it clear,
> > > this patch adds a separate 'name ' option to specify the VDUSE
> > > name for the vduse-blk export instead.
> > >
> > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > ---
> > >  block/export/vduse-blk.c             | 9 ++++++---
> > >  docs/tools/qemu-storage-daemon.rst   | 5 +++--
> > >  qapi/block-export.json               | 7 ++++---
> > >  storage-daemon/qemu-storage-daemon.c | 8 ++++----
> > >  4 files changed, 17 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> > > index 3b10349173..d96993bdf5 100644
> > > --- a/block/export/vduse-blk.c
> > > +++ b/block/export/vduse-blk.c
> > > @@ -245,7 +245,7 @@ static int vduse_blk_exp_create(BlockExport *exp,=
 BlockExportOptions *opts,
> > >      }
> > >      vblk_exp->num_queues =3D num_queues;
> > >      vblk_exp->handler.blk =3D exp->blk;
> > > -    vblk_exp->handler.serial =3D exp->id;
> > > +    vblk_exp->handler.serial =3D g_strdup(vblk_opts->name);
> >
> > Do we want to expose the VDUSE device name to the guest? Maybe the
> > serial string should be a separate parameter.
> >
>=20
> OK, it makes sense to me. But we might need a default value. Any suggesti=
ons?

hw/block/virtio-blk.c defaults to the empty string:

  const char *serial =3D s->conf.serial ? s->conf.serial : "";

I think it's reasonable to say that anyone who wants to use serial will
also want to set the value explicitly.

Stefan

--zEqZxxT3Uv1y5IPH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKd34UACgkQnKSrs4Gr
c8iCFQgAtGtrkN7L3aD4Z1hc6hVls6oXb9X1uGCrxaIV+12TjnL+fDoBLEbiifnN
bAMobrDRafyfNTKS8oBMEHg3ExL5cH7UJPpRweU87ymCpSibYSKp2B0KJSaisWfy
fnOZ+tWjGGFZ9QdtXBSEcYWEjfc33Sj3IHk9wEKbewYLcYyqzYr74RE4CIMQ9uBk
5cvRKUzQM7fmzDFN1jsl3hO1QZOtA4URbC9eMlLO7O029qAmMJXmFAWvvX1N4/8a
kOp7PKz6by70S1kVeH+jywlNrVHaSs8qt76byHBsD7vOvUuylb4wa9Phkj1RhbGl
YGUH5i6HUDZdgJcmpRulL6IucwULEQ==
=5/kN
-----END PGP SIGNATURE-----

--zEqZxxT3Uv1y5IPH--


