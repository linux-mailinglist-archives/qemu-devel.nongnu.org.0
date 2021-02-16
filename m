Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AAF31C86F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:54:30 +0100 (CET)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBx3t-0002zg-4Y
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBx2Q-0002Ym-5N
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:52:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBx2O-00072J-DK
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613469175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRReZNgCWzUmpfIFFGfMkJs+6acHmwwCq7vHjR8sy18=;
 b=TB1pHU47G5l/twvsjjvqvPsLImSWV+2Zl35pQgZGeYqlr6KKhfpryUGSLfcLocWy/Yv2mz
 B67BnJ+PZzA4YGY2YQ9GUu21LwCYBBpgFgLvHYCVfHwiQNtrB2Qyh9zUeJSKwOWeZ5J9A7
 jiE5dNSsoENQaWR8bnMQFt+OVWACj8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-r1Uaw6TqMR20R3ZYVh9iXw-1; Tue, 16 Feb 2021 04:52:52 -0500
X-MC-Unique: r1Uaw6TqMR20R3ZYVh9iXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C08AC283;
 Tue, 16 Feb 2021 09:52:51 +0000 (UTC)
Received: from redhat.com (ovpn-112-215.ams2.redhat.com [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A5912B0AA;
 Tue, 16 Feb 2021 09:52:46 +0000 (UTC)
Date: Tue, 16 Feb 2021 09:52:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Only push Docker 'latest' image when building
 default branch
Message-ID: <YCuV624Qhy5F9CAZ@redhat.com>
References: <20210215192814.989441-1-philmd@redhat.com>
 <97878d0a-5c47-c50c-c4ef-f6d69a52a7d0@redhat.com>
 <b09a8758-4cb5-b0bb-4c4a-334ea2d52b29@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b09a8758-4cb5-b0bb-4c4a-334ea2d52b29@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 08:05:09AM +0100, Philippe Mathieu-Daudé wrote:
> On 2/16/21 7:55 AM, Thomas Huth wrote:
> > On 15/02/2021 20.28, Philippe Mathieu-Daudé wrote:
> >> While we are interested in building docker images in different
> >> branches, it only makes sense to push 'latest' to the registry
> >> when this is the project default branch (usually 'master').
> >>
> >> Else when pushing different branches concurrently we might have
> >> inconsistent image state between branches.
> >>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>   .gitlab-ci.d/containers.yml | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> >> index 90fac85ce46..52a915f4141 100644
> >> --- a/.gitlab-ci.d/containers.yml
> >> +++ b/.gitlab-ci.d/containers.yml
> >> @@ -17,7 +17,7 @@
> >>             -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
> >>             -r $CI_REGISTRY_IMAGE
> >>       - docker tag "qemu/$NAME" "$TAG"
> >> -    - docker push "$TAG"
> >> +    - test "$CI_COMMIT_BRANCH" = "$CI_DEFAULT_BRANCH" && docker push
> >> "$TAG"
> > 
> > So does that mean that the following stages in the CI (i.e. build, test)
> > are only always (i.e. also for the non-master branches) going to use
> > containers that have been build on the master branch?
> 
> Hmm good point. Should we use "$CI_COMMIT_BRANCH" instead of "latest"?

This doesn't work because git branch names are not guaranteed to be
valid docker tag names. Please see my thread here:

  https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03535.html

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


