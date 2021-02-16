Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D23231CB01
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:19:20 +0100 (CET)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0G7-000259-5V
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0Cn-0000qE-SN
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0Cj-0007ms-9c
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613481347;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mb9rdwD/uug8Gypepi0ywWzyj6KSzjmDjpr5yPO0mh4=;
 b=eVjtZn05nK46Uo/EFRU7EzLZFD3DGmvkFnJInRh3je+3dvAIKeEO66dKd3rSUeRRpVtbF5
 PfPjSLwvNtEK7Q89A4+dE6Z6gvy/xOgQtAY8cQc2+6b0Qhxn3BsKLFBcGtnN4A/BO3oy+S
 ynIdvshU1fix1W2XcE8hHpcnHYRQpa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-S3Zmv9h4O9-yTQoX04wk4w-1; Tue, 16 Feb 2021 08:15:40 -0500
X-MC-Unique: S3Zmv9h4O9-yTQoX04wk4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2641804046;
 Tue, 16 Feb 2021 13:15:39 +0000 (UTC)
Received: from redhat.com (ovpn-112-215.ams2.redhat.com [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EBAC60C96;
 Tue, 16 Feb 2021 13:15:27 +0000 (UTC)
Date: Tue, 16 Feb 2021 13:15:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] gitlab: always build container images
Message-ID: <YCvFbHyMkoiLOCY+@redhat.com>
References: <20210208163339.1159514-1-berrange@redhat.com>
 <20210208163339.1159514-2-berrange@redhat.com>
 <a0dd7611-6b35-0a4f-4522-58c8c4add6d5@redhat.com>
 <20210209095829.GC1166421@redhat.com>
 <20210210111700.GE1240644@redhat.com> <YCu+Ct3gMYetnVYT@redhat.com>
 <f51c705b-56fc-a14c-2a18-6faf04bb3f43@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f51c705b-56fc-a14c-2a18-6faf04bb3f43@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 02:02:31PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/16/21 1:43 PM, Daniel P. Berrangé wrote:
> > On Wed, Feb 10, 2021 at 11:17:00AM +0000, Daniel P. Berrangé wrote:
> >> On Tue, Feb 09, 2021 at 09:58:29AM +0000, Daniel P. Berrangé wrote:
> >>> On Tue, Feb 09, 2021 at 07:37:51AM +0100, Thomas Huth wrote:
> >>>> On 08/02/2021 17.33, Daniel P. Berrangé wrote:
> >>>> [...]
> >>>>> For example, consider pushing 5 commits, one of which contains a
> >>>>> dockerfile change. This will trigger a CI pipeline for the
> >>>>> containers. Now consider you do some more work on the branch and push 3
> >>>>> further commits, so you now have a branch of 8 commits. For the second
> >>>>> push GitLab will only look at the 3 most recent commits, the other 5
> >>>>> were already present. Thus GitLab will not realize that the branch has
> >>>>> dockerfile changes that need to trigger the container build.
> >>>>>
> >>>>> This can cause real world problems:
> >>>>>
> >>>>>   - Push 5 commits to branch "foo", including a dockerfile change
> >>>>>
> >>>>>      => rebuilds the container images with content from "foo"
> >>>>>      => build jobs runs against containers from "foo"
> >>>>>
> >>>>>   - Refresh your master branch with latest upstream master
> >>>>>
> >>>>>      => rebuilds the container images with content from "master"
> >>>>>      => build jobs runs against containers from "master"
> >>>>>
> >>>>>   - Push 3 more commits to branch "foo", with no dockerfile change
> >>>>>
> >>>>>      => no container rebuild triggers
> >>>>>      => build jobs runs against containers from "master"
> >>>>>
> >>>>> The "changes" conditional in gitlab is OK, *provided* your build
> >>>>> jobs are not relying on any external state from previous builds.
> >>>>>
> >>>>> This is NOT the case in QEMU, because we are building container
> >>>>> images and these are cached. This is a scenario in which the
> >>>>> "changes" conditional is not usuable.
> >>>>>
> >>>>> The only other way to avoid this problem would be to use the git
> >>>>> branch name as the container image tag, instead of always using
> >>>>> "latest".
> >>>> I'm basically fine with your patch, but let me ask one more thing: Won't we
> >>>> still have the problem if the user pushes to different branches
> >>>> simultaneously? E.g. the user pushes to "foo" with changes to dockerfiles,
> >>>> containers start to get rebuild, then pushes to master without waiting for
> >>>> the previous CI to finish, then the containers get rebuild from the "master"
> >>>> job without the local changes to the dockerfiles. Then in the "foo" CI
> >>>> pipelines the following jobs might run with the containers that have been
> >>>> built by the "master" job...
> >>>
> >>> Yes,  this is the issue I describe in the cover letter.
> >>>
> >>>> So if we really want to get it bulletproof, do we have to use the git branch
> >>>> name as the container image tag?
> >>>
> >>> That is possible, but I'm somewhat loathe to do that, as it means the
> >>> container registry in developers forks will accumulate a growing list
> >>> of image tags. I know gitlab will force expire once it gets beyond a
> >>> certain number of tags, but it still felt pretty wasteful of space
> >>> to create so many tags.
> >>>
> >>> Having said that, maybe this is not actually wasteful if we always
> >>> use the "master" as a cache for docker, then the "new" images we
> >>> build on each branch will just re-use existing docker layers and
> >>> thus not add to disk usage. We'd only see extra usage if the branch
> >>> contained changes to dockerfiles.
> >>
> >> The challenge here is that I need the docker tag name to be in an env
> >> variable in the gitlab-ci.yml file.
> >>
> >> I can directly use $CI_COMMIT_REF_NAME  to get the branch name but
> >> the list of valid characters for a git branch is way more permissive
> >> than valid characters for a docker tag.
> >>
> >> So we need to filter the git branch name to form a valid docker tag,
> >> and AFAICT, there's no way todo that when setting a global env variable
> >> in the gitlab-ci.yml.  I can only do filtering once in the before_script:
> >> stage, and that's too late to use it in the image name for the job.
> > 
> > I've thought of a solution here.
> > 
> > We can tag the images with $CI_COMMIT_SHORT_SHA , and the build jobs
> > can reference them with 
> > 
> >   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$CI_COMMIT_SHORT_SHA
> > 
> > In the continer build script, we then *also* tag them with a sanitized
> > version of $CI_COMMIT_REF_NAME, and also use this as the cache to pull
> > from when building the image.
> > 
> > The main downside here is that we'll end up creating alot of tags, but
> > most will have the same content so shouldn't be too bad.
> 
> This could be automated (for forks):
> 
> https://docs.gitlab.com/ee/user/packages/container_registry/#delete-images-by-using-a-cleanup-policy
> 
> Not yet to the qemu-project registry because:
> 
>   Cleanup policies can be run on all projects, with these exceptions:
> 
>     For GitLab.com, the project must have been created after 2020-02-22.

NB, when they say "project" here it appears to refer to the top level
namespace, ie your personal account namespace, not the individual repos.

None of my repos allow expiration to be turned on, even repos I only
created last week :-(

It apears they are getting close to removing this restriction though

  https://gitlab.com/gitlab-org/gitlab/-/issues/196124#note_492157369

so perhaps in the next 6 months expiration will be active.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


