Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D3B2AE0A4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:27:22 +0100 (CET)
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcaEb-0001Q5-KE
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaBy-0000Bl-KS
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:24:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaBw-00079v-Jy
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605039876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUpwkxpCDaiMWgSLr6GhMjLcFMsQtKuiO4gBRbibjEo=;
 b=glMIwnJFodbtVrPGcyEqGwz3U9RFLsMxf7pYmZeafONg/YCT9BOGGO1ImIMVw+jOX8+4Mc
 vqoIqtjz0RrHfp4qyI3v9DPXWjxi60+Je7rC5HbO+6aaQzn1mq72ypOjsg23mFsnpEVVrq
 iBhn6kF66akwAe63tdrXz4Fr4OZyT38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-52hFlwDUO3-T1SBAl3R40g-1; Tue, 10 Nov 2020 15:24:34 -0500
X-MC-Unique: 52hFlwDUO3-T1SBAl3R40g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CDAF809DE9;
 Tue, 10 Nov 2020 20:24:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 489C15E9D0;
 Tue, 10 Nov 2020 20:24:28 +0000 (UTC)
Subject: Re: [PATCH v3 04/11] gitlab-ci: Replace YAML anchors by extends
 (native_test_job)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-5-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <49099f5f-3d26-149d-e990-c7a652470605@redhat.com>
Date: Tue, 10 Nov 2020 18:24:21 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108221925.2344515-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 8:19 PM, Philippe Mathieu-Daudé wrote:
> 'extends' is an alternative to using YAML anchors
> and is a little more flexible and readable. See:
> https://docs.gitlab.com/ee/ci/yaml/#extends
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

LGTM

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a96e7dd23e5..e11f80f6d65 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -34,7 +34,7 @@ include:
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>         fi
>   
> -.native_test_job_template: &native_test_job_definition
> +.native_test_job:
>     stage: test
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     script:
> @@ -80,7 +80,7 @@ build-system-ubuntu:
>         - build
>   
>   check-system-ubuntu:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-system-ubuntu
>         artifacts: true
> @@ -89,7 +89,7 @@ check-system-ubuntu:
>       MAKE_CHECK_ARGS: check
>   
>   acceptance-system-ubuntu:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-system-ubuntu
>         artifacts: true
> @@ -111,7 +111,7 @@ build-system-debian:
>         - build
>   
>   check-system-debian:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-system-debian
>         artifacts: true
> @@ -120,7 +120,7 @@ check-system-debian:
>       MAKE_CHECK_ARGS: check
>   
>   acceptance-system-debian:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-system-debian
>         artifacts: true
> @@ -143,7 +143,7 @@ build-system-fedora:
>         - build
>   
>   check-system-fedora:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-system-fedora
>         artifacts: true
> @@ -152,7 +152,7 @@ check-system-fedora:
>       MAKE_CHECK_ARGS: check
>   
>   acceptance-system-fedora:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-system-fedora
>         artifacts: true
> @@ -175,7 +175,7 @@ build-system-centos:
>         - build
>   
>   check-system-centos:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-system-centos
>         artifacts: true
> @@ -184,7 +184,7 @@ check-system-centos:
>       MAKE_CHECK_ARGS: check
>   
>   acceptance-system-centos:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-system-centos
>         artifacts: true
> @@ -282,7 +282,7 @@ build-deprecated:
>   # We split the check-tcg step as test failures are expected but we still
>   # want to catch the build breaking.
>   check-deprecated:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-deprecated
>         artifacts: true
> @@ -346,7 +346,7 @@ build-crypto-old-nettle:
>         - build
>   
>   check-crypto-old-nettle:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-crypto-old-nettle
>         artifacts: true
> @@ -367,7 +367,7 @@ build-crypto-old-gcrypt:
>         - build
>   
>   check-crypto-old-gcrypt:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-crypto-old-gcrypt
>         artifacts: true
> @@ -388,7 +388,7 @@ build-crypto-only-gnutls:
>         - build
>   
>   check-crypto-only-gnutls:
> -  <<: *native_test_job_definition
> +  extends: .native_test_job
>     needs:
>       - job: build-crypto-only-gnutls
>         artifacts: true


