Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FF15ECA25
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:53:51 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDqA-0003qh-Oy
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odCue-0004cK-Lw
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odCua-0000fS-KY
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664294058;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FfRV/vwQrYOux5veysQEawnb1aTDXWE7BAXB+T2CfkY=;
 b=g2+1SQedCxlNCN7u993MNWjo8/KnRyrmWkel0gzzi1DpbhMXGrzorBeCyzLLgUZucS4iek
 8FYHX5e7LBS/NpQ0R+26iuu2xNgjzJME3nY27U3k5yiNUu4x1qKJaOl371VFbYruNgd3cH
 Ba/JeI/iEg0kyM36HI/Lm2DcpKKiXLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-OMtPl4NPPMKTcrYlxZS02g-1; Tue, 27 Sep 2022 11:54:14 -0400
X-MC-Unique: OMtPl4NPPMKTcrYlxZS02g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4511280D2A2;
 Tue, 27 Sep 2022 15:54:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F12C40C6EC2;
 Tue, 27 Sep 2022 15:54:12 +0000 (UTC)
Date: Tue, 27 Sep 2022 16:54:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
Message-ID: <YzMcobeWVAnHUkNu@redhat.com>
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
> On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrote:
> > now that Gitlab is giving us pressure on the amount of free CI minutes, I
> > wonder whether we should maybe move the Cirrus-CI jobs out of the gitlab-CI
> > dashboard again? We could add the jobs to our .cirrus-ci.yml file instead,
> > like we did it in former times...
> >
> > Big advantage would be of course that the time for those jobs would not
> > count in the Gitlab-CI minutes anymore. Disadvantage is of course that they
> > do not show up in the gitlab-CI dashboard anymore, so there is no more
> > e-mail notification about failed jobs, and you have to push to github, too,
> > and finally check the results manually on cirrus-ci.com ...
> 
> My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI job
> to run the cirrus-run container image that forwards jobs to Cirrus-CI.
> So GitLab CI resources are consumed waiting for Cirrus-CI to finish.
> 
> This shouldn't affect gitlab.com/qemu-project where there are private
> runners that do not consume GitLab CI minutes.
> 
> Individual developers are affected though because they most likely
> rely on the GitLab shared runner minutes quota.

NB, none of the jobs should ever be run automatically anymore in
QEMU CI pipelines. It always requires the maintainer to set the
env var when pushing to git, to explicitly create a pipeline.
You can then selectively start each individual job as desired.

While the Cirrus CI minutes burn is undesirable, it is not
inherantly worse than the CI minutes burn from all the other
build jobs. Contributors unforunately just need to be aware
of this and be more selective in running jobs.

If QEMU does eventually join the OSS program, then I believe
forks of QEMU will get an elevate CI allowance.

> 
> Does GitLab CI support some kind of async job so a container doesn't
> have to monitor Cirrus-CI for the duration of the tests? I guess it
> would require a job like the cirrus-run job, except a webhook signals
> completion and therefore the GitLab CI container doesn't need to wait
> around.

No, this consumption of GitLab CI minutes is an inherant limitation
of using the cirrus-run hack.  The real solution would be native
GItLab support for Cirrus CI. This would have Cirrus CI listening
for git changes, triggers the pipeline itself, and then reports
them back as a fake GitLab CI pipeline job. This is what Travis
is able todo these days, and the recommended way for external CI
systems to integrate.  No ETA on when Cirrus may support this.

https://github.com/cirruslabs/cirrus-ci-docs/issues/10


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


