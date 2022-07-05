Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C07566EDA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:04:08 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8iDm-0004We-QT
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8i8m-0002YT-M6
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8i8k-0005aR-10
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657025933;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tvcTazJVxCoIaLcufM/Bq2tAn36yVR7cFZcgCo9ESlY=;
 b=QTFGjVooL7QHzb9dxGR977F2PJMZiuB+5ywBmdI4ZN1pOfb78Gbrs8bG+H0lxyKDyGxEMc
 /GZ68QFO/3Ojmjf31R6hhLX7KmkbltcUSPWDJl83xTXVv6o/hg3IwT4CXVgvKOl49rm1tZ
 Qp4bdQ7IwfwgqqBt76koj71X8DuqjpM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-iESwEHRGPWapHX0x_qIw6Q-1; Tue, 05 Jul 2022 08:58:44 -0400
X-MC-Unique: iESwEHRGPWapHX0x_qIw6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06ABC83395C;
 Tue,  5 Jul 2022 12:58:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 455BF40C141F;
 Tue,  5 Jul 2022 12:58:42 +0000 (UTC)
Date: Tue, 5 Jul 2022 13:58:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
Subject: Re: [RFC] gitlab: introduce s390x wasmtime job
Message-ID: <YsQ1fuMRPpA+9AzX@redhat.com>
References: <20220704224844.2903473-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704224844.2903473-1-iii@linux.ibm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 05, 2022 at 12:48:44AM +0200, Ilya Leoshkevich wrote:
> wasmtime is a WebAssembly runtime, which includes a large testsuite.
> This testsuite uses qemu-user (aarch64 and s390x are supported) in
> order to exercise foreign architectures.

So you're saying that WebAssembly itself is aware of qemu-user
in its test suite, as opposed to us simply choosing to run its
test suite under qemu-user ?

Any idea why its limited to just two arches ?  Can it be made
to cover all QEMU arches, or are these the only ones that
wasmtime knows how to generate code for ?

>                                          Over time it found several
> regressions in qemu itself, and it would be beneficial to catch the
> similar ones earlier.

If we put this job in QEMU CI someone will have to be able to
interpret the results when it fails.

How practical is it going to be for QEMU maintainers to understand
a failure in wasmtime test suite, and correlate that back to a
problem in QEMU ? The risk with introducing any significant 3rd
party project to a CI system, is the lack of knowledge around
that external project creating a signifcant burden for the CI
system maintainers.

> To this end, this patch introduces a job that runs stable wasmtime
> testsuite against qemu-s390x. The job is split into the following
> components:
> 
> - A script for running the tests. Usable on developers' machines:
> 
>     qemu$ mkdir build
>     qemu$ cd build
>     qemu/build$ ../tests/wasmtime/test s390x
> 
> - A script for building the tests (build-toolchain.sh).
> 
> - A dockerfile describing an image with the prebuilt testsuite
>   (debian-s390x-wasmtime-cross.docker).
> 
> - gitlab job definition for building the image.
> 
> - gitlab job definition for using the image to run the tests.
> 
> It's possible to use this with aarch64 as well, but it segfaults at
> the moment, therefore this patch does not provide job definitions for
> it. This needs to be investigated separately.
> 
> The example of a resulting pipeline can be seen at [1].
> 
> The test job runs for about 30 minutes mostly due to unnecessary
> rebuilds. They will be gone once [2] is integrated and makes it to a
> stable release.
> 
> This patch depends on madvise(MADV_DONTNEED) passthrough support [3].
> 
> [1] https://gitlab.com/iii-i/qemu/-/pipelines/579677396
> [2] https://github.com/bytecodealliance/wasmtime/pull/4377
> [3] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00112.html
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  .gitlab-ci.d/container-cross.yml              | 10 +++
>  .gitlab-ci.d/container-template.yml           |  2 +-
>  .gitlab-ci.d/qemu-project.yml                 |  1 +
>  .gitlab-ci.d/wasmtime-template.yml            |  6 ++
>  .gitlab-ci.d/wasmtime.yml                     |  9 ++
>  tests/docker/Makefile.include                 |  6 ++
>  .../build-toolchain.sh                        | 83 +++++++++++++++++++
>  .../debian-s390x-wasmtime-cross.docker        | 16 ++++
>  tests/wasmtime/test                           | 39 +++++++++
>  9 files changed, 171 insertions(+), 1 deletion(-)
>  create mode 100644 .gitlab-ci.d/wasmtime-template.yml
>  create mode 100644 .gitlab-ci.d/wasmtime.yml
>  create mode 100755 tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh
>  create mode 100644 tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker
>  create mode 100755 tests/wasmtime/test
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index b7963498a3..b3c4b76a16 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -138,6 +138,16 @@ s390x-debian-cross-container:
>    variables:
>      NAME: debian-s390x-cross
>  
> +s390x-debian-wasmtime-cross-container:
> +  extends: .container_job_template
> +  stage: containers
> +  needs: ['s390x-debian-cross-container']

This job is in 'containers' stage, but it depends on a container
built in the same stage. Seems gitlab manages to schedule that
by effectively delaying the the build. Suggests that actually we
can entirely get rid of 'containers-layer2' and just let gitlab
figure out the container dependencies.

> +  variables:
> +    NAME: debian-s390x-wasmtime-cross
> +    DOCKER_SCRIPT_ARGS: >
> +      --extra-files
> +      tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh


> diff --git a/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh
> new file mode 100755
> index 0000000000..a28d61a353
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh
> @@ -0,0 +1,83 @@
> +#!/bin/sh
> +
> +# Build the stable wasmtime testsuite and run it with qemu-user from $PATH.
> +# ".rustup", ".cargo" and "wasmtime" subdirectories will be created or updated
> +# in the current directory.
> +#
> +# Based on https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/.github/workflows/main.yml#L208.
> +#
> +# Usage:
> +#
> +#     ./test TARGET_ARCH [CARGO_ARGS ...]
> +#
> +# where TARGET_ARCH is the architecture to test (aarch64 or s390x) and
> +# CARGO_ARGS are the extra arguments passed to cargo test.
> +
> +set -e -u -x
> +
> +# Dependency versions.
> +export RUSTUP_TOOLCHAIN=1.62.0
> +
> +# Bump when https://github.com/bytecodealliance/wasmtime/pull/4377 is
> +# integrated. Until this moment there will be some unnecessary rebuilds.
> +wasmtime_version=0.37.0
> +
> +# Script arguments.
> +arch=$1
> +shift
> +arch_upper=$(echo "$arch" | tr '[:lower:]' '[:upper:]')
> +
> +# Install/update Rust.
> +export RUSTUP_HOME="$PWD/.rustup"
> +export CARGO_HOME="$PWD/.cargo"
> +curl \
> +    --proto '=https' \
> +    --tlsv1.2 \
> +    -sSf \
> +    https://sh.rustup.rs \
> +    | sh -s -- -y \
> +        --default-toolchain="$RUSTUP_TOOLCHAIN" \
> +        --target=wasm32-wasi \
> +        --target=wasm32-unknown-unknown \
> +        --target="$arch"-unknown-linux-gnu

Why can't we just install the distros' rust packages ?


> +cat >"$CARGO_HOME/config" <<HERE
> +[build]
> +# Save space by not generating data to speed-up delta builds.
> +incremental = false
> +
> +[profile.test]
> +# Save space by not generating debug information.
> +debug = 0
> +
> +[net]
> +# Speed up crates.io index update.
> +git-fetch-with-cli = true
> +HERE
> +. "$PWD/.cargo/env"
> +
> +# Checkout/update wasmtime.
> +if [ -d wasmtime ]; then
> +    cd wasmtime
> +    git fetch --force --tags
> +    git checkout v"$wasmtime_version"
> +    git submodule update --init --recursive
> +else
> +    git clone \
> +        --depth=1 \
> +        --recurse-submodules \
> +        --shallow-submodules \
> +        -b v"$wasmtime_version" \
> +        https://github.com/bytecodealliance/wasmtime.git
> +    cd wasmtime
> +fi
> +
> +# Run wasmtime tests.
> +export CARGO_BUILD_TARGET="$arch-unknown-linux-gnu"
> +runner_var=CARGO_TARGET_${arch_upper}_UNKNOWN_LINUX_GNU_RUNNER
> +linker_var=CARGO_TARGET_${arch_upper}_UNKNOWN_LINUX_GNU_LINKER
> +eval "export $runner_var=\"qemu-$arch -L /usr/$arch-linux-gnu\""
> +eval "export $linker_var=$arch-linux-gnu-gcc"
> +export CARGO_PROFILE_DEV_OPT_LEVEL=2
> +export WASMTIME_TEST_NO_HOG_MEMORY=1
> +export RUST_BACKTRACE=1
> +ci/run-tests.sh --locked "$@"

This build-toolchain.sh script is invoked during the dockerfile
build stage, but it appears you're running the test suite here.
Shouldn't this be left until the CI build job instead ?

> diff --git a/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker
> new file mode 100644
> index 0000000000..d08a66dcc2
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker
> @@ -0,0 +1,16 @@
> +# Image containing pre-built wasmtime tests for s390x.
> +
> +FROM registry.gitlab.com/qemu-project/qemu/qemu/debian-s390x-cross:latest
> +
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    eatmydata apt-get update && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y \
> +            curl \
> +            libglib2.0-dev && \
> +    eatmydata apt-get autoremove -y && \
> +    eatmydata apt-get autoclean -y
> +
> +RUN mkdir /build
> +ADD build-toolchain.sh /build
> +RUN cd /build && ./build-toolchain.sh s390x --no-run


Is this '--no-run' arg used by  ci/run-tests.sh in some way ?


> diff --git a/tests/wasmtime/test b/tests/wasmtime/test
> new file mode 100755
> index 0000000000..10e2c3f886
> --- /dev/null
> +++ b/tests/wasmtime/test
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +
> +# Build qemu-user in the current directory, build the stable wasmtime
> +# testsuite, and test them together. ".rustup", ".cargo" and "wasmtime"
> +# subdirectories, as well as qemu build files, will be created or updated in
> +# the current directory.
> +#
> +# Based on https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/.github/workflows/main.yml#L208.
> +#
> +# Usage:
> +#
> +#     ./test TARGET_ARCH [CARGO_ARGS ...]
> +#
> +# where TARGET_ARCH is the architecture to test (aarch64 or s390x) and
> +# CARGO_ARGS are the extra arguments passed to cargo test.
> +
> +set -e -u -x
> +
> +# Script arguments.
> +arch=$1
> +shift
> +
> +# Build QEMU.
> +srcdir=$(cd "$(dirname "$0")" && pwd)/../..
> +docker_files_dir="$srcdir"/tests/docker/dockerfiles
> +"$srcdir"/configure \
> +    --target-list="$arch"-linux-user \
> +    --disable-tools \
> +    --disable-slirp \
> +    --disable-fdt \
> +    --disable-capstone \
> +    --disable-docs
> +make --output-sync -j"$(nproc)"
> +export PATH="$PWD:$PATH"
> +
> +# Run wasmtime tests.
> +exec \
> +    "$docker_files_dir"/debian-s390x-wasmtime-cross.d/build-toolchain.sh \
> +    "$arch" "$@"
> -- 
> 2.35.3
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


