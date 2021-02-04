Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC1430FC94
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:25:20 +0100 (CET)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kFh-000395-8b
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7jph-0005sp-VE
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7jpb-0005zu-TX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612465097;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fe/PtsqQ+9PL1kFV7mQ0CAVPnCfjgvjVa2fR+8Pl1Ko=;
 b=g6yQlSjimzUTXCLlnfUMWY8aWreJwJGr7nv0kVue9/IbEXNYH7tA4cQDHbQMRFjFBzIT6y
 s2x5xP/xLrwm5N2llvwW/G772tOgL2jmrrHT5x+SuDZtgtGgJMs/OOBn55/1g19qM1e/bN
 MMQWr+HCj5ceUHMn+fnhkgD2iBFMOS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-QjrYEj-lPXSuiWvNX9ymAw-1; Thu, 04 Feb 2021 13:58:12 -0500
X-MC-Unique: QjrYEj-lPXSuiWvNX9ymAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E37D80403C;
 Thu,  4 Feb 2021 18:58:10 +0000 (UTC)
Received: from redhat.com (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAB7D10016F5;
 Thu,  4 Feb 2021 18:58:08 +0000 (UTC)
Date: Thu, 4 Feb 2021 18:58:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: gitlab containers are broken
Message-ID: <20210204185805.GA903389@redhat.com>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
 <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
 <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
 <6ec7bebe-587d-df2d-0221-e12cb6f4c775@redhat.com>
 <20210204100009.GE549438@redhat.com>
 <9e716df9-3be3-4c79-dff3-e6475b13fdc5@linaro.org>
 <20210204173736.GV549438@redhat.com>
 <f2a184c7-80f1-afb2-e502-3b03f586d4dc@linaro.org>
MIME-Version: 1.0
In-Reply-To: <f2a184c7-80f1-afb2-e502-3b03f586d4dc@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 08:27:00AM -1000, Richard Henderson wrote:
> On 2/4/21 7:37 AM, Daniel P. Berrangé wrote:
> > On Thu, Feb 04, 2021 at 07:36:19AM -1000, Richard Henderson wrote:
> >> On 2/4/21 12:00 AM, Daniel P. Berrangé wrote:
> >>>>> Hmm.  Is there any way to get the full output of the container build?  At
> >>>>> present it's being truncated:
> >>>>>
> >>>>> #7 [4/5] RUN yum install -y bzip2     bzip2-devel     ccache     csnappy-de...
> >>>>>
> >>>>>
> >>>>> In particular, I'm trying to add a new test, and I have added libffi-devel.i686
> >>>>> to the fedora-i386-cross.docker file, but then the actual build fails because
> >>>>> the libffi header file is missing.
> >> ...
> >>> Alternatively just make your changes to the dockerfiles and thne push
> >>> the branch to gitlab. Gitlab will run the build and you can pull down
> >>> the docker image from your fork's docker registry
> >>
> >> That's what I did, with the results as described above.
> > 
> > Ah, if you can point me to the gitlab pipeline / branch I can have a
> > look at diagnosing it.
> 
> One that failed is
> 
> https://gitlab.com/rth7680/qemu/-/pipelines/250583359
> 
> where the cross-i386-tci job fails.  It takes some digging to see that all of
> the correct bits are in place: from the head (84f9ac62) up to the ffi patch
> (7bdae288) which modifies the docker files, up to the gitlab patch (a1d93694)
> which adds the cross test.  I'll note that for this particular push, gitlab has
> failed to rebuild the containers, and I don't know why.

> Irritatingly, I re-pushed a combined cross-test+ffi patch on top of my current
> tci branch (since I had removed both patches shown above), and it seems to be
> working.  Possibly because this time gitlab decided to rebuild the containers:
> 
> https://gitlab.com/rth7680/qemu/-/pipelines/251596167

I'm inclined to blame our gitlab CI rules. We have a condition for
the container builds:

  rules:
    - changes:
      - .gitlab-ci.d/containers.yml
      - tests/docker/*
      - tests/docker/dockerfiles/*
    - if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
    - if: '$CI_COMMIT_REF_NAME == "testing/next"'


The intent here is that containers are only built if a patch touches
these files.

The question is though *how* gitlab identifies that changes have been
made, when running a job for a branch. ie what set of commits does it
look at ?

The docs say it looks at the commits "in the push event".

IOW, if you have a git branch which has a delta of 40 commits vs
current git master, and you force push to that branch, it is not
guaranteed to look at all 40 commits.  I suspect it only looks
at commits which have changed since the previous push on that
branch.

This is a problem if you are pushing to multiple different
branches.

The containers are always tagged with ":latest", which means
that every time a build runs on a branch it will replace
containers created from a different branch.

So consider you

 - Push 40 commits to tci-next with a dockerfile change in the 4th commit.
   This triggers a build of the containers.

   Containers reflect your tci-next branch content.

 - Now push to master to catch up with upstream. This triggers a rebuild
   becuase of if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'

   Containers reflect your master branch content.

 - Push 40 commits to tci-next, but only the last 5 in the branch are
   different from your previous commit.  The container build won't
   trigger, despite the branch containing a dockerfile change, because
   the commit with the dockerfile wasn't changed from previous push


I've not dug further back into your pipeline history to verify if this
is what happened, but I've convinced myself that it is plausible, and
thus I believe our rules for container rebuilds are likely fundamentally
broken.

When I first introduced the container build stuff to gitlab, I used
the :latest tag because I don't want to pollute the container registry
with an ever growing number of tags for throwaway branches. This was
safe because my original patches *always* ran the container builds,
and told docker to use the existing image as a cache. This meant that
despite running in every pipeline, the container builds were reasonably
fast as they'd hit docker layer cache most of the time.

The addition of the rules to make container builds conditional has
broken the assumption that it is safe to use :latest for the docker
tag.

I think we need to remove the rules condition

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


