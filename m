Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E02F9C35
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:13:59 +0100 (CET)
Received: from localhost ([::1]:59730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RXq-0002We-MY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1RWV-0001hX-2p
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1RWR-00047a-K9
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610964751;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hBNYY1QnhCoztLa28EBa6DIVUIemTWrN7XrdDXxnMrU=;
 b=Eu2yHoD/IsD52gHsWEphOx1UNkydJ/5inXliB0Fe6sDKCIDFqvYQv0GzjMsBL0rrIU6aRw
 VPwoWkvsMgzY3JyqEohe94ysSwYgOxLEpZuuzUw44fsHS0HqZUt1II8KJSjU9oASylPPy6
 Q+7LbEbYQ1ZTBqzvNvvH34mWeF0TNKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Sz94-NtJP6ObNS-fQtVvXQ-1; Mon, 18 Jan 2021 05:12:26 -0500
X-MC-Unique: Sz94-NtJP6ObNS-fQtVvXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E23A7801817;
 Mon, 18 Jan 2021 10:12:23 +0000 (UTC)
Received: from redhat.com (ovpn-116-34.ams2.redhat.com [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9CD671C9B;
 Mon, 18 Jan 2021 10:12:02 +0000 (UTC)
Date: Mon, 18 Jan 2021 10:11:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 9/9] gitlab-ci: Add alpine to pipeline
Message-ID: <20210118101159.GC1789637@redhat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-10-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118063808.12471-10-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, qemu-block@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 02:38:08PM +0800, Jiaxun Yang wrote:
> We only run build test and check-acceptance as their are too many
> failures in checks due to minor string mismatch.

Can you give real examples of what's broken here, as that sounds
rather suspicious, and I'm not convinced it should be ignored.

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .gitlab-ci.d/containers.yml |  5 +++++
>  .gitlab-ci.yml              | 23 +++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 910754a699..90fac85ce4 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -28,6 +28,11 @@
>      - if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
>      - if: '$CI_COMMIT_REF_NAME == "testing/next"'
>  
> +amd64-alpine-container:
> +  <<: *container_job_definition
> +  variables:
> +    NAME: alpine
> +
>  amd64-centos7-container:
>    <<: *container_job_definition
>    variables:
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 4532f1718a..6cc922aedb 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -72,6 +72,29 @@ include:
>      - cd build
>      - du -chs ${CI_PROJECT_DIR}/avocado-cache
>  
> +build-system-alpine:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: alpine
> +    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
> +      moxie-softmmu microblazeel-softmmu mips64el-softmmu
> +    MAKE_CHECK_ARGS: check-build
> +    CONFIGURE_ARGS: --enable-docs
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +
> +acceptance-system-alpine:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-system-alpine
> +      artifacts: true
> +  variables:
> +    IMAGE: alpine
> +    MAKE_CHECK_ARGS: check-acceptance
> +  <<: *acceptance_definition
> +
>  build-system-ubuntu:
>    <<: *native_build_job_definition
>    variables:
> -- 
> 2.30.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


