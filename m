Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ED5533279
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 22:30:14 +0200 (CEST)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntbAS-0004Ue-Mb
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 16:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ntay0-0005zN-GV
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ntaxx-0003b4-IW
 for qemu-devel@nongnu.org; Tue, 24 May 2022 16:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653423433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mdk1MCDROjyCpvlaxNJjBHQEgvbXjYq/vv1nJQyGQ5g=;
 b=B4EVvnTSHiHoY0u+0mAAiM1noSZJvk99V0l5eaz9ETwvIWhjSh31PK4oStMYmE0TY/ulSt
 CT0kwfZ7zUX1tIQrndJLlrrLByIjadbHk2yHJ9tWHyqnYarHBEFMWYyNt1PFFgKchVjNI4
 vT+nNtu4n2oDqPid+8a+VWt+AKMEb64=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-bkWhkc7YOFiCRJ2otgGT3g-1; Tue, 24 May 2022 16:17:11 -0400
X-MC-Unique: bkWhkc7YOFiCRJ2otgGT3g-1
Received: by mail-yb1-f200.google.com with SMTP id
 b11-20020a5b008b000000b00624ea481d55so16805219ybp.19
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 13:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mdk1MCDROjyCpvlaxNJjBHQEgvbXjYq/vv1nJQyGQ5g=;
 b=nGpl7Ck03gbLbGfdd41B4vVBIY3fZkHbTiMUvhwr6VzbMHwGtfbPf03J2n0Btrxgpg
 Rwzdv/ZPrYFIXJQ8peGB4gBkola641nsO9NkjGmOHO7o9oFoeXHeCsTjCmqIXDTXGPUf
 PwQTyusGeVQQLmsaGBGMK3hQTFAIQuCcS0u6giJgcmHCZZvhjNq0FPLYOpp0lJTpYy8g
 DIumwTVdZCbKuF4VozxsDNup+Bp+61dGPBInb40gScQNrDnTOq5XPxvHR/jxV5t7ulHB
 /l4YzYWwSDqS/4/pyoUhyMdO/GiiWz/uvXBZFS/1L4nUtC1RuaCy4gC8o6QtUdYGLJK/
 JjcQ==
X-Gm-Message-State: AOAM530eCyj18zW+nvSGLG6Zw6oiPfFdLfpEgjSqm/uRM+w5zh7xueWb
 RZfuomSf0sWWUD/LKfENv88qwatjNi2VFdkXD9clh+Ha5dQx05ED0xcleBwK6k8qKsv6pV1vjEo
 hSd4A/AO2PlbIRyUBPg92c1cnsSegsqg=
X-Received: by 2002:a81:e54d:0:b0:300:37fd:9856 with SMTP id
 c13-20020a81e54d000000b0030037fd9856mr3451467ywm.15.1653423431036; 
 Tue, 24 May 2022 13:17:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx4M2ujz3vFGxdMW31EXrNV1UwSwVq1iyRncw8looFXBM2MYQpae0b8MeFBKEgytD1hxjeZS1aCqtEa7zLKyQ=
X-Received: by 2002:a81:e54d:0:b0:300:37fd:9856 with SMTP id
 c13-20020a81e54d000000b0030037fd9856mr3451441ywm.15.1653423430868; Tue, 24
 May 2022 13:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220524181111.922031-1-kkostiuk@redhat.com>
In-Reply-To: <20220524181111.922031-1-kkostiuk@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 24 May 2022 22:16:59 +0200
Message-ID: <CAMxuvaw11W7-RbCJi3+ZQ3jbii5VUSjWa44QRfwVx-6eCgTk1A@mail.gmail.com>
Subject: Re: [PATCH] tests: Bump Fedora image version for cross-compilation
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 24, 2022 at 8:11 PM Konstantin Kostiuk <kkostiuk@redhat.com> wr=
ote:
>
> There are 2 reason for the bump:
>  - Fedora 33 is unsupported anymore
>  - Some changes in the guest agent required updates of
>    mingw-headers
>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win32-cross.docker
> index 84a8f5524d..a06bd29e8e 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -1,4 +1,4 @@
> -FROM registry.fedoraproject.org/fedora:33
> +FROM registry.fedoraproject.org/fedora:35
>
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win64-cross.docker
> index d7ed8eb1cf..b71624330f 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -1,4 +1,4 @@
> -FROM registry.fedoraproject.org/fedora:33
> +FROM registry.fedoraproject.org/fedora:35
>
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> --
> 2.25.1
>


