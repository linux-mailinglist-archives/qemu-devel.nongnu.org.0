Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC62E69EC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 19:04:09 +0100 (CET)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktwsJ-0007Aa-LH
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 13:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ktwqf-0006jd-2x
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 13:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ktwqb-0005J6-Fd
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 13:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609178539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDWBVMxnM9NogYw/JS8w3ZQTkv50ih5CajTXMykM07c=;
 b=DTTI75yiZlm5ka7p9V4zL+MOUVWLpqri2jMGYMeJlRv3rs2of3ce1CJ5k+w12Ak9OiRsIB
 EnShNL7DVhqT1WDf7BqznKF9v0LxjcpbZBXoFBGV4DoDfpJTpvYplyu/X/fGHxGRwr9S2m
 J/urloLejMcVRmCP9Zwyvwr5R0WOYvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-7CpwDNq_NZue_Xvmsz86gg-1; Mon, 28 Dec 2020 13:02:17 -0500
X-MC-Unique: 7CpwDNq_NZue_Xvmsz86gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AEB0E75A;
 Mon, 28 Dec 2020 18:02:15 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-175.gru2.redhat.com
 [10.97.116.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38FBF272D8;
 Mon, 28 Dec 2020 18:02:09 +0000 (UTC)
Subject: Re: [PATCH v3] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org
References: <20201224085931.20465-1-acho@suse.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <e7954d35-3540-5230-28e8-8dd33569c95d@redhat.com>
Date: Mon, 28 Dec 2020 15:02:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201224085931.20465-1-acho@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.178,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, lyan@suse.com, thuth@redhat.com, philmd@redhat.com,
 brogers@suse.com, cfontana@suse.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/24/20 5:59 AM, Cho, Yu-Chen wrote:
> Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> Use openSUSE Leap 15.2 container image in the gitlab-CI.
>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
> v3:
> Drop the "acceptance-system-opensuse" job part of the
> patch for now to get at least the basic compile-coverage
>
> v2:
> Drop some package from dockerfile to make docker image more light.
>
> v1:
> Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> Use openSUSE Leap 15.2 container image in the gitlab-CI.
> ---
>   .gitlab-ci.d/containers.yml                   |  5 ++
>   .gitlab-ci.yml                                | 20 +++++++
>   tests/docker/dockerfiles/opensuse-leap.docker | 54 +++++++++++++++++++
>   3 files changed, 79 insertions(+)
>   create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker

On Gitlab CI this new docker file has no issues:

https://gitlab.com/wainersm/qemu/-/jobs/934243313

One test won't execute due to lack of hostname program:

https://gitlab.com/wainersm/qemu/-/jobs/934243313#L3698

Using it locally has some issues though. I can build the image as ...

$ make docker-image-opensuse-leap

... but I cannot run the test-build script as ...

$ make docker-test-build@opensuse-leap

.. and the reason is that it misses the tar program which is used to 
untar the QEMU sources inside the container.

Ensuring that tar is installed wasn't enough either, I had to adjust the 
path to python (/usr/bin/python3.8 doesn't exist).

So I did change:

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker 
b/tests/docker/dockerfiles/opensuse-leap.docker
index 8b0d915bff..0e64893e4a 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -43,12 +43,13 @@ ENV PACKAGES \
      libspice-server-devel \
      systemd-devel \
      systemtap-sdt-devel \
+    tar \
      usbredir-devel \
      virglrenderer-devel \
      xen-devel \
      vte-devel \
      zlib-devel
-ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.8
+ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6

  RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
  RUN rpm -q $PACKAGES | sort > /packages.txt

>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 892ca8d838..910754a699 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -246,3 +246,8 @@ amd64-ubuntu-container:
>     <<: *container_job_definition
>     variables:
>       NAME: ubuntu
> +
> +amd64-opensuse-leap-container:
> +  <<: *container_job_definition
> +  variables:
> +    NAME: opensuse-leap
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 98bff03b47..a1df981c9a 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -195,6 +195,26 @@ acceptance-system-centos:
>       MAKE_CHECK_ARGS: check-acceptance
>     <<: *acceptance_definition
>   
> +build-system-opensuse:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: opensuse-leap
> +    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
> +check-system-opensuse:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-system-opensuse
> +      artifacts: true
> +  variables:
> +    IMAGE: opensuse-leap
> +    MAKE_CHECK_ARGS: check
> +
>   build-disabled:
>     <<: *native_build_job_definition
>     variables:
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> new file mode 100644
> index 0000000000..8b0d915bff
> --- /dev/null
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -0,0 +1,54 @@
> +FROM opensuse/leap:15.2
> +
> +# Please keep this list sorted alphabetically

The list of packages below isn't sorted.

Thanks for contributing this!

- Wainer

> +ENV PACKAGES \
> +    bc \
> +    brlapi-devel \
> +    bzip2 \
> +    cyrus-sasl-devel \
> +    gcc \
> +    gcc-c++ \
> +    mkisofs \
> +    gettext-runtime \
> +    git \
> +    glib2-devel \
> +    glusterfs-devel \
> +    libgnutls-devel \
> +    gtk3-devel \
> +    libaio-devel \
> +    libattr-devel \
> +    libcap-ng-devel \
> +    libepoxy-devel \
> +    libfdt-devel \
> +    libiscsi-devel \
> +    libjpeg8-devel \
> +    libpmem-devel \
> +    libpng16-devel \
> +    librbd-devel \
> +    libseccomp-devel \
> +    libssh-devel \
> +    lzo-devel \
> +    make \
> +    libSDL2_image-devel \
> +    ncurses-devel \
> +    ninja \
> +    libnuma-devel \
> +    perl \
> +    libpixman-1-0-devel \
> +    python3-base \
> +    python3-virtualenv \
> +    rdma-core-devel \
> +    libSDL2-devel \
> +    snappy-devel \
> +    libspice-server-devel \
> +    systemd-devel \
> +    systemtap-sdt-devel \
> +    usbredir-devel \
> +    virglrenderer-devel \
> +    xen-devel \
> +    vte-devel \
> +    zlib-devel
> +ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.8
> +
> +RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
> +RUN rpm -q $PACKAGES | sort > /packages.txt


