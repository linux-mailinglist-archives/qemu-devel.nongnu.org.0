Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1A725989C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 18:29:04 +0200 (CEST)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD99b-0002Gc-NY
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 12:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kD98W-0001J4-Cg
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 12:27:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kD98U-0007ur-GT
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 12:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598977673;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPL7IkQWhvWhJ+bAvv5cbqcB0Mlo+DSNc9r4eFxElzU=;
 b=EHPegDkbFy8B4eZsjrRHxF8OW5PTNh2wybzgpLGS7Cf/jCzMppire4uYmX4yV9nBgQpR4w
 umewvYCKhm0gmG0Zpz10MzQyVQ6Qs/HfnbQ9EwhZHRVohnMfsQtWVzmzUuH6oHJUohKUFg
 fGqI07d2xWJNur/7tS9chInrGdXNBaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-V0nNueAvO7iptu6RLghf5Q-1; Tue, 01 Sep 2020 12:27:51 -0400
X-MC-Unique: V0nNueAvO7iptu6RLghf5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B825510ABDA7;
 Tue,  1 Sep 2020 16:27:50 +0000 (UTC)
Received: from redhat.com (ovpn-114-215.ams2.redhat.com [10.36.114.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6801002D51;
 Tue,  1 Sep 2020 16:27:45 +0000 (UTC)
Date: Tue, 1 Sep 2020 17:27:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 7/7] gitlab-ci: Add cross-compiling build tests
Message-ID: <20200901162743.GX345480@redhat.com>
References: <20200823111757.72002-1-thuth@redhat.com>
 <20200823111757.72002-8-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200823111757.72002-8-thuth@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 01:27:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, luoyonggang@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 23, 2020 at 01:17:57PM +0200, Thomas Huth wrote:
> Now that we can use all our QEMU test containers in the gitlab-CI, we can
> easily add some jobs that test cross-compilation for various architectures.
> There is just only small ugliness: Since the shared runners on gitlab.com
> are single-threaded, we have to split each compilation job into two parts
> (--disable-user and --disable-system), and exclude some additional targets,
> to avoid that the jobs are running too long and hitting the timeout of 1 h.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 113 +++++++++++++++++++++++++++++++++++
>  .gitlab-ci.yml               |   1 +
>  MAINTAINERS                  |   1 +
>  3 files changed, 115 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds.yml

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> new file mode 100644
> index 0000000000..4ec7226b5c
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -0,0 +1,113 @@
> +
> +.cross_system_build_job_template: &cross_system_build_job_definition
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  script:
> +    - mkdir build
> +    - cd build
> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
> +        --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
> +          mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
> +          xtensa-softmmu"

What does this leave enabled ?  Would it be shorter to just say
--target-list="...explicit targets we want..." ?  It would be clearer
to review at least.

> +    - make -j$(expr $(nproc) + 1) all check-build

None the less, it is functionally fine so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


