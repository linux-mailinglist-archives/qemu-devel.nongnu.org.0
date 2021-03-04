Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659532D104
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:42:24 +0100 (CET)
Received: from localhost ([::1]:53284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlR1-0002of-IX
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlOo-0000MW-5h
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHlOl-0003ga-Ug
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614854403;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YWhgcPErSn9U32dhXOTbQ3kHtPT63bh5Clv7bxbsX+Y=;
 b=ee6OpPd3p+g8MtStvtRGRmUve6Kt1xHzi1juLmcwWj6OaoFYAmvSzezQHqOBzWRwIDIEwu
 QXPzUpNgWWedRkrvAiwNsR6nxDMp9Ie1pqCBFGpaKqSOow6KNs8ImLdVsnnyDSmJ9QXd5J
 wrBxJB8RVreGNmoZByWY6VKyZDLgYVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-u0I8FGjAPOabn0SfRSDyrQ-1; Thu, 04 Mar 2021 05:40:01 -0500
X-MC-Unique: u0I8FGjAPOabn0SfRSDyrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29971108BD0E;
 Thu,  4 Mar 2021 10:40:00 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22181175BB;
 Thu,  4 Mar 2021 10:39:44 +0000 (UTC)
Date: Thu, 4 Mar 2021 10:39:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 2/2] gitlab-ci.yml: Add jobs to test CFI flags
Message-ID: <YEC47lN4Xt3LUsP6@redhat.com>
References: <20210304030948.9367-1-dbuono@linux.vnet.ibm.com>
 <20210304030948.9367-3-dbuono@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210304030948.9367-3-dbuono@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 10:09:48PM -0500, Daniele Buono wrote:
> QEMU has had options to enable control-flow integrity features
> for a few months now. Add two sets of build/check/acceptance
> jobs to ensure the binary produced is working fine.
> 
> The three sets allow testing of x86_64 binaries for x86_64, s390x,
> ppc64 and aarch64 targets
> 
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> ---
>  .gitlab-ci.yml | 119 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 814f51873f..7b1f25c92e 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -483,6 +483,125 @@ clang-user:
>        --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
>      MAKE_CHECK_ARGS: check-unit check-tcg
>  
> +# Set LD_JOBS=1 because this requires LTO and ld consumes a large amount of memory.
> +# On gitlab runners, default value sometimes end up calling 2 lds concurrently and
> +# triggers an Out-Of-Memory error
> +#
> +# Since slirp callbacks are used in QEMU Timers, slirp needs to be compiled together
> +# with QEMU and linked as a static library to avoid false positives in CFI checks.
> +# This can be accomplished by using -enable-slirp=git, which avoids the use of
> +# a system-wide version of the library
> +#
> +# Split in three sets of build/check/acceptance to limit the execution time of each
> +# job
> +build-cfi-arm:

s/arm/aarch64/

> +  <<: *native_build_job_definition
> +  needs:
> +  - job: amd64-fedora-container
> +  variables:
> +    LD_JOBS: 1
> +    AR: llvm-ar
> +    IMAGE: fedora
> +    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
> +      --enable-safe-stack --enable-slirp=git
> +    TARGETS: aarch64-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
> +check-cfi-arm:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-cfi-arm
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +    MAKE_CHECK_ARGS: check
> +
> +acceptance-cfi-arm:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-cfi-arm
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +    MAKE_CHECK_ARGS: check-acceptance
> +  <<: *acceptance_definition
> +
> +build-cfi-ibm:

Lets not use vendor names here - keep the target names. ie

  build-cfi-s390x-ppc64

and equivalent for the rest of the jobs below....

> +  <<: *native_build_job_definition
> +  needs:
> +  - job: amd64-fedora-container
> +  variables:
> +    LD_JOBS: 1
> +    AR: llvm-ar
> +    IMAGE: fedora
> +    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
> +      --enable-safe-stack --enable-slirp=git
> +    TARGETS: ppc64-softmmu s390x-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
> +check-cfi-ibm:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-cfi-ibm
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +    MAKE_CHECK_ARGS: check
> +
> +acceptance-cfi-ibm:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-cfi-ibm
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +    MAKE_CHECK_ARGS: check-acceptance
> +  <<: *acceptance_definition
> +
> +build-cfi-intel:
> +  <<: *native_build_job_definition
> +  needs:
> +  - job: amd64-fedora-container
> +  variables:
> +    LD_JOBS: 1
> +    AR: llvm-ar
> +    IMAGE: fedora
> +    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
> +      --enable-safe-stack --enable-slirp=git
> +    TARGETS: x86_64-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
> +check-cfi-intel:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-cfi-intel
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +    MAKE_CHECK_ARGS: check
> +
> +acceptance-cfi-intel:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-cfi-intel
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +    MAKE_CHECK_ARGS: check-acceptance
> +  <<: *acceptance_definition
> +
>  tsan-build:
>    <<: *native_build_job_definition
>    variables:
> -- 
> 2.30.0
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


