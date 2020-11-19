Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102672B9097
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:05:21 +0100 (CET)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhke-000510-4L
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfhjB-0004BZ-PW
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfhj3-0000jj-GK
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605783820;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=TGjVLszc0H4u1S356r4SCnsrKAqW3VfHPUEJTqahHY8=;
 b=hSyzV4BHV0YTFjKq30BDyawjZbwh6KxyhjCmlgvLTgT26HlI+hXlYAdbURdFbQdy2ikq/j
 dpi+miMHPuQmxH2SJT4/kOMNHYA2y4kMMheLUsZMSKKYFsG6fmBSnfWbBZFjGacSFenD2c
 x/uLzmuLaE84Dq3FB99QiJNsGlfQ6nQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-Xbl6GUefN9SF83e12-t4Iw-1; Thu, 19 Nov 2020 06:03:21 -0500
X-MC-Unique: Xbl6GUefN9SF83e12-t4Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64D2F801B14
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:03:20 +0000 (UTC)
Received: from redhat.com (ovpn-114-191.ams2.redhat.com [10.36.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95ED919C47
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:03:19 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:03:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: RFC: Pull request testing expectations for subsystem maintainers
Message-ID: <20201119110316.GE579364@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a longish mail, so

[tldr]
  I propose that we require subsystem maintainers to run GitLab CI pipeline
  /before/ sending pull requests to qemu-devel. This will

   * reduce the burden on the person merging pull requests by making it
     less likely merge tests will fail, thus avoiding v2/v3/etc which
     add to volume of pending pulls.
   * reduce the burden on CI maintainers by avoiding breakage of our
     public CI post merge.
   * reduce the burden on subsystem maintainers by catching problems
     more quickly, avoiding delays in their pulls being merged

  Overall it will distribute the testing burden more equitably across
  our community, instead of today where the testing burden is focused on
  a small number of people.
[/tldr]

Now the longer back-story / justification...

When sending pull requests to qemu-devel for merge into master, there are
no formally defined expectations around the level of testing that has been
performed by the maintainer. It is up to the subsystem maintainer's
judgement as to the amount of testing that is appropriate.


This is positive for the individual subsystem maintainer when considering
sending one pull request in isolation, as the bar is quite low. IMHO this
is actually a negative thing for the QEMU project as a whole.

 * Pull requests that fail testing at time of applying to master waste the
   time of the gate keeper (Peter), because they are detecting problems
   that the subsystem maintainers could often have detected themselves.

 * Pull requests that fail testing at time of applying to master waste the
   time of the subsystem maintainer too, as it is a very slow / inefficient
   feedback loop between sending the PULL, getting the test failure results
   back, fixing the problem, and sending a new PULL.

 * Pull requests that pass testing at time of applying to master, but none
   the less break our public CI (GitLab, Travis, Cirrus) waste the time of
   our CI maintainers. Mostly the problem here is that we are not using our
   public CI as part of the gating tests.


Overall the big problem is that testing and monitoring of test results is
centralized onto too small a set of people (the person merging to git
master, and the people babysitting the public CI systems). This is not a
scalable approach and ultimately either limits the velocity of everything
sent for merge into master, and/or leads to burnout of people dealing with
failing CI.


The testing burden needs to be more equitably distributed across the QEMU
community.


The big reason that we've not placed specific testing pre-requisites for
the sending of pull requests is that, historically, the test environment
is only accessible to the person doing the merge to master, not the
subsystem maintainers, nor individual contributors. Maintainers were only
expected to have access to the specific OS used on their dev machine.


With our increasing use of automated CI platforms and provision of
standardized docker container & VM recipes as build environments, the
situation has already changed significantly and will continue to do so.


It is trivial for any contributor to get comprehensive testing cross many
platform combinations (build + tests across all Linux distros on x86 with
many different build config scenarios, build Windows via mingw32/64, build
Debian on non-x86 via cross compilers) using just GitLab CI pipelines. If
adding Cirrus CI, and Travis CI, even more combinations are added (macOS,
FreeBSD, native Windows, and some native non-x86).

In the not too distant future, the current CI setup for gating merges to
master, will be replaced by a system built on GitLab CI, so we'll get much
better alignment between our post-merge CI and our gating CI, preventing
more post merge CI failures and reducing burden on our CI maintainers.


The high frequency with which post-merge CI jobs break today, show that
subsystem maintainers are mostly only testing a narrow set of scenarios
before sending their pull requests. When gating merges to master is done
by GitLab CI, the number of configuration scenarios and platforms we'll
be testing will increase significantly. This is going to increase the
frequency with which pull requests are rejected due to failing tests.

We will have more v2, v3, pull requests posted which will increase the
burden on the person handling them. This is not going to be sustainable
and will limit our velocity unless we change our testing expectations.



We need to distribute the burden of testing more broadly, by introducing
a requirement for all pull requests to pass GitLab CI *before* being sent
as a PULL to the list. This might sound like a scary burden, but don't be
afraid, as it is much easier to achieve than one might realize.


Testing with GitLab CI merely requires pushing the queued patches to a
personal fork of the QEMU repository hosted on gitlab.com. Any time
patches are pushed to a fork they trigger a pipeline whose result are
presented at a URL

    https://gitlab.com/YOUR-USER-NAME/qemu/pipelines

There is a "scripts/ci/gitlab-pipeline-status" script that can be used to
monitor results from the terminal if web browsers are not your ideal UI.

IOW, in terms of workflow for a subsystem maintainer, the current process
is:

  1. Push to an arbitrary public git repo host
  2. Send patches to qemu-devel

With a requirement to pass GitLab CI before sending a pull, the workflow
would be more like

  1. Push patches to a personal gitlab.com QEMU fork
  2. Wait for CI results to arrive (typically 45-60 mins)
  3. If CI failed
       (a) fix problems, go to (1)
     else if CI passed
       (b) Send patches to qemu-devel


How will we verify that a pull request has a successful pipeline run
before merging it ? We could require that cover letter always point
to a gitlab.com repo, instead of arbitrary public git repo host. Or
we could just require the cover letter have a pointer to the GitLab
pipeline results page that matches the git commit ref. The former
would be simpler, as we could use scripts/ci/gitlab-pipeline-status
to validate it.

If this is done by all subsystem maintainers, then the number of PULL
requests that fail to pass gating tests should be significantly reduced.
It won't be zero because the gating tests will still run more jobs than
are available via the public runners. Also git master can move between the
time the maintainer runs CI and when their PULL is actually applied to
master, which can trigger test failures. Pulls should have a quicker turn
around time if we have less v2/v3/v4s clogging up the queue of pending
merges.



Earlier I mentioned that we have three CI systems (GitLab, Cirrus, Travis).
It is possible for maintainers to send to all three and wait for results.
This has a larger upfront setup burden in terms account creation and
configuration, as well as a larger burden in monitoring results. It is
better if we start off simple and only focus on GitLab CI, because that
runs the vast majority of our jobs, and is also what will soon be used as
a gating test for master. IOW, if subsystem mintainers want to test on
Cirrus/Travis, great, but lets consider that strictly optional.



If we want to take this a step further, then subsystem maintainers may
wish to have individual contributors to show that they have run CI tests
before queuing patches in a staging tree. This is probably unreasonable
for small patches especially from occassional contributors, but for large
or complex patch series, or regular contributors it is likely a net win
to set expectation that they should be testing via GitLab CI.

IOW, we should update our contributing guidelines to encourage, but not
mandate, patches be sent through GitLab CI before submission for review.
This should catch many of the silly mistakes contributors make in their
code, and reduce the burden on reviewers, and reduce problems hit later
by maintainers or gating CI.


Finally, some people may have noticed that GitLab is planning to reduce
the number of free CI minutes they provide to users. This has the potential
to be a significant problem to running QEMU GitLab CI tests. Many open
source projects have given them feedback about the negative impact it would
have and their response has been positive about wanting to find a mutually
acceptable solution to support OSS projects. We don't know the outcome yet,
but I'm somewhat positive there will be a viable solution. Worst case we
can go back to current situation with minimal testing of pull requests,
but I'm hopeful it won't come to that.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


