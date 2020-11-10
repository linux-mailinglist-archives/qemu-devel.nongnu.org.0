Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF032AE0C7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:37:30 +0100 (CET)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcaOO-0004iC-W4
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaN8-0004Gf-PB
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:36:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaN5-0000ID-J8
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605040565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvKe2GLFmYrZ6x52okuZxtycXyaj7Yzosi2Tag4GUaE=;
 b=O4LSTrk/T1fbPrHKwLQa3j4AGNpR20S+MKLUhHs30Do5mSHbNoz8lg+GVxoLhrxQdAM0IW
 0VVS1yodCxX0hkeckUtU8Ocrz7JathLR2T7GaOD2+X2lWh0cESNy68gWNpvkqNSO/Et3Fi
 W+6sOsXIqcTrSjXBnFv+Bb7lGocmCe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278--Cpp45YYOBacUPTvjcremA-1; Tue, 10 Nov 2020 15:36:01 -0500
X-MC-Unique: -Cpp45YYOBacUPTvjcremA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3D66835B4F;
 Tue, 10 Nov 2020 20:35:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01ACB5B4BA;
 Tue, 10 Nov 2020 20:35:55 +0000 (UTC)
Subject: Re: [PATCH v3 05/11] gitlab-ci: Replace YAML anchors by extends
 (acceptance_test_job)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-6-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <b7efcb4c-547a-bd81-5719-8d4344673650@redhat.com>
Date: Tue, 10 Nov 2020 18:35:48 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108221925.2344515-6-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
>   .gitlab-ci.yml | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)

LGTM

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index e11f80f6d65..0ef814764a0 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -42,7 +42,8 @@ include:
>       - find . -type f -exec touch {} +
>       - make $MAKE_CHECK_ARGS
>   
> -.acceptance_template: &acceptance_definition
> +.acceptance_test_job:
> +  extends: .native_test_job
>     cache:
>       key: "${CI_JOB_NAME}-cache"
>       paths:
> @@ -89,14 +90,13 @@ check-system-ubuntu:
>       MAKE_CHECK_ARGS: check
>   
>   acceptance-system-ubuntu:
> -  extends: .native_test_job
> +  extends: .acceptance_test_job
>     needs:
>       - job: build-system-ubuntu
>         artifacts: true
>     variables:
>       IMAGE: ubuntu2004
>       MAKE_CHECK_ARGS: check-acceptance
> -  <<: *acceptance_definition
>   
>   build-system-debian:
>     extends: .native_build_job
> @@ -120,14 +120,13 @@ check-system-debian:
>       MAKE_CHECK_ARGS: check
>   
>   acceptance-system-debian:
> -  extends: .native_test_job
> +  extends: .acceptance_test_job
>     needs:
>       - job: build-system-debian
>         artifacts: true
>     variables:
>       IMAGE: debian-amd64
>       MAKE_CHECK_ARGS: check-acceptance
> -  <<: *acceptance_definition
>   
>   build-system-fedora:
>     extends: .native_build_job
> @@ -152,14 +151,13 @@ check-system-fedora:
>       MAKE_CHECK_ARGS: check
>   
>   acceptance-system-fedora:
> -  extends: .native_test_job
> +  extends: .acceptance_test_job
>     needs:
>       - job: build-system-fedora
>         artifacts: true
>     variables:
>       IMAGE: fedora
>       MAKE_CHECK_ARGS: check-acceptance
> -  <<: *acceptance_definition
>   
>   build-system-centos:
>     extends: .native_build_job
> @@ -184,14 +182,13 @@ check-system-centos:
>       MAKE_CHECK_ARGS: check
>   
>   acceptance-system-centos:
> -  extends: .native_test_job
> +  extends: .acceptance_test_job
>     needs:
>       - job: build-system-centos
>         artifacts: true
>     variables:
>       IMAGE: centos8
>       MAKE_CHECK_ARGS: check-acceptance
> -  <<: *acceptance_definition
>   
>   build-disabled:
>     extends: .native_build_job


