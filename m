Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0042549A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:47:21 +0200 (CEST)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTk0-0005bM-RP
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTc5-0003Ry-Qp
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTc3-0006hu-N2
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633613947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BnRwnIoVvQv5J+xq7AS3hnEx1utUdfYx18Ahb6c+pWo=;
 b=a0cXYg0WTeku/Jq9VYs2hQypb95dw0woWNmqLYzjjR/Po9yuDgYeNJ6HYVfH1O/fBFuLlV
 avZERSntenX0uuSGgbyKUCsulDPeXilusCIXzPC+TouLwjPCkkasngP6rJuIEbF7O5y1fU
 wviE9yWE4nKYssRUJtxsF8wdsH3auLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-svnanvsfPVqYFTMBip77Ig-1; Thu, 07 Oct 2021 09:39:05 -0400
X-MC-Unique: svnanvsfPVqYFTMBip77Ig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52AA312BFB9;
 Thu,  7 Oct 2021 13:38:40 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC06110013D7;
 Thu,  7 Oct 2021 13:38:39 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:38:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 06/25] include/block/block_int: split header into
 I/O and global state API
Message-ID: <YV74XrPPIA4cts8V@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-7-eesposit@redhat.com>
 <YV7Ri5adGVrl0pPQ@stefanha-x1.localdomain>
 <70405d0c-3f1f-ccfe-a233-fdda9d4b213e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <70405d0c-3f1f-ccfe-a233-fdda9d4b213e@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8menEcVH6rdz6anc"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8menEcVH6rdz6anc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 07, 2021 at 01:30:42PM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> On 07/10/2021 12:52, Stefan Hajnoczi wrote:
> > On Tue, Oct 05, 2021 at 10:31:56AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> > > +int coroutine_fn bdrv_co_copy_range_from(BdrvChild *src, int64_t src=
_offset,
> > > +                                         BdrvChild *dst, int64_t dst=
_offset,
> > > +                                         int64_t bytes,
> > > +                                         BdrvRequestFlags read_flags=
,
> > > +                                         BdrvRequestFlags write_flag=
s);
> > > +int coroutine_fn bdrv_co_copy_range_to(BdrvChild *src, int64_t src_o=
ffset,
> > > +                                       BdrvChild *dst, int64_t dst_o=
ffset,
> > > +                                       int64_t bytes,
> > > +                                       BdrvRequestFlags read_flags,
> > > +                                       BdrvRequestFlags write_flags)=
;
> >=20
> > These look like I/O APIs to me. Are they in the GS API because only
> > qemu-img.c call copy_range? I thought SCSI emulation might call it too,
> > but grep says otherwise.
>=20
> SCSI (iscsi.c) implements the function pointer
> (*bdrv_co_copy_range_from/to), but does not call the function itself.
> However, later in the patches I put the function pointer as I/O.

I meant the SCSI target emulation in hw/scsi/ where the SCSI commands
that require copy_range could be handled.

> These two functions are only tested by test-replication and thus are alwa=
ys
> under BQL when tested. But after looking at them again, and since they
> internally use only I/O APIs, I think we can move them to the I/O API.

Okay, great.

Stefan

--8menEcVH6rdz6anc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe+F4ACgkQnKSrs4Gr
c8hWfgf+ILEDf6v0ZwDrlvtiQRhoZTR/mGddYRL9jN+oktfWvfuQecxmFxSjjVdK
V/OdWXDFh+M/4VIgMAPGUuQbu4Sz8tEaVNRCqAR84zs5YvaUIp/WNszp/epmD0B9
EkgOAqiYHZG3wsCFomQLSjMYrIHoOfVTPizHNBIWTcWaiUKp1ujtIXPhxu4ZNkSi
49Vqun3kQF9O4eN87ImvCRNS0fYdVIcuTjgIaaDDR5LXCouuriMXW/wndBSAeo8a
oug3rMyw65N1nu18AXy3tTWD3WoAyKuhQx+28H1B5WLxwZ/vPP4+JkFQsJJY+y8h
tIc8ZzYBc6bUCZvzNgdkio9M5pWhSw==
=+8O2
-----END PGP SIGNATURE-----

--8menEcVH6rdz6anc--


