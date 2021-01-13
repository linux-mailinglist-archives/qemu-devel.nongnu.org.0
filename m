Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760FB2F4EF0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:38:47 +0100 (CET)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziEQ-0001Lx-J5
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kziBS-0008V9-OC
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:35:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kziBN-0001J7-DP
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610552130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Cuva5NntRQGyTKCwo13DqFJE8xhXnjQC52jGuRSELM=;
 b=XuPJOklsVI454y+ck3YGNepWdXojWNv7Ab9zoAQn5inxPXlZgrpmft+mJQ/Zsjc1/ApoBB
 SoE5oCCxoY7ogTn1V9bLp9hdnclOgYDvnilhwwArM/3xo1Tptg7k7VPbBp0i/CychL6i6J
 v4xBfzMLs680Tvk8UVd4nm+hFZJ85Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-sqC3I-w3PGu9muRUueTahA-1; Wed, 13 Jan 2021 10:35:25 -0500
X-MC-Unique: sqC3I-w3PGu9muRUueTahA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E74C1012E9B;
 Wed, 13 Jan 2021 15:35:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB35D6062F;
 Wed, 13 Jan 2021 15:35:19 +0000 (UTC)
Subject: Re: [PATCH v1 9/9] gitlab: move docs and tools build across from
 Travis
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210113151408.27939-1-alex.bennee@linaro.org>
 <20210113151408.27939-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <17cc62cf-a7da-c6ac-e021-fc1ef208abdf@redhat.com>
Date: Wed, 13 Jan 2021 16:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210113151408.27939-10-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/2021 16.14, Alex Bennée wrote:
> While we are at it we might as well check the tag generation. For
> bonus points we run GNU globals htags into the public pages directory
> for publishing with the auto generated pages.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.yml | 22 ++++++++++++++++------
>   .travis.yml    | 16 ----------------
>   2 files changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 4532f1718a..c07064a4f7 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -79,7 +79,6 @@ build-system-ubuntu:
>       TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
>         moxie-softmmu microblazeel-softmmu mips64el-softmmu
>       MAKE_CHECK_ARGS: check-build
> -    CONFIGURE_ARGS: --enable-docs
>     artifacts:
>       expire_in: 2 days
>       paths:
> @@ -111,7 +110,6 @@ build-system-debian:
>       TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
>         riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
>       MAKE_CHECK_ARGS: check-build
> -    CONFIGURE_ARGS: --enable-docs
>     artifacts:
>       expire_in: 2 days
>       paths:
> @@ -126,6 +124,17 @@ check-system-debian:
>       IMAGE: debian-amd64
>       MAKE_CHECK_ARGS: check
>   
> +build-tools-and-docs-debian:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-amd64
> +    MAKE_CHECK_ARGS: ctags gtags TAGS cscope
> +    CONFIGURE_ARGS: --enable-docs --enable-tools
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
>   acceptance-system-debian:
>     <<: *native_test_job_definition
>     needs:
> @@ -597,13 +606,14 @@ build-libvhost-user:
>       - ninja
>   
>   pages:
> -  image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
> +  image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
>     stage: test
>     needs:
> -    - job: build-system-ubuntu
> -      artifacts: true
> +    - job: build-tools-and-docs-debian
>     script:
> -    - mkdir public
> +    - mkdir -p public/src
> +    - htags --suggest --tree-view=filetree -m qemu_init
> +        -t "Welcome to the QEMU source code" public/src
>       - mv build/docs/index.html public/
>       - for i in devel interop specs system tools user ; do mv build/docs/$i public/ ; done
>     artifacts:
> diff --git a/.travis.yml b/.travis.yml
> index f2a101936c..3b574a5968 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -148,22 +148,6 @@ jobs:
>           - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
>   
>   
> -    # Check we can build docs and tools (out of tree)
> -    - name: "tools and docs (bionic)"
> -      dist: bionic
> -      env:
> -        - BUILD_DIR="out-of-tree/build/dir" SRC_DIR="../../.."
> -        - BASE_CONFIG="--enable-tools --enable-docs"
> -        - CONFIG="--target-list=x86_64-softmmu,aarch64-linux-user"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -      addons:
> -        apt:
> -          packages:
> -            - ninja-build
> -            - python3-sphinx
> -            - perl
> -
> -
>       # Test with Clang for compile portability (Travis uses clang-5.0)
>       - name: "Clang (user)"
>         env:
> 

Acked-by: Thomas Huth <thuth@redhat.com>


