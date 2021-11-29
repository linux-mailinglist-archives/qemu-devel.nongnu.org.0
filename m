Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B94611DE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:10:05 +0100 (CET)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrdbo-0001dP-CV
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:10:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mrda1-0000FA-Su
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:08:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mrdZx-00085e-3S
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638180487;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fywTo/8p1SkacWjAxY/z/Rprzyh2OT5CIvf5HYDLxI4=;
 b=P9BeSrPPYbvQSqbnA1vG0nNRRCTgXPhnF/hpd8ZPvzuhL1sjCFwfWr0sP327G9TRoEAfbG
 nQmgtFyl0NGSeUSRnEMtQVcoc/K9QWVXKKioWbmQiRtOP5HnEMhZcvg0iLiqwk1kCBn974
 9wLg9uuw2G11/l9A5H7U/rQx6z0i1UI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-V-5VILwBMYi0kf6nUDuJUw-1; Mon, 29 Nov 2021 05:07:57 -0500
X-MC-Unique: V-5VILwBMYi0kf6nUDuJUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 296241019982;
 Mon, 29 Nov 2021 10:07:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8420067843;
 Mon, 29 Nov 2021 10:07:54 +0000 (UTC)
Date: Mon, 29 Nov 2021 10:07:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Add jobs that run the
 device-crash-test
Message-ID: <YaSmeFqGGFlty75h@redhat.com>
References: <20211126162724.1162049-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211126162724.1162049-1-thuth@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 05:27:24PM +0100, Thomas Huth wrote:
> The device-crash-test script has been quite neglected in the past,
> so that it bit-rot quite often. Let's add CI jobs that run this
> script for at least some targets, so that this script does not
> regress that easily anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 71d0f407ad..7e1cb0b3c2 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -100,6 +100,17 @@ avocado-system-debian:
>      IMAGE: debian-amd64
>      MAKE_CHECK_ARGS: check-avocado
>  
> +crash-test-debian:
> +  extends: .native_test_job_template
> +  needs:
> +    - job: build-system-debian
> +      artifacts: true
> +  variables:
> +    IMAGE: debian-amd64
> +  script:
> +    - cd build
> +    - scripts/device-crash-test -q ./qemu-system-i386
> +
>  build-system-fedora:
>    extends: .native_build_job_template
>    needs:
> @@ -134,6 +145,18 @@ avocado-system-fedora:
>      IMAGE: fedora
>      MAKE_CHECK_ARGS: check-avocado
>  
> +crash-test-fedora:
> +  extends: .native_test_job_template
> +  needs:
> +    - job: build-system-fedora
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
> +  script:
> +    - cd build
> +    - scripts/device-crash-test -q ./qemu-system-ppc
> +    - scripts/device-crash-test -q ./qemu-system-riscv32

I'm curious why you picked all the 32-bit architecture targets to test
this for, since 95% of usage these days will be on the 64-bit targets ?

I guess both 32-bit & 64-bit targets probably have the same set of
devices built mostly, but still wondering if there was a reason for
your choice.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


