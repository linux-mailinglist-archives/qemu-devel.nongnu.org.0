Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C4930000C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:21:03 +0100 (CET)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tYs-0007MS-6b
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2tWl-0006Jx-Pt
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:18:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2tWj-0002Or-H3
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611310728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gnk6/gYozV7p+8QDJ7TNJh7iaTpIMdhK6rNpERuxlZY=;
 b=bklRa+nOY5opkP/uBegYFjDtuNTLbDArXwU7Mt2+cAD6E+wp9AzOqYqu6kWJbSXAfee64b
 FcjcjcqTbOUfSdht5bLOWHKHh1KDTUYqgxs6ElUJv55lDn7SzAtG8qZy7oG14vZydWxSnJ
 YyKGLvmnQgMt2uuNrkz0J9FiGRIjBb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-gv_R2qopO1q080nMQmoAcw-1; Fri, 22 Jan 2021 05:18:47 -0500
X-MC-Unique: gv_R2qopO1q080nMQmoAcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECB0559;
 Fri, 22 Jan 2021 10:18:45 +0000 (UTC)
Received: from redhat.com (ovpn-115-108.ams2.redhat.com [10.36.115.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4796F442;
 Fri, 22 Jan 2021 10:18:35 +0000 (UTC)
Date: Fri, 22 Jan 2021 10:18:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.yml: Use the whole tree as artifacts to speed
 up the CI
Message-ID: <20210122101833.GC3150238@redhat.com>
References: <20210122100722.705375-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210122100722.705375-1-thuth@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 11:07:22AM +0100, Thomas Huth wrote:
> Currently, our check-system-* jobs are recompiling the whole sources
> again. This happens due to the fact that the jobs are checking out
> the whole source tree and required submodules again, and only try
> to use the "build" directory with the binaries and object files
> as an artifact from the previous stage - which simply does not work
> anymore (with the current version of meson). Due to some changed
> time stamps, meson is always trying to rebuild the whole tree.

This used to work in the past didn't it ? Did something change in
meson to break this, or have we just not noticed before.

> So instead of trying to marry a freshly checked out source tree
> with the pre-built binaries in these jobs, let's simply pass the
> whole source including the submodules and the build tree as artifact
> to the test jobs. That way timestamps get preserved and there is
> no rebuild of the sources anymore. This saves ca. 15 - 20 minutes
> of precious CI cycles in each run.

I'm a little worried we might end up hitting the artifact size
limit which is supposedly 1GB on gitlab.com.  Im guessing this
must be measuring the compressed size though, as a src checkout
with build dir  and .git dir is already way over 1GB.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  This is how a job looked like before my patch, running for 42 minutes:
>  https://gitlab.com/huth/qemu/-/jobs/978432757
> 
>  And this is how it looks like afterwards - it just took 18 minutes:
>  https://gitlab.com/huth/qemu/-/jobs/979500316
> 
>  .gitlab-ci.d/containers.yml |  1 +
>  .gitlab-ci.yml              | 40 +++++++++++++++++++++++++------------
>  2 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index e2f9c99e27..d55280661f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -39,7 +39,6 @@ include:
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>    script:
>      - cd build
> -    - find . -type f -exec touch {} +
>      - make $MAKE_CHECK_ARGS
>  
>  .acceptance_template: &acceptance_definition
> @@ -83,8 +82,7 @@ build-system-alpine:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - .git-submodule-status
> -      - build
> +      - "*"
>  
>  check-system-alpine:
>    <<: *native_test_job_definition
> @@ -92,6 +90,7 @@ check-system-alpine:
>      - job: build-system-alpine
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: alpine
>      MAKE_CHECK_ARGS: check
>  
> @@ -101,6 +100,7 @@ acceptance-system-alpine:
>      - job: build-system-alpine
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: alpine
>      MAKE_CHECK_ARGS: check-acceptance
>    <<: *acceptance_definition
> @@ -116,7 +116,7 @@ build-system-ubuntu:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - build
> +      - "*"
>  
>  check-system-ubuntu:
>    <<: *native_test_job_definition
> @@ -124,6 +124,7 @@ check-system-ubuntu:
>      - job: build-system-ubuntu
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: ubuntu2004
>      MAKE_CHECK_ARGS: check
>  
> @@ -133,6 +134,7 @@ acceptance-system-ubuntu:
>      - job: build-system-ubuntu
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: ubuntu2004
>      MAKE_CHECK_ARGS: check-acceptance
>    <<: *acceptance_definition
> @@ -148,7 +150,7 @@ build-system-debian:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - build
> +      - "*"
>  
>  check-system-debian:
>    <<: *native_test_job_definition
> @@ -156,6 +158,7 @@ check-system-debian:
>      - job: build-system-debian
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: debian-amd64
>      MAKE_CHECK_ARGS: check
>  
> @@ -170,7 +173,7 @@ build-tools-and-docs-debian:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - build
> +      - "*"
>  
>  acceptance-system-debian:
>    <<: *native_test_job_definition
> @@ -178,6 +181,7 @@ acceptance-system-debian:
>      - job: build-system-debian
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: debian-amd64
>      MAKE_CHECK_ARGS: check-acceptance
>    <<: *acceptance_definition
> @@ -194,7 +198,7 @@ build-system-fedora:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - build
> +      - "*"
>  
>  check-system-fedora:
>    <<: *native_test_job_definition
> @@ -202,6 +206,7 @@ check-system-fedora:
>      - job: build-system-fedora
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: fedora
>      MAKE_CHECK_ARGS: check
>  
> @@ -211,6 +216,7 @@ acceptance-system-fedora:
>      - job: build-system-fedora
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: fedora
>      MAKE_CHECK_ARGS: check-acceptance
>    <<: *acceptance_definition
> @@ -226,7 +232,7 @@ build-system-centos:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - build
> +      - "*"
>  
>  check-system-centos:
>    <<: *native_test_job_definition
> @@ -234,6 +240,7 @@ check-system-centos:
>      - job: build-system-centos
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: centos8
>      MAKE_CHECK_ARGS: check
>  
> @@ -243,6 +250,7 @@ acceptance-system-centos:
>      - job: build-system-centos
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: centos8
>      MAKE_CHECK_ARGS: check-acceptance
>    <<: *acceptance_definition
> @@ -257,7 +265,7 @@ build-system-opensuse:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - build
> +      - "*"
>  
>  check-system-opensuse:
>    <<: *native_test_job_definition
> @@ -265,6 +273,7 @@ check-system-opensuse:
>      - job: build-system-opensuse
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: opensuse-leap
>      MAKE_CHECK_ARGS: check
>  
> @@ -274,6 +283,7 @@ acceptance-system-opensuse:
>       - job: build-system-opensuse
>         artifacts: true
>     variables:
> +     GIT_CHECKOUT: "false"
>       IMAGE: opensuse-leap
>       MAKE_CHECK_ARGS: check-acceptance
>     <<: *acceptance_definition
> @@ -444,7 +454,7 @@ build-deprecated:
>    artifacts:
>      expire_in: 2 days
>      paths:
> -      - build
> +      - "*"
>  
>  # We split the check-tcg step as test failures are expected but we still
>  # want to catch the build breaking.
> @@ -454,6 +464,7 @@ check-deprecated:
>      - job: build-deprecated
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: debian-all-test-cross
>      MAKE_CHECK_ARGS: check-tcg
>    allow_failure: true
> @@ -526,7 +537,7 @@ build-crypto-old-nettle:
>      MAKE_CHECK_ARGS: check-build
>    artifacts:
>      paths:
> -      - build
> +      - "*"
>  
>  check-crypto-old-nettle:
>    <<: *native_test_job_definition
> @@ -534,6 +545,7 @@ check-crypto-old-nettle:
>      - job: build-crypto-old-nettle
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: centos7
>      MAKE_CHECK_ARGS: check
>  
> @@ -547,7 +559,7 @@ build-crypto-old-gcrypt:
>      MAKE_CHECK_ARGS: check-build
>    artifacts:
>      paths:
> -      - build
> +      - "*"
>  
>  check-crypto-old-gcrypt:
>    <<: *native_test_job_definition
> @@ -555,6 +567,7 @@ check-crypto-old-gcrypt:
>      - job: build-crypto-old-gcrypt
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: centos7
>      MAKE_CHECK_ARGS: check
>  
> @@ -568,7 +581,7 @@ build-crypto-only-gnutls:
>      MAKE_CHECK_ARGS: check-build
>    artifacts:
>      paths:
> -      - build
> +      - "*"
>  
>  check-crypto-only-gnutls:
>    <<: *native_test_job_definition
> @@ -576,6 +589,7 @@ check-crypto-only-gnutls:
>      - job: build-crypto-only-gnutls
>        artifacts: true
>    variables:
> +    GIT_CHECKOUT: "false"
>      IMAGE: centos7
>      MAKE_CHECK_ARGS: check
>  
> -- 
> 2.27.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


