Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773D02C9612
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 04:50:12 +0100 (CET)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjwg6-0005Lc-Ug
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 22:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kjwej-0004Xz-Bm
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 22:48:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kjwef-00066P-T8
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 22:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606794519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mB5qgdzo6q+HYsFGF3WsI1aTAzzMtdKPFcub2Xm2aeg=;
 b=GMM7Fl6yn5k+We/x5IEJmYnXa6IK2w3Qayx6wn+OVme8LPpa3rQUt8aNUoZ+9LnNxhGSbt
 Lo72QNGMefMPTrMJxmeqL1TV6LcPw5ArzmHalx8vu4a7whAhRMW90zSf7pKhnKhiUccWTp
 YphB+ybr6rR2PIgw9qZRQKq+Muh5dgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-n-QrxWTrNqW97jwDydL-cQ-1; Mon, 30 Nov 2020 22:48:35 -0500
X-MC-Unique: n-QrxWTrNqW97jwDydL-cQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF80E1842161;
 Tue,  1 Dec 2020 03:48:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-118-183.rdu2.redhat.com
 [10.10.118.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55CCC60854;
 Tue,  1 Dec 2020 03:48:27 +0000 (UTC)
Date: Mon, 30 Nov 2020 22:48:25 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
Message-ID: <20201201034825.GA2343635@localhost.localdomain>
References: <20201127174110.1932671-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201127174110.1932671-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, virt-ci-maint-team@redhat.com,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 06:41:10PM +0100, Philippe Mathieu-Daud=E9 wrote:
> We lately realized that the Avocado framework was not designed
> to be regularly run on CI environments. Therefore, as of 5.2

Hi Phil,

First of all, let me say that I understand your overall goal, and
although I don't agree with the strategy, I believe we're in agreement
wrt the destination.

The main issue that you seem to address here is the fact that some CI
tests may fail more often than others, which will lead to jobs that
will fail more than others, which will ultimately taint the overall CI
status.  Does that sound like an appropriate overall grasp of your
motivation?

Assuming I got it right, let me say that having an "always green CI"
is a noble goal, but it can also be extremely frustrating if one
doesn't apply some safeguarding measures.  More on that later.

As you certainly know, I'm also interested in understanding the "not
designed to be regularly run on CI environments" part.  The best
correlation I could make was to link that to the these two points you
raised elsewhere:

 1) Failing randomly
 2) Images hardcoded in tests are being removed from public servers

With regards to point #1, this is probably unavoidable as a whole.
I've had some experience running dedicated test jobs for close to a
decade, and maybe the only way to get close to avoid random failures
on integration tests, is to run close to nothing in those jobs.
Running "/bin/true" has a very low chance of failing randomly.

In my own experience, the only way to address point #1, is to
babysit jobs.  That means:

 a) assume they will produce some messy stuff at no particular time
 b) act as quickly and effectively as possible
 c) be compassionate, that is, waive the unavoidable mess incidents

Building on the previous analogy, if you decide to not have a baby,
but a plant, you'll probably need to to a lot less of those.
If you get a pet, than some more.  Now a human baby will probably
(I guess) require a whole lot more of those.  And as those age
and reach maturity, they'll (hopefully) require less babysitting,
but they can still mess up at any given time.

Analogies and jokes aside, the urgent *action item* here has been
discussed both publicly, and internally at Red Hat. It consists of
having an "always on" maintainer for those jobs.  In the specific case
of the "Acceptance" jobs, Willian Rampazzo has volunteered to,
initially, be this person.  He'll manage all related information
on job's issues.

We're still discussing the tools to use to give the visibility that
the QEMU projects needs.  I personally would be happy enough to start
with a publicly accessible spreadsheet that builds upon the
information produced by GitLab.  A proper application is also being
considered.  A sample of the requirements include:

   I) waive failures (say a job and tests failed because of a
      network outage)
  II) build trends (show how stable all executions of test "foo"
      were during the last: week, month, eternity, etc).
 III) keep a list of the known issues and relate them to waivers
      and currently skipped tests

Getting back to point #2, I have two main points about it.  First is
that I've had a lot of experience with tests having copies of images,
both on local filesystems and in on close by NFS servers.  Local
filesystems would fail at provisioning/sync time. And NFS based ones
would fail every now and then for various network or NFS server
issues.  It goes back to my point about not being able to escape the
babysitting ever.

Second is that this is somehow related to features and improvements
that could/should be added to whathever supporting code (aka
framework) we use.  Right now, we have some specific features
scheduled to be introduced in Avocado 84.0 (due in ~2 weeks).  They
can be seen with the "customer:QEMU" label:

  https://github.com/avocado-framework/avocado/issues?q=3Dis%3Aissue+is%3Ao=
pen+label%3Acustomer%3AQEMU

A number of other features have already landed on previous versions,
but I was unable to send patches in time for 5.2, so my expectation is
to bundle more of them and bump Avocado to 84.0 at once (instead of
82.0 or 83.0).

> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
> current users, it is possible to keep the current behavior by
> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
> (see [*]).
> From now on, using these jobs (or adding new tests to them)
> is strongly discouraged.
>

These jobs run `make check-acceptance`, which will pickup new tests.
So how do you suggest to *not adding new tests* to those jobs?  Are
you suggesting that no new acceptance test be added?

> Tests based on Avocado will be ported to new job schemes during
> the next releases, with better documentation and templates.
>

This is a very good approach to move forward.  For what is worth,
Avocado has invested in an API specifically for that, the Job API.
The goal is to have smarter jobs for different purposes that behave
appropriattely and account for the environment (such as host platform,
CI, etc).  Example of my upcoming "job-kvm-only.py":

---------------------------------------------------------------------------=
---

#!/usr/bin/env python

import os
import sys

from qemu.accel import kvm_available
from avocado.core.job import Job


def main():
    if not kvm_available():
        sys.exit(0)

    config =3D {'run.references': ['tests/acceptance/'],
              'filter.by_tags.tags': ['accel:kvm,arch:%s' % os.uname()[4]]}
    with Job.from_config(config) as job:
        return job.run()


if __name__ =3D=3D '__main__':
    sys.exit(main())

---------------------------------------------------------------------------=
---

Other examples of Jobs using this API can be seen here:

   https://github.com/avocado-framework/avocado/tree/master/examples/jobs

And the documentation on the features one can use by setting
configuration keys can be found here:

   https://avocado-framework.readthedocs.io/en/83.0/config/index.html

So for example, if one wants to ignore errors while fetching assets in a jo=
b,
there is this:

   https://avocado-framework.readthedocs.io/en/83.0/config/index.html#asset=
s-fetch-ignore-errors

> [*] https://docs.gitlab.com/ee/ci/variables/README.html#create-a-custom-v=
ariable-in-the-ui
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d0173e82b16..2674407cd13 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -66,6 +66,15 @@ include:
>      - cd build
>      - python3 -c 'import json; r =3D json.load(open("tests/results/lates=
t/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] =
not in ("PASS", "SKIP", "CANCEL")]' | xargs cat
>      - du -chs ${CI_PROJECT_DIR}/avocado-cache
> +  rules:
> +  # As of QEMU 5.2, Avocado is not yet ready to run in CI environments, =
therefore
> +  # the jobs based on this template are not run automatically (except if=
 the user
> +  # explicitly sets the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE environ=
ment
> +  # variable). Adding new jobs on top of this template is strongly disco=
uraged.
> +  - if: $QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE =3D=3D null
> +    when: manual
> +    allow_failure: true
> +  - when: always
>

I believe the best way to move forward is a bit different than what
you propose here.  I'd go with the babysitting approach, and
agressively disable tests on first sign of failure, instead of
"muting" all of them at once.  My perception is that without the
babysitting and quick actions, new jobs will end up in the same
situation given enough tests are added.

Anyway, thanks for bringing up the discussion here.

- Cleber.

>  build-system-ubuntu:
>    <<: *native_build_job_definition
> --=20
> 2.26.2
>=20

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl/FvQcACgkQZX6NM6Xy
CfNAPQ/9HgU5/+/ABO+o1gnFM9VLDqFJHqN19NT57EoBKO9aHrwjWE8pymbFY3VE
yp045afE2n0bkzrCaLK3WeXj4KK5TaNl4siSg4IgodAx8auUATNhRggxkmqe0NFw
iPBQw4MAAaUqz8pUMc5+oCS82Dfloty/VopBMYVk9Zv1+BEPkkqjRffimivCaa4N
HrzPkwG1QKts3K6TjIWT3RZJugeyUo+UgBucCvkfp5KiVJIWUy/d9hMhEKV0M0YR
P4de70KSGK7kPYvo4PH1auF22yBlGkms1ldkEE9YnJOdv+CNQSoGNmKfghUgdItY
ByZN35lQC5xST+KD0a1LAUsjqnoOMI/hMGYby3Knw0dwa8HHjTUcHi+dMFIL0tsC
4Qly82q7G19RrEuSJIPjvFJEjEbsAn9X35SY+PfBjSSKIJgvxQiYFvlGGBhbMzMr
vVy6YszHjnIuY5m5sjsB8e2GbLu5yDuC0vLOXEFX3mkDYwNoKQ/aM5ZpNdTb1wIh
AO4+j37BQAOIVlz375zy2QiwDydeEdVmqvq3YOizxknH1bYzOp6lAta0T+gLiuG1
MuASqRdCZs/nixvcs7JCsxLwwAiKcPeDoQdL/LiuTBKFy5KOMjzBOYqq8uDN1v6S
SiqaWTaOWgA//pBu4nQKEn9fW3Lx8bl6brXrWPOpjtACCx7mFb0=
=TMmD
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--


