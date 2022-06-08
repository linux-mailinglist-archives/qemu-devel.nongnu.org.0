Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37756543135
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 15:19:43 +0200 (CEST)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyvb3-0003fT-P3
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 09:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nyv9x-00045b-2O
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nyv9l-0000PC-0h
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654692628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O9K296j1AQJUvWv4X2E5lcaEhQPLywuWyxVOnlgSS+Y=;
 b=QRDVhhBIIR2XzmMH8OaKamat33pWmfHEbePC5BYBBnipDpcg26zpSMVn7vPrmIs3RCt0Yr
 UAi19HLo6PzzVluYhBd5bJ4QTZgWsU0eR7gi+h2NCxOGAoJSbyLsPx766a/eezLTaCgR3C
 7RIK+JYErgxUwoBXveHPj5IpLviApHQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-ix1ylmh6P0i0-6qm67tQvQ-1; Wed, 08 Jun 2022 08:50:24 -0400
X-MC-Unique: ix1ylmh6P0i0-6qm67tQvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBCCB811E7A;
 Wed,  8 Jun 2022 12:50:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42BC0C33AE6;
 Wed,  8 Jun 2022 12:50:23 +0000 (UTC)
Date: Wed, 8 Jun 2022 13:50:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, Ari Sundholm <ari@tuxera.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 07/10] block: Implement
 bdrv_{pread,pwrite,pwrite_zeroes}() using generated_co_wrapper
Message-ID: <YqCbDWy4kdBSzd43@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-8-afaria@redhat.com>
 <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
 <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
 <20220527142506.wkl2al5vtle45qji@redhat.com>
 <YpS9Y0p18HJSNFsq@stefanha-x1.localdomain>
 <CAELaAXx23BK86W6oEzo9DANj=KCTpXAwDu0E85BGj19UW0M3VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pon0V5yUbVIY/eb1"
Content-Disposition: inline
In-Reply-To: <CAELaAXx23BK86W6oEzo9DANj=KCTpXAwDu0E85BGj19UW0M3VQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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


--Pon0V5yUbVIY/eb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 05:10:38PM +0100, Alberto Faria wrote:
> Thanks for the feedback, and apologies for the delayed response.
>=20
> On Mon, May 30, 2022 at 1:49 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > If you find it's safe to change to -EINVAL then that's consistent with
> > how file I/O syscalls work and I think it would be nice.
>=20
> Switching to -EINVAL on negative bytes sounds good to me, but perhaps
> it should be done as a separate series. For now, switching just
> bdrv_{pread,pwrite}() to -EIO will make them consistent with all of
> bdrv_{preadv,pwritev}() and bdrv_co_{pread,pwrite,preadv,pwritev}(),
> accomplishing the purpose of this series with less changes and
> auditing.
>=20
> I can work on a subsequent series that changes -EIO to -EINVAL on
> negative bytes for all the bdrv_...() and blk_...() functions.
>=20
> Would this make sense?

Yes, that's fine. My main concern is that callers have been audited when
errnos are changed. If you switch bdrv_{pread,pwrite}() to -EIO and have
audited callers, then I'm happy.

Consistent -EINVAL would be nice in the future, but I think it's lower
priority and it doesn't have to be done any time soon.

Stefan

--Pon0V5yUbVIY/eb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKgmw0ACgkQnKSrs4Gr
c8hILAf+IY/0s2r8hPa5VenosRFxr7r27QDQLApEQIBXttlQloy+aN7hqi6FLe20
ons+xMUI1/+NbHzwbq1fko/LB+XTu9cPi5YXE49aRZBuaTYw4OSfe8WXI9g8h4yJ
XElNGfE7CiOo/q6PCz5P4CVRDAIITMmoLOj68qh893OBfVF+Zv0Sh1pfXlxnuuez
shIzPaxw9Ovzr04mrYgmu6VSx5bNsSxrvAvQY6RhwTgi00YPBIkFwsuUY06i0CfZ
VQN4xebSPjsRsXo3GObMBxVjMNPADv+D73b5GEs6Lqn9ACoJGh8YHe+VSzDDRgHS
MBBPdCj+Qst844Q+5ROeJcHK1dUIxg==
=AXtK
-----END PGP SIGNATURE-----

--Pon0V5yUbVIY/eb1--


