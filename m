Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39CE2D7F5B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:29:56 +0100 (CET)
Received: from localhost ([::1]:47832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kno71-0003ee-Vh
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnan-0002r2-16
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnak-0004pN-DR
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607712992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOgJ+NZOFqwfkgP9Kdv5qlJVb0fc32q6fmKf5L5l8Rc=;
 b=TbqKPc5F0n/nHluMaL4UdU6E0PFtqDtmnqL9iJHC6nm8O+pFUu9uiqs+fX2k39Il4NYRHM
 uwm5C9RNEU71iRG1oLy1WKIl11thfWDw5hZr9L7xWJntSb7QAcS+hSWgIonBcPnP5eE4qw
 rtMjSM0gwn7ffAJGHgz25flyyVthGi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-NKh6JXoNNCac5idwiREB9w-1; Fri, 11 Dec 2020 13:56:28 -0500
X-MC-Unique: NKh6JXoNNCac5idwiREB9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B96DD8143EF;
 Fri, 11 Dec 2020 18:55:32 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50ED25F9A6;
 Fri, 11 Dec 2020 18:55:28 +0000 (UTC)
Subject: Re: [PATCH v2 6/8] gitlab: move --without-default-devices build from
 Travis
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-7-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <32564462-080c-bbff-246c-cfce9cb8f3e7@redhat.com>
Date: Fri, 11 Dec 2020 15:55:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-7-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com, richard.henderson@linaro.org, f4bug@amsat.org,
 cota@braap.org, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/10/20 4:04 PM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> ---
> v2
>    - move to centos8
> ---
>   .gitlab-ci.yml | 7 +++++++
>   .travis.yml    | 8 --------
>   2 files changed, 7 insertions(+), 8 deletions(-)

lgtm.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index b3bcaacf7b..2134453717 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -514,6 +514,13 @@ build-trace-ust-system:
>       IMAGE: ubuntu2004
>       CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
>   
> +# Check our reduced build configurations
> +build-without-default-devices:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: centos8
> +    CONFIGURE_ARGS: --without-default-devices --disable-user
> +
>   check-patch:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> diff --git a/.travis.yml b/.travis.yml
> index d01714a5ae..f2a101936c 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -205,14 +205,6 @@ jobs:
>           - ${SRC_DIR}/scripts/travis/coverage-summary.sh
>   
>   
> -    # We manually include builds which we disable "make check" for
> -    - name: "GCC without-default-devices (softmmu)"
> -      env:
> -        - CONFIG="--without-default-devices --disable-user"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -        - TEST_CMD=""
> -
> -
>       # Using newer GCC with sanitizers
>       - name: "GCC9 with sanitizers (softmmu)"
>         dist: bionic


