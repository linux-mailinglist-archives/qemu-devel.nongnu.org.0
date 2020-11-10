Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E042ADA03
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:15:53 +0100 (CET)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVNA-0000i4-9o
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcVEx-0008LT-0I
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:07:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcVEu-0000z3-Tu
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605020840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4oQIEWE1Hup6/aiNkdyZoo4JZp3RqrCxczEBgqVRXbI=;
 b=hSuQaDgunASOl9dzNdR16jTf2nens119SCP2SsjMx8n5cwgryHt4OMN+lcTc3/dRIRbZpc
 3spGmZ844tqiQ9stVLHrx/FTdTq5Lx0uVIbSzpFG+JbT9+FAYfgEam+Wt6qd2/rw9el5pk
 Pagsg2oUDbcSBFbEeKftaLbWUYOkQ4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-avXtn4ybOkSWh4cq8LJgbQ-1; Tue, 10 Nov 2020 10:07:17 -0500
X-MC-Unique: avXtn4ybOkSWh4cq8LJgbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B95151008549;
 Tue, 10 Nov 2020 15:07:15 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1AB75D9D2;
 Tue, 10 Nov 2020 15:07:01 +0000 (UTC)
Subject: Re: [PATCH-for-6.0 v4 10/17] gitlab-ci: Move user-static test across
 to gitlab
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-11-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d0d6a70e-bec5-6e40-1a47-32bb5af3d0a6@redhat.com>
Date: Tue, 10 Nov 2020 13:06:54 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108204535.2319870-11-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 6:45 PM, Philippe Mathieu-Daudé wrote:
> Similarly to commit 8cdb2cef3f1, move the user-static test to GitLab.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>   .gitlab-ci.yml | 7 +++++++
>   .travis.yml    | 5 -----
>   2 files changed, 7 insertions(+), 5 deletions(-)

LGTM.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d1583cee5db..a91870cf85e 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -311,6 +311,13 @@ build-user-debug:
>       CONFIGURE_ARGS: --disable-tools --disable-system --enable-debug-tcg
>       MAKE_CHECK_ARGS: check-tcg
>   
> +build-user-static:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-all-test-cross
> +    CONFIGURE_ARGS: --disable-tools --disable-system --static
> +    MAKE_CHECK_ARGS: check-tcg
> +
>   # Run check-tcg against linux-user (with plugins)
>   # we skip sparc64-linux-user until it has been fixed somewhat
>   # we skip cris-linux-user as it doesn't use the common run loop
> diff --git a/.travis.yml b/.travis.yml
> index 6087e2909cd..5fb69c5fb02 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -119,11 +119,6 @@ after_script:
>   
>   jobs:
>     include:
> -    - name: "GCC static (user)"
> -      env:
> -        - CONFIG="--disable-system --static"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -
>       # Just build tools and run minimal unit and softfloat checks
>       - name: "GCC check-unit and check-softfloat"
>         env:


