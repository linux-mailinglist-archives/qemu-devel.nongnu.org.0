Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85A2AD9B9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:09:10 +0100 (CET)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVGf-00012S-LW
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcVBs-00056B-2S
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcVBo-0008QL-Lb
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605020645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=woRRASDX9AlRR7376osoCviI1IIBpk7MwhZAQRbWgeI=;
 b=iVbfCPrVnw6YJvm+G+Jnn1UzNIv4Sj3ZS4smmOIfTmqdQ6pONpDRDg4Y4rpH4nolVH2wCI
 qkDz23Q/V+79k55zCDTvuJknoY2Gw6eVkO0XZDFaU1FQW8cjZweGzkWXDvFUWSMojA7BrA
 rk8y+0U45ci+yozM8mfwMk8bnK91na4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-ppJf3BumOUGwi8zJG6n62A-1; Tue, 10 Nov 2020 10:03:59 -0500
X-MC-Unique: ppJf3BumOUGwi8zJG6n62A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AEF11006C9C;
 Tue, 10 Nov 2020 15:03:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1427C5DA6A;
 Tue, 10 Nov 2020 15:03:48 +0000 (UTC)
Subject: Re: [PATCH-for-6.0 v4 09/17] gitlab-ci: Move gprof/gcov test across
 to gitlab
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-10-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <fa626c7f-3dce-8856-f8f8-55304d274839@redhat.com>
Date: Tue, 10 Nov 2020 13:03:41 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108204535.2319870-10-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 6:45 PM, Philippe Mathieu-Daudé wrote:
> Similarly to commit 8cdb2cef3f1, move the gprof/gcov test to GitLab.
>
> The coverage-summary.sh script is not Travis-CI specific, make it
> generic.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml                             | 12 ++++++++++++
>   .travis.yml                                | 14 --------------
>   MAINTAINERS                                |  2 +-
>   scripts/{travis => ci}/coverage-summary.sh |  2 +-
>   4 files changed, 14 insertions(+), 16 deletions(-)
>   rename scripts/{travis => ci}/coverage-summary.sh (92%)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 80082a602b8..d1583cee5db 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -403,6 +403,18 @@ check-deprecated:
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
> +    TARGETS: aarch64-softmmu mips64-softmmu ppc64-softmmu
> +             riscv64-softmmu s390x-softmmu x86_64-softmmu
> +  after_script:
> +    - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
> +

The script uses gcovr and it is not installed in the Ubuntu 20.04 
container image:

docker run registry.gitlab.com/qemu-project/qemu/qemu/ubuntu2004 gcovr
Emulate Docker CLI using podman. Create /etc/containers/nodocker to 
quiet msg.
Error: executable file not found in $PATH: No such file or directory: 
OCI runtime command not found error

- Wainer

>   build-oss-fuzz:
>     <<: *native_build_job_definition
>     variables:
> diff --git a/.travis.yml b/.travis.yml
> index bee6197290d..6087e2909cd 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -210,20 +210,6 @@ jobs:
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
>       # We don't need to exercise every backend with every front-end
>       - name: "GCC trace log,simple,syslog (user)"
>         env:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 817c7c93f91..3d8c586d444 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3121,7 +3121,7 @@ R: Philippe Mathieu-Daudé <philmd@redhat.com>
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
> index d7086cf9ca6..8d9fb4de401 100755
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


