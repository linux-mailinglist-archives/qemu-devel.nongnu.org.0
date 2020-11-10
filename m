Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2609B2AD7FB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:47:26 +0100 (CET)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTzY-0006HO-LW
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcTxg-0005cX-IC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcTxT-0006ne-8q
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605015910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bdG1OeLSuZnVRXQM7jC7LLBBp1vlMuj3hRKEiqS6Pk=;
 b=AZiPOkBjGMcNJbVSHv1YKAH/bR1hrhwnHuACnwYQqfZLni5miTb5SA0s20ZlU2URA6gzuI
 vIhLSYd4jSAdtIZepQBI8kyCQEyLahcntiFA6KN8cDDw+PSyDFQ9ue4aKcboVyKCn2Nyap
 3lABeOgvBqFNPahD5IzMNqyIozoDn50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-LhTtfiQ7N_C7Ao-xt1uQdQ-1; Tue, 10 Nov 2020 08:45:07 -0500
X-MC-Unique: LhTtfiQ7N_C7Ao-xt1uQdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F13AE1018F6F;
 Tue, 10 Nov 2020 13:45:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 874685B4A4;
 Tue, 10 Nov 2020 13:44:58 +0000 (UTC)
Subject: Re: [PATCH-for-6.0 v4 07/17] gitlab-ci: Move job testing
 --without-default-devices across to gitlab
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-8-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ce8f02ed-104f-3d56-4ea8-283f50c83d7e@redhat.com>
Date: Tue, 10 Nov 2020 11:44:51 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108204535.2319870-8-philmd@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 6:45 PM, Philippe Mathieu-Daudé wrote:
> Similarly to commit 8cdb2cef3f1, move the job testing the
> '--without-default-devices' configure option to GitLab.
>
> Since building all softmmu targets takes too long, split
> the job in 2.
>
> As smoke test, run the qtests on the AVR and m68k targets.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
>
> v3 had:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>   .gitlab-ci.yml | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>   .travis.yml    |  8 --------
>   2 files changed, 46 insertions(+), 8 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index b98800462ed..3fc3d0568c6 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -315,6 +315,52 @@ build-user-plugins:
>       MAKE_CHECK_ARGS: check-tcg
>     timeout: 1h 30m
>   
> +build-system-ubuntu-without-default-devices 1/2:

Nit: It seems a non-usual key naming. Maybe 
"build-system-ubuntu-without-default-devices_1_2"  instead.

- Wainer

> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --without-default-devices --disable-tools --disable-docs
> +    TARGETS:
> +      aarch64-softmmu
> +      alpha-softmmu
> +      arm-softmmu
> +      avr-softmmu
> +      cris-softmmu
> +      hppa-softmmu
> +      i386-softmmu
> +      m68k-softmmu
> +      microblazeel-softmmu
> +      microblaze-softmmu
> +      mips64el-softmmu
> +      mips64-softmmu
> +      mipsel-softmmu
> +      mips-softmmu
> +      moxie-softmmu
> +    MAKE_CHECK_ARGS: check-qtest-avr check-qtest-m68k
> +
> +build-system-ubuntu-without-default-devices 2/2:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --without-default-devices --disable-tools --disable-docs
> +    TARGETS:
> +      nios2-softmmu
> +      or1k-softmmu
> +      ppc64-softmmu
> +      ppc-softmmu
> +      riscv32-softmmu
> +      riscv64-softmmu
> +      rx-softmmu
> +      s390x-softmmu
> +      sh4eb-softmmu
> +      sh4-softmmu
> +      sparc64-softmmu
> +      sparc-softmmu
> +      tricore-softmmu
> +      x86_64-softmmu
> +      xtensaeb-softmmu
> +      xtensa-softmmu
> +
>   build-clang:
>     <<: *native_build_job_definition
>     variables:
> diff --git a/.travis.yml b/.travis.yml
> index a3d78171cab..15d92291358 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -224,14 +224,6 @@ jobs:
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
>       # We don't need to exercise every backend with every front-end
>       - name: "GCC trace log,simple,syslog (user)"
>         env:


