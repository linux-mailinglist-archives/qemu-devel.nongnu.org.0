Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29647281056
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 12:07:55 +0200 (CEST)
Received: from localhost ([::1]:34142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOHyk-0005as-7S
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 06:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kOHxO-0004aM-Tz
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 06:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kOHxL-0005le-QO
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 06:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601633185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zs/7gSXGvU1n+2V1nZLWpA+gcUQcMIEyS3bbM8ArVi4=;
 b=DAmeKVXddrSuif9KjXTSencbDAXzmesqCjPO6NPVhktmz2ZxBUTIXjAm+o2WKZnl3yQC7M
 uFAZ5HPw6q2f02VjgXm3ng0xiAIua0hK1MlMgrtV2QIxV9oQzYpBhkMGiILviNYwHQgqGY
 Va0SZEX/NJ7fsR2t7qQjJaF4C/jaSas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-a_q0r9PJMPyHBE6moejl8A-1; Fri, 02 Oct 2020 06:06:23 -0400
X-MC-Unique: a_q0r9PJMPyHBE6moejl8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3EFB85C707;
 Fri,  2 Oct 2020 10:06:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE8F360CCC;
 Fri,  2 Oct 2020 10:06:17 +0000 (UTC)
Subject: Re: [PATCH] gitlab: split deprecated job into build/check stages
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201002091538.3017-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d5799eff-7760-b74f-9f43-167201d90460@redhat.com>
Date: Fri, 2 Oct 2020 12:06:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201002091538.3017-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.26, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/2020 11.15, Alex Bennée wrote:
> While the job is pretty fast for only a few targets we still want to
> catch breakage of the build. By splitting the test step we can
> allow_failures for that while still ensuring we don't miss the build
> breaking.

Is there already something broken?

Otherwise, I'd rather simply remove the "allow_failure: true" tag
instead ... these jobs otherwise tend to get ignored.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 346f23acf7..a51c89554f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -270,9 +270,24 @@ build-deprecated:
>    variables:
>      IMAGE: debian-all-test-cross
>      CONFIGURE_ARGS: --disable-docs --disable-tools
> -    MAKE_CHECK_ARGS: check-tcg
> +    MAKE_CHECK_ARGS: build-tcg
>      TARGETS: ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
>        unicore32-softmmu
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
> +# We split the check-tcg step as test failures are expected but we still
> +# want to catch the build breaking.
> +check-deprecated:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-deprecated
> +      artifacts: true
> +  variables:
> +    IMAGE: debian-all-test-cross
> +    MAKE_CHECK_ARGS: check-tcg

Anyway, that's better than before, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


