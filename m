Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29AB34E6F1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:57:02 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCzW-0001gv-0g
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRCye-0001Fa-Rk
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRCya-0004D8-ES
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617105363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3j0/Wz9NPilvlcPhmuurAKuW90wXbghuNb/YXE7ttQ=;
 b=g6jlVyusl7GMwZ/g44+2DoeLlIsCZZpLYXZVS9gfqB2U3YhLL/guf/0JMOXtVlasWBtLSt
 GvTY2ARdMtzrch3ilXk9gV9oZhYAZRVHD689P9IPPdAsOUTMMPcQbLhzTf0AGh2AfJPsXU
 SDOxFZ+pnCDAz986SYHrQtG9xN7UBrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-D0v06-jiNk2rrhSi-OOzew-1; Tue, 30 Mar 2021 07:56:00 -0400
X-MC-Unique: D0v06-jiNk2rrhSi-OOzew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76598180FCAA;
 Tue, 30 Mar 2021 11:55:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-225.ams2.redhat.com [10.36.112.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 037ED10016FC;
 Tue, 30 Mar 2021 11:55:49 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
Date: Tue, 30 Mar 2021 13:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGMJSoIGa5VoVDB1@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/2021 13.19, Daniel P. Berrangé wrote:
> On Mon, Mar 29, 2021 at 03:10:36PM +0100, Stefan Hajnoczi wrote:
>> Hi,
>> I wanted to follow up with a summary of the CI jobs:
>>
>> 1. Containers & Containers Layer2 - ~3 minutes/job x 39 jobs
>> 2. Builds - ~50 minutes/job x 61 jobs
>> 3. Tests - ~12 minutes/job x 20 jobs
>> 4. Deploy - 52 minutes x 1 job

I hope that 52 was just a typo ... ?

> I think a challenges we have with our incremental approach is that
> we're not really taking into account relative importance of the
> different build scenarios, and often don't look at the big picture
> of what the new job adds in terms of quality, compared to existing
> jobs.
> 
> eg Consider we have
> 
>    build-system-alpine:
>    build-system-ubuntu:
>    build-system-debian:
>    build-system-fedora:
>    build-system-centos:
>    build-system-opensuse:

I guess we could go through that list of jobs and remove the duplicated 
target CPUs, e.g. it should be enough to test x86_64-softmmu only once.

>    build-trace-multi-user:
>    build-trace-ftrace-system:
>    build-trace-ust-system:
> 
> I'd question whether we really need any of those 'build-trace'
> jobs. Instead, we could have build-system-ubuntu pass
> --enable-trace-backends=log,simple,syslog, build-system-debian
> pass --enable-trace-backends=ust and build-system-fedora
> pass --enable-trace-backends=ftrace, etc.

I recently had the very same idea already:

  https://gitlab.com/qemu-project/qemu/-/commit/65aff82076a9bbfdf7

:-)

> Another example, is that we test builds on centos7 with
> three different combos of crypto backend settings. This was
> to exercise bugs we've seen in old crypto packages in RHEL-7
> but in reality, it is probably overkill, because downstream
> RHEL-7 only cares about one specific combination.

Care to send a patch? Or shall we just wait one more months and then remove 
these jobs (since we won't support RHEL7 after QEMU 6.0 anymore)?

> We don't really have a clearly defined plan to identify what
> the most important things are in our testing coverage, so we
> tend to accept anything without questioning its value add.
> This really feeds back into the idea I've brought up many
> times in the past, that we need to better define what we aim
> to support in QEMU and its quality level, which will influence
> what are the scenarios we care about testing.

But code that we have in the repository should get at least some basic test 
coverage, otherwise it bitrots soon ... so it's maybe rather the other old 
problem that we struggle with, that we should deprecate more code and remove 
it if nobody cares about it...

>> Traditionally ccache (https://ccache.dev/) was used to detect
>> recompilation of the same compiler input files. This is trickier to do
>> in GitLab CI since it would be necessary to share and update a cache,
>> potentially between untrusted users. Unfortunately this shifts the
>> bottleneck from CPU to network in a CI-as-a-Service environment since
>> the cached build output needs to be accessed by the linker on the CI
>> runner but is stored remotely.
> 
> Our docker containers install ccache already and I could have sworn
> that we use that in gitlab, but now I'm not so sure. We're only
> saving the "build/" directory as an artifact between jobs, and I'm
> not sure that directory holds the ccache cache.

AFAIK we never really enabled ccache in the gitlab-CI, only in Travis.

>> This is as far as I've gotten with thinking about CI efficiency. Do you
>> think these optimizations are worth investigating or should we keep it
>> simple and just disable many builds by default?
> 
> ccache is a no-brainer and assuming it isn't already working with
> our gitlab jobs, we must fix that asap.

I've found some nice instructions here:

https://gould.cx/ted/blog/2017/06/10/ccache-for-Gitlab-CI/

... and just kicked off a build with these modifications, let's see how it 
goes...

> Aside from optimizing CI, we should consider whether there's more we
> can do to optimize build process itself. We've done alot of work, but
> there's still plenty of stuff we build multiple times, once for each
> target. Perhaps there's scope for cutting this down in some manner ?

Right, I think we should also work more towards consolidating the QEMU 
binaries, to avoid that we have to always build sooo many target binaries 
again and again. E.g.:

- Do we still need to support 32-bit hosts? If not we could
   finally get rid of qemu-system-i386, qemu-system-ppc,
   qemu-system-arm, etc. and just provide the 64-bit variants

- Could we maybe somehow unify the targets that have both, big
   and little endian versions? Then we could merge e.g.
   qemu-system-microblaze and qemu-system-microblazeel etc.

- Or could we maybe even build a unified qemu-system binary that
   contains all target CPUs? ... that would also allow e.g.
   machines with a x86 main CPU and an ARM-based board management
   controller...

> I'm unclear how many jobs in CI are build submodules, but if there's
> more scope for using the pre-built distro packages that's going to
> be beneficial in build time.

Since the build system has been converted to meson, I think the configure 
script prefers to use the submodules instead of the distro packages. I've 
tried to remedy this a little bit here:

https://gitlab.com/qemu-project/qemu/-/commit/db0108d5d846e9a8

... but new jobs of course will use the submodules again if the author is 
not careful.

I think we should tweak that behavior again to use the system version of 
capstone, slirp and dtc instead if these are available. Paolo, what do you 
think?

Also I wonder whether we could maybe even get rid of the capstone and slirp 
submodules in QEMU now ... these libraries should be available in the most 
distros by now, and otherwise people could also install them manually instead?

  Thomas


