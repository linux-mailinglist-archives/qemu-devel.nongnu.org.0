Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E1E371931
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:22:59 +0200 (CEST)
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbLW-0000XV-R6
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ldbKa-0008Rz-Hb
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ldbKX-0005ti-IO
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:21:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620058915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OtN5AHZZQR9nyYGKCpu30nvBWgs2jQhI3sQUxSmAYx8=;
 b=ATimx5vDQVm3hexo02/Im7em2J9VlnwAg+fxzDf+1bnsIM0Rr8c/oiNi/QULAeOdDSkTZ8
 nCsFrmewxSbxWpRBWLk9F2NM3q/y7jsVGO3cVJ3vViFHBRxdZcch4VKA77IYiiFWIF3YIf
 JWP0oZ+utY/7i5D2KKp0HpLQOiTvMIc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-fCB2u6muOHmu5GpGzc81Kg-1; Mon, 03 May 2021 12:21:53 -0400
X-MC-Unique: fCB2u6muOHmu5GpGzc81Kg-1
Received: by mail-vs1-f72.google.com with SMTP id
 g28-20020a67d49c0000b0290226baf5716bso3018607vsj.12
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OtN5AHZZQR9nyYGKCpu30nvBWgs2jQhI3sQUxSmAYx8=;
 b=YrNz6viSPEvr/09C/z1Xj9foqTQ+BoWMS7du917N5Wz68El16+68EKkPtr2+pCuMUR
 IUc7jSXKKADHC7FpZMGl+oBnDk8wGMX8p8xErhx6ck/bSz7dn047WGPvF8LFIB4lBZm7
 z1RW5wZngOQrXtlkNY3DW4OqhJGx640ZWnQ9k0TUySDKyvJwJ+JUT6Ps5byed75Q2Kp4
 zJG6ag+xfNfpX7GdLfvDl/y8DQNIzMIY09mRSzJwBmNeWt0AjY2xDVhQxF+251u/N67A
 Zl/7PGyuVfjEVWi0mk+X4O2RKe6mfSRoKatExBpzVmW4kehED7qFLAvl/vdfFNdkLxyR
 yjRw==
X-Gm-Message-State: AOAM532qx1+Cn0L2BpmEM8TULe+JM8EYLexcHuaVSOYs2LNVChEkgeZs
 t3GX7YxfmDG/I0G07w/N02s6jujw5ofLG+BObi5qrDUtFdWnol/vKTl8+MloFyxxJfCwjrV78wG
 1vQZDgpclCZTa0cpG48dgDWJWcx1bouo=
X-Received: by 2002:a1f:9d90:: with SMTP id g138mr15449560vke.2.1620058913415; 
 Mon, 03 May 2021 09:21:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzogWCQrwQIkNhyRBQzoU3olbj0lh/VnpgNN2oKQWehoubWSzFHEtPl9uVy3hl7V3jUqSy98Kga6HxYRbpcaas=
X-Received: by 2002:a1f:9d90:: with SMTP id g138mr15449516vke.2.1620058913044; 
 Mon, 03 May 2021 09:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-26-richard.henderson@linaro.org>
In-Reply-To: <20210502235727.1979457-26-richard.henderson@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 3 May 2021 13:21:27 -0300
Message-ID: <CAKJDGDa4aJ14FLrgGAMcGydL-=2-J4Jg7JBeLPmuRjj_sBk-2Q@mail.gmail.com>
Subject: Re: [PATCH v6 25/26] gitlab: Rename ACCEL_CONFIGURE_OPTS to
 EXTRA_CONFIGURE_OPTS
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 2, 2021 at 9:24 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 2d95784ed5..fbf7b7a881 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -16,7 +16,7 @@
>  #
>  # Set the $ACCEL variable to select the specific accelerator (default to
>  # KVM), and set extra options (such disabling other accelerators) via the
> -# $ACCEL_CONFIGURE_OPTS variable.
> +# $EXTRA_CONFIGURE_OPTS variable.
>  .cross_accel_build_job:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> @@ -26,7 +26,7 @@
>      - cd build
>      - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>        ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
> -        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
> +        --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
>      - make -j$(expr $(nproc) + 1) all check-build
>
>  .cross_user_build_job:
> @@ -174,7 +174,7 @@ cross-s390x-kvm-only:
>      job: s390x-debian-cross-container
>    variables:
>      IMAGE: debian-s390x-cross
> -    ACCEL_CONFIGURE_OPTS: --disable-tcg
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg
>
>  cross-win32-system:
>    extends: .cross_system_build_job
> @@ -197,7 +197,7 @@ cross-amd64-xen-only:
>    variables:
>      IMAGE: debian-amd64-cross
>      ACCEL: xen
> -    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>
>  cross-arm64-xen-only:
>    extends: .cross_accel_build_job
> @@ -206,4 +206,4 @@ cross-arm64-xen-only:
>    variables:
>      IMAGE: debian-arm64-cross
>      ACCEL: xen
> -    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> --
> 2.25.1
>
>


