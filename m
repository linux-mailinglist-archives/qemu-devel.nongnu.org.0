Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B8425C7FE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 19:22:48 +0200 (CEST)
Received: from localhost ([::1]:46200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDswh-0005ib-VC
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 13:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kDsvr-00056K-Uc
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 13:21:55 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45059
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kDsvp-0001dA-JJ
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 13:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599153712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4XB/8H0+1F0kMAlKd2nv7Q1nK7NyJWHyNFqdqpwMD4c=;
 b=UVa71/Alkb3pNl7RPQNBSDvK6HyH0yM6DUI3pUpIevWShwBt8QjFx/VnZOXN12N3bSA7cU
 6kby6OLMsGG33ojAHe5o34/O7DimFrKfOGEWBPJFDxws4K2HbyjhAzRikstvZ8a5Vq8NyE
 kMJCQJ5WxMp0UmmvK+IpBHwAy8Ngfcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-i1x87LhRO9ybFEKwbsKmhQ-1; Thu, 03 Sep 2020 13:21:50 -0400
X-MC-Unique: i1x87LhRO9ybFEKwbsKmhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C04C801AEA;
 Thu,  3 Sep 2020 17:21:49 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-183.ams2.redhat.com [10.36.114.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55C175C22D;
 Thu,  3 Sep 2020 17:21:48 +0000 (UTC)
Date: Thu, 3 Sep 2020 19:21:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests: Allow running from different directory
Message-ID: <20200903172146.GF8835@linux.fritz.box>
References: <20200902110326.257115-1-kwolf@redhat.com>
 <170e9e09-5d81-f75b-fbb1-b60ed0d2e776@redhat.com>
MIME-Version: 1.0
In-Reply-To: <170e9e09-5d81-f75b-fbb1-b60ed0d2e776@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0lnxQi9hkpPO77W3"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0lnxQi9hkpPO77W3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 03.09.2020 um 14:54 hat Max Reitz geschrieben:
> On 02.09.20 13:03, Kevin Wolf wrote:
> > It is convenient to be able to edit the tests and run them without
> > changing the current working directory back and forth. Instead of
> > assuming that $PWD is the qemu-iotests build directory, derive the buil=
d
> > directory from the executed script.
> >=20
> > This allows 'check' to find the required files even when called from
> > another directory. The scratch directory will still be in the current
> > working directory.
> >=20
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  tests/qemu-iotests/check | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> > index 3ab859ac1a..22ada6a549 100755
> > --- a/tests/qemu-iotests/check
> > +++ b/tests/qemu-iotests/check
> > @@ -44,7 +44,7 @@ then
> >          _init_error "failed to obtain source tree name from check syml=
ink"
> >      fi
> >      source_iotests=3D$(cd "$source_iotests"; pwd) || _init_error "fail=
ed to enter source tree"
> > -    build_iotests=3D$PWD
> > +    build_iotests=3D$(dirname "$0")
>=20
> This breaks running check from the build tree.
> (i.e. cd $build/tests/qemu-iotests; ./check)
>=20
> The problem is that to run the test, we do cd to the source directory
> ($source_iotests), and so $build_iotests then becomes invalid if it=E2=80=
=99s
> just a relative path.  In my case, this leads to the following error:
>=20
> -Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048576
> +./common.rc: line 139: $QEMU/tests/qemu-iotests/../../qemu-img: No such
> file or directory

Ah, my symlinks in the source tree made it work for me.

> I think this could be resolved by wrapping the $(dirname) in
> $(realpath), i.e.
>=20
> build_iotests=3D$(realpath "$(dirname "$0")")

Sounds good, I'll update it in my tree.

Kevin

--0lnxQi9hkpPO77W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAl9RJioACgkQfwmycsiP
L9aI8xAAhj8OJzer/h90hi+1XUbAzvUJqKXrwRfn+Y+jwU9+5KcPChIP3JkW7e24
oelDYCeMLxkItNRK2MPI2wTVX06A0sjxSSt3LqfNqDga6cSFc/5SIhWhiKGjAyw7
vYO4pW262sogd8nPkmewjXEjIaW9U+VewFrDHRMnikdK0/Zi+cRh6/eISPbZvBpp
IJQp5P1NnnG2cVv4yrYkpHplU/iHoiuZdj8ENbK5t+Ckd6HFmxbZvDpcihd9CNBZ
ksGUqMBuhBTTPDG8CRwJYMNOpqZo7iKc4NxaP6w1cBPbUmC1NJE/YLVT4QlxIQo6
QfQVTuW7R56dXUeuADHZRXZ+70eGHtzC8c+Gq/2fQUN4/ew4o51oHWtqDD6z82P2
Yp40evekG6MfM7IjjYtYvjvUgJBmgijSc4/KQLEJTe3vzpWCNAK/sACSSw9SjiJ9
jK6F+vVPXvLZTd+kg1am0wHy4Zfd6t+TYt1NTd1QfDAViaOyzwM+/t9Oq7+PdLcu
4rV1fDLKD7BY5vyUBrafzCP9WPMAD/sJOgQLYXsvk1tdoAPVW0kHSLZA0QKKfVVL
7I+1sMXAuMCgvRWMGVtebXjzgxx+QUVoRMCDfy1Nmvz790Klu9ggsfW4ObyprS4d
koivEGVm+wuyw/Skv08Pe7BPfwK3qfNeMLnV4T0EWn7Bd2KpU0g=
=nWK6
-----END PGP SIGNATURE-----

--0lnxQi9hkpPO77W3--


