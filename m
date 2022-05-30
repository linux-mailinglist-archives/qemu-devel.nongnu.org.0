Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC33537AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:52:43 +0200 (CEST)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvesz-0002KB-MX
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nveqE-0008UD-BP
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:49:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nveqB-0003nE-AY
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653914986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vKrr0rSHqOkoPIonUyDdTEmGvLG69uCV8jCSX2P96Ys=;
 b=AEYym4s5CFBZQflPW4IoRNVmUEl4TASnK+d6rYZNy6rKDiit0+wWHaAdWWUWkdHbSrMQaA
 QuqLejQriKj7lOraA6E45zYZ/eRGDnMJ403Kwp7XwERlrsW5ngHsgTFjIGAntATq2XbVOp
 2Mp1Xh6ouEl15f9YX1pEjQ4CDrp1WwI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-7gv2YRayNjC3NFMBuwykFw-1; Mon, 30 May 2022 08:49:43 -0400
X-MC-Unique: 7gv2YRayNjC3NFMBuwykFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95E003C7B127;
 Mon, 30 May 2022 12:49:42 +0000 (UTC)
Received: from localhost (unknown [10.39.195.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC50B40EC002;
 Mon, 30 May 2022 12:49:40 +0000 (UTC)
Date: Mon, 30 May 2022 13:49:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org,
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
Message-ID: <YpS9Y0p18HJSNFsq@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-8-afaria@redhat.com>
 <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
 <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
 <20220527142506.wkl2al5vtle45qji@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aWR8Cru0uE+wBG2v"
Content-Disposition: inline
In-Reply-To: <20220527142506.wkl2al5vtle45qji@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--aWR8Cru0uE+wBG2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2022 at 09:25:06AM -0500, Eric Blake wrote:
> On Thu, May 26, 2022 at 08:23:02PM +0100, Alberto Faria wrote:
> > On Thu, May 26, 2022 at 9:55 AM Stefan Hajnoczi <stefanha@redhat.com> w=
rote:
> > > The bdrv_pread()/bdrv_pwrite() errno for negative bytes changes from
> > > EINVAL to EIO. Did you audit the code to see if it matters?
> >=20
> > I don't believe I had, but I checked all calls now. There's ~140 of
> > them, so the probability of me having overlooked something isn't
> > exactly low, but it seems callers either cannot pass in negative
> > values or don't care about the particular error code returned.
> >=20
> > Another option is to make bdrv_co_pread() and bdrv_co_pwrite() (which
> > have much fewer callers) fail with -EINVAL when bytes is negative, but
> > perhaps just getting rid of this final inconsistency between
> > bdrv_[co_]{pread,pwrite}[v]() now will be worth it in the long run.
>=20
> Failing with -EINVAL for negative bytes makes more sense at
> identifying a programming error (whereas EIO tends to mean hardware
> failure), so making that sort of cleanup seems reasonable.

I'm surprised -EIO is being returned but all the more reason to check
what effect changing to -EINVAL has.

If you find it's safe to change to -EINVAL then that's consistent with
how file I/O syscalls work and I think it would be nice.

Stefan

--aWR8Cru0uE+wBG2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKUvWMACgkQnKSrs4Gr
c8jU2wgAkM1Vrb0y+7ylz4rkYXryOANGCVeJ973csYexi3T6smmMp74RCrh7JP72
1m9MSKO5LExKjH27TLRR/wy14OQCLx9zx1Z+Gdk0MJvROGOZ2CX2HudX2VxXgcJv
AsQStVBbtTe1bIbHqiIslByOvDF1vVj0RhGbZmpYPwdMBd5MwgmudOxtI3FAK3hO
Zl67DGGgdiUehB0BHNtn9br/xFD+2E2Y8TsxEavDvmFbwFoaXP0eZ2MueeyaWAg9
RVG+4vHbztq4DT9N/KirQ4yly87W1vt4prIhneJN3DAd+LUT0reUu9vH7yxjfU8v
KVu7BaLfH3q83F1DY/EFcw0b87Z0Xg==
=Fkhr
-----END PGP SIGNATURE-----

--aWR8Cru0uE+wBG2v--


