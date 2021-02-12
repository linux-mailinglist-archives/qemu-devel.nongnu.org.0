Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19431985C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 03:32:35 +0100 (CET)
Received: from localhost ([::1]:48754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAOG2-0005wf-I0
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 21:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAOEs-0005UW-So
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 21:31:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAOEp-00069F-Li
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 21:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613097077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V6HVLK1/QQoKCVxtm1N25Vm6d1gixKyVUa4r6lIjFq0=;
 b=MWhqhcSnJsnAIqWmvwMeGUSzsfRYX0bnVsDTWvC3ogPh2Lh+WZuBff0+cAc7Hnu7nhpkFa
 6IcWFCwYdPrHQjHncpjqV0vFKch52el0SLSSdtKfvtNJszCSgnSZ4iuNjYmRtI3PYOFnDY
 tcA9rByUqUgVN0oREnGwhijFypufm8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-9ldXChzSODuNBb08XlyKGQ-1; Thu, 11 Feb 2021 21:31:12 -0500
X-MC-Unique: 9ldXChzSODuNBb08XlyKGQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1216E192AB7A;
 Fri, 12 Feb 2021 02:31:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-63.rdu2.redhat.com
 [10.10.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DC126F7ED;
 Fri, 12 Feb 2021 02:31:10 +0000 (UTC)
Date: Thu, 11 Feb 2021 21:31:08 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: runaway avocado
Message-ID: <YCXobMgS01x2ee14@localhost.localdomain>
References: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
 <CAFEAcA_S81bnYVcNENW9bFApAc-Ob1uKQncsGPmyFD034p2FOA@mail.gmail.com>
 <20210211172541.GA2316309@localhost.localdomain>
 <CAFEAcA-3M_CaNEiZHohH-RdxYP1Cn=5s+UXYTYE1e7YhoN2+tg@mail.gmail.com>
 <20210211184710.GA2323314@localhost.localdomain>
 <CAFEAcA8twaP2=MGZh1OOHO8EFAVmQYM26i+QN6y26kaVfTNnwQ@mail.gmail.com>
 <22cc2681-b53c-b5b2-d8f0-8307bb514c21@redhat.com>
MIME-Version: 1.0
In-Reply-To: <22cc2681-b53c-b5b2-d8f0-8307bb514c21@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L83zsyQU+fCulwGZ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--L83zsyQU+fCulwGZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 12:59:23AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/11/21 8:21 PM, Peter Maydell wrote:
> > On Thu, 11 Feb 2021 at 18:47, Cleber Rosa <crosa@redhat.com> wrote:
> >> On Thu, Feb 11, 2021 at 05:37:20PM +0000, Peter Maydell wrote:
> >>> I wonder if we could have avocado run all our acceptance cases
> >>> under a 'ulimit -f' setting that restricts the amount of disk
> >>> space they can use? That would restrict the damage that could
> >>> be done by any runaways. A CPU usage limit might also be good.
> >=20
> >> To me that sounds a lot like Linux cgroups.
> >=20
> > ...except that ulimits are a well-established mechanism that
> > is straightforward, works for any user and is cross-platform
> > for most Unixes, whereas cgroups are complicated, Linux specific,
> > and AIUI require root access to set them up and configure them.
>=20
> I agree with Peter, having being POSIX compliant is better than
> restricting to (recent) Linux. But also note we have users interested
> running tests for Windows builds. See the Cirrus-CI.
>=20

Sure, I feel like cgroups is more comprehensive, but definitely have
the drawbacks you both listed.

> >=20
> >> We can have a script setting up a cgroup as part of a
> >> gitlab-ci.{yml,d} job for the jobs that will run on the non-shared
> >> GitLab runners (such as the s390 and aarch64 machines owned by the
> >> QEMU project).
> >>
> >> Does this sound like a solution?
> >=20
> > We want a solution that works for anybody running
> > "make check-acceptance" in any situation, not just for
> > the CI runners.
>=20
> Indeed. Public CI time being limited, I expect users to run tests
> elsewhere. We don't mind about data loss on CI runners.
>

That was kind of my point.  We want to use all the resources the
GitLab CI shared runners give us, so extra limit enforcements make no
sense to me.  Also, on my personal machines, I also prefer to have
faster test turnarounds, so putting extra limits is not beneficial to
me.  YMMV, so my opinion is that this should be an opt-in, *not*
enabled by default.

My initial take on this is that we can have a few pre-defined scripts
that set those limits.  Users get to activate those profiles by
name if say, a given environment variable is set.  Something like:

  RESOURCE_LIMIT_PROFILE=3Dlow_cpu_4g_files
  if [ -n $RESOURCE_LIMIT_PROFILE ]; then
  ./scripts/limit-resources/$RESOUCE_LIMIT_PROFILE $*

> FWIW similar complain last year:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg672277.html
>

The specific issue of Avocado's cache size should be addressed in this
development cycle, and a solution available on 86.0.  It's being tracked
here:

  https://github.com/avocado-framework/avocado/issues/4311

Now, in Peter's case, it was QEMU writing to a replay.bin file, and I
don't see a practical way that Avocado could limit the overall disk
space usage by whathever gets run on a test unless disk quotas are
set.  Not sure if this belongs on a test framework though.

Cheers,
- Cleber.

> Regards,
>=20
> Phil.
>=20

--L83zsyQU+fCulwGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAl6GkACgkQZX6NM6Xy
CfMq3g//TTY5rFTKGSJh7kBZYEozR7xxJav34sfOHtoAvwfyjHhRVm578/SLbb3v
tw64GEy4/V4WlJJrYUaO+ctuNbUydOTym1bhaL5PK0UwTZcAJ9CjpmUU+Fp5X2WS
M+H9Oo2h+V/1p9jl/fpQd5RKKqWfyA+Iz7Xo2jIdKDikruYO0l7QXZ7L82DV5+Y0
WsK5SoEsprqMPrP5yltjTwD4XyKZd8KbyIhy4xIwDLE1PaUTsgKor4z6WQLTCOWx
HejRhgjOCjdf8mgTpodZPb/CEWL6xZDd4GNSEWNHZzJBkRpPC9UmqA9W4glmxLgM
NITzyJT8J81qA/32o8509Bjs2QCjLko7sDqm0mh3UZQVj5q3F78WkC/ZSd2eSOGH
EHaSVHs3cxLp+L3Vu5QI3G64u7p66ZfLjQhGR8wXSehEwhwmjAd+r/GgLnXUB0LD
xCCdoQI+HXRGLrYa4a8FuitMZvJLy0LQ+Ti5PlkZ+RRuzepeLUMUSESYGNMvc1ee
JWg7I5gvaiPMfdV/wBwo2IgawsRdg6cddhiYmLV30FNAxQV15s1xgOEghoUQqLDQ
BZ5VGSDul8RyI1vSq5ojRO6BUB68b/DY8byHgUAj/PHvGER1UQKQF7QuOuDWc5uM
jPSFezhdRu5Z3Wp5oXKIKxKUnJavp6ebcuy8PEUgMIZ+D+oxJmQ=
=tcAo
-----END PGP SIGNATURE-----

--L83zsyQU+fCulwGZ--


