Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD540C7B5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:48:06 +0200 (CEST)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWCj-00087q-Em
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQWAF-0006SK-AJ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQWAC-0004mx-Gg
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631717127;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMJVC+jswIXxh6KuIv16lp3KHYReLUGnpaew/NH+OXM=;
 b=KVrO8Y8xcvzH8IheQLHA4BB+w3doS50zXyKxQi3s4Omsnu/3ATn6+ffAmr/fWSc6hs/Q+t
 3f/X2LQyZJJrVnBuwWfblS8EnMhA2jXp8PEMf2ShFeXRIR7tQEXgWWwopM5NSaNBMB/ziC
 2PkUXNmax9GEplGynfhAj1hdQG9eeQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-v4hH1raAPcOg_eOF-9gJbQ-1; Wed, 15 Sep 2021 10:45:21 -0400
X-MC-Unique: v4hH1raAPcOg_eOF-9gJbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 953D51060DAC;
 Wed, 15 Sep 2021 14:45:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 02E1510016FB;
 Wed, 15 Sep 2021 14:45:08 +0000 (UTC)
Date: Wed, 15 Sep 2021 15:45:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
Message-ID: <YUIG8qo9Fdym3NfO@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com>
 <627a5199-c92d-b002-e7cf-8b5258c3aac8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <627a5199-c92d-b002-e7cf-8b5258c3aac8@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 12:42:32PM +0200, Thomas Huth wrote:
> 
> (meta note: patch does not apply anymore and needs to be refreshed)
> 
> On 12/08/2021 20.04, Daniel P. Berrangé wrote:
> [...]
> > diff --git a/.gitlab-ci.d/rules.yml b/.gitlab-ci.d/rules.yml
> > new file mode 100644
> > index 0000000000..3399722ca9
> > --- /dev/null
> > +++ b/.gitlab-ci.d/rules.yml
> > @@ -0,0 +1,116 @@
> > +
> > +# This defines rules used to control individual job execution
> > +# See docs/devel/ci-jobs.rst for an explanation of the various
> > +# variables and branch naming conventions applied here.
> > +#
> > +.job_rules:
> > +  rules:
> > +    # ======================================================================
> > +    # Rules that apply regardless of whether the primary qemu repo or a fork
> > +    # ======================================================================
> > +
> > +    # Skip any cirrus job if either repo or api token are missing
> > +    # as we won't be able to talk to cirrus
> > +    - if: '$CIRRUS_VM_INSTANCE_TYPE && ($CIRRUS_GITHUB_REPO == null || $CIRRUS_API_TOKEN == null)'
> > +      when: never
> > +
> > +    # Any jobs marked as manual, never get automatically run in any scenario
> > +    # and don't contribute to pipeline status
> > +    - if: '$QEMU_JOB_MANUAL'
> > +      when: manual
> > +      allow_failure: true
> > +
> > +    # For the main repo, tags represent official releases.
> > +    # The branch associated with the release will have passed
> > +    # a CI pipeline already
> > +    #
> > +    # For user forks, tags are tyically added by tools like
> 
> s/tyically/typically/
> 
> > +    # git-publish at the same time as pushing the branch prior
> > +    # to sending out for review
> > +    #
> > +    # In neither case do we wish to run CI pipelines for tags
> > +    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_TAG'
> > +      when: never
> 
> Not sure whether I like this rule ... First, tags are very seldom compared
> to normal pushes to branches, so this should not affect us that much.
> Second, I think it might be good for "documentation" purposes to be able to
> say that the CI ran properly for a certain tag. Ok, you could still look it
> up in the push to a branch that might have happened before, but that's
> cumbersome. Just my 0.02 €.

"git-publish" creates tags for every version and pushes them to your
repo when you use --pull arg. I don't want jobs triggered when
git-publish pushes tags, because I will have already tested the code
before I ask git-publish to send the pull.  So IMHO skipping CI pipelines
on forks is important to avoid git-publish burning everyone's CI minutes.

In terms of the upstream repo, a tag is only pushed when the changes for
the release have already been pushed. Those changes would have undergone
CI already. There's no point running CI again for the tag, especially if
no one is going to do anything with failures it might report. 

> > +    # ====================================
> > +    # Rules for running jobs in user forks
> > +    # ====================================
> > +
> > +    # Part 1: gating jobs
> > +    # -------------------
> > +
> > +    # If on a branch with name prefix 'ci-acceptance-', then run
> > +    # everything, just as a gating job on 'staging' branch would
> > +    - if: '$CI_COMMIT_BRANCH =~ /^ci-gating-/'
> > +      when: on_success
> > +
> > +    # If user set QEMU_CI_GATING=1, then run everything just as
> > +    # a gating job on 'staging' branch would
> > +    - if: '$QEMU_CI_GATING'
> > +      when: on_success
> > +
> > +    # Otherwise never run jobs marked as gating, but allow manual trigger
> > +    # without affecting pipeline status
> > +    - if: '$QEMU_JOB_GATING'
> > +      when: manual
> > +      allow_failure: true
> 
> IMHO if it's "gating", then we should not use "allow_failure: true", no
> matter whether the job is manual or not. Otherwise this is very confusing.

I think you're misinterpreting this.

Gating jobs run on the upstream pushes to 'staging' (not shown in this
quoted context - its higher in rules.yml), or if you have pushed to a
branch 'ci-gating-' (the first rule here), or if you set QEMU_CI_GATING
env var when pushing (the second rule here).

This 3rd rule is about ensuring gating jobs do NOT get launched in any
other scenario. We could use 'when: never' but that's a big hammer that
prevents users to opt-ing in to running a single job from the web UI,
so we use 'when: manual'.  If you use 'when: manual' on its own, the
pipeline will never complete, as it'll be waiting for someone to
trigger the manual job which is not what we need. 'allow_failure: true'
means that the pipeline will complete without waiting for the manual
job.

Ideally there would be a way to say "Let this job be manually run,
and make its failure affect the pipeline status, but ignore the job
if not ru nmanually".  GitLab doesn't support that AFAIK though, so
this is the next best option, that isn't 'when: never'.

> > +
> > +    # =============================================
> > +    # Part 2: opt-in for all CI, except gating jobs
> > +    # =============================================
> > +
> > +    # If pushing to a branch with name prefix 'ci-all', then run all jobs
> > +    - if: '$CI_COMMIT_BRANCH =~ /^ci-all/'
> > +      when: on_success
> > +
> > +    # If user QEMU_CI_ALL=1, then run all jobs
> > +    - if: '$QEMU_CI_ALL'
> > +      when: on_success
> 
> Uh, so "all" is not running all jobs? ... that's confusing, too. Could you
> come up with some better naming? QEMU_CI_CORE maybe?

"all" is running everything that currently runs today when you do a
git push in a fork.  I admit it is odd that 'gating' runs more than
'all'.

We could change it to "default" instead.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


