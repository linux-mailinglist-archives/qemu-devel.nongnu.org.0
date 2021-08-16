Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350893ED2DD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:05:45 +0200 (CEST)
Received: from localhost ([::1]:39484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFaR6-0006RC-9e
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFaPh-0005gs-3f
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFaPc-000310-Df
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629111851;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEfrOQSVkbd6s2mNYl3yUKg5TbIOe+y4OsCD9TgTM7E=;
 b=PXUpFaSgW35hX4TbcA/i9/dz3BzR36IuvJKD+qi+PHdEq/ZNPBvCEy+d9d278Dkbb8Dvm8
 fOyvqE8aBfZ9rh5Iay3tB+OL/afqCk2X04GWTyiHeeM3xXtVAqkakBowAFD1JPxz8Rj6H/
 c6jxtXD1Cl/PVBd2XdW9rEOc9oCJvoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-mGsFqyiJOCS9GQfu2hN8cQ-1; Mon, 16 Aug 2021 07:04:04 -0400
X-MC-Unique: mGsFqyiJOCS9GQfu2hN8cQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84EDD8799E0;
 Mon, 16 Aug 2021 11:04:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7372D60FB8;
 Mon, 16 Aug 2021 11:03:53 +0000 (UTC)
Date: Mon, 16 Aug 2021 12:03:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
Message-ID: <YRpGFnvZznlU9RKQ@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com>
 <87y291u0st.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87y291u0st.fsf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 12:44:02PM +0200, Cornelia Huck wrote:
> On Thu, Aug 12 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > Currently pushes to user forks run the same set of build / test jobs as
> > pushes to the main repo. This results in creation of 120+ individual
> > jobs. While it is useful for subsystem maintainers, and even regular
> > contributors to be able to run the full set of jobs, it is wasteful to
> > run all of them all the time.
> >
> > In addition, with the expected change in GitLab to set a finite CI
> > minute allowance on all users we need to be much more conservative.
> >
> > This patch thus sets up rules so that no CI jobs will run by default
> > on push, except
> >
> >  - Pushes to branch name prefix 'staging' on 'qemu-project' repo
> >    run full set of jobs
> >  - Pushes to 'master' branch, only run jobs needed to publish
> >    the website.
> >
> > In any pushes to users forks, CI is now strictly opt-in. The pipeline
> > will always be created by every singe job will be marked manual. You
> > can then use the web UI to start individual jobs.
> 
> Is a random user notified in some way that a pipeline with jobs that can
> be triggered manually has been created?

I don't believe there's any notification.


> > The minimal job set covers:
> >
> >   * Fedora, CentOS, Ubuntu & Debian system emulator builds
> >     to cover all arch targets.
> >   * Linux user static build
> >   * Cross build i386 (to identify any 32-bit build issues)
> >   * Cross build s390x (to identify any big endian build issues)
> >   * Containers needed for the above
> >   * Cirrus CI FreeBSD 12 and macOS 11 (to identify non-Linux issues)
> >   * Simple checks - python unittests, DCO check, checkpatch.pl, etc
> >
> > This gives about 30 jobs instead of 120 from the "Full" group. It
> > is likely reasonable to cut the minimal set down even more, as IMHO
> > there are too many system emulator jobs there.
> 
> Where do you think we should start to cut them down? Limit the set of
> tested arch targets to the most common ones?

Some of our targets are obviously much more important and
frequently changed than others.  For contributors our goal is
to mimimize breakage after patches are submitted. Most of our
contributors changes will be well covered by x86-64 + aarch64
alone. Other targets give varying degrees of extra benefit.

On the other hand the contributors are likely to have tested
x86_64 or aarch64 themselves since that'll be their dev
platform. So the benefit of CI is testing bits that they
didnt bother to test.

No clear easy answer here, but I feel like we could benefit
from classifying our target archs tier 1/2/3 and tailoring
our default testing matrix accordingly.

The other way to cut down the "minimal" set is to reduce
the OS containers that we build. The jobs above end up
requiring something like 8 container builds - we should
try to cut this down to perhaps 2-3 container builds

> Generally speaking, this makes sense; but I think we have different
> situations which need different kinds of testing, and we should make it
> as easy as possible to run the right set of tests.
> 
> (a) an individual contributor is doing some changes
> 
> In that case, I assume (hope?) that the contributor has actually
> compiled the code for the relevant targets and has done some manual
> testing. Running acceptance tests locally would also be good, or things
> like iotests or check-tcg, when applicable.

With my contributor hat on, I like GitLab CI to validate the platforms
I always forget. Changes I do are 95% tested on Fedora x86_64. I have
often broken stuff for non-Linux builds (Windows in particular), or
have broken non-x86_64 target arches. CI lets me see this before
sending patches.  Unfortunately this means I benefit most from the
"full" set, but this won't be sustainable with limited CI minutes :-(

When I'm working on changing gitlab CI rules, then I burn loads of
minutes which is especially troubling - limited CI minutes will make
it very hard for me to debug future CI rule changes :-(

> (b) a subsystem maintainer is queuing some changes
> 
> Some more comprehensive automated testing, and likely some
> subsystem-specific testing on top (like testing that requires
> specialized hardware, manual interventions, etc.) Since the introduction
> of gitlab-ci, I had relied on what you call the 'full' set to be run
> automatically when I push to my staging branch, plus my manual
> testing. Prior to that, I relied on patchew and ran tests
> locally. Drawbacks of that: it hogs my development machine, and it is
> easy to forget something.

> If I pull from a sub-submaintainer, I assume that everything is already
> in good order, and only do some very light sanity/integration
> checking. Although we're hardly doing subsystem pull request nowadays.

Yes, I think that 'minimal' ought to be a good "smoke test" to run
when queuing changes, on the assumption you'll run a full/gating set
before sending the final pull.

> (c) a subsystem maintainer is preparing a pull request
> 
> Ideally, that should run the 'gating' set, to eliminate needless bounces
> of the pull request; plus some subsystem-specific manual testing on
> top. In practice, the 'full' set might be good enough.

Yeah, the full/gating set is what I would thing subsys maintainers
would want to use, to minimize risk that Peter's tests throw back
the merge due to failure. The only difference of gating vs full
is whether the acceptance tests run.

> Couple of ideas from my side:
> - include some scripts/make targets that guide an individual contributor
>   to run a good subset of automated tests locally

We've got various make targets right now, but they don't guide users
as to what is the most beneficial thing to run.

> - define a 'ci-subsystem' set that covers usual pain points for a
>   subsystem
> - have subsystem maintainers run a pull req test in the qemu-project
>   context (i.e. using extra CI minutes that the project may have), or
>   put them on a special list on subsystem maintainers so they can use
>   more minutes

I think ultimately we should be looking to take email out of the loop
for merging pull requests from subsys maintainers.

If we expect subsys maintainers to use gitlab CI before sending, then
we have a crazy situation where subsys maintainers pushes to gitlab,
has CI run, then send email PULL to list, then Peter downloads and
applies the mails, and pushes back to gitlab and runs CI again and
then pushes to gitlab again for master.

It would be much simpler if the subsys maintainer pushes to gitlab
and opens a merge request. This would trigger the CI gating runs,
consuming minutes from the QEMU project, not the maintainer. Peter
can ignore merge request until CI passes. The subsys maintainer
is responsible for getting CI to pass. Once CI passes, the merge
request could be apporved and merged. The person approving it for
merge should really only need to validate the the non-automatable
stuff. eg it meets the current freeze rules; the maintainer is
the owner of the subsystem being modified, etc.

Of course this relies on us being able to use GitLab for 100% of
merge time gating. Cleber's custom runners recently enabled get
us closer, but I think Peter still uses some other hardware
outside of GitLab for some testing.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


