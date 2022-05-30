Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D61537AEB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:58:58 +0200 (CEST)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvez3-0000Ya-Dx
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nvewi-0007QW-Ci
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nvewe-0005Ht-42
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653915386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=de+nQyqCQiWPfW8kM6nAt4FpbCMwhFpx5mEOj07O0Dc=;
 b=c7stgy0UXe2Ghf27LYklhA1ShbyezmcBWr/QSZ7veQVjJsZu935pMl2S+FQAZGae1g3UWT
 iRSVKIEzqmgliYuEaEw5U6TckDy+7CiyWDASLGYfPCTKVel9VANSMoDSyrDUpLbL++HRqo
 /DHkssjM/ScKWNpTZ1EHYxe03qz8X6w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-HHVyfRFfOLiYybwUwvxP5g-1; Mon, 30 May 2022 08:56:22 -0400
X-MC-Unique: HHVyfRFfOLiYybwUwvxP5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5040B1C05EAB;
 Mon, 30 May 2022 12:56:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDA5363F54;
 Mon, 30 May 2022 12:56:21 +0000 (UTC)
Date: Mon, 30 May 2022 13:56:20 +0100
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
Message-ID: <YpS+9OL6TNeTJqem@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-8-afaria@redhat.com>
 <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
 <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
 <20220527142506.wkl2al5vtle45qji@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AfZXbiLhgSrF3U8o"
Content-Disposition: inline
In-Reply-To: <20220527142506.wkl2al5vtle45qji@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--AfZXbiLhgSrF3U8o
Content-Type: text/plain; charset=utf-8
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

=46rom IRC:

13:50 < stefanha> kwolf hreitz: Is there a reason why bdrv_check_qiov_reque=
st() fails with -EIO instead of -EINVAL when parameters are invalid?
13:51 < hreitz> I think the reason is =E2=80=9CEIO is kind of the default e=
rror value in the block layer=E2=80=9D
13:53 < stefanha> bdrv_pwrite() has its own if (bytes < 0) return -EINVAL c=
heck, duplicating the input validation (but returning a different errno).
13:54 < hreitz> I think I=E2=80=99m only responsible for blk_check_byte_req=
uest(), but AFAIR that was my reasoning there
13:54 < stefanha> That makes me wonder if something depends on the exact er=
rno.
13:54 < hreitz> I hope not
13:54 < stefanha> ...and what would break if it was changed to be EINVAL (c=
onsistent with file I/O syscalls).
13:55 < hreitz> Speaking for myself, I don=E2=80=99t think I=E2=80=99ve eve=
r spent much consideration on what error codes to use in the block layer=E2=
=80=A6
13:55 < kwolf> My guess is that it has always been EIO and nobody was bothe=
red enough to check whether returning EINVAL instead would break anything
13:55 < stefanha> Thanks!
13:55 < hreitz> E2BIG might be special, and EAGAIN might do funny things so=
metimes, but other than that I=E2=80=99d=E2=80=99ve hoped everything=E2=80=
=99s treated equally
13:55 < stefanha> I'll add this information to the afaria's patch series di=
scussion.

--AfZXbiLhgSrF3U8o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKUvvQACgkQnKSrs4Gr
c8hbTQgAwgxxXDC3M024QxHzr0NhkRcx+tk9mfwFPaGewakz/C5jMtoqK7rYB3GS
kzJ1eHpJWZUYlAQ7uiulgX8JOzercQJKw7DMrqPbXQ+ck1Dpsy6406NVBCd8CZ3/
bv5ru4paT3j8l3qvuSAByiOIgR2v8hOLY04+8mixF5e4nsLQ91OChCNalnPECyUd
4Ev0P02Y1aIkm4MQqQ3+8cyhRQetFXPaw14jFFpZMglJg/BsbgakHywSGBh9X1Zr
dzHfzRfIRjZx/+YsavMIoqyZEUFn4cQdCQLk0R0lf6GsnK6sCZ9yNAjsHarNjH/Z
jL/fx4QAF3Nh/aHSUAxSSfhe3/aVZA==
=20Mh
-----END PGP SIGNATURE-----

--AfZXbiLhgSrF3U8o--


