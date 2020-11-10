Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A610E2AE09A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:22:44 +0100 (CET)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcaA7-0006Xf-FX
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kca8t-0005yh-Ad
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:21:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kca8p-0006rJ-NX
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605039681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1NshmJxIj1lcyr+a71fM7G4rFORVceRAn1qXa0pDO8=;
 b=HpKEB3PjWKykzoR4skKdLbeZA7ZhzGRP3mt8GBIbRgdkbfOBVRsIwIaQfqVH3D1YDxwt8U
 uCC8VRT92/SVbWg0lIzYbY1kIHlTW6t4Cg22YYBVXKQ2kBy9hCre4a+LAJ/QhOiBCtEeD+
 HESvRpqy5OjlX9Rwim1kbi8f7q/DvI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-V5fxsLgrNKqbYl5LnInxKA-1; Tue, 10 Nov 2020 15:21:20 -0500
X-MC-Unique: V5fxsLgrNKqbYl5LnInxKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E7C1809DE2;
 Tue, 10 Nov 2020 20:21:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAF86EF43;
 Tue, 10 Nov 2020 20:21:16 +0000 (UTC)
Subject: Re: [PATCH v3 02/11] gitlab-ci: Replace YAML anchors by extends
 (cross_system_build_job)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-3-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <02d261af-a8b8-571c-9a4a-b33a5dd0b5a2@redhat.com>
Date: Tue, 10 Nov 2020 18:21:09 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108221925.2344515-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Good idea!
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 40 ++++++++++++++++++------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 03ebfabb3fa..099949aaef3 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -1,5 +1,5 @@
>   
> -.cross_system_build_job_template: &cross_system_build_job_definition
> +.cross_system_build_job:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     timeout: 80m
> @@ -13,7 +13,7 @@
>             xtensa-softmmu"
>       - make -j$(expr $(nproc) + 1) all check-build
>   
> -.cross_user_build_job_template: &cross_user_build_job_definition
> +.cross_user_build_job:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     script:
> @@ -24,91 +24,91 @@
>       - make -j$(expr $(nproc) + 1) all check-build
>   
>   cross-armel-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: debian-armel-cross
>   
>   cross-armel-user:
> -  <<: *cross_user_build_job_definition
> +  extends: .cross_user_build_job
>     variables:
>       IMAGE: debian-armel-cross
>   
>   cross-armhf-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: debian-armhf-cross
>   
>   cross-armhf-user:
> -  <<: *cross_user_build_job_definition
> +  extends: .cross_user_build_job
>     variables:
>       IMAGE: debian-armhf-cross
>   
>   cross-arm64-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: debian-arm64-cross
>   
>   cross-arm64-user:
> -  <<: *cross_user_build_job_definition
> +  extends: .cross_user_build_job
>     variables:
>       IMAGE: debian-arm64-cross
>   
>   cross-mips-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: debian-mips-cross
>   
>   cross-mips-user:
> -  <<: *cross_user_build_job_definition
> +  extends: .cross_user_build_job
>     variables:
>       IMAGE: debian-mips-cross
>   
>   cross-mipsel-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: debian-mipsel-cross
>   
>   cross-mipsel-user:
> -  <<: *cross_user_build_job_definition
> +  extends: .cross_user_build_job
>     variables:
>       IMAGE: debian-mipsel-cross
>   
>   cross-mips64el-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: debian-mips64el-cross
>   
>   cross-mips64el-user:
> -  <<: *cross_user_build_job_definition
> +  extends: .cross_user_build_job
>     variables:
>       IMAGE: debian-mips64el-cross
>   
>   cross-ppc64el-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: debian-ppc64el-cross
>   
>   cross-ppc64el-user:
> -  <<: *cross_user_build_job_definition
> +  extends: .cross_user_build_job
>     variables:
>       IMAGE: debian-ppc64el-cross
>   
>   cross-s390x-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: debian-s390x-cross
>   
>   cross-s390x-user:
> -  <<: *cross_user_build_job_definition
> +  extends: .cross_user_build_job
>     variables:
>       IMAGE: debian-s390x-cross
>   
>   cross-win32-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: fedora-win32-cross
>   
>   cross-win64-system:
> -  <<: *cross_system_build_job_definition
> +  extends: .cross_system_build_job
>     variables:
>       IMAGE: fedora-win64-cross


