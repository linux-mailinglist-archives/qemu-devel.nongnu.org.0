Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59F2F6A7E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:09:11 +0100 (CET)
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07zZ-0005Op-RA
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l07s2-0003iJ-Kf
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:01:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l07rq-0003Y4-TU
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610650868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgIY3hPxmFG3ZXAreB9M5Z6ad6o6a8fIWzQtpurPIf4=;
 b=XcaxQ2p3jt6hUVZj+K6MFBSVSdtNC66NM3Wns4bekfyx0SjjuWfatI1akczjtfEtJd70I3
 AFVKdc9akXX54NQUt+OXgV94/LGD0rwcWIANUfOK7dOlutCRiHrY8TAOlVakBigL4ExSbs
 pmNFPEetN3k2DSmKV0HjPLwTl8S3ZhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-EN9vICRKPgm-5GBZIDZegQ-1; Thu, 14 Jan 2021 14:01:05 -0500
X-MC-Unique: EN9vICRKPgm-5GBZIDZegQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47C2880A5EF;
 Thu, 14 Jan 2021 19:00:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE3C319C48;
 Thu, 14 Jan 2021 19:00:54 +0000 (UTC)
Subject: Re: [PATCH v2 11/12] gitlab: migrate the minimal tools and unit tests
 from Travis
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bc54682a-0d11-28f0-4df4-b9deaf5e3a82@redhat.com>
Date: Thu, 14 Jan 2021 20:00:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-12-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 14/01/2021 17.57, Alex Bennée wrote:
> These tests are good at shaking out missing stubs which otherwise work
> if we have built targets. Rather than create a new job just add the
> checks to the existing tools-and-docs build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.yml | 4 +++-
>   .travis.yml    | 9 ---------
>   2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index bd60f3e741..a686bc40cf 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -124,11 +124,13 @@ check-system-debian:
>       IMAGE: debian-amd64
>       MAKE_CHECK_ARGS: check
>   
> +# No targets are built here, just tools and docs. This also feeds into
> +# the eventual documentation deployment steps later
>   build-tools-and-docs-debian:
>     <<: *native_build_job_definition
>     variables:
>       IMAGE: debian-amd64
> -    MAKE_CHECK_ARGS: ctags TAGS cscope
> +    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
>       CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
>     artifacts:
>       expire_in: 2 days
> diff --git a/.travis.yml b/.travis.yml
> index 3b574a5968..5f1dea873e 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -119,15 +119,6 @@ after_script:
>   
>   jobs:
>     include:
> -    # Just build tools and run minimal unit and softfloat checks
> -    - name: "GCC check-unit and check-softfloat"
> -      env:
> -        - BASE_CONFIG="--enable-tools"
> -        - CONFIG="--disable-user --disable-system"
> -        - TEST_CMD="make check-unit check-softfloat -j${JOBS}"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -
> -
>       # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
>       - name: "GCC debug (main-softmmu)"
>         env:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


