Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3653BBE79
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:52:00 +0200 (CEST)
Received: from localhost ([::1]:50352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Pwz-0000YO-Bu
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Pv5-0007QS-71
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Pv3-00012S-AG
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625496595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4GztZS4LlxsdClPYvsJK2XZThc3eOArjFFqa5qGVWro=;
 b=KnVCe75NJKUOco+wZ3XN/c0bKM+pikuQHUjuLzmkQVUGMqoLnn1BdXzMz59S1C1gz7g5hN
 tNKJTHqXk4nqXhmHFmqF3DQvlOfcFH3q6I1DpokjqYugVF6LGP9divHC6K6c2eGJlrkV6Q
 SBuJahgMQryqvujI7GOGU+oG+u+8R2E=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-TnfRubPmMKq3z5isQXzJYQ-1; Mon, 05 Jul 2021 10:49:55 -0400
X-MC-Unique: TnfRubPmMKq3z5isQXzJYQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 j13-20020a63594d0000b0290228b387f4a3so3179498pgm.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4GztZS4LlxsdClPYvsJK2XZThc3eOArjFFqa5qGVWro=;
 b=OwMuqbDon6PF7IErXujvqZvaLaEcRgxFR33bTxBpizwDRS+V2Z702z2E5bORTj6ama
 yRaXh0ibgmewEJfORk70JZljaPq92s29YZmFtaN3nuHHa1Afvxj2oNJLuTEoZQEFKZ1z
 3+CoxLp3DVizp62Wx5W9CRjWVwbSIma+VX13CDNJMIyn4oYJlcs7zY9Udv8kAfNjLId/
 vPr/e9zUKMFL6ox0EJFS7jVTh6ahEkr2SAP/TWEihuADc9ti3fdTbWTqpxW2KoW0dpkg
 VFEGDzSb7qA40rFFsTPOIig6dw5i5DRkv83BhAHkg3NlVU08vUWUOZf/RXFBsaYVIo2C
 KHmA==
X-Gm-Message-State: AOAM530JwAxGbKS+Fdccnod8K59Up1xybl0W2jvCeKvS1+3ZNqc90Z3A
 3MV2Q6EhnkDjgeSghHZaa4BunyASkO44roXptvDrkx4ssimP3beeF6sfsN6v4RMkMH7s5CsYppZ
 HwCo5LuR6uLDLieW1nYM4IqL3OSdajRA=
X-Received: by 2002:a67:e0c9:: with SMTP id m9mr9571811vsl.50.1625496285352;
 Mon, 05 Jul 2021 07:44:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznjbsdf9KLrhug3kRgSNQGmLEnNqpikoP+nl+rvNap43qPrZXz8liOjkVU2+GQQB5iF89arqdBSNy4BQ4bEgM=
X-Received: by 2002:a67:e0c9:: with SMTP id m9mr9571790vsl.50.1625496285130;
 Mon, 05 Jul 2021 07:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210623091137.1156959-1-kraxel@redhat.com>
 <20210623091137.1156959-2-kraxel@redhat.com>
In-Reply-To: <20210623091137.1156959-2-kraxel@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 11:44:19 -0300
Message-ID: <CAKJDGDbr3Tp44R-TcAg0Z_-9h6OF-bDBArzFGDPKqFUBPQb=Nw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ci: build & store windows installer
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 6:11 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Build windows installer for qemu in gitlab CI,
> store the result as artifact.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml               | 5 +++++
>  .gitlab-ci.d/crossbuilds.yml                       | 6 ++++++
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
>  3 files changed, 12 insertions(+)
>
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> index 1be541174c91..7d3ad00a1eb9 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -11,6 +11,11 @@
>            i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
>            mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
> +    - if grep -q "EXESUF=.exe" config-host.mak;
> +      then make installer;
> +      version="$(git describe --match v[0-9]*)";
> +      mv -v qemu-setup*.exe qemu-setup-${version}.exe;
> +      fi
>
>  # Job to cross-build specific accelerators.
>  #

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


