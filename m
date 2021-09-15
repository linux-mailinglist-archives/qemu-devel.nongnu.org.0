Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CD040C71A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:11:05 +0200 (CEST)
Received: from localhost ([::1]:32800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVcu-0003MC-6W
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQVa6-0001GR-CW
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQVa2-0005b6-72
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631714885;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkEn7bEgjfanNszuEjMDa/m39ue20Jtz0kPVX03JWJg=;
 b=hGAzRvzGfJJ5uqae8cnVYM/GgM0gVi7IaNBe2ZG0aVTqFPSsDubkU9tedZKhnYL+552CYg
 vM5PZMhrJLSG3y2/AfrfoybLODcnns/2APdI4N1cwyaBFKCgI6DNHEvJoDhfIqzJwT6RHx
 663Md6rSU8WCzyuqJ1cvyZBfmCwFsYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-3bLpb-S2MNOO7GGSi5plGw-1; Wed, 15 Sep 2021 10:07:51 -0400
X-MC-Unique: 3bLpb-S2MNOO7GGSi5plGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63C6691270;
 Wed, 15 Sep 2021 14:07:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 436C05C1D1;
 Wed, 15 Sep 2021 14:07:43 +0000 (UTC)
Date: Wed, 15 Sep 2021 15:07:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [RFC 1/1] docs/deve/ci-plan: define a high-level plan for the
 QEMU GitLab CI
Message-ID: <YUH+LBhlFAz7IJR1@redhat.com>
References: <20210914184830.84454-1-willianr@redhat.com>
 <20210914184830.84454-2-willianr@redhat.com>
 <YUG2CnZalmiTMAGb@redhat.com>
 <CAKJDGDb-4kTDFHX9J-kf13E2AXnhMz4EDNZGODSFTrTfrCUbBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKJDGDb-4kTDFHX9J-kf13E2AXnhMz4EDNZGODSFTrTfrCUbBA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 10:51:56AM -0300, Willian Rampazzo wrote:
> On Wed, Sep 15, 2021 at 6:00 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Sep 14, 2021 at 03:48:30PM -0300, Willian Rampazzo wrote:
> > > This adds a high-level plan for the QEMU GitLab CI based on use cases.
> > > The idea is to have a base for evolving the QEMU CI. It sets high-level
> > > characteristics for the QEMU CI use cases, which helps guide its
> > > development.
> > >
> > > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > > ---
> > >  docs/devel/ci-plan.rst | 77 ++++++++++++++++++++++++++++++++++++++++++
> > >  docs/devel/ci.rst      |  1 +
> > >  2 files changed, 78 insertions(+)
> > >  create mode 100644 docs/devel/ci-plan.rst
> > >
> > > diff --git a/docs/devel/ci-plan.rst b/docs/devel/ci-plan.rst
> > > new file mode 100644
> > > index 0000000000..5e95b6bcea
> > > --- /dev/null
> > > +++ b/docs/devel/ci-plan.rst
> > > @@ -0,0 +1,77 @@
> > > +The GitLab CI structure
> > > +=======================
> > > +
> > > +This section describes the current state of the QEMU GitLab CI and the
> > > +high-level plan for its future.
> > > +
> > > +Current state
> > > +-------------
> > > +
> > > +The mainstream QEMU project considers the GitLab CI its primary CI system.
> > > +Currently, it runs 120+ jobs, where ~36 are container build jobs, 69 are QEMU
> > > +build jobs, ~22 are test jobs, 1  is a web page deploy job, and 1 is an
> > > +external job covering Travis jobs execution.
> > > +
> > > +In the current state, every push a user does to its fork runs most of the jobs
> > > +compared to the jobs running on the main repository. The exceptions are the
> > > +acceptance tests jobs, which run automatically on the main repository only.
> > > +Running most of the jobs in the user's fork or the main repository is not
> > > +viable. The job number tends to increase, becoming impractical to run all of
> > > +them on every single push.
> > > +
> > > +Future of QEMU GitLab CI
> > > +------------------------
> > > +
> > > +Following is a proposal to establish a high-level plan and set the
> > > +characteristics for the QEMU GitLab CI. The idea is to organize the CI by use
> > > +cases, avoid wasting resources and CI minutes, anticipating the time GitLab
> > > +starts to enforce minutes limits soon.
> > > +
> > > +Use cases
> > > +^^^^^^^^^
> > > +
> > > +Below is a list of the most common use cases for the QEMU GitLab CI.
> > > +
> > > +Gating
> > > +""""""
> > > +
> > > +The gating set of jobs runs on the maintainer's pull requests when the project
> > > +leader pushes them to the staging branch of the project. The gating CI pipeline
> > > +has the following characteristics:
> > > +
> > > + * Jobs tagged as gating run as part of the gating CI pipeline;
> > > + * The gating CI pipeline consists of stable jobs;
> > > + * The execution duration of the gating CI pipeline should, as much as possible,
> > > +   have an upper bound limit of 2 hours.
> > > +
> > > +Developers
> > > +""""""""""
> > > +
> > > +A developer working on a new feature or fixing an issue may want to run/propose
> > > +a specific set of tests. Those tests may, eventually, benefit other developers.
> > > +A developer CI pipeline has the following characteristics:
> > > +
> > > + * It is easy to run current tests available in the project;
> > > + * It is easy to add new tests or remove unneeded tests;
> > > + * It is flexible enough to allow changes in the current jobs.
> > > +
> > > +Maintainers
> > > +"""""""""""
> > > +
> > > +When accepting developers' patches, a maintainer may want to run a specific
> > > +test set. A maintainer CI pipeline has the following characteristics:
> > > +
> > > + * It consists of tests that are valuable for the subsystem;
> > > + * It is easy to run a set of specific tests available in the project;
> > > + * It is easy to add new tests or remove unneeded tests.
> >
> >
> > Neither of these describe why I use CI as a developer and/or subsys
> > maintainer.
> >
> > My desire with using CI is to (as close as possible) be able to
> > execute the exact same  set of tests that will be run by gating CI
> > on pull requests.
> 
> I totally understand your desire and I think it is valid.
> 
> What I'm trying with this proposal is the same strategy we used when
> we started planning for the gating CI. The decision was to start
> small. Today the CI grew and we don´t have a so called gating CI yet,
> but a bunch of jobs that runs on staging branch, some needing
> reevaluation whether they should run on staging or not.

Of course we have a gating CI today, it is the very thing you just
described. Whether or not the set of CI jobs that run on staging is
designed ground up, or evolved organically is irrelevant. It is what
exists today and is used to test merges to master, so by definition
is is our gating CI.  The set of jobs will never be perfect because
we're in a changing world, so they will always need re-evaluation
periodically to judge whether they're the right mix for our current
needs.

> > My goal is to minimize (ideally eliminate) the risk that a patch
> > series or pull request gets rejected with a need to re-spin due
> > to CI failures. Each such rejection causes a round trip delaying
> > merge, and this wastes my time & the maintainer/gate keepers' time.
> > It is also hard to debug failures if I can't replicate the gating
> > CI myself.
> 
> Again, I totally agree with you. That would be the perfect scenario.

Aside from the custom runners, it is the scenario that exists today
and is relied on by many people. That existing usage and starting 
point has to be acknowledged in any CI plan that is proposed.

> The barrier I see to have it working the way you described is the
> hardware access. The staging branch runs on two different custom
> runners. We have two possible solutions to accomplish the scenario you
> described: remove the custom runners from the staging branch and let
> the jobs run on the GitLab CI shared runners, which everyone with
> access to GitLab can use, or allow developers to access the custom
> runners.

It isn't that large of a barrier IMHO. It will be slow, but people
can bring up custom runners for ppc/s390 using QEMU VMs if they lack
access to hardware. The most important is the build coverage and 
that's already acquired via the cross compilers. The custom runners 
essentially only add "make check" as a benefit.

> Today, I don´t think any of those options are feasible or bring value
> to the project. That is one of the reasons I'm not covering it now in
> the future plan. As I mentioned before, let's take another small step
> and organize a gating CI with some ground rules. When we reach it, the
> future future step can be to implement merge requests, think about
> reproducibility, and so on.

Being able to replicate gating CI jobs as a contributor is the most 
critical starting point for any plan. Historically diagnosing failures
in gating CI has been the biggest pain point in submitting code to QEMU,
and why myself and others have spent so much time on Travis, and now 
GitLab config to let us have a well defined environment and ruleset for
build jobs. That can't be ignored by any proposed CI plan.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


