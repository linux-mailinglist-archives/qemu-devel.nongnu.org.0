Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E54341E28
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:29:27 +0100 (CET)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFBu-00034x-8y
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lNF9C-0001GM-Bg
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lNF99-0004Ch-Lz
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616160393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdZUD0N2XYwlF/PJNXCwyW4v9E8K463PxxZjLy/62ZQ=;
 b=FV5NFNMMFihuc0DSlYCCdcycOPUTA8vVhbFj7A6C8VmA/daNo/Rq48yUDSlnVv0eFWOlGJ
 SrobvvNaBFXszb8G/SvuWtOdd5hard9WC+/FQ3DgiuIaRPgEqS6pNl42zcSeycobbxCusK
 DUBjV+ZQ4qfaPksF4wdKmouRHg/kBGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-y3ZjyUmqNwKR9k-NL8FXbQ-1; Fri, 19 Mar 2021 09:26:31 -0400
X-MC-Unique: y3ZjyUmqNwKR9k-NL8FXbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F0183DB64;
 Fri, 19 Mar 2021 13:26:30 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-73.gru2.redhat.com
 [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 898C35F9B7;
 Fri, 19 Mar 2021 13:26:08 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci.yml: Merge the trace-backend testing into other
 jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210319095726.45965-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a2748a1d-b8f9-b3dc-ca22-5893cde528e4@redhat.com>
Date: Fri, 19 Mar 2021 10:26:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319095726.45965-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/19/21 6:57 AM, Thomas Huth wrote:
> Our gitlab-ci got quite slow in the past weeks, due to the immense amount
> of jobs that we have, so we should try to reduce the number of jobs.
> There is no real good reason for having separate jobs just to test the
> trace backends, we can do this just fine in other jobs, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.yml | 30 +++---------------------------
>   1 file changed, 3 insertions(+), 27 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 0cc6d53f7e..cbbd67f139 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -87,7 +87,7 @@ build-system-alpine:
>       TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
>         moxie-softmmu microblazeel-softmmu mips64el-softmmu
>       MAKE_CHECK_ARGS: check-build
> -    CONFIGURE_ARGS: --enable-docs
> +    CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
>     artifacts:
>       expire_in: 2 days
>       paths:
> @@ -608,7 +608,7 @@ tsan-build:
>     variables:
>       IMAGE: ubuntu2004
>       CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
> -                    --enable-fdt=system --enable-slirp=system
> +          --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
>       TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
>       MAKE_CHECK_ARGS: bench V=1
>   
> @@ -706,6 +706,7 @@ build-coroutine-sigaltstack:
>     variables:
>       IMAGE: ubuntu2004
>       CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
> +                    --enable-trace-backends=ftrace

Nit: different indentation from the previous CONFIGURE_ARGS

Regardless,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>       MAKE_CHECK_ARGS: check-unit
>   
>   # Most jobs test latest gcrypt or nettle builds
> @@ -743,31 +744,6 @@ crypto-only-gnutls:
>       MAKE_CHECK_ARGS: check
>   
>   
> -# We don't need to exercise every backend with every front-end
> -build-trace-multi-user:
> -  <<: *native_build_job_definition
> -  needs:
> -    job: amd64-ubuntu2004-container
> -  variables:
> -    IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
> -
> -build-trace-ftrace-system:
> -  <<: *native_build_job_definition
> -  needs:
> -    job: amd64-ubuntu2004-container
> -  variables:
> -    IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=x86_64-softmmu
> -
> -build-trace-ust-system:
> -  <<: *native_build_job_definition
> -  needs:
> -    job: amd64-ubuntu2004-container
> -  variables:
> -    IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
> -
>   # Check our reduced build configurations
>   build-without-default-devices:
>     <<: *native_build_job_definition


