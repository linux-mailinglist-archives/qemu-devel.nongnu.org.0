Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE8319298
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:59:02 +0100 (CET)
Received: from localhost ([::1]:47316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHB7-0002cf-Fb
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAGzs-0004T8-JS
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:47:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAGzn-0008HC-MW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613069235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q/8atqqvHQrXeV4/i4YkqGPZ5ubin9wKnpIarJO6u5A=;
 b=b/QQbEZ2M4hmvUG/b25JHl8+a5fbt2hkKd+eJZCFDdyKp6ury8hMjWZe+OLEAXgi7Ijp1R
 jHfUxjqP3UUeb4xplxln8bj2M7iRrvhaxsB1yX3fKRttBsqmakhOZhaidKFPU3up5NRenI
 ue57Ayp4I//uCVyBn432dflWdk3xKGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-vqd1ROmYOwiLz9wjGU_--w-1; Thu, 11 Feb 2021 13:47:13 -0500
X-MC-Unique: vqd1ROmYOwiLz9wjGU_--w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF54B801988;
 Thu, 11 Feb 2021 18:47:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23C5F60BF1;
 Thu, 11 Feb 2021 18:47:12 +0000 (UTC)
Date: Thu, 11 Feb 2021 13:47:10 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: runaway avocado
Message-ID: <20210211184710.GA2323314@localhost.localdomain>
References: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
 <CAFEAcA_S81bnYVcNENW9bFApAc-Ob1uKQncsGPmyFD034p2FOA@mail.gmail.com>
 <20210211172541.GA2316309@localhost.localdomain>
 <CAFEAcA-3M_CaNEiZHohH-RdxYP1Cn=5s+UXYTYE1e7YhoN2+tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3M_CaNEiZHohH-RdxYP1Cn=5s+UXYTYE1e7YhoN2+tg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 05:37:20PM +0000, Peter Maydell wrote:
> On Thu, 11 Feb 2021 at 17:25, Cleber Rosa <crosa@redhat.com> wrote:
> > IIUC, this specic issue was caused by a runaway QEMU.  Granted, it was
> > started by an Avocado test.  I've opened a bug report to look into the
> > possibilities to mitigate or prevent this from happening again:
>=20
> I wonder if we could have avocado run all our acceptance cases
> under a 'ulimit -f' setting that restricts the amount of disk
> space they can use? That would restrict the damage that could
> be done by any runaways. A CPU usage limit might also be good.
>=20
> thanks
> -- PMM
>=20

To me that sounds a lot like Linux cgroups.

I can see either someone setting up cgroups and having Avocado
run in it (then all tests inherit from this common parent),
or alternatively Avocado setting up cgroups for each of the
tests.

The former seems simpler and effective wrt preventing system
resources.  I can see a use case for the later when tests actually
want to verify a behavior when certain resources are constrained.

We can have a script setting up a cgroup as part of a
gitlab-ci.{yml,d} job for the jobs that will run on the non-shared
GitLab runners (such as the s390 and aarch64 machines owned by the
QEMU project).

Does this sound like a solution?

Thanks,
- Cleber.

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAle6sACgkQZX6NM6Xy
CfMQfBAAmhPJ1HrBQcpNdPIYlDxD5fIpcff9eMJhZaNy0Y7bPOblPRFXV4l8S0j5
oTjARuaPoasaSMvK7OsyGNUywpemjpRYcCK0QCKgXvWydKNzPYDQRuafwoqbdAQC
AmvBVo4+6irIrBcXEatG1fUu/utL/3+qSqg1Ke+tEVd0j+WtLUdSR8EsSrGMf9X1
dRGdMdlvKseKPb2x+2C5jTOKkMITr70l1Usy88zjB9k14L+8et/c80VkOnar0Hy5
1t7bqlnu1Bl6SniFN3TgPT9EUYbV1byEpsODmcUJuNJ9rp/yZ3wi/euGALPius91
So84sSE4VghEC3Mj9ss55aoozM1EZPHRsb2su2i7KS0SgyhyLJLZ2yV3wmWcgoce
59ZSLSLRwxkvHa/UdxIgteqHH6+mjCerkZWHzxDpyH9IncC7DKNWbxISN4fEjM4e
Fjqn69hN7bz+9P7uTfXnWFubHGxb4fSlFWDz4vpRxS1G951X6rphhxvjTzTg+eDv
U0n+ozNek76L5HtjsrgQx1Kpb7bHiavcRyDj8zBjSz8HIcnQkZSRaszFdnSnrpzD
fVTC+9nWfq1fN9dDtiCqOvBixRo5Hh6ZlQzcUIRjTpO8F0/sNbHKJmoxwARzmZD6
vUXKRdQf39n8D0h4CBciZvCN0LyiWDBq+Qys4VNoHvBDVk8lKHk=
=8m9t
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--


