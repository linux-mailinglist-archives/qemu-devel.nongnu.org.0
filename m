Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEF2ED6B2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:29:39 +0100 (CET)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxa2U-0005vO-QO
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxa1U-0005UM-Te
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:28:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxa1P-0005wB-9p
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 13:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610044110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uCmwDIkXtK5I7alTr5T1G1Sp6YG5oy52aEr6dQRODS4=;
 b=fWM2dFryNPpRZJi3fNfeuZHNTScQFg6v2EQ/u8nbDhgcAhuRaRfUYyIvLk7x4Usc80U5ej
 VdBIb+zs3KWgMLa1zbcw+805K//pjs0wdZMvpoBuclLsxOqqF1GJOBHMxpM7DyrbwXVBa8
 BY4pJO6IOHkZ6yCflUh5u4Jtgbow6Q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-EgqT7gihNyiaMcYCotRNvQ-1; Thu, 07 Jan 2021 13:28:24 -0500
X-MC-Unique: EgqT7gihNyiaMcYCotRNvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 924368735DA;
 Thu,  7 Jan 2021 18:28:23 +0000 (UTC)
Received: from redhat.com (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 765C31820E;
 Thu,  7 Jan 2021 18:28:15 +0000 (UTC)
Date: Thu, 7 Jan 2021 18:28:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH] ci: ensure that all jobs use a shallow clone
Message-ID: <20210107182812.GI1029501@redhat.com>
References: <20210107171719.477856-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210107171719.477856-1-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 06:17:19PM +0100, Paolo Bonzini wrote:
> We are still using quite a bit of bandwidth to run CI jobs, even though
> GitLab has switched to gitlab.com to fetch the sources.  This is in
> part because we are handling submodules ourselves and therefore those
> do not use shallow clones.

I presume the impact is going to vary for GitLab vs the other
CI systems.  For gitlab, any bandwidth used should be entirely
within gitlab's own network infra since its pulling repos
from  gitlab.com/qemu-project

For Cirrus/Shippable/Travis  the bandwidth used would be more
of a potential performance problem.

> Observe GitLab's GIT_DEPTH environment variable in
> scripts/git-submodule.sh so that CI systems can use a shallow clone
> for submodules.  Set a depth of 3 for all CI systems, for both the main
> repository (using whatever native configuration mechanism is there)
> and the submodules.
> 
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>         Completely untested, just to propose the idea.

The check-patch and check-dco jobs need the git history depth to be
long enough to cover the entire contents of the branch that is being
tested vs common ancestor against git master.

This could potentially be 100's of commits deep for some of the very
largest branches we see merged in qemu


Travis has issues with git cloning and concurrent pushes.

eg if you push branch A, it schedules a CI job. Then you
push branch B before jobs for A have started.

When the job for A starts, it will be unable to checkout
the commit for branch A's merge because the history will
be too shallow.


I'm not sure if the other CI systems have similar issues or
not.

> 
>  .cirrus.yml              | 1 +
>  .gitlab-ci.yml           | 3 +++
>  .shippable.yml           | 2 ++
>  .travis.yml              | 2 ++
>  scripts/git-submodule.sh | 2 +-
>  5 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 6f2a958472..47c2467d04 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -1,5 +1,6 @@
>  env:
> -  CIRRUS_CLONE_DEPTH: 1
> +  CIRRUS_CLONE_DEPTH: 3
> +  GIT_DEPTH: 3
>  
>  freebsd_12_task:
>    freebsd_instance:
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 01c9e46410..ff19a9c313 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -7,6 +7,9 @@ stages:
>    - build
>    - test
>  
> +variables:
> +  GIT_DEPTH: 3
> +
>  include:
>    - local: '/.gitlab-ci.d/edk2.yml'
>    - local: '/.gitlab-ci.d/opensbi.yml'
> diff --git a/.shippable.yml b/.shippable.yml
> index 14350e6de8..f2d59b478e 100644
> --- a/.shippable.yml
> +++ b/.shippable.yml
> @@ -1,9 +1,11 @@
>  language: c
> +depth: 3
>  git:
>     submodules: false
>  env:
>    global:
>      - LC_ALL=C
> +    - GIT_DEPTH=3
>    matrix:
>      - IMAGE=debian-amd64
>        TARGET_LIST=x86_64-softmmu,x86_64-linux-user
> diff --git a/.travis.yml b/.travis.yml
> index f2a101936c..f2a785a42b 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -80,9 +80,11 @@ env:
>      - CCACHE_SLOPPINESS="include_file_ctime,include_file_mtime"
>      - CCACHE_MAXSIZE=1G
>      - G_MESSAGES_DEBUG=error
> +    - GIT_DEPTH=3
>  
>  
>  git:
> +  depth: 3
>    # we want to do this ourselves
>    submodules: false
>  
> diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
> index 65ed877aef..2886087a12 100755
> --- a/scripts/git-submodule.sh
> +++ b/scripts/git-submodule.sh
> @@ -75,7 +75,7 @@ update)
>          exit 0
>      fi
>  
> -    $GIT submodule update --init $modules 1>/dev/null
> +    $GIT submodule update ${GIT_DEPTH:+--depth "$GIT_DEPTH"} --init $modules 1>/dev/null
>      test $? -ne 0 && error "failed to update modules"
>  
>      $GIT submodule status $modules > "${substat}"
> -- 
> 2.29.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


