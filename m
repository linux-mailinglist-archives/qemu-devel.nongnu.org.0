Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC0C322FF3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:48:33 +0100 (CET)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbnU-00063Z-It
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbl2-0004xO-4w
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:46:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbku-0007MM-TU
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614102351;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sQuK/yVSTAvOuTErZlfAKPN19Z1K0wssI+p36MVsUs=;
 b=USTPEdQdTQpoTehrAFLuoOgH1atNzzqugXenz2vwnUysXkQUkEqSHuYYdqzMQMfcZeBL5s
 aqtO66COpo3bvruTUHX8uCZabgE3kFpKTsoNjd6L83tgpcnwIMlzfnU1JkToHxVxlRsirs
 hdK7IXq2NvyZ7wl7tLNlkq/DpQMJG0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-7kLDNxPCMyWW8XTuxpZwWw-1; Tue, 23 Feb 2021 12:45:44 -0500
X-MC-Unique: 7kLDNxPCMyWW8XTuxpZwWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B89107ACFC;
 Tue, 23 Feb 2021 17:45:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 301DF1002388;
 Tue, 23 Feb 2021 17:45:36 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:45:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
Message-ID: <YDU/PgzQCaY10Udl@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
 <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
 <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
 <20210223164718.GA987581@amachine.somewhere>
MIME-Version: 1.0
In-Reply-To: <20210223164718.GA987581@amachine.somewhere>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 11:47:18AM -0500, Cleber Rosa wrote:
> On Tue, Feb 23, 2021 at 05:37:04PM +0100, Philippe Mathieu-Daudé wrote:
> > On 2/23/21 12:25 PM, Thomas Huth wrote:
> > > On 19/02/2021 22.58, Cleber Rosa wrote:
> > >> As described in the included documentation, the "custom runner" jobs
> > >> extend the GitLab CI jobs already in place.  One of their primary
> > >> goals of catching and preventing regressions on a wider number of host
> > >> systems than the ones provided by GitLab's shared runners.
> > >>
> > >> This sets the stage in which other community members can add their own
> > >> machine configuration documentation/scripts, and accompanying job
> > >> definitions.  As a general rule, those newly added contributed jobs
> > >> should run as "non-gating", until their reliability is verified (AKA
> > >> "allow_failure: true").
> > >>
> > >> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > >> ---
> > >>   .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
> > >>   .gitlab-ci.yml                  |  1 +
> > >>   docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
> > >>   docs/devel/index.rst            |  1 +
> > >>   4 files changed, 44 insertions(+)
> > >>   create mode 100644 .gitlab-ci.d/custom-runners.yml
> > >>   create mode 100644 docs/devel/ci.rst
> > >>
> > >> diff --git a/.gitlab-ci.d/custom-runners.yml
> > >> b/.gitlab-ci.d/custom-runners.yml
> > >> new file mode 100644
> > >> index 0000000000..3004da2bda
> > >> --- /dev/null
> > >> +++ b/.gitlab-ci.d/custom-runners.yml
> > >> @@ -0,0 +1,14 @@
> > >> +# The CI jobs defined here require GitLab runners installed and
> > >> +# registered on machines that match their operating system names,
> > >> +# versions and architectures.  This is in contrast to the other CI
> > >> +# jobs that are intended to run on GitLab's "shared" runners.
> > >> +
> > >> +# Different than the default approach on "shared" runners, based on
> > >> +# containers, the custom runners have no such *requirement*, as those
> > >> +# jobs should be capable of running on operating systems with no
> > >> +# compatible container implementation, or no support from
> > >> +# gitlab-runner.  To avoid problems that gitlab-runner can cause while
> > >> +# reusing the GIT repository, let's enable the recursive submodule
> > >> +# strategy.
> > >> +variables:
> > >> +  GIT_SUBMODULE_STRATEGY: recursive
> > > 
> > > Is it really necessary? I thought our configure script would take care
> > > of the submodules?
> >
> 
> I've done a lot of testing on bare metal systems, and the problems
> that come from reusing the same system and failed cleanups can be very
> frustrating.  It's unfortunate that we need this, but it was the
> simplest and most reliable solution I found.  :/

Hmmm, this makes it sound like the job is not being run in a
fresh pristine checkout. IMHO we need to guarantee that in
general, at which point submodules should "just work", unless
the running is blocking network access ?



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


