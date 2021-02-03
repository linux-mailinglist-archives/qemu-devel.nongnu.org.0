Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B527B30E394
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:51:06 +0100 (CET)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OB7-0002di-Ps
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7NtS-0000Of-Jd
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:32:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7NtP-0006L1-L6
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612380767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JnbaweZAOqEq/Ida/sdqiuveoSdNMKrj4znQhmU6ZHs=;
 b=ikQjQj4Tpzsrw7WpTOeelA2BFCNWZKjSEidkFEpnao/TyYUHdAPvz1UX1yTsdcx55S990e
 B7K+TRXLaD80VKx64Xg8zRRHzBfdXqhNaTCl9/cfJ/aaAAT2XrBZbMoNvctA6zBKYpxSCv
 8aMwKnaeKFwZNrxL2KbpQC+7pfS7NJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-JLMeEyWPPI2zW4wVqJjt5Q-1; Wed, 03 Feb 2021 14:32:42 -0500
X-MC-Unique: JLMeEyWPPI2zW4wVqJjt5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A2B1801961;
 Wed,  3 Feb 2021 19:32:41 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5EE45C238;
 Wed,  3 Feb 2021 19:32:37 +0000 (UTC)
Subject: Re: [PATCH 1/6] travis.yml: Move gprof/gcov test across to gitlab
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210203113243.280883-1-thuth@redhat.com>
 <20210203113243.280883-2-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d8621cd3-7b95-10a2-8696-b4daada8b10f@redhat.com>
Date: Wed, 3 Feb 2021 16:32:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203113243.280883-2-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/3/21 8:32 AM, Thomas Huth wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>
> Similarly to commit 8cdb2cef3f1, move the gprof/gcov test to GitLab.
>
> The coverage-summary.sh script is not Travis-CI specific, make it
> generic.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20201108204535.2319870-10-philmd@redhat.com>
> [thuth: Add gcovr and bsdmainutils which are required for the
>          overage-summary.sh script to the ubuntu docker file]
s/overage/coverage/
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.yml                             | 12 ++++++++++++
>   .travis.yml                                | 14 --------------
>   MAINTAINERS                                |  2 +-
>   scripts/{travis => ci}/coverage-summary.sh |  2 +-
>   tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
>   5 files changed, 16 insertions(+), 16 deletions(-)
>   rename scripts/{travis => ci}/coverage-summary.sh (92%)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 7c0db64710..8b97b512bb 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -468,6 +468,18 @@ check-deprecated:
>       MAKE_CHECK_ARGS: check-tcg
>     allow_failure: true
>   
> +# gprof/gcov are GCC features
> +build-gprof-gcov:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --enable-gprof --enable-gcov
> +    MAKE_CHECK_ARGS: build-tcg

With build-tcg it generates an empty report, e.g., 
https://gitlab.com/wainersm/qemu/-/jobs/1005923421

Shouldn't it run `make check`?

- Wainer

> +    TARGETS: aarch64-softmmu mips64-softmmu ppc64-softmmu
> +             riscv64-softmmu s390x-softmmu x86_64-softmmu
> +  after_script:
> +    - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
> +
>   build-oss-fuzz:
>     <<: *native_build_job_definition
>     variables:
> diff --git a/.travis.yml b/.travis.yml
> index 5f1dea873e..76b69f6de1 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -166,20 +166,6 @@ jobs:
>         compiler: clang
>   
>   
> -    # gprof/gcov are GCC features
> -    - name: "GCC gprof/gcov"
> -      dist: bionic
> -      addons:
> -        apt:
> -          packages:
> -            - ninja-build
> -      env:
> -        - CONFIG="--enable-gprof --enable-gcov --disable-libssh
> -                  --target-list=${MAIN_SOFTMMU_TARGETS}"
> -      after_success:
> -        - ${SRC_DIR}/scripts/travis/coverage-summary.sh
> -
> -
>       # Using newer GCC with sanitizers
>       - name: "GCC9 with sanitizers (softmmu)"
>         dist: bionic
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcd88668bc..f14a2e6eb5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3193,7 +3193,7 @@ R: Philippe Mathieu-Daudé <philmd@redhat.com>
>   S: Maintained
>   F: .github/lockdown.yml
>   F: .travis.yml
> -F: scripts/travis/
> +F: scripts/ci/
>   F: .shippable.yml
>   F: tests/docker/
>   F: tests/vm/
> diff --git a/scripts/travis/coverage-summary.sh b/scripts/ci/coverage-summary.sh
> similarity index 92%
> rename from scripts/travis/coverage-summary.sh
> rename to scripts/ci/coverage-summary.sh
> index d7086cf9ca..8d9fb4de40 100755
> --- a/scripts/travis/coverage-summary.sh
> +++ b/scripts/ci/coverage-summary.sh
> @@ -3,7 +3,7 @@
>   # Author: Alex Bennée <alex.bennee@linaro.org>
>   #
>   # Summerise the state of code coverage with gcovr and tweak the output
> -# to be more sane on Travis hosts. As we expect to be executed on a
> +# to be more sane on CI runner. As we expect to be executed on a
>   # throw away CI instance we do spam temp files all over the shop. You
>   # most likely don't want to execute this script but just call gcovr
>   # directly. See also "make coverage-report"
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 8519584d2b..9750016e51 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -1,8 +1,10 @@
>   FROM ubuntu:20.04
>   ENV PACKAGES flex bison \
> +    bsdmainutils \
>       ccache \
>       clang-10\
>       gcc \
> +    gcovr \
>       genisoimage \
>       gettext \
>       git \


