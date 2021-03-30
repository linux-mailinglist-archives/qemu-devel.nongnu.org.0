Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AC34EA76
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:33:34 +0200 (CEST)
Received: from localhost ([::1]:38548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFQy-0006Io-M5
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRFOR-0005F9-18
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRFOB-0000Ak-AB
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617114632;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=irrenoEcetWqpqC1fEDfvJMeSSdkYMcMTHdZpdjgbXc=;
 b=DS5SMARn7Jz94kkcGyZJbKDFHnKrKfb6YaMt5JBbYjpw2Hsxi8GRFYoNxy/+J6LuZTrPK7
 kd67SSjIIUnDN1XxGvMsgKuv8Bu8TxMxRjvOmvc4OKsv2TJd2W2zlJcf55ao+6/TnkLkuG
 re55jry9A7UE5zJSCqCkB+FmhctwI5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-7fn2sRYlO0-LKup_oVwj4w-1; Tue, 30 Mar 2021 10:30:21 -0400
X-MC-Unique: 7fn2sRYlO0-LKup_oVwj4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A0F518C89CC;
 Tue, 30 Mar 2021 14:30:20 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC1439A66;
 Tue, 30 Mar 2021 14:30:07 +0000 (UTC)
Date: Tue, 30 Mar 2021 15:30:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YGM17ZlUFsQMkw/F@redhat.com>
References: <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <YGMyIxXn6QgBJNqJ@stefanha-x1.localdomain>
 <35487f46-f373-9da5-8833-d3f0704b3a8b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <35487f46-f373-9da5-8833-d3f0704b3a8b@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 30, 2021 at 04:23:35PM +0200, Paolo Bonzini wrote:
> On 30/03/21 16:13, Stefan Hajnoczi wrote:
> > On Tue, Mar 30, 2021 at 01:55:48PM +0200, Thomas Huth wrote:
> > > On 30/03/2021 13.19, Daniel P. Berrangé wrote:
> > > > On Mon, Mar 29, 2021 at 03:10:36PM +0100, Stefan Hajnoczi wrote:
> > > > > Hi,
> > > > > I wanted to follow up with a summary of the CI jobs:
> > > > > 
> > > > > 1. Containers & Containers Layer2 - ~3 minutes/job x 39 jobs
> > > > > 2. Builds - ~50 minutes/job x 61 jobs
> > > > > 3. Tests - ~12 minutes/job x 20 jobs
> > > > > 4. Deploy - 52 minutes x 1 job
> > > 
> > > I hope that 52 was just a typo ... ?
> > 
> > No, but I think Dan already found this issue a little while ago. The
> > deploy job uses "make install":
> > 
> >    # Prepare for GitLab pages deployment. Anything copied into the
> >    # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
> >    pages:
> >      image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
> >      stage: test
> >      needs:
> >        - job: build-tools-and-docs-debian
> >      script:
> >        - mkdir -p public
> >        # HTML-ised source tree
> >        - make gtags
> >        - htags -anT --tree-view=filetree -m qemu_init
> >            -t "Welcome to the QEMU sourcecode"
> >        - mv HTML public/src
> >        # Project documentation
> >        - make -C build install DESTDIR=$(pwd)/temp-install
> >        - mv temp-install/usr/local/share/doc/qemu/* public/
> >      artifacts:
> >        paths:
> >          - public
> > 
> > Do we have/need a docs-only install target?
> 
> The problem is that after "git clone" the artifacts from the previous stage
> are stale.  We can use the "NINJA=:" hack/workaround on the make command
> line that we already use for tests.

The problem we have is that the publishing job needs to be called "pages"
in the gitlab-ci.yml file.  We didn't want to rebuild everything, so we
have the dependancy on the build-tools-and-docs-debian job to do the
build phase, and the "pages" job just does "make install" + list the
artifacts.

We can avoid the accidental rebuild if we just change what we do in the
"pages" job.  Move the "make install" command into the
"build-tools-and-docs-debian" job.

The "pages" job then reduces to only

 - mv temp-install/usr/local/share/doc/qemu/* public/

and thus is guaranteed to not trigger a rebuild.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


