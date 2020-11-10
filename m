Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D62ADCBC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:19:23 +0100 (CET)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXIg-0000ha-5a
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcXFG-0006Tx-SS
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcXFA-0002kZ-Q4
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605028541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHouytu7QjAkhKtU9qymcGCSzuj3SO5kGSUPwDUT5wQ=;
 b=ZoIKQ2NH2NSk0B66zxm/R6UYHeuRzHhGtqzXVtlW5a1DRng9kIGsU0D2j8vKsH1LYGggSU
 7NnsifFW6cs09bytvqlr9XHFoYliuNoG9eY/z7//OvCig+hFRtC4SkfW25NWitbAj1Jee5
 ZWkk/zMz3UQXP7rlIbIA/ZgTIqpOVCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-vL3RA9nmOHC-Jaa4DQvyDw-1; Tue, 10 Nov 2020 12:15:39 -0500
X-MC-Unique: vL3RA9nmOHC-Jaa4DQvyDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A837418B9EC1;
 Tue, 10 Nov 2020 17:15:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D84C91972B;
 Tue, 10 Nov 2020 17:15:21 +0000 (UTC)
Subject: Re: [PATCH-for-6.0 v4 12/17] gitlab-ci: Move coroutine tests across
 to gitlab
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-13-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <ad8f776a-23cb-f68a-5cd2-6bfc594e583d@redhat.com>
Date: Tue, 10 Nov 2020 15:15:14 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108204535.2319870-13-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 6:45 PM, Philippe Mathieu-Daudé wrote:
> Similarly to commit 8cdb2cef3f1, move the coroutine tests to GitLab.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> ---
>   .gitlab-ci.yml | 16 ++++++++++++++++
>   .travis.yml    | 14 --------------
>   2 files changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a799803afb9..6552a832939 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -475,6 +475,22 @@ build-tci:
>       - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
>       - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
>   
> +# Alternate coroutines implementations are only really of interest to KVM users
> +# However we can't test against KVM on Travis so we can only run unit tests


s/Travis/Gitlab

Otherwise,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


> +build-coroutine-ucontext:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --with-coroutine=ucontext --disable-tcg
> +    MAKE_CHECK_ARGS: check-unit
> +
> +build-coroutine-sigaltstack:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
> +    MAKE_CHECK_ARGS: check-unit
> +
>   # Most jobs test latest gcrypt or nettle builds
>   #
>   # These jobs test old gcrypt and nettle from RHEL7
> diff --git a/.travis.yml b/.travis.yml
> index 15550fb023f..8ef31f8d8b6 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -139,20 +139,6 @@ jobs:
>           - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
>   
>   
> -    # Alternate coroutines implementations are only really of interest to KVM users
> -    # However we can't test against KVM on Travis so we can only run unit tests
> -    - name: "check-unit coroutine=ucontext"
> -      env:
> -        - CONFIG="--with-coroutine=ucontext --disable-tcg"
> -        - TEST_CMD="make check-unit -j${JOBS} V=1"
> -
> -
> -    - name: "check-unit coroutine=sigaltstack"
> -      env:
> -        - CONFIG="--with-coroutine=sigaltstack --disable-tcg"
> -        - TEST_CMD="make check-unit -j${JOBS} V=1"
> -
> -
>       # Check we can build docs and tools (out of tree)
>       - name: "tools and docs (bionic)"
>         dist: bionic


