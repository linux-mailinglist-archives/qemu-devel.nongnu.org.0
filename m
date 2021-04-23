Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2DF3692A0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:04:38 +0200 (CEST)
Received: from localhost ([::1]:51776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvU4-0007Z3-VA
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phrdina@redhat.com>)
 id 1lZvRY-0006Ia-5w
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phrdina@redhat.com>)
 id 1lZvRU-0000dr-Od
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619182915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0eCPxOkwj4MNW7yVCeLV5uDgz01qIDQoHA6fgQIP3Q=;
 b=Yp7ZmNMraluRCBFaZgZJ1rnVqiga4Vf0+Vtpqba88nkNBgWEv/bCHcg4+dS5HGZcBrMroG
 EkOQkhLYvVkr6cx/9lZSBtonFuk4N+Kz/QPWLYprrVeVP+EqC0T9goUWbuR0gCeucljHDK
 FcbhQL5OOU9xIl8TsZxNKfG5h8+nnic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-YeO8CJolMlS0YuN4iWJmqg-1; Fri, 23 Apr 2021 09:01:49 -0400
X-MC-Unique: YeO8CJolMlS0YuN4iWJmqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B1F3107ACCA;
 Fri, 23 Apr 2021 13:01:47 +0000 (UTC)
Received: from antique-laptop (unknown [10.40.195.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB9360854;
 Fri, 23 Apr 2021 13:01:45 +0000 (UTC)
Date: Fri, 23 Apr 2021 15:01:42 +0200
From: Pavel Hrdina <phrdina@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: firmware selection for SEV-ES
Message-ID: <YILFNu1R8LcZRF48@antique-laptop>
References: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
 <YIARw09TcakElBco@antique-laptop>
 <0b5d799c-6290-5585-599e-4c4f37af6202@redhat.com>
 <0cf69e7e-d159-6b68-0046-5449b0241634@redhat.com>
 <YIKiE+USYmCjQeSR@antique-laptop>
 <e5978a49-00a6-6350-0e06-6aab6de4c9a5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e5978a49-00a6-6350-0e06-6aab6de4c9a5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=phrdina@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5ZuJPZe7tVCZ0FU3"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=phrdina@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5ZuJPZe7tVCZ0FU3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 02:34:02PM +0200, Laszlo Ersek wrote:
> On 04/23/21 12:31, Pavel Hrdina wrote:
> > On Fri, Apr 23, 2021 at 10:16:24AM +0200, Michal Privoznik wrote:
> >> On 4/22/21 4:13 PM, Laszlo Ersek wrote:
> >>> On 04/21/21 13:51, Pavel Hrdina wrote:
>=20
> >>> Should we file a libvirtd Feature Request (where?) for recognizing th=
e
> >>> @amd-sev-es feature flag?
> >>
> >> Yes, we should. We can use RedHat bugzilla for that. Laszlo - do you w=
ant to
> >> do it yourself or shall I help you with that?
> >=20
> > This BZ looks like it's already tracking support for amd-sev-es [1].
> >=20
> > Pavel.
> >=20
> > [1] <https://bugzilla.redhat.com/show_bug.cgi?id=3D1895035>
>=20
> That's a private RHBZ that tracks SEV-ES for a product that is different
> from "libvirt upstream".

I didn't notice that's a private RHBZ, thanks for pointing it out.

For upstream libvirt we no longer use RHBZ to track RFEs/BZs, we use
gitlab issues so if we want to track the work in upstream as well I can
create a new issue.

Pavel

--5ZuJPZe7tVCZ0FU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcbzs91ho/coWWY7aUi1kczAH4YwFAmCCxTYACgkQUi1kczAH
4Yy3ABAAzI776I7UdXCLfQJZd/8FnlU9KGlXhV/O9Yzpz/Y6beqYP+AEEJepS1Cj
Y4zkmflSTF06WAO3IJA46uzq3G8kzl+EcBziJTATM4PgbPccKjTrA6QITpyVBxIV
Y+wqAlBZAXx10BAx7wpCBRJAH7Cxu48JTpbt2diq2bct2nlGVqpRNv9Kr3MyC5KN
mk38KElvnhRfr+hz3jXy9cRBJyuzdTJHffeORJe8tlEhOS2W9+g/U5jtuiZqCxwX
YkcE6qDb7Uh1QvaLjUwCGjKRa+A766f2dmVN0cEnHUuBbUZcHDpiAaE+bSvOr3t2
I/9UVWylkL7o0QFMDeUTCsq1onjs8nbEbNxIhQgdsTi6Uz2rnBdxjGtG4Vh3VEoz
I1V9Vy9xMS3v6pZKOt8Hw1L57WkEvCCkKqVt2SWD309vqb9DZwWWvNHWPpI45PNX
lps5ZkkzRYTCI9Ciy6h85F94PCugshNWrIXosk2Xa3rBfDkkVZHrDv1Pmoxru85p
fJHi064KGF/UjaCwQO8/+DAlOq75fExVrxDoDQGDzaztdqLXz4uxYs33H5CccN/V
OZvH7ClhclqCUOkoKqLdMjXqIr9ulByYtYyCEr6unb+9dNiBBzKUo5E47XR8S3MG
COggDpzyC95wOvjno9fv/JQck8Zd1wKbT1vt3ihWpy4jTLhHGE0=
=1dg/
-----END PGP SIGNATURE-----

--5ZuJPZe7tVCZ0FU3--


