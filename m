Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0D63ED364
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:49:22 +0200 (CEST)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFb7J-0008AI-7W
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFb5R-00076p-N1
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mFb5P-0002LK-3t
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629114442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFhataG0gl4y6u8jHdK0tdXkqr7AznQGTY1oyXNJpGg=;
 b=QpdTEvCi3xXMVJ+lKbKXGyfVMRrFK/wIhILez61OSUfhPvnyg+fPsE1rrVIcSikjIni3gb
 BK0Gq3VoIlULA3tXPVgzuprHZkddUal6XUd7qtcSTQAOzYn/1kiV4yzUFf+0LFmQDgZahB
 L6WjRYrlTh6mVSG16irOd6ccWRq5/tY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-vlX2kOaVOG6Fv222T-16uQ-1; Mon, 16 Aug 2021 07:47:19 -0400
X-MC-Unique: vlX2kOaVOG6Fv222T-16uQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B61BB1008064;
 Mon, 16 Aug 2021 11:47:18 +0000 (UTC)
Received: from localhost (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C9A75D6A1;
 Mon, 16 Aug 2021 11:47:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to
 user forks
In-Reply-To: <YRpGFnvZznlU9RKQ@redhat.com>
Organization: Red Hat GmbH
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com> <87y291u0st.fsf@redhat.com>
 <YRpGFnvZznlU9RKQ@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 16 Aug 2021 13:47:08 +0200
Message-ID: <87v945txvn.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Aug 16, 2021 at 12:44:02PM +0200, Cornelia Huck wrote:
>> On Thu, Aug 12 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote=
:
>>=20
>> > Currently pushes to user forks run the same set of build / test jobs a=
s
>> > pushes to the main repo. This results in creation of 120+ individual
>> > jobs. While it is useful for subsystem maintainers, and even regular
>> > contributors to be able to run the full set of jobs, it is wasteful to
>> > run all of them all the time.
>> >
>> > In addition, with the expected change in GitLab to set a finite CI
>> > minute allowance on all users we need to be much more conservative.
>> >
>> > This patch thus sets up rules so that no CI jobs will run by default
>> > on push, except
>> >
>> >  - Pushes to branch name prefix 'staging' on 'qemu-project' repo
>> >    run full set of jobs
>> >  - Pushes to 'master' branch, only run jobs needed to publish
>> >    the website.
>> >
>> > In any pushes to users forks, CI is now strictly opt-in. The pipeline
>> > will always be created by every singe job will be marked manual. You
>> > can then use the web UI to start individual jobs.
>>=20
>> Is a random user notified in some way that a pipeline with jobs that can
>> be triggered manually has been created?
>
> I don't believe there's any notification.

So a random user might be entirely unaware that they could trigger some
jobs. OTOH, they already consciously pushed to gitlab...

>
>
>> > The minimal job set covers:
>> >
>> >   * Fedora, CentOS, Ubuntu & Debian system emulator builds
>> >     to cover all arch targets.
>> >   * Linux user static build
>> >   * Cross build i386 (to identify any 32-bit build issues)
>> >   * Cross build s390x (to identify any big endian build issues)
>> >   * Containers needed for the above
>> >   * Cirrus CI FreeBSD 12 and macOS 11 (to identify non-Linux issues)
>> >   * Simple checks - python unittests, DCO check, checkpatch.pl, etc
>> >
>> > This gives about 30 jobs instead of 120 from the "Full" group. It
>> > is likely reasonable to cut the minimal set down even more, as IMHO
>> > there are too many system emulator jobs there.
>>=20
>> Where do you think we should start to cut them down? Limit the set of
>> tested arch targets to the most common ones?
>
> Some of our targets are obviously much more important and
> frequently changed than others.  For contributors our goal is
> to mimimize breakage after patches are submitted. Most of our
> contributors changes will be well covered by x86-64 + aarch64
> alone. Other targets give varying degrees of extra benefit.

I'd probably add s390x to that list, not just because of personal bias
:), but also because it has a unique set of devices, is big endian, and
has been broken in the past.

>
> On the other hand the contributors are likely to have tested
> x86_64 or aarch64 themselves since that'll be their dev
> platform. So the benefit of CI is testing bits that they
> didnt bother to test.

Contributors are unlikely to have tested s390x unless they explicitly
develop for that target, so that might be a net benefit.

>
> No clear easy answer here, but I feel like we could benefit
> from classifying our target archs tier 1/2/3 and tailoring
> our default testing matrix accordingly.

Nod, that seems useful in any case.

>
> The other way to cut down the "minimal" set is to reduce
> the OS containers that we build. The jobs above end up
> requiring something like 8 container builds - we should
> try to cut this down to perhaps 2-3 container builds

Yes, that is also what usually takes ages.

>
>> Generally speaking, this makes sense; but I think we have different
>> situations which need different kinds of testing, and we should make it
>> as easy as possible to run the right set of tests.
>>=20
>> (a) an individual contributor is doing some changes
>>=20
>> In that case, I assume (hope?) that the contributor has actually
>> compiled the code for the relevant targets and has done some manual
>> testing. Running acceptance tests locally would also be good, or things
>> like iotests or check-tcg, when applicable.
>
> With my contributor hat on, I like GitLab CI to validate the platforms
> I always forget. Changes I do are 95% tested on Fedora x86_64. I have
> often broken stuff for non-Linux builds (Windows in particular), or
> have broken non-x86_64 target arches. CI lets me see this before
> sending patches.  Unfortunately this means I benefit most from the
> "full" set, but this won't be sustainable with limited CI minutes :-(

Agreed :(

>
> When I'm working on changing gitlab CI rules, then I burn loads of
> minutes which is especially troubling - limited CI minutes will make
> it very hard for me to debug future CI rule changes :-(

I hope that will not make gitlab CI a complete non-starter -- if you
cannot easily debug a test case that is failing, it's mostly
useless. We've seen too many cases where a failure could not be
reproduced when the test case was running locally.

>
>> (b) a subsystem maintainer is queuing some changes
>>=20
>> Some more comprehensive automated testing, and likely some
>> subsystem-specific testing on top (like testing that requires
>> specialized hardware, manual interventions, etc.) Since the introduction
>> of gitlab-ci, I had relied on what you call the 'full' set to be run
>> automatically when I push to my staging branch, plus my manual
>> testing. Prior to that, I relied on patchew and ran tests
>> locally. Drawbacks of that: it hogs my development machine, and it is
>> easy to forget something.
>
>> If I pull from a sub-submaintainer, I assume that everything is already
>> in good order, and only do some very light sanity/integration
>> checking. Although we're hardly doing subsystem pull request nowadays.
>
> Yes, I think that 'minimal' ought to be a good "smoke test" to run
> when queuing changes, on the assumption you'll run a full/gating set
> before sending the final pull.
>
>> (c) a subsystem maintainer is preparing a pull request
>>=20
>> Ideally, that should run the 'gating' set, to eliminate needless bounces
>> of the pull request; plus some subsystem-specific manual testing on
>> top. In practice, the 'full' set might be good enough.
>
> Yeah, the full/gating set is what I would thing subsys maintainers
> would want to use, to minimize risk that Peter's tests throw back
> the merge due to failure. The only difference of gating vs full
> is whether the acceptance tests run.

I can at least run a subset of the acceptance tests locally, but I think
I may be missing some platforms? Still, better than nothing.

>
>> Couple of ideas from my side:
>> - include some scripts/make targets that guide an individual contributor
>>   to run a good subset of automated tests locally
>
> We've got various make targets right now, but they don't guide users
> as to what is the most beneficial thing to run.

There's also the question what the most beneficial subset actually
is. "Run make check-tcg when you are doing tcg changes" is an unfortunately
rare obvious case.

>
>> - define a 'ci-subsystem' set that covers usual pain points for a
>>   subsystem
>> - have subsystem maintainers run a pull req test in the qemu-project
>>   context (i.e. using extra CI minutes that the project may have), or
>>   put them on a special list on subsystem maintainers so they can use
>>   more minutes
>
> I think ultimately we should be looking to take email out of the loop
> for merging pull requests from subsys maintainers.
>
> If we expect subsys maintainers to use gitlab CI before sending, then
> we have a crazy situation where subsys maintainers pushes to gitlab,
> has CI run, then send email PULL to list, then Peter downloads and
> applies the mails, and pushes back to gitlab and runs CI again and
> then pushes to gitlab again for master.

Hm, I thought Peter pulled the subsys maintainers' signed tags?

[As a side remark, I recommend using b4 for applying patches. The only
advantage for me when pulling vs applying with b4 is the usage of signed
tags. Not that I needed to pull anything recently :)]

>
> It would be much simpler if the subsys maintainer pushes to gitlab
> and opens a merge request. This would trigger the CI gating runs,
> consuming minutes from the QEMU project, not the maintainer. Peter
> can ignore merge request until CI passes. The subsys maintainer
> is responsible for getting CI to pass. Once CI passes, the merge
> request could be apporved and merged. The person approving it for
> merge should really only need to validate the the non-automatable
> stuff. eg it meets the current freeze rules; the maintainer is
> the owner of the subsystem being modified, etc.

I hate gitlab MR tooling. (Same for any forge. I'm contemplating using
magit/forge to at least avoid a medium break; anyone been using it
sucessfully?) At the very least, we should have notifications about pull
requests and when they are merged on the mailing list, just to keep
information about development in one page.

>
> Of course this relies on us being able to use GitLab for 100% of
> merge time gating. Cleber's custom runners recently enabled get
> us closer, but I think Peter still uses some other hardware
> outside of GitLab for some testing.


