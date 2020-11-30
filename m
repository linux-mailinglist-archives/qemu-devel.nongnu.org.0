Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB412C81CF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:09:05 +0100 (CET)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjg7E-00041j-K1
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kjg6R-0003al-23
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:08:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kjg6O-0005uj-Nj
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 05:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606730891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMabaTz4Fvi0uV17HxqAIWKClrwpOP9oMk4d+Gh2Ki8=;
 b=FsvxP6/KqTWuGhhVulbl4iOU8tVyS82h6nzMMk91zIiCoTQyKweNjRzuC9lDKqV3lOZqT1
 Kei9/bREBp+sj9wp5bwHgxKkobW5pHtepDikW1Cey/mIw5n0F6INHVHt/jZ/h82upUd2LB
 V5SeChPpvgeSn424ZSD/CVPLazRb/Bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-h138-V7DOBOSOjg7vMUJzA-1; Mon, 30 Nov 2020 05:08:08 -0500
X-MC-Unique: h138-V7DOBOSOjg7vMUJzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90016805BE0;
 Mon, 30 Nov 2020 10:08:07 +0000 (UTC)
Received: from gondolin (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9AA5D6A8;
 Mon, 30 Nov 2020 10:07:59 +0000 (UTC)
Date: Mon, 30 Nov 2020 11:07:56 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
Message-ID: <20201130110756.0e25ce1f.cohuck@redhat.com>
In-Reply-To: <36279d42-2312-adcf-2f83-51ec9ff64e0a@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
 <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
 <ec7e0016-7d10-49bf-0af2-69de8356bbed@redhat.com>
 <20201130091044.2b35fca4.cohuck@redhat.com>
 <36279d42-2312-adcf-2f83-51ec9ff64e0a@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Nov 2020 10:36:43 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 11/30/20 9:10 AM, Cornelia Huck wrote:
> > On Fri, 27 Nov 2020 19:46:29 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote: =20
> >> On 11/27/20 7:29 PM, Thomas Huth wrote: =20
> >>> On 27/11/2020 18.57, Philippe Mathieu-Daud=C3=A9 wrote:   =20
> >>>> On 11/27/20 6:47 PM, Thomas Huth wrote:   =20
> >>>>> On 27/11/2020 18.41, Philippe Mathieu-Daud=C3=A9 wrote:   =20
> >>>>>> We lately realized that the Avocado framework was not designed
> >>>>>> to be regularly run on CI environments. Therefore, as of 5.2
> >>>>>> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
> >>>>>> current users, it is possible to keep the current behavior by
> >>>>>> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
> >>>>>> (see [*]).
> >>>>>> From now on, using these jobs (or adding new tests to them)
> >>>>>> is strongly discouraged.
> >>>>>>
> >>>>>> Tests based on Avocado will be ported to new job schemes during
> >>>>>> the next releases, with better documentation and templates.   =20
> >>>>>
> >>>>> Why should we disable the jobs by default as long as there is no re=
placement
> >>>>> available yet?   =20
> >>>>
> >>>> Why keep it enabled if it is failing randomly   =20
> >>>
> >>> We can still disable single jobs if they are not stable, but that's n=
o
> >>> reason to disable all of them by default, is it?
> >>>    =20
> >>>> if images hardcoded
> >>>> in tests are being removed from public servers, etc...?   =20
> >>>
> >>> That's independent from Avocado, you'll always have that problem if y=
ou want
> >>> to test with external images, unless you mirror them into a repositor=
y on
> >>> the same server (ie. gitlab), which, however, might not always be pos=
sible...
> >>>    =20
> >>>> They are not disabled, they are still runnable manually or setting
> >>>> QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE...   =20
> >>>
> >>> And who do you think is going to set that variable? Hardly anybody, I=
 guess.   =20
> >>
> >> Does that mean nobody cares about these tests? =20
> >=20
> > If I first have to set some random config option before tests are run,
> > that's an extra hurdle. I want a simple workflow where I just push to
> > gitlab and don't have to care about extra configuration. =20
>=20
> Good, that means you are not particularly interested by
> this specific test, so you don't need to set
> QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE.

Confused. Why does that mean I'm not interested in that test? If I push
to gitlab, I want every reasonable test to be run, without needing to
change specific configs.

>=20
> >  =20
> >> =20
> >>> So you could also simply remove the stuff from the yml file completel=
y instead.   =20
> >>
> >> Yes, I'd prefer that too, but Alex objected.
> >> =20
> >>>> We realized by default Avocado runs all tests on the CI jobs,
> >>>> triggering failures and complains. Developer stopped to contribute/
> >>>> review integration tests because of that.   =20
> >>>
> >>> Did anybody really stop contributing "acceptance" test since they wer=
e
> >>> afraid of the gitlab-CI running them? That's new to me, do you have a=
 pointer?   =20
> >>
> >> No, but alternatively, how many tests were contributed / reviewed
> >> last year? =20
> >=20
> > I added one, just last week... plan to do more, but there's always less
> > time than things I want/need to do. Maybe this just needs more
> > advertising? =20
>=20
> I noticed your test. Do you plan it to be run regularly on CI too
> (a.k.a. a gating test)?

If it proves stable, most definitely yes, as it would have caught a
recent regression.

>=20
> It is small, simple, run fast, it got quickly reviewed.
>=20
> Nobody cared to review the COLO test 3 months, because it is
> more complex:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg727381.html

Well, that's because of the complexity, not because of the test
framework, isn't it?

>=20
> >  =20
> >> =20
> >>>> We want developers be
> >>>> able to contribute tests to the repository fearlessly.   =20
> >>>
> >>> You can always mark your test with @skipIf(os.getenv('GITLAB_CI')) if=
 you
> >>> don't want to see it running in the gitlab-CI, so that's not a reason=
 to be
> >>> afraid.   =20
> >>
> >> This was the idea here (opposite, tag jobs with 'gating-ci' to run
> >> them on GitLab):
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg756464.html =20
> >=20
> > I guess you want all of that:
> > - tag tests that you know to not work, so they're not run
> > - tag tests that you know to be stable, so they can be gating
> > - all non-tagged tests are expected to work usually, but there might be
> >   an occasional failure
> > ? =20
>=20
> Yes, but IIUC Alex didn't agree to use a gating tag for stable
> tests, he wants everything to be run on GitLab.
>=20
> >  =20
> >> =20
> >>>    =20
> >>>> If we don't change anything, we'll keep having CI failures due
> >>>> to Avocado design issues (artifacts removed from remote servers,
> >>>> etc...).   =20
> >>>
> >>> I fail to see the relation between Avocado and vanishing artifacts fr=
om 3rd
> >>> party servers... what do you plan to do instead if something gets (re=
-)moved
> >>> from a server that is not under our control?   =20
> >>
> >> Avocado tests and CI are orthogonal, but it will be painful to
> >> fix Avocado tests with the current Avocado CI jobs. =20
> >=20
> > What's the problem? Cryptic error messages when artifacts cannot be
> > fetched? =20
>=20
> More importantly to display a reproducible command line on failure.

Yes, it's sometimes hard to coax out of Avocado what exactly went
wrong, and how to reproduce it.

>=20
> But there are some design issue (Avocado was not design to run on
> CI environment at all) that will be hard to solve if we have to keep
> what we current have.

I'll let the people more familiar with Avocado speak up here. However,
if we turn off the Avocado tests now without having replacements, we'll
get worse coverage.

>=20
> >  =20
> >> =20
> >>>    =20
> >>>> I haven't seen any attempt on this list to improve the current
> >>>> fragile situation, but better suggestions are certainly welcome.   =
=20
> >>>
> >>> At least I am hoping that the "check-acceptance" tests will break a l=
ittle
> >>> bit less often once Peter uses the gitlab-CI for his gating tests, to=
o. That
> >>> will at least prevent that one of the tests gets completely broken by=
 a new
> >>> merged pull request. Of course there's still the risk that tests only=
 fail
> >>> occasionally due to new bugs, but that can also happen for all other =
test
> >>> suites (unit, qtest, iotests, ...), too.   =20
> >>
> >> Or Peter (as other users) will get grumpy at these tests because they
> >> are unreliable, hard to understand what fail and debug.
> >>
> >> Thus the removal suggestion, so we can "fix" the missing Avocado parts
> >> before it is used heavily. =20
> >=20
> > I think disabling _all_ of them is way too harsh. =20
>=20
> I'm looking for ways to:
>=20
> - allow developers to contribute integration tests easily,
>   not being blocked by CI.
> - allow maintainers to expand their default tests set (by
>   marking non-gating tests as gating for their workflow).
> - allow developers to disable tests they are not interested
>   in to reduce how many CI minutes they burn on each pipeline
> - figure out who to contact in case a job failed (runner
>   owner? test owner? breaking patch author?)
>=20
> I thought marking our current jobs as optional would be simpler
> that introducing an Avocado2 framework and duplicating the tests,
> so I wanted to try the fast path first.

More fine-granular control is certainly desirable; however, if we make
too many tests opt-in, it becomes more likely that nobody runs them. I
generally want (as a maintainer) to run as many tests as possible, and
not waste any brain cycles on what I need to enable where to get more
coverage.


