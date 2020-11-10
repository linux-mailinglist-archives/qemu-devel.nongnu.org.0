Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151682ADE07
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:17:45 +0100 (CET)
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcYDA-0006MZ-4C
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcY8e-0003Tr-Nn
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:13:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcY8Z-00057m-Uw
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605031975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdCMO+kb6zHRq1K4jY1UermpF2og1ZvjV8gcWjKvttU=;
 b=KQAPBhmhN6iN28RezjGS9OIWRPqLQ35Q887q/RHb7ymC+wn0ckOjpmj2cVLR65qYOD8yyB
 WdYfygoD04cFT7c3G2lOahTPHMzML32jXlsOKU61VSIdXGmjIYIalvs8ucP3L3d/G/jDUK
 CfH4z+zX6XzeVxEp1OXBxenoQsUTPh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-IwE56W6OOz2sBOPtT6ZXNA-1; Tue, 10 Nov 2020 13:12:53 -0500
X-MC-Unique: IwE56W6OOz2sBOPtT6ZXNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F6D180475A;
 Tue, 10 Nov 2020 18:12:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27DB775121;
 Tue, 10 Nov 2020 18:12:40 +0000 (UTC)
Subject: Re: [PATCH-for-6.0 v4 14/17] gitlab-ci: Move trace backend tests
 across to gitlab
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-15-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <25d070b2-204a-51d5-a961-d6c56b39b758@redhat.com>
Date: Tue, 10 Nov 2020 16:12:33 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108204535.2319870-15-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 6:45 PM, Philippe Mathieu-Daudé wrote:
> Similarly to commit 8cdb2cef3f1, move the trace backend
> tests to GitLab.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   .gitlab-ci.yml | 18 ++++++++++++++++++
>   .travis.yml    | 19 -------------------
>   2 files changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 6552a832939..2f0da7b3dc1 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -557,6 +557,24 @@ check-crypto-only-gnutls:
>       IMAGE: centos7
>       MAKE_CHECK_ARGS: check
>   
> +# We don't need to exercise every backend with every front-end
> +build-trace-multi-user:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004

Doesn't it need the lttng-ust-dev package in Ubuntu's image likewise you 
did for Fedora (patch 13)?

> +    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
> +
> +build-trace-ftrace-system:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=aarch64-softmmu
On Travis it builds the x86_64 softmmu target. Changed to aarch64 to 
increase coverage?
> +
> +build-trace-ust-system:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: fedora

Similar question here, increasing coverage by using Fedora?

- Wainer

> +    CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu --disable-tcg
>   
>   check-patch:
>     stage: build
> diff --git a/.travis.yml b/.travis.yml
> index 8ef31f8d8b6..ff5d5ead579 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -182,25 +182,6 @@ jobs:
>         compiler: clang
>   
>   
> -    # We don't need to exercise every backend with every front-end
> -    - name: "GCC trace log,simple,syslog (user)"
> -      env:
> -        - CONFIG="--enable-trace-backends=log,simple,syslog --disable-system"
> -        - TEST_CMD=""
> -
> -
> -    - name: "GCC trace ftrace (x86_64-softmmu)"
> -      env:
> -        - CONFIG="--enable-trace-backends=ftrace --target-list=x86_64-softmmu"
> -        - TEST_CMD=""
> -
> -
> -    - name: "GCC trace ust (x86_64-softmmu)"
> -      env:
> -        - CONFIG="--enable-trace-backends=ust --target-list=x86_64-softmmu"
> -        - TEST_CMD=""
> -
> -
>       # Using newer GCC with sanitizers
>       - name: "GCC9 with sanitizers (softmmu)"
>         dist: bionic


