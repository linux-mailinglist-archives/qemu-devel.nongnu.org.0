Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FCF529F84
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 12:34:48 +0200 (CEST)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nquXP-0006f2-D0
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 06:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nquT7-0004qB-En
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nquT3-0006n8-Rq
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652783416;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzOHEtQWPNU6cZwnZQd+sldX88VXIZ/MbAh/2EaXxDA=;
 b=CcVGxIfrPhB/Msf90gjSHLUSODxcy0mdRKM9hhTyxcoVM8N8+TiWJ1rJJ8Ph1ot6hQZmwl
 MmQTcECHLZtO1/ceuWZEwrvOIIpQrXMNbFV0AIPI6MHVtEJsAH8wuwjPkIm0LA22HF2D9v
 Bu3voFzx/UHiTO465+LCS7aQCfaGXDs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-mMI601aEPhCiubfMYEB95Q-1; Tue, 17 May 2022 06:30:13 -0400
X-MC-Unique: mMI601aEPhCiubfMYEB95Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 025D629AB443;
 Tue, 17 May 2022 10:30:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8BEB2166B2D;
 Tue, 17 May 2022 10:30:11 +0000 (UTC)
Date: Tue, 17 May 2022 11:30:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitlab-ci: Allow adding manual jobs on cirrus-ci
Message-ID: <YoN5MMqaR8w1avU4@redhat.com>
References: <20220314143130.28503-1-philippe.mathieu.daude@gmail.com>
 <2a52914a-d129-cd20-d54d-ee8cfd38a8d7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a52914a-d129-cd20-d54d-ee8cfd38a8d7@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 17, 2022 at 12:10:30PM +0200, Thomas Huth wrote:
> On 14/03/2022 15.31, Philippe Mathieu-Daudé wrote:
> > From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > 
> > By default, all Cirrus-CI jobs are added as 'on_success' (the
> > default value). Add a ${MANUAL_JOB} variable (default to 0)
> > to be able to add manual jobs.
> > 
> > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >   .gitlab-ci.d/cirrus.yml       | 2 ++
> >   .gitlab-ci.d/cirrus/build.yml | 1 +
> >   2 files changed, 3 insertions(+)
> > 
> > diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
> > index b96b22e269..9e640019dd 100644
> > --- a/.gitlab-ci.d/cirrus.yml
> > +++ b/.gitlab-ci.d/cirrus.yml
> > @@ -44,6 +44,8 @@
> >       # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
> >       - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
> >         when: never
> > +    - if: '$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN && $MANUAL_JOB == "1"'
> > +      when: manual



> >       - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
> >   x64-freebsd-12-build:
> > diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
> > index c555f5d36e..c58dc86855 100644
> > --- a/.gitlab-ci.d/cirrus/build.yml
> > +++ b/.gitlab-ci.d/cirrus/build.yml
> > @@ -14,6 +14,7 @@ env:
> >     MAKE: "@MAKE@"
> >     CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
> >     TEST_TARGETS: "@TEST_TARGETS@"
> > +  MANUAL_JOB: 0

This addition doesn't make sense.  build.yml is config that is run
by Cirrus CI.

The MANUAL_JOB  env is interpreted by GitLab CI, so would only ever
be set by jobs in .gitlab-ci.d/cirrus.yml

> >   build_task:
> >     install_script:
> 
>  Hi Philippe!
> 
> Sorry for the late reply ... I think this might collide with Daniel's patch
> that turns most jobs to manual mode
> (https://lore.kernel.org/all/20210812180403.4129067-3-berrange@redhat.com/)
> which he is hopefully going to respin soon ... but anyway, if you add a
> variable like this, there should be an update to docs/devel/ci-jobs.rst.inc
> to describe the new variable, otherwise you might be the only one who's
> using it.

IIUC, this MANUAL_JOB variable isn't for end developer usage, rather it is
for usage when adding jobs to .gitlab-ci.d/cirrus.yml, so I don't think it
needs documenting there. THis simply lets us add a bunch more jobs to
cirrus.yml without causing timeout problems by having them all run at
once, providing we put MANUAL_JOB: 1 in the config for the new job. 

No need to delay this for sake of my series. I'll adapt to whatever
exists at the time I'm rebasing.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


