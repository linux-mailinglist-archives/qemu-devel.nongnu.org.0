Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C73ED3A3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 14:05:26 +0200 (CEST)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFbMr-0004gt-De
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 08:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFbJY-0001oJ-G4
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mFbJU-0001wa-JG
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 08:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629115314;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYd22UqPRCJezgjV135st6RgvwPEsEFqFz6uxkN7UxQ=;
 b=SRCHw3xYTWgWPRuVW3o2qWoT8SEXPXeGlplx/D6zqDz+Ka5HrJFOcY6oDbBqYuPGHxo2AU
 DFYV0GvKZ6v1+a05IbRR2oM3eLNRsUvvvs4HGR1HlicmKyBM+15U/2MQx7/97neXNFi8/1
 SpsCrbyUUfx33f6bqeJJYFEVjHrlHeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-RooDD_OmP4ixEUCwIYQKDQ-1; Mon, 16 Aug 2021 08:01:51 -0400
X-MC-Unique: RooDD_OmP4ixEUCwIYQKDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71AFA100CEC9;
 Mon, 16 Aug 2021 12:01:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB8E5C25D;
 Mon, 16 Aug 2021 12:01:48 +0000 (UTC)
Date: Mon, 16 Aug 2021 13:01:46 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
Message-ID: <YRpTqmv/yXU0cK5H@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com>
 <87y291u0st.fsf@redhat.com> <YRpGFnvZznlU9RKQ@redhat.com>
 <87v945txvn.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87v945txvn.fsf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

On Mon, Aug 16, 2021 at 01:47:08PM +0200, Cornelia Huck wrote:
> On Mon, Aug 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Mon, Aug 16, 2021 at 12:44:02PM +0200, Cornelia Huck wrote:
> >> On Thu, Aug 12 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >> > The minimal job set covers:
> >> >
> >> >   * Fedora, CentOS, Ubuntu & Debian system emulator builds
> >> >     to cover all arch targets.
> >> >   * Linux user static build
> >> >   * Cross build i386 (to identify any 32-bit build issues)
> >> >   * Cross build s390x (to identify any big endian build issues)
> >> >   * Containers needed for the above
> >> >   * Cirrus CI FreeBSD 12 and macOS 11 (to identify non-Linux issues)
> >> >   * Simple checks - python unittests, DCO check, checkpatch.pl, etc
> >> >
> >> > This gives about 30 jobs instead of 120 from the "Full" group. It
> >> > is likely reasonable to cut the minimal set down even more, as IMHO
> >> > there are too many system emulator jobs there.
> >> 
> >> Where do you think we should start to cut them down? Limit the set of
> >> tested arch targets to the most common ones?
> >
> > Some of our targets are obviously much more important and
> > frequently changed than others.  For contributors our goal is
> > to mimimize breakage after patches are submitted. Most of our
> > contributors changes will be well covered by x86-64 + aarch64
> > alone. Other targets give varying degrees of extra benefit.
> 
> I'd probably add s390x to that list, not just because of personal bias
> :), but also because it has a unique set of devices, is big endian, and
> has been broken in the past.

The desire to have something covering big endian is why I included
the s390x cross-build in the "minimal" set. Even if we don't run
the tests, building it is still worthwhile.

> > When I'm working on changing gitlab CI rules, then I burn loads of
> > minutes which is especially troubling - limited CI minutes will make
> > it very hard for me to debug future CI rule changes :-(
> 
> I hope that will not make gitlab CI a complete non-starter -- if you
> cannot easily debug a test case that is failing, it's mostly
> useless. We've seen too many cases where a failure could not be
> reproduced when the test case was running locally.

One of the best things about GitLab compared to what we had with
Travis is that the build environment is 100% container based (until
Cleber's custom runners arrived).  This meant that when something
does fail in GitLab, you can pull the container image down from
the gitlab registry and run the build locally. You still have
differences due to hardware or CPUs resources, but its a hell of
alot easier to reproduce than before. This is good enough for most
contributors in general, but not for the CI maintainers, who need
to debug especially the CI system as it exists on GitLab.


> >> (c) a subsystem maintainer is preparing a pull request
> >> 
> >> Ideally, that should run the 'gating' set, to eliminate needless bounces
> >> of the pull request; plus some subsystem-specific manual testing on
> >> top. In practice, the 'full' set might be good enough.
> >
> > Yeah, the full/gating set is what I would thing subsys maintainers
> > would want to use, to minimize risk that Peter's tests throw back
> > the merge due to failure. The only difference of gating vs full
> > is whether the acceptance tests run.
> 
> I can at least run a subset of the acceptance tests locally, but I think
> I may be missing some platforms? Still, better than nothing.

As ever the big problem for most people is non-x86_64 platforms. The
custom runners solve this for gitlab, and in theory people can deploy
a VM using QEMU TCG to do this locally, but massively slower


> >> - define a 'ci-subsystem' set that covers usual pain points for a
> >>   subsystem
> >> - have subsystem maintainers run a pull req test in the qemu-project
> >>   context (i.e. using extra CI minutes that the project may have), or
> >>   put them on a special list on subsystem maintainers so they can use
> >>   more minutes
> >
> > I think ultimately we should be looking to take email out of the loop
> > for merging pull requests from subsys maintainers.
> >
> > If we expect subsys maintainers to use gitlab CI before sending, then
> > we have a crazy situation where subsys maintainers pushes to gitlab,
> > has CI run, then send email PULL to list, then Peter downloads and
> > applies the mails, and pushes back to gitlab and runs CI again and
> > then pushes to gitlab again for master.
> 
> Hm, I thought Peter pulled the subsys maintainers' signed tags?

We could have a CI job that validates the merge request is associated
with a signed tag whose key is on a designated keyring containing the
known maintainers.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


