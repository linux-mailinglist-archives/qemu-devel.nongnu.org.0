Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CEE43C90F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 13:58:58 +0200 (CEST)
Received: from localhost ([::1]:44828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfha6-0007qM-0f
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 07:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfhN1-0002pf-ND
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mfhMv-0007SN-JV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 07:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635335116;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TE/eIunoYxU5sPe5scPwjmOOGDgMbN16u9Xfd+idQ8=;
 b=WhpZ/BJbpkaSePVv1gJd4ydyYjGYoWBnzkdxguZIOA/qMpKw/9PNb1mbsXH1bUYlV7K5i9
 nLdchu+z7mxInxTMWO2MLvXzzWeRppPkzwM7jZqFAHLh2tw78K6mOWHMtml8vrnZEtsqXs
 5WUa0rCDMji7PxzlEDAm+pTkjNpgQoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-61nMqDV1N5-w7iBUHfM0eg-1; Wed, 27 Oct 2021 07:45:03 -0400
X-MC-Unique: 61nMqDV1N5-w7iBUHfM0eg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A52021006AA3;
 Wed, 27 Oct 2021 11:45:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFA41001B3B;
 Wed, 27 Oct 2021 11:44:30 +0000 (UTC)
Date: Wed, 27 Oct 2021 12:44:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/1] gitlab-ci: Only push docker images to mainstream
 registry from /master
Message-ID: <YXk7nLN/rBGk+Gaz@redhat.com>
References: <20211026145509.1029274-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026145509.1029274-1-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 04:55:08PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I guess I got very unlucky because I happened to pull the docker
> images from the mainstream registry in a very short time frame
> where they jumped back in time... Then I kept using them to run
> my tests during 1 week trying to understand why I was having odd
> build failures. Then I realize the Ubuntu docker images were out
> of sync. I pulled again and it was working, so I searched for the
> mainstream job producing the outdated images and found a pipeline
> pushing the 'stable-6.0-staging' branch. This branch doesn't
> contain the recent gitlab-ci and Dockerfile changes...
> 
> Similarly, this branch doesn't contain commit eafadbbbac0
> ("gitlab: only let pages be published from default branch") so
> outdated documentation got pushed for a short time.
> 
> This patch won't fix branches pushed from the past, but at least
> it should avoid to reproduce this problem in the future.
> 
> Any idea how to improve the GitLab infrastructure to avoid these
> kind of problems in the future? Is it possible to enforce
> restrictions from the project configuration, rather than the
> repository YAML file?

The problem here is the general way we are handling docker images
in the CI pipeline.

In the first stage of the pipeline we build and publish images
with a tag   "$reponame/$imagename:latest".  We need to publish
them because the next stage of the pipeline has to be able to
pull the just built images - stages can't directly inherit the
docker images from each stages without going via the registry.

The use of ":latest" here is the root cause of our problems.
It works only under the assumptions:

  - you have a single pipeline running for any repository at
    any point in time
  - you only need a single maintainance stage (master)

The first assumption was never really true. In the main qemu-project
namespace we sometimes end up ith pipelines runnning on 'master' for
just pushed series, and for 'staging' for series being tested for
merge. Most of the time we get away with this but we've seen a few
rare CI failures from it. Similarly in user forks most of the time
we get away with it, but sometimes users might quickly push to
different branches. In all cases the race is only a problem when
a patch series contains dockerfile changes, which is why it is such
a rare problem

So far we've only been relying on the CI pipeline for pushes to master,
since stable branch maint has been awol for a while. We're soon going
to starting violating this assumption though.

IOW, we can't keep relying on ":latest", as its going to cause increasing
trouble.

The reason we picked ":latest" though is because gitlab CI config is a
bit inflexible:

  - It has to be either a fixed string, or the contents of a standard
    environment variable present in gitlab:

    https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

    We can't populate our own env variables dynamically, nor
    programatically define a tag


  - The tag contents has to satisfy the Docker restrictions on valid
    characters in tags

      "A tag name must be valid ASCII and may contain lowercase and 
       uppercase letters, digits, underscores, periods and dashes. 
       A tag name may not start with a period or a dash and may 
       contain a maximum of 128 characters."

Essentially we need two tags

 - One that is only for use during execution of the current pipeline
 - One that is published only on success of the pipeline on master,
   to serve as cache for future pipelines, or to let developer pull


Notably the latter is more restrictive that git branch names. We could
assume users always have "sensible" branch names that are less than
128 chars and only alpha-num characters plus dash/underscore. This
would be fine for my personal branch naming, but I wonder if anyone
uses wierd branch names that would violate docker tag name rules ?
Perhaps we just accept that risk and have the CI job that builds the
container fail + print a clear message to user to rename their branch
to something sensible.

Ideally we would take a sha256 sum of the dockerfile (and parent layers
it inherits from) and use that as the image tag. That fails with the
constraint number 1 though - we can't programmatically set tags. This
would maximise our cache hit rate though, compared to the single
"latest" tag we publish.

The other alternative option here is to use the current git commit
hash to as the image tag, since this is valid docker tag name and is
unique for the dockerfile contents even if multiple pipelines run for
the same commit.

An even more unique option is to use the unique pipeline ID as the
tag.

Using either commit hash or pipeline ID will lead to an explosion in
the number of tags present in the repository's container registry.
GitLab has ability to periodically cleanup old tags but on all my
repos this appears disabled by default.

We could manually delete the tag, at the end of the pipeline, but that
causes trouble if multiple pipelines for the same commit hash are runing
concurrently, as the tag might still be needed by something later. Also
it means the developer can't easily reproduce problems using the *exact*
image the pipeline used.


Maybe we put something at the start of the pipeline that manualyl deletes
any obsolete tags (eg > 7 days old) from previous pipelines. This re-invents
gitlab tag cleanup, in a way that doesn't require every develoiper to
toggle a setting in their repo.


So my overall inclination is

 - Modify ".container_job_template"

    - If image tag matching the sha256 sum of the dockerfile(s) exists:
    
       - Publish new tag based on $CI_PIPELINE_IID, copying the sha256 tag
       
    - Else

       - Build new image from scratch, no caching
       - Publish new tag based on sha256 sum of the dockerfile(s)
       - Publish new tag based on $CI_PIPELINE_IID

 - Modify ".native_build_job_template"

    - Use $CI_REGISTRY_IMAGE/qemu/$IMAGE:$CI_PIPELINE_IID

 - Add a final job

    - Publish a new tag ":latest" based on the image built earlier,
      *if* this branch is "master" and all jobs succeeded

      Possibly, we could add ":master" and ":stable-XXX" too as
      convenience tags ?

 - Add an early job

    - Delete all $CI_PIPELINE_IID based tags older than 7 days
    - Delete all sha256 sum tags older than 7 days *provided*
      the tag does not match the current sha256 content


In the common case I believe this will make our pipelines faster,
because publishing the $CI_PIPELINE_IID based oan copy of the sha256
tag can be done without even pulling down the image. It is a pure
metadata operation from docker registry POV.  Our current caching by
contrast needs to pull down existing images to see if their content
is usable, which takes time.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


