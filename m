Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E7269351
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 19:29:43 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHsIQ-0003k0-BY
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 13:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHr9l-0005Au-E5
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 12:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHr9j-0004NS-Nq
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 12:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600100198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15tBURtBcF2BVpIWMpBR34eVXQIAUjoMxy7cPCBbIcY=;
 b=jMA6JTWIwP3tmDxqYp2XfbTIUkMNa9URNhpvmLjMwDR38FcSjfZm92BrwUn30fU3ZhgK8k
 E++wAa8gCzCc7DOTnxQDvYzTjomX2fgTQv6WuZrGuYGgDoHRcdfAOgBpTloY2ZOSmf8xYX
 8tJhsGLhNLTA2RUeZW+Lq5qWMaH4p/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-UlzPK_eWNPGZujORyhzcdg-1; Mon, 14 Sep 2020 12:16:37 -0400
X-MC-Unique: UlzPK_eWNPGZujORyhzcdg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5B6A18C9F40;
 Mon, 14 Sep 2020 16:16:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4C1F5DA6B;
 Mon, 14 Sep 2020 16:16:31 +0000 (UTC)
Subject: Re: [PATCH v1 5/6] gitlab: create a build-deprecated target
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200914150716.10501-1-alex.bennee@linaro.org>
 <20200914150716.10501-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a5a9dc61-f5bd-2dd4-7506-ef2f843d9719@redhat.com>
Date: Mon, 14 Sep 2020 18:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200914150716.10501-6-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:10:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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

On 14/09/2020 17.07, Alex Bennée wrote:
> These targets might be deprecated but we should keep them building
> before the final axe comes down. Lets keep them all in one place and
> don't hold up the CI if they do fail. They are either poorly tested or
> already flaky anyway,
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 10 ++++++++++
>  .travis.yml    |  3 +--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 72e8604579ee..f027b55aef15 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -254,6 +254,16 @@ build-clang:
>        ppc-softmmu s390x-softmmu arm-linux-user
>      MAKE_CHECK_ARGS: check
>  
> +# These targets are on the way out
> +build-deprecated:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-all-test-cross
> +    CONFIGURE_ARGS: --disable-docs --disable-tools --disable-system
> +    MAKE_CHECK_ARGS: check-tcg
> +    TARGETS: ppc64abi32-linux-user tilegx-linux-user
> +  allow_failure: true
> +
>  build-oss-fuzz:
>    <<: *native_build_job_definition
>    variables:
> diff --git a/.travis.yml b/.travis.yml
> index 65341634d02a..c75221dca3e7 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -344,10 +344,9 @@ jobs:
>      # Run check-tcg against linux-user (with plugins)
>      # we skip sparc64-linux-user until it has been fixed somewhat
>      # we skip cris-linux-user as it doesn't use the common run loop
> -    # we skip ppc64abi32-linux-user as it seems to have a broken libc
>      - name: "GCC plugins check-tcg (user)"
>        env:
> -        - CONFIG="--disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user,ppc64abi32-linux-user"
> +        - CONFIG="--disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user"
>          - TEST_BUILD_CMD="make build-tcg"
>          - TEST_CMD="make check-tcg"
>          - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
> 

Acked-by: Thomas Huth <thuth@redhat.com>


