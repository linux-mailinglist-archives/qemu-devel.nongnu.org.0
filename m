Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7FC5ECBD2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:59:22 +0200 (CEST)
Received: from localhost ([::1]:35208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odErY-00045Q-T5
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odEq1-0002cL-NC
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odEpx-0006C4-J3
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664301460;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWwKOQyM+I059wvcMDq3MkI11HvmcmlYuMpXidK7OYc=;
 b=UDsyZoWB9LuywNHLTkqh6fl2cZY6M7lk9lJa408qLcE6TR7GjC3ZbeBK6VlrgADOzZMAyT
 OoVt/KQu7YU21HAnLWmzI/G3sci0EmwAy5DgOSh14gengWV4PebwOvyJ29sEiBGmlM298Q
 dfeHOse3JieiIPAU0PTbU9LFnt48g4o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-SCJD1rkNOgumpZWfgCMvCA-1; Tue, 27 Sep 2022 13:57:36 -0400
X-MC-Unique: SCJD1rkNOgumpZWfgCMvCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53ECE8582B9;
 Tue, 27 Sep 2022 17:57:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACCEC140EBF3;
 Tue, 27 Sep 2022 17:57:34 +0000 (UTC)
Date: Tue, 27 Sep 2022 18:57:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
Message-ID: <YzM5i5QP7NQq4OHV@redhat.com>
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
 <YzMcobeWVAnHUkNu@redhat.com>
 <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Sep 27, 2022 at 01:36:20PM -0400, Stefan Hajnoczi wrote:
> On Tue, 27 Sept 2022 at 11:54, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
> > > On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrote:
> > > > now that Gitlab is giving us pressure on the amount of free CI minutes, I
> > > > wonder whether we should maybe move the Cirrus-CI jobs out of the gitlab-CI
> > > > dashboard again? We could add the jobs to our .cirrus-ci.yml file instead,
> > > > like we did it in former times...
> > > >
> > > > Big advantage would be of course that the time for those jobs would not
> > > > count in the Gitlab-CI minutes anymore. Disadvantage is of course that they
> > > > do not show up in the gitlab-CI dashboard anymore, so there is no more
> > > > e-mail notification about failed jobs, and you have to push to github, too,
> > > > and finally check the results manually on cirrus-ci.com ...
> > >
> > > My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI job
> > > to run the cirrus-run container image that forwards jobs to Cirrus-CI.
> > > So GitLab CI resources are consumed waiting for Cirrus-CI to finish.
> > >
> > > This shouldn't affect gitlab.com/qemu-project where there are private
> > > runners that do not consume GitLab CI minutes.
> > >
> > > Individual developers are affected though because they most likely
> > > rely on the GitLab shared runner minutes quota.
> >
> > NB, none of the jobs should ever be run automatically anymore in
> > QEMU CI pipelines. It always requires the maintainer to set the
> > env var when pushing to git, to explicitly create a pipeline.
> > You can then selectively start each individual job as desired.
> 
> Cirrus CI is not automatically started when pushing to a personal
> GitLab repo? If starting it requires manual action anyway then I think
> nothing needs to be changed here.

No pipeline at all is created unless you do

  git push -o ci.variable=QEMU_CI=1 <your-fork-remote>

that creates the pipeliune but doesn't run any jobs - they're manual
start. Or QEMU_CI=2 creates & starts the jobs (like the old way we
had CI until a few months ago, which burns CI quota hugely).


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


