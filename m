Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743D534E647
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:21:42 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCRH-00071D-DO
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRCPj-0006F1-68
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRCPf-0007If-Cr
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617103197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5YoZN8famXMCNUn7S4jrjzdXBH/KpQ9HylYpyZ6Yl3A=;
 b=TJaPzTlRmo7kHUgF+oxUGyjyTsf5bj6d+m6ombpT2pzHF73Sb57ETNPRK3nMyMNH4CgUkw
 Qn+qDfi6Fyk523+ka6pFQL/huXoghNsgGUUObfw2eX//vQzd1S8tCHGIag9hz6SYjLSSoW
 Ap0scIjNXjVCCudlQj/beN1pk9NMmEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-v-uVDetxOpCejP_Y3jjCDA-1; Tue, 30 Mar 2021 07:19:51 -0400
X-MC-Unique: v-uVDetxOpCejP_Y3jjCDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7997584B9A0;
 Tue, 30 Mar 2021 11:19:50 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4669319C45;
 Tue, 30 Mar 2021 11:19:41 +0000 (UTC)
Date: Tue, 30 Mar 2021 12:19:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YGMJSoIGa5VoVDB1@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 03:10:36PM +0100, Stefan Hajnoczi wrote:
> Hi,
> I wanted to follow up with a summary of the CI jobs:
> 
> 1. Containers & Containers Layer2 - ~3 minutes/job x 39 jobs
> 2. Builds - ~50 minutes/job x 61 jobs
> 3. Tests - ~12 minutes/job x 20 jobs
> 4. Deploy - 52 minutes x 1 job
> 
> The Builds phase consumes the most CI minutes. If we can optimize this
> phase then we'll achieve the biggest impact.
> 
> In the short term builds could be disabled. However, in the long term I
> think full build coverage is desirable to prevent merging code that
> breaks certain host OSes/architectures (e.g. stable Linux distros,
> macOS, etc).

The notion of "full build coverage" doesn't really exist in reality.
The number of platforms that QEMU is targetting, combined with the
number of features that can be turned on/off in QEMU configure
means that the matrix for "full build coverage" is too huge to ever
contemplate.

So far we've been adding new jobs whenever we hit some situation
where we found a build problem that wasn't previously detected by
CI. In theory this is more reasonable as a strategy, than striving
for full build coverage, as it targets only places where we've hit
real world problems. I think we're seeing though, that even the
incremental new coverage approach is not sustainable in the real
world. Or rather it is only sustainable if CI resources are
essentially free.


Traditionally the biggest amount of testing would be done in a
freeze period leading upto a release. WIth GitLab CI we've tried
to move to a model where testing is continuous, such that we
have git master in a so called "always ready" state. This is
very good in general, but it comes with significant hardware
resource costs. We've relied on free service for this and this
is being less viable.



I think a challenges we have with our incremental approach is that
we're not really taking into account relative importance of the
different build scenarios, and often don't look at the big picture
of what the new job adds in terms of quality, compared to existing
jobs.

eg Consider we have

  build-system-alpine:
  build-system-ubuntu:
  build-system-debian:
  build-system-fedora:
  build-system-centos:
  build-system-opensuse:

  build-trace-multi-user:
  build-trace-ftrace-system:
  build-trace-ust-system:

I'd question whether we really need any of those 'build-trace'
jobs. Instead, we could have build-system-ubuntu pass
--enable-trace-backends=log,simple,syslog, build-system-debian
pass --enable-trace-backends=ust and build-system-fedora
pass --enable-trace-backends=ftrace, etc. 

Another example, is that we test builds on centos7 with
three different combos of crypto backend settings. This was
to exercise bugs we've seen in old crypto packages in RHEL-7
but in reality, it is probably overkill, because downstream
RHEL-7 only cares about one specific combination.

We don't really have a clearly defined plan to identify what
the most important things are in our testing coverage, so we
tend to accept anything without questioning its value add.
This really feeds back into the idea I've brought up many
times in the past, that we need to better define what we aim
to support in QEMU and its quality level, which will influence
what are the scenarios we care about testing.


> Traditionally ccache (https://ccache.dev/) was used to detect
> recompilation of the same compiler input files. This is trickier to do
> in GitLab CI since it would be necessary to share and update a cache,
> potentially between untrusted users. Unfortunately this shifts the
> bottleneck from CPU to network in a CI-as-a-Service environment since
> the cached build output needs to be accessed by the linker on the CI
> runner but is stored remotely.

Our docker containers install ccache already and I could have sworn
that we use that in gitlab, but now I'm not so sure. We're only
saving the "build/" directory as an artifact between jobs, and I'm
not sure that directory holds the ccache cache.

> A complementary approach is avoiding compilation altogether when code
> changes do not affect a build target. For example, a change to
> qemu-storage-daemon.c does not require rebuilding the system emulator
> targets. Either the compiler or the build system could produce a
> manifest of source files that went into a build target, and that
> information is what's needed to avoid compiling unchanged targets.

I think we want to be pretty wary of making the CI jobs too complex
in what they do. We want them to accurately reflect the way that our
developers and end users build the system in general. Trying to add
clever logic to the CI system to skip building certain pieces will
make the CI system more complex and fragile which will increase the
burden of keeping CI working reliably.

> Ideally the CI would look at the code changes and only launch jobs that
> were affected. Those jobs would use a C compiler cache to avoid
> rebuilding compiler input that has not changed. Basically, we need
> incremental builds.

If we want to consider "code changes" between CI runs, then we need
to establish as baseline. If we're triggering GitLab jobs on "push"
events, then the baseline is whatever content already exists in
the remote server. eg if you have a branch with 10 commits delta
on top of "master", but 8 of those commits already exist in the
branch on gitlab, then the push event baseline is those 8 commits,
so it'll only look at changes in the 2 top commits, rather than
the entire 10 commits of that branch.  This is generally *not*
what we want for testing, because we can't assume that the 8
commits which already exist have successfully passed CI. We've
seen this cause us problems for CI already, when we tried to
filter out jobs rebuilding container images, so they only ran
when a tests/docker/* file was modified. 

If we want to consider code changes where "master" is the baseline,
then we need to trigger CI pipelines from merge requests, because
merge requests have an explicit baseline associated with them. Of
course this means we need to be using merge requests in some way
which is a big can of worms.

> This is as far as I've gotten with thinking about CI efficiency. Do you
> think these optimizations are worth investigating or should we keep it
> simple and just disable many builds by default?

ccache is a no-brainer and assuming it isn't already working with
our gitlab jobs, we must fix that asap.


Aside from optimizing CI, we should consider whether there's more we
can do to optimize build process itself. We've done alot of work, but
there's still plenty of stuff we build multiple times, once for each
target. Perhaps there's scope for cutting this down in some manner ?

I'm unclear how many jobs in CI are build submodules, but if there's
more scope for using the pre-built distro packages that's going to
be beneficial in build time.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


