Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5D46A6B6A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:10:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKLc-0003dg-AN; Wed, 01 Mar 2023 06:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pXKLa-0003dS-Ox
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:10:10 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pXKLS-0000aI-JD
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:10:04 -0500
Received: by mail-lj1-x22b.google.com with SMTP id g18so11410669ljl.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 03:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677669000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GncUh+45jeEcAzXhQKzwae5wEl3lQCs+diGPaWqS7fQ=;
 b=XxsS5MqB5OtE3/tK+OwohU7ryg2iqMLnUH3VVATnZbL3JvCPWL1j770K9rMZZxyqlo
 /RqEeQiO2QzMADjraRJY2ryahzcnGZZA9XnvkZAPisin3o9HGX2B3eEEBFXULCOZVyx4
 ClfTFaiS66oziTrRdVRTtFMQwnLF2bst6TM6c0DXfSrXLLKJ+j05ucINdgVsThhw1aTq
 75cBeR4a468h3TJzwelsk4ZIFSthLsGoZmcdk1uxj5lCJwIvVBPkUnsQujNDqdn9/3qi
 cEx+Myd6eVX6AVLYKOx9mCU6tCKvM87keGM1EvUgdm4aS6nJJIT6gEulWdp0rANrtvlO
 yOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677669000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GncUh+45jeEcAzXhQKzwae5wEl3lQCs+diGPaWqS7fQ=;
 b=y/9xJ2G7/ozTE0rx9zgLaJ/4QYuAV4DnxtUCFM0XIqEmE7tLellYp4X9OO8vLhOuwd
 9XeQn7PZbaP8XQF9/KJN9Na9MSccv3G7xC7uij8N+u8szXRRKjxzt/n6BUCUHZ1K6Ax/
 YKJSgeWHabr7MTnZ0D3J+zYHgcLSrUKU3TAWjYLiPNSmtegAHtNJnjP6n1QpvYy3EvGi
 x1877VpVt0xVQFV8cjNEJJ/IUdbC/bCDRhuRnpUJYB6QSA19Au91FoNtjqA2D8iniN2u
 Y3uCWVUejgUWHiuMDfq15LOOU/BnBdcFhsgeqce2nc3zo0fMfCVfDTk0tIIZbzysgXaj
 knTA==
X-Gm-Message-State: AO0yUKVMEkNaSwMrB4kJV0CmfCUbV1uxm0Hc+j6ylclKbGqpPLxFEQzq
 v+Yw5QTlUhX19mpH9yxyBT1EuTwk4zg8oVjGSmA=
X-Google-Smtp-Source: AK7set8o1UYCTEBEAjk1hrTXiDPeVulVvUHD5fq0eqtQv979yw0uzr0wTETPCYHslSayuxk9optnqL833IQCEtYpbUY=
X-Received: by 2002:a2e:86d7:0:b0:295:b026:8c34 with SMTP id
 n23-20020a2e86d7000000b00295b0268c34mr1854998ljj.4.1677669000456; Wed, 01 Mar
 2023 03:10:00 -0800 (PST)
MIME-Version: 1.0
References: <20230301104450.1017-1-quintela@redhat.com>
In-Reply-To: <20230301104450.1017-1-quintela@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 1 Mar 2023 15:09:48 +0400
Message-ID: <CAJ+F1C+Z5O_znLGwNdui+keBGPqxYOVEUEf7WcwkM0YC22ZCgQ@mail.gmail.com>
Subject: Re: [PATCH] test: Check vnc enable before compiling vnc test
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 1, 2023 at 2:45 PM Juan Quintela <quintela@redhat.com> wrote:
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/qtest/meson.build | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 29a4efb4c2..62eecf2edf 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -309,10 +309,12 @@ qtests =3D {
>    'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
>  }
>
> -gvnc =3D dependency('gvnc-1.0', required: false)
> -if gvnc.found()
> -  qtests +=3D {'vnc-display-test': [gvnc]}
> -  qtests_generic +=3D [ 'vnc-display-test' ]
> +if vnc.found()
> +  gvnc =3D dependency('gvnc-1.0', required: false)
> +  if gvnc.found()
> +    qtests +=3D {'vnc-display-test': [gvnc]}
> +    qtests_generic +=3D [ 'vnc-display-test' ]
> +  endif
>  endif
>
>  if dbus_display
> --
> 2.39.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

