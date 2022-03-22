Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05514E4283
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:08:09 +0100 (CET)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWg7E-0005mk-VX
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:08:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWg4e-0003Ah-3e
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWg4c-0003nl-6D
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647961525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0eqWp6IpJLcsfeENUpoJaOkDHG6yVxW0sCFG8Btzaw=;
 b=P0ILm3Kbp4zcWj4gVPaFVZDkt7Y0tzY2Q1sJ48lCWvDQFXvqa9dNMTsh8zS9vSP6hxICr4
 tIVZvl0c1/csXGPeICB4/OS7pQe/pIongVcSo/raCLPKgUc4bzfVSENw3PX4Ov53rvalCD
 67w43bmrLT2kadSf0P0oFTWNBf0BuLc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-0t8jgmPSNRycBj9E3lRHuA-1; Tue, 22 Mar 2022 11:05:20 -0400
X-MC-Unique: 0t8jgmPSNRycBj9E3lRHuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58F2D811E81;
 Tue, 22 Mar 2022 15:05:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 009744010A02;
 Tue, 22 Mar 2022 15:05:19 +0000 (UTC)
Date: Tue, 22 Mar 2022 15:05:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
Message-ID: <Yjnlr67GOzii0Ead@stefanha-x1.localdomain>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <a0f8c750-ed7b-908a-1a29-bf03004579e4@redhat.com>
 <YjhIddqwACSpoCfR@stefanha-x1.localdomain>
 <470cb0ab-137f-655c-9dcd-a480f66dac33@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s649EFo6HN6CrvoN"
Content-Disposition: inline
In-Reply-To: <470cb0ab-137f-655c-9dcd-a480f66dac33@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Charles Shih <cheshi@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--s649EFo6HN6CrvoN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022 at 11:29:42AM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> Hello Stefan,
>=20
> Dne 21. 03. 22 v 10:42 Stefan Hajnoczi napsal(a):
> > On Mon, Mar 21, 2022 at 09:46:12AM +0100, Luk=C3=A1=C5=A1 Doktor wrote:
> >> Dear qemu developers,
> >>
> >> you might remember the "replied to" email from a bit over year ago to =
raise a discussion about a qemu performance regression CI. On KVM forum I p=
resented https://www.youtube.com/watch?v=3DCbm3o4ACE3Y&list=3DPLbzoR-pLrL6q=
4ZzA4VRpy42Ua4-D2xHUR&index=3D9 some details about my testing pipeline. I t=
hink it's stable enough to become part of the official CI so people can con=
sume, rely on it and hopefully even suggest configuration changes.
> >>
> >> The CI consists of:
> >>
> >> 1. Jenkins pipeline(s) - internal, not available to developers, runnin=
g daily builds of the latest available commit
> >> 2. Publicly available anonymized results: https://ldoktor.github.io/tm=
p/RedHat-Perf-worker1/
> >=20
> > This link is 404.
> >=20
>=20
> My mistake, it works well without the tailing slash: https://ldoktor.gith=
ub.io/tmp/RedHat-Perf-worker1
>=20
> >> 3. (optional) a manual gitlab pulling job which triggered by the Jenki=
ns pipeline when that particular commit is checked
> >>
> >> The (1) is described here: https://run-perf.readthedocs.io/en/latest/j=
enkins.html and can be replicated on other premises and the individual jobs=
 can be executed directly https://run-perf.readthedocs.io on any linux box =
using Fedora guests (via pip or container https://run-perf.readthedocs.io/e=
n/latest/container.html ).
> >>
> >> As for the (3) I made a testing pipeline available here: https://gitla=
b.com/ldoktor/qemu/-/pipelines with one always-passing test and one allow-t=
o-fail actual testing job. If you think such integration would be useful, I=
 can add it as another job to the official qemu repo. Note the integration =
is a bit hacky as, due to resources, we can not test all commits but rather=
 test on daily basis, which is not officially supported by gitlab.
> >>
> >> Note the aim of this project is to ensure some very basic system-level=
 workflow performance stays the same or that the differences are described =
and ideally pinned to individual commits. It should not replace thorough re=
lease testing or low-level performance tests.
> >=20
> > If I understand correctly the GitLab CI integration you described
> > follows the "push" model where Jenkins (running on your own machine)
> > triggers a manual job in GitLab CI simply to indicate the status of the
> > nightly performance regression test?
> >=20
> > What process should QEMU follow to handle performance regressions
> > identified by your job? In other words, which stakeholders need to
> > triage, notify, debug, etc when a regression is identified?
> >=20
> > My guess is:
> > - Someone (you or the qemu.git committer) need to watch the job status =
and triage failures.
> > - That person then notifies likely authors of suspected commits so they=
 can investigate.
> > - The authors need a way to reproduce the issue - either locally or by =
pushing commits to GitLab and waiting for test results.
> > - Fixes will be merged as additional qemu.git commits since commit hist=
ory cannot be rewritten.
> > - If necessary a git-revert(1) commit can be merged to temporarily undo=
 a commit that caused issues.
> >=20
> > Who will watch the job status and triage failures?
> >=20
> > Stefan
>=20
> This is exactly the main question I'd like to resolve as part of consider=
ing-this-to-be-official-part-of-the-upstream-qemu-testing. At this point ou=
r team is offering it's service to maintain this single worker for daily jo=
bs, monitoring the status and pinging people in case of bisectable results.

That's great! The main hurdle is finding someone to triage regressions
and if you are volunteering to do that then these regression tests would
be helpful to QEMU.

> From the upstream qemu community we are mainly looking for a feedback:
>=20
> * whether they'd want to be notified of such issues (and via what means)

I have CCed Kevin Wolf in case he has any questions regarding how fio
regressions will be handled.

I'm happy to be contacted when a regression bisects to a commit I
authored.

> * whether the current approach seems to be actually performing useful tas=
ks
> * whether the reports are understandable

Reports aren't something I would look at as a developer. Although the
history and current status may be useful to some maintainers, that
information isn't critical. Developers simply need to know which commit
introduced a regression and the details of how to run the regression.

> * whether the reports should be regularly pushed into publicly available =
place (or just on regression/improvement)
> * whether there are any volunteers to be interested in non-clearly-bisect=
able issues (probably by-topic)

One option is to notify maintainers, but when I'm in this position
myself I usually only investigate critical issues due to limited time.

Regarding how to contact people, I suggest emailing them and CCing
qemu-devel so others are aware.

Thanks,
Stefan

--s649EFo6HN6CrvoN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmI55a8ACgkQnKSrs4Gr
c8jsCAf7ByjOKS/Z1kHh7mkFOnvu7aoM2WOGDFoUNZYtA/ykB440gD1VTf2Wolv5
WZwRUHT9wYm+klsS3fFl7TK0xnNlEl5W3UnAohN1gW/P6i8EPsVqm7xuwZ2FeI82
mkr9O8FcwTUg2TZFbhq0K8zN2+pVVP7V0BiwEBchRDXjdPCdfjLbS1PXrpftJhVO
nYV42WwOF9iQFpawvMydFCUfIjI7wFYbbvU3WxXCVhhTdEMw1UHyYD0dE7xHQF51
JR/YTr8LIyiSLX4Hut3VQySi2H1yoOOJUHIOcqq6xuBJa0dOBtuNPS2oZ42LqAPf
gdLREFiNbeYTxqHk7AjgTVEkZrUFcQ==
=tD9n
-----END PGP SIGNATURE-----

--s649EFo6HN6CrvoN--


