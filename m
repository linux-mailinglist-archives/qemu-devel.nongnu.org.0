Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0805154ABEB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:37:03 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o122n-0004Vn-UN
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o11vk-0000jl-Li
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o11vf-0005KL-LJ
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655195375;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMmXNnwUsSTvHq/s+uxz0WbAqWIP62IcHKjUipnBwWQ=;
 b=hadSS0Kh/+KgyZFziLlrcNX8q/xemnR39j8l++NfcZ80HDyLWWtzRsl+EWmdxu0UqRqd2D
 +ojJsnJHd+RapdMZzbq8QYl0HFiCxLGvmeSwNHEabKUEUTogQAZtn1bL6oNUUGMdupBX1I
 pkAzEm0tGmYIeiqqEwGiXpog+r/hfr8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-zYruq1LcPtyUNW9qBk4_SA-1; Tue, 14 Jun 2022 04:29:32 -0400
X-MC-Unique: zYruq1LcPtyUNW9qBk4_SA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BECA11C0513E;
 Tue, 14 Jun 2022 08:29:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B5D71410F34;
 Tue, 14 Jun 2022 08:29:29 +0000 (UTC)
Date: Tue, 14 Jun 2022 09:29:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v1 3/7] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Message-ID: <YqhG58RwkyCxiFN0@redhat.com>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
 <20220613171258.1905715-4-alex.bennee@linaro.org>
 <39615b6d-6454-2a4f-013e-478766e0c3f8@linaro.org>
 <8ad852ab-9580-fc52-b641-679a70212245@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ad852ab-9580-fc52-b641-679a70212245@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Tue, Jun 14, 2022 at 06:30:47AM +0200, Thomas Huth wrote:
> On 13/06/2022 23.46, Richard Henderson wrote:
> > On 6/13/22 10:12, Alex Bennée wrote:
> > > From: Thomas Huth <thuth@redhat.com>
> > > 
> > > The job definitions recently got a second "variables:" section by
> > > accident and thus are failing now if one tries to run them. Merge
> > > the two sections into one again to fix the issue.
> > > 
> > > And while we're at it, bump the timeout here (70 minutes are currently
> > > not enough for the aarch64 job). The jobs are marked as manual anyway,
> > > so if the user starts them, they want to see their result for sure and
> > > then it's annoying if the job timeouts too early.
> > > 
> > > Fixes: e312d1fdbb ("gitlab: convert build/container jobs to
> > > .base_job_template")
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > Acked-by: Richard Henderson <richard.henderson@linaro.org>
> > > Message-Id: <20220603124809.70794-1-thuth@redhat.com>
> > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > ---
> > >   .gitlab-ci.d/buildtest.yml | 22 ++++++++++------------
> > >   1 file changed, 10 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> > > index 544385f5be..cb7cad44b5 100644
> > > --- a/.gitlab-ci.d/buildtest.yml
> > > +++ b/.gitlab-ci.d/buildtest.yml
> > > @@ -357,16 +357,15 @@ build-cfi-aarch64:
> > >         --enable-safe-stack --enable-slirp=git
> > >       TARGETS: aarch64-softmmu
> > >       MAKE_CHECK_ARGS: check-build
> > > -  timeout: 70m
> > > -  artifacts:
> > > -    expire_in: 2 days
> > > -    paths:
> > > -      - build
> > > -  variables:
> > >       # FIXME: This job is often failing, likely due to
> > > out-of-memory problems in
> > >       # the constrained containers of the shared runners. Thus this
> > > is marked as
> > >       # skipped until the situation has been solved.
> > >       QEMU_JOB_SKIPPED: 1
> > > +  timeout: 90m
> > > +  artifacts:
> > > +    expire_in: 2 days
> > > +    paths:
> > > +      - build
> > 
> > FWIW, 90 minutes was close, but insufficient:
> > 
> > https://gitlab.com/qemu-project/qemu/-/jobs/2584472225
> 
> Hmm, it was working at least once for me while I was working on the patch.
> But as I already wrote here:
> 
>  https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg00463.html
> 
> I think nobody really used this build-cfi-aarch64 in month ... so we should
> maybe have a try with the 90 min timeout first (maybe the CI servers were
> just a little bit overloaded when you tried), but if the test continues to
> hit the 90 minutes timeout, I'd say we rather delete it instead of bumping
> the timeout even further. 90 minutes are really very close to the pain level
> already - at least for me.

The CFI jobs seem to massively slow down and timeout waaaaaaay
more often than any other job. I've seen the CFI jobs run
successfully in 45 minutes, and yet they frequently take so long
that they can't even complete in double that. CFI is certainly
slower at compile but not in a non-deterministic manner that
would randomly double compilation time. I would be willing to
blame CI overload if all our other jobs were showing similar
magnitude of slow down, but AFAIK, they are not showing this.
I worry that there are genuine problems with the CFI builds
that result in non-deterministic runtime problems in functional
testing. IOW not merely running slowly, but genuine hang


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


