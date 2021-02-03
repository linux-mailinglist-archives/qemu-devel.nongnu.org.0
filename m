Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE930E38C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:49:58 +0100 (CET)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OA1-0000WT-Bu
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7Nky-00088G-BF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:24:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7Nkp-0002K5-Hi
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612380215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vtgJJ+s9lNCHKDIHim7D6mC/IoggxkHLJyuAiwvOZ6U=;
 b=WAekLIwEWBh2j6IHhvwCqqdASNhAvKOuKv3NZnlkNgrgfo4fdec8XMGuxJqvSov6CfhYyO
 GcDVXUy5erE6TtdkWLwmFTmawdmvLRDGhwAb1DIki/dC/pdfqm9jquO6ZdRu6zOzG1XgJx
 5pRwtCLddrSyJFNSZfI88I1NiiBXTAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-UuoQBX_7Mwy53c7cSHRA8w-1; Wed, 03 Feb 2021 14:23:33 -0500
X-MC-Unique: UuoQBX_7Mwy53c7cSHRA8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C8A45B364;
 Wed,  3 Feb 2021 19:23:32 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12673779F4;
 Wed,  3 Feb 2021 19:23:28 +0000 (UTC)
Subject: Re: [PATCH 6/6] travis.yml: Move the -fsanitize=thread
 compile-testing to the gitlab-CI
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210203113243.280883-1-thuth@redhat.com>
 <20210203113243.280883-7-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <efa13112-64c7-b906-f6bd-970039a62151@redhat.com>
Date: Wed, 3 Feb 2021 16:23:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203113243.280883-7-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> It's only about compile-testing (there is too much noise when running
> the tests), so let's simply add the -fsanitize=thread flag to a job that
> only compiles the sources. The "build-gprof-gcov" seems to be a good
> candidate.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.yml |  1 +
>   .travis.yml    | 51 --------------------------------------------------
>   2 files changed, 1 insertion(+), 51 deletions(-)

It will be a little weird to see a gprof/gcov failing with a sanitize 
error, but it seems indeed the best job.

Allow me to double-check: doesn't it need -g to show the line numbers?

- Wainer

>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 4654798523..e5c86e38c4 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -484,6 +484,7 @@ build-gprof-gcov:
>     variables:
>       IMAGE: ubuntu2004
>       CONFIGURE_ARGS: --enable-gprof --enable-gcov
> +                    --extra-cflags=-fsanitize=thread
>       MAKE_CHECK_ARGS: build-tcg
>       TARGETS: aarch64-softmmu mips64-softmmu ppc64-softmmu
>                riscv64-softmmu s390x-softmmu x86_64-softmmu
> diff --git a/.travis.yml b/.travis.yml
> index b3fc72f561..18e62f282f 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -120,57 +120,6 @@ after_script:
>   jobs:
>     include:
>   
> -
> -    # Using newer GCC with sanitizers
> -    - name: "GCC9 with sanitizers (softmmu)"
> -      dist: bionic
> -      addons:
> -        apt:
> -          update: true
> -          sources:
> -            # PPAs for newer toolchains
> -            - ubuntu-toolchain-r-test
> -          packages:
> -            # Extra toolchains
> -            - gcc-9
> -            - g++-9
> -            # Build dependencies
> -            - libaio-dev
> -            - libattr1-dev
> -            - libbrlapi-dev
> -            - libcap-ng-dev
> -            - libgnutls28-dev
> -            - libgtk-3-dev
> -            - libiscsi-dev
> -            - liblttng-ust-dev
> -            - libnfs-dev
> -            - libncurses5-dev
> -            - libnss3-dev
> -            - libpixman-1-dev
> -            - libpng-dev
> -            - librados-dev
> -            - libsdl2-dev
> -            - libsdl2-image-dev
> -            - libseccomp-dev
> -            - libspice-protocol-dev
> -            - libspice-server-dev
> -            - liburcu-dev
> -            - libusb-1.0-0-dev
> -            - libvte-2.91-dev
> -            - ninja-build
> -            - sparse
> -            - uuid-dev
> -      language: generic
> -      compiler: none
> -      env:
> -        - COMPILER_NAME=gcc CXX=g++-9 CC=gcc-9
> -        - CONFIG="--cc=gcc-9 --cxx=g++-9 --disable-linux-user"
> -        - TEST_CMD=""
> -      before_script:
> -        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
> -        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
> -
> -
>       - name: "[aarch64] GCC check-tcg"
>         arch: arm64
>         dist: focal


