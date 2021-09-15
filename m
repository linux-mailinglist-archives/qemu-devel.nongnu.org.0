Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8B40C9C7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:08:59 +0200 (CEST)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXT0-0003U2-41
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQXL0-0003kF-3t
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQXKv-0003o5-P8
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631721636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAQ/kIkcyDIFosSKfvVNgZMhCwVjPxc6SL6vmUrClW4=;
 b=N5ytuA1AfkDodEOnpLLhy4pzCQFDqd4/8qGBosHmkps+8NvU4KH78e5h6vP2P9ka+ijjk+
 a2bOLA9Fo/1jdoOdeAoWCp0euDxnGLQ5VTrZwgoqvZj+o3fQEgFIjQUddGuX/yysS/rrJr
 GY2VhUFeeHZygBV1yLuKdS5Fv7R6HUc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-VdnHQrtfMUao6deMiz51fg-1; Wed, 15 Sep 2021 12:00:28 -0400
X-MC-Unique: VdnHQrtfMUao6deMiz51fg-1
Received: by mail-pj1-f69.google.com with SMTP id
 c2-20020a17090a558200b001873dcb7f09so1951752pji.7
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vAQ/kIkcyDIFosSKfvVNgZMhCwVjPxc6SL6vmUrClW4=;
 b=2WgXcYIDUuxC1cnU+riBJZ3QO1RoquuwR19b/jtQodHMbSFEZ2j2Sc8gfuVy4eP2Ie
 ATJB4eLaM18yqT6HysQNUuLEntrNeUhuT3Rea1lvdVXWhhFs7tGFBArwivzwhIjQ09up
 LPc0fy8Fu3hGyppC6taAxPeyWrsuyWG1Ooprmmv0Ur7z2ywkghhy4j1qTlY+t50BWcrC
 ZiLLlkN9OJLpQmXtarCX+TCrTnqXF1n2C/pf/+d3Wyx6PtMl+SN89buU0h79qnjsUcjw
 5J6e+oS55qz6UJSKU7mGjKFmRbyZuSwXm3a6G5tHtNp056B01CRBxdjBLwtX6YMrcP0H
 b32w==
X-Gm-Message-State: AOAM5306ziSHoKjJdXX11ekjJIfpOXlAD9ozXFHD3qb44c9bQG3xUxAX
 L9S5lJ2FLGPHLdKdbvfRc+uqRHL09P5G+CKmSafYMrh0IvrassfvEeBcixXJ9Szsw8cp4LH6NOM
 xx2azJb/bqYgQDv7GHEmQUXCeeUJj0U4=
X-Received: by 2002:a65:47cd:: with SMTP id f13mr414534pgs.439.1631721627190; 
 Wed, 15 Sep 2021 09:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2A24BTIvi5j1Y5opLH0AhhCCKis1yYcibX8dwJT6a8DaoWW+N7+dkT6iKOGwsZwwGSRY817y07FBbesZ+9DQ=
X-Received: by 2002:a65:47cd:: with SMTP id f13mr414502pgs.439.1631721626738; 
 Wed, 15 Sep 2021 09:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210914184830.84454-1-willianr@redhat.com>
 <20210914184830.84454-2-willianr@redhat.com>
 <YUG2CnZalmiTMAGb@redhat.com>
 <CAKJDGDb-4kTDFHX9J-kf13E2AXnhMz4EDNZGODSFTrTfrCUbBA@mail.gmail.com>
 <YUH+LBhlFAz7IJR1@redhat.com>
In-Reply-To: <YUH+LBhlFAz7IJR1@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 15 Sep 2021 12:59:59 -0300
Message-ID: <CAKJDGDY7KzJCqPJN2E=JKnZ9Yq47=1R7Sp5vHJpW2JoYP=3qWA@mail.gmail.com>
Subject: Re: [RFC 1/1] docs/deve/ci-plan: define a high-level plan for the
 QEMU GitLab CI
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 11:07 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Wed, Sep 15, 2021 at 10:51:56AM -0300, Willian Rampazzo wrote:
> > On Wed, Sep 15, 2021 at 6:00 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Tue, Sep 14, 2021 at 03:48:30PM -0300, Willian Rampazzo wrote:
> > > > This adds a high-level plan for the QEMU GitLab CI based on use cas=
es.
> > > > The idea is to have a base for evolving the QEMU CI. It sets high-l=
evel
> > > > characteristics for the QEMU CI use cases, which helps guide its
> > > > development.
> > > >
> > > > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > > > ---
> > > >  docs/devel/ci-plan.rst | 77 ++++++++++++++++++++++++++++++++++++++=
++++
> > > >  docs/devel/ci.rst      |  1 +
> > > >  2 files changed, 78 insertions(+)
> > > >  create mode 100644 docs/devel/ci-plan.rst
> > > >
> > > > diff --git a/docs/devel/ci-plan.rst b/docs/devel/ci-plan.rst
> > > > new file mode 100644
> > > > index 0000000000..5e95b6bcea
> > > > --- /dev/null
> > > > +++ b/docs/devel/ci-plan.rst
> > > > @@ -0,0 +1,77 @@
> > > > +The GitLab CI structure
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > > +
> > > > +This section describes the current state of the QEMU GitLab CI and=
 the
> > > > +high-level plan for its future.
> > > > +
> > > > +Current state
> > > > +-------------
> > > > +
> > > > +The mainstream QEMU project considers the GitLab CI its primary CI=
 system.
> > > > +Currently, it runs 120+ jobs, where ~36 are container build jobs, =
69 are QEMU
> > > > +build jobs, ~22 are test jobs, 1  is a web page deploy job, and 1 =
is an
> > > > +external job covering Travis jobs execution.
> > > > +
> > > > +In the current state, every push a user does to its fork runs most=
 of the jobs
> > > > +compared to the jobs running on the main repository. The exception=
s are the
> > > > +acceptance tests jobs, which run automatically on the main reposit=
ory only.
> > > > +Running most of the jobs in the user's fork or the main repository=
 is not
> > > > +viable. The job number tends to increase, becoming impractical to =
run all of
> > > > +them on every single push.
> > > > +
> > > > +Future of QEMU GitLab CI
> > > > +------------------------
> > > > +
> > > > +Following is a proposal to establish a high-level plan and set the
> > > > +characteristics for the QEMU GitLab CI. The idea is to organize th=
e CI by use
> > > > +cases, avoid wasting resources and CI minutes, anticipating the ti=
me GitLab
> > > > +starts to enforce minutes limits soon.
> > > > +
> > > > +Use cases
> > > > +^^^^^^^^^
> > > > +
> > > > +Below is a list of the most common use cases for the QEMU GitLab C=
I.
> > > > +
> > > > +Gating
> > > > +""""""
> > > > +
> > > > +The gating set of jobs runs on the maintainer's pull requests when=
 the project
> > > > +leader pushes them to the staging branch of the project. The gatin=
g CI pipeline
> > > > +has the following characteristics:
> > > > +
> > > > + * Jobs tagged as gating run as part of the gating CI pipeline;
> > > > + * The gating CI pipeline consists of stable jobs;
> > > > + * The execution duration of the gating CI pipeline should, as muc=
h as possible,
> > > > +   have an upper bound limit of 2 hours.
> > > > +
> > > > +Developers
> > > > +""""""""""
> > > > +
> > > > +A developer working on a new feature or fixing an issue may want t=
o run/propose
> > > > +a specific set of tests. Those tests may, eventually, benefit othe=
r developers.
> > > > +A developer CI pipeline has the following characteristics:
> > > > +
> > > > + * It is easy to run current tests available in the project;
> > > > + * It is easy to add new tests or remove unneeded tests;
> > > > + * It is flexible enough to allow changes in the current jobs.
> > > > +
> > > > +Maintainers
> > > > +"""""""""""
> > > > +
> > > > +When accepting developers' patches, a maintainer may want to run a=
 specific
> > > > +test set. A maintainer CI pipeline has the following characteristi=
cs:
> > > > +
> > > > + * It consists of tests that are valuable for the subsystem;
> > > > + * It is easy to run a set of specific tests available in the proj=
ect;
> > > > + * It is easy to add new tests or remove unneeded tests.
> > >
> > >
> > > Neither of these describe why I use CI as a developer and/or subsys
> > > maintainer.
> > >
> > > My desire with using CI is to (as close as possible) be able to
> > > execute the exact same  set of tests that will be run by gating CI
> > > on pull requests.
> >
> > I totally understand your desire and I think it is valid.
> >
> > What I'm trying with this proposal is the same strategy we used when
> > we started planning for the gating CI. The decision was to start
> > small. Today the CI grew and we don=C2=B4t have a so called gating CI y=
et,
> > but a bunch of jobs that runs on staging branch, some needing
> > reevaluation whether they should run on staging or not.
>
> Of course we have a gating CI today, it is the very thing you just
> described. Whether or not the set of CI jobs that run on staging is
> designed ground up, or evolved organically is irrelevant. It is what
> exists today and is used to test merges to master, so by definition
> is is our gating CI.  The set of jobs will never be perfect because
> we're in a changing world, so they will always need re-evaluation
> periodically to judge whether they're the right mix for our current
> needs.

Okay, let me rephrase my sentence. Today the CI grew, and we have an
opportunity to improve the gating CI to reduce the number of manual
interventions we have and make it fit the project better. For example,
during the release freeze window, or right before it, sometimes the
gating CI execution was ignored because it took too much time to
execute. Another example is the set of flaky tests we have running
today. They should not be part of the gating CI.

>
> > > My goal is to minimize (ideally eliminate) the risk that a patch
> > > series or pull request gets rejected with a need to re-spin due
> > > to CI failures. Each such rejection causes a round trip delaying
> > > merge, and this wastes my time & the maintainer/gate keepers' time.
> > > It is also hard to debug failures if I can't replicate the gating
> > > CI myself.
> >
> > Again, I totally agree with you. That would be the perfect scenario.
>
> Aside from the custom runners, it is the scenario that exists today
> and is relied on by many people. That existing usage and starting
> point has to be acknowledged in any CI plan that is proposed.

If I understood correctly, we should first find a way to let the
developers run the same jobs as the gating CI and then think about
other improvements, right? I can adjust the proposal to list that, no
problem. At least we have a plan.

>
> > The barrier I see to have it working the way you described is the
> > hardware access. The staging branch runs on two different custom
> > runners. We have two possible solutions to accomplish the scenario you
> > described: remove the custom runners from the staging branch and let
> > the jobs run on the GitLab CI shared runners, which everyone with
> > access to GitLab can use, or allow developers to access the custom
> > runners.
>
> It isn't that large of a barrier IMHO. It will be slow, but people
> can bring up custom runners for ppc/s390 using QEMU VMs if they lack
> access to hardware. The most important is the build coverage and
> that's already acquired via the cross compilers. The custom runners
> essentially only add "make check" as a benefit.

Okay, I can adjust the plan to list this too. My only concern is about
those developers that do not have access to a custom runner, but we
can discuss it during the implementation.

>
> > Today, I don=C2=B4t think any of those options are feasible or bring va=
lue
> > to the project. That is one of the reasons I'm not covering it now in
> > the future plan. As I mentioned before, let's take another small step
> > and organize a gating CI with some ground rules. When we reach it, the
> > future future step can be to implement merge requests, think about
> > reproducibility, and so on.
>
> Being able to replicate gating CI jobs as a contributor is the most
> critical starting point for any plan. Historically diagnosing failures
> in gating CI has been the biggest pain point in submitting code to QEMU,
> and why myself and others have spent so much time on Travis, and now
> GitLab config to let us have a well defined environment and ruleset for
> build jobs. That can't be ignored by any proposed CI plan.

Alright, I can adjust the plan to add this too.

And just a side note, I never said the work done until now is not
valuable. I'm sure all the work done until now in the CI is valuable.
I feel today that we reached a point where we need to talk about the
next steps. I personally find it difficult to contribute with the CI
because there are diverging ideas about what we should do next, so
having a high-level plan helps newcomers interested in contributing
with the CI.

>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


