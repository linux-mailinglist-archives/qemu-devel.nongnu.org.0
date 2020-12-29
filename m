Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC92E7317
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 19:55:35 +0100 (CET)
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuK9d-0005Za-QP
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 13:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kuK8V-00053q-0r
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 13:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kuK8R-0005DC-Hy
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 13:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609268057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gf8rIj5yqtJkCMSW7Mx6d5Ol1cpsWm8e7O4hRnpM+0I=;
 b=QRyz6wrkulmTie1DWzRpWBsZ3Fi+NnH4ulemUHTjuQ2B9N2SEMksRrQ3FLugvpomU7ArhO
 quCz0U85jA2zzlWv4ORnqWSJmZOdElYU/QzOAbC42lm6MhZuyivBUCUL4kDTZZVtTW6N3g
 uRZmLs4pk8+OlFXFzE7FV+J+4vfgXHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-TuBCk5FEO2OVftnLRf31lg-1; Tue, 29 Dec 2020 13:54:13 -0500
X-MC-Unique: TuBCk5FEO2OVftnLRf31lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91755180A086;
 Tue, 29 Dec 2020 18:54:12 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-175.gru2.redhat.com
 [10.97.116.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 337072C01B;
 Tue, 29 Dec 2020 18:54:06 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org
References: <20201229085046.8536-1-acho@suse.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <34ea1e9b-ac06-b5eb-d10b-664977840352@redhat.com>
Date: Tue, 29 Dec 2020 15:54:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201229085046.8536-1-acho@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.07, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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


On 12/29/20 5:50 AM, Cho, Yu-Chen wrote:
> Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> Use openSUSE Leap 15.2 container image in the gitlab-CI.
>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
> v4:
> Add package tar and fix python3 version from 3.8 to 3.6
> Add acceptance-system-opensuse back.
>
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
>   .gitlab-ci.yml                                | 31 +++++++++++
>   tests/docker/dockerfiles/opensuse-leap.docker | 55 +++++++++++++++++++
>   3 files changed, 91 insertions(+)
>   create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
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
> index 98bff03b47..fb65a2d29c 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -195,6 +195,37 @@ acceptance-system-centos:
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
> +acceptance-system-opensuse:
> +   <<: *native_test_job_definition
> +   needs:
> +     - job: build-system-opensuse
> +       artifacts: true
> +   variables:
> +     IMAGE: opensuse-leap
> +     MAKE_CHECK_ARGS: check-acceptance
> +   <<: *acceptance_definition
> +
> +
>   build-disabled:
>     <<: *native_build_job_definition
>     variables:
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> new file mode 100644
> index 0000000000..0e64893e4a
> --- /dev/null
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -0,0 +1,55 @@
> +FROM opensuse/leap:15.2
> +
> +# Please keep this list sorted alphabetically

Except for the list of packages below not being sorted below, this 
version of the patch looks good to me. So,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

I did some tests locally, it is working. Also on Gitlab CI all the new 
builds pass:

https://gitlab.com/wainersm/qemu/-/pipelines/235534062

So,

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

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
> +    tar \
> +    usbredir-devel \
> +    virglrenderer-devel \
> +    xen-devel \
> +    vte-devel \
> +    zlib-devel
> +ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
> +
> +RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
> +RUN rpm -q $PACKAGES | sort > /packages.txt


