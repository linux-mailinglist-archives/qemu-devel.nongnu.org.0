Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC3E3ED22F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 12:45:12 +0200 (CEST)
Received: from localhost ([::1]:53658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFa7D-0003eI-Q1
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 06:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFa6H-0002r7-1f
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 06:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFa6D-0002Wi-IW
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 06:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629110647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zmd9bvgMwdqu8kebuj4nJD7yhSpFRZ3ucJltuX3cKQg=;
 b=drdyALQYVv7mA6W3DtaDng8dpFKoed0uEDBal5ihrtacj3oF61a3LoK93iko2EhD4Q7LRA
 1FsH6RGNKqCkq9w5F2wvUcnsyXxq2U9u66WN/2shgcbltFJ0scT2OTQDIgz6uxwwaywCll
 AyY0ClR/C6Ak3ng1zCNmjQxLAMToi94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-1WGyDnDVMmahaMs6fGEZJg-1; Mon, 16 Aug 2021 06:44:05 -0400
X-MC-Unique: 1WGyDnDVMmahaMs6fGEZJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A81E7801B3D;
 Mon, 16 Aug 2021 10:44:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46E26100763B;
 Mon, 16 Aug 2021 10:44:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to
 user forks
In-Reply-To: <20210812180403.4129067-3-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 16 Aug 2021 12:44:02 +0200
Message-ID: <87y291u0st.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> Currently pushes to user forks run the same set of build / test jobs as
> pushes to the main repo. This results in creation of 120+ individual
> jobs. While it is useful for subsystem maintainers, and even regular
> contributors to be able to run the full set of jobs, it is wasteful to
> run all of them all the time.
>
> In addition, with the expected change in GitLab to set a finite CI
> minute allowance on all users we need to be much more conservative.
>
> This patch thus sets up rules so that no CI jobs will run by default
> on push, except
>
>  - Pushes to branch name prefix 'staging' on 'qemu-project' repo
>    run full set of jobs
>  - Pushes to 'master' branch, only run jobs needed to publish
>    the website.
>
> In any pushes to users forks, CI is now strictly opt-in. The pipeline
> will always be created by every singe job will be marked manual. You
> can then use the web UI to start individual jobs.

Is a random user notified in some way that a pipeline with jobs that can
be triggered manually has been created?

> For more convenience there are three levels of increasing comprehensive
> CI job sets that can be chosen between
>
>  - Gating - run exactly the same as pushes to 'staging' branch
>             (except for jobs needing custom runners)
>
>    Push to 'ci-gating-xxx' branch, or set env QEMU_CI_GATING=3D1
>
>  - Full - same as 'Gating', except that acceptance tests don't
>           get run. This is equivalent to historical CI behaviour
> =09  for pushes to user forks.
>
>    Push to 'ci-full-xxx' branch, or set env QEMU_CI_FULL=3D1
>
>  - Minimal - a significantly cut down set of jobs to get a
>              decent sanity check of builds without burning
> =09     massive amounts of CI time.
>
>    Push to 'ci-min-xxx' branch, or set env QEMU_CI=3D1
>
> The minimal job set covers:
>
>   * Fedora, CentOS, Ubuntu & Debian system emulator builds
>     to cover all arch targets.
>   * Linux user static build
>   * Cross build i386 (to identify any 32-bit build issues)
>   * Cross build s390x (to identify any big endian build issues)
>   * Containers needed for the above
>   * Cirrus CI FreeBSD 12 and macOS 11 (to identify non-Linux issues)
>   * Simple checks - python unittests, DCO check, checkpatch.pl, etc
>
> This gives about 30 jobs instead of 120 from the "Full" group. It
> is likely reasonable to cut the minimal set down even more, as IMHO
> there are too many system emulator jobs there.

Where do you think we should start to cut them down? Limit the set of
tested arch targets to the most common ones?

Generally speaking, this makes sense; but I think we have different
situations which need different kinds of testing, and we should make it
as easy as possible to run the right set of tests.

(a) an individual contributor is doing some changes

In that case, I assume (hope?) that the contributor has actually
compiled the code for the relevant targets and has done some manual
testing. Running acceptance tests locally would also be good, or things
like iotests or check-tcg, when applicable.

(b) a subsystem maintainer is queuing some changes

Some more comprehensive automated testing, and likely some
subsystem-specific testing on top (like testing that requires
specialized hardware, manual interventions, etc.) Since the introduction
of gitlab-ci, I had relied on what you call the 'full' set to be run
automatically when I push to my staging branch, plus my manual
testing. Prior to that, I relied on patchew and ran tests
locally. Drawbacks of that: it hogs my development machine, and it is
easy to forget something.

If I pull from a sub-submaintainer, I assume that everything is already
in good order, and only do some very light sanity/integration
checking. Although we're hardly doing subsystem pull request nowadays.

(c) a subsystem maintainer is preparing a pull request

Ideally, that should run the 'gating' set, to eliminate needless bounces
of the pull request; plus some subsystem-specific manual testing on
top. In practice, the 'full' set might be good enough.

Couple of ideas from my side:
- include some scripts/make targets that guide an individual contributor
  to run a good subset of automated tests locally
- define a 'ci-subsystem' set that covers usual pain points for a
  subsystem
- have subsystem maintainers run a pull req test in the qemu-project
  context (i.e. using extra CI minutes that the project may have), or
  put them on a special list on subsystem maintainers so they can use
  more minutes


