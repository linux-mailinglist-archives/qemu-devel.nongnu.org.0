Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348963B49BE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 22:26:19 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwsP4-0003C7-9E
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 16:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwsNn-0001yE-Rp
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 16:24:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwsNm-0007u9-6H
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 16:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624652697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ol5lsIxAMUOdXKiep39EYHsCwygZZCn3QAuCkHRkkF4=;
 b=jKANGeyaCCdVFsAO/BAqobfXrMB7bbKzNFJk6FZOdQUvVPwizXEZg8OusAsh1yrP4BoUpB
 UgwD4I2qDluTKvsUV7z1HwByoQOYu29u7ghkWXhtm+7m85AuaSvYfe5ufV/pCx6a8mONEh
 g2oJ/yYGrrefmxgGY5TzJWhv0DmWBnI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-RaEYLm39MbCoOUVD7uHDrg-1; Fri, 25 Jun 2021 16:24:56 -0400
X-MC-Unique: RaEYLm39MbCoOUVD7uHDrg-1
Received: by mail-vs1-f69.google.com with SMTP id
 u12-20020a67f94c0000b0290278a507ec3aso2563248vsq.18
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 13:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ol5lsIxAMUOdXKiep39EYHsCwygZZCn3QAuCkHRkkF4=;
 b=WEYnBY5Yy298rDEx/AKG+jgkQ6gYdtH4kT/InR4Gcn7Q/KJaXPaK/NWRgY+xaS1LAL
 fQx+TuoFdj2yKfbnhn2DvNmU7g5cWRWVeyzIfeEokkA2fIzr5c6iEAD5HiqJyItSxWXo
 DdTRWuMFSCHx3M52BnygO/vW/qWiDu1utO/drB/hHWf/AFjetuhvRlzBj0rLRwWdT79s
 Sx15/d/e0mTKijnKiOwP4S1mr0W+GkuQrlZPzt8hcZH1n1EkSIto6NRkHf7yWKxW44G6
 YjLPjJkk7jfRnzNVrEezIK/HX25Z4dtck1Zm+r0fh6A9av1htonx1+DU/lPAPYu8gLG3
 rJ3g==
X-Gm-Message-State: AOAM53389p5ISGiL6Ma0LPE9Aeo6oYIg+kNP2zcNx6CgTh3dk3YPQadA
 NaUFrFS29hpgNR03oDLj0MmN7VZFSdROfZyzraS9JEj3RqYnuw52bkCr+IQqKNobH8jq7cn41tH
 hPgIxdCMf/84+lCDbakqZVAPQbPnC364=
X-Received: by 2002:a67:d80f:: with SMTP id e15mr11208320vsj.50.1624652695698; 
 Fri, 25 Jun 2021 13:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYYElCtZlA8JnkNJPCgfvYfNocdPt8ULxu5FqItEuu78Ldv8lriLtQEhnsaPT7d/NKh5FC60ROhq7GKKFxacI=
X-Received: by 2002:a67:d80f:: with SMTP id e15mr11208308vsj.50.1624652695585; 
 Fri, 25 Jun 2021 13:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-4-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-4-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 17:24:29 -0300
Message-ID: <CAKJDGDbBPV+HcLm+=dNZeqYM7keQKnHWz5RGAk7ALJh4TjJzNw@mail.gmail.com>
Subject: Re: [PATCH v4 03/22] tests/docker: use project specific container
 registries
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 11:23 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> Since Docker Hub has started to enforce pull rate limits on clients, it
> is preferrable to use project specific container registries where they

s/preferrable/preferable/

> are available. Fedora and OpenSUSE projects provide registries.
>
> The images in these registries are also refreshed on a more regular
> basis than the ones in docker hub, so the package update should
> generally be faster.
>
> While CentOS also has a registry it is considerably outdated compared
> to docker.io, and also only provides x86 images, while docker.io images
> are multi-arch.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
>  tests/docker/dockerfiles/fedora-i386-cross.docker  | 2 +-
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora.docker             | 2 +-
>  tests/docker/dockerfiles/opensuse-leap.docker      | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


