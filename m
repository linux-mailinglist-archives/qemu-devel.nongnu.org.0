Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF843BF4DD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:49:45 +0200 (CEST)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Lyq-0004vA-DK
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m1Lxn-000365-1s
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:48:39 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:43607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m1Lxl-0002Tb-Ag
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:48:38 -0400
Received: by mail-io1-xd2c.google.com with SMTP id k16so6606855ios.10
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 21:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ms/GtOCKfUV79MjiIPE7+hRA47DVQKw8jMBZdMnc7Dc=;
 b=lyU857jH5K6U9jaRGAr193ptO0qbEziB3UFGUZvXr2ABzBe0b2lkrxCw6W/UB+adHQ
 N0mMTYd/Hi52HelUiOL9Hj0cU+pC+AJAy65qA/k4RjVrGOyHgUa4iAI/OvA1uL+2tqBl
 4LrIqaB1AvhC2dpGWnQACcIGJZ8gCqUWLX6CilS14n0opsY8u5+2Rm21LFjVCIKzAaFd
 fTJxwCBQ/BuJTx7c8hHVwK1cVe0dhB4opwcmQsWFz+3Vuq1ZH+9lIkMeWBPwfRqLXO7L
 Nvf4gbv3K/sf9T8/bujfB5q9fjtUTTUAYP4cxc/2QBjsrr6rwF9GSMoprwcltHGl/Y8m
 XxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ms/GtOCKfUV79MjiIPE7+hRA47DVQKw8jMBZdMnc7Dc=;
 b=OA4WvyqeX32r1wK0LQWFXPATsiT/q7jOHyQtFRdd1wkEFFnWSFOH5s33SZsWRQ8zgQ
 T6aSAUZMmZHeAngwSm/9rtxMSD1Rktoo/X3Sj4MwOxQ7Hdn4nv8ZvsrBTRqE+suWJcr0
 XwSL9uKtCIOPU12BoYZz0Ji+r+8WP2llLZ46/Zy76hC+BV9W7p2gxvjBldpyxdVz2+6s
 pNJ7nwQ+vXDSEaDpfbjqE/4syJ0I4LbNOChkreWnMA470TdeTgCfLut0OcRIWnYkDJPo
 fPbmobbdAQSKcx6z+Fxh3E6nXDyXFwEiTfaf0RHnavnVXgJxPsR7AWy6iibEtvnbifso
 XSaA==
X-Gm-Message-State: AOAM530GPw9Qw3hxfk72Igoa2/8T80kPCszvcTGvjLZ3Zj6x3cWFMec0
 kP8XxVMd0NwcjiEH4YdNLc3abxsaglDyI4KCnEjCs2UvZJ8=
X-Google-Smtp-Source: ABdhPJzbMg9cgpQ9Z+iyXGioH1Le8wqR4BZj3ME9oOm1dv5/knkB9eqn0XK7h9h9EAg9Roz+BATsSCGK0KoPlI+iTxk=
X-Received: by 2002:a5d:9c96:: with SMTP id p22mr17461551iop.67.1625719716368; 
 Wed, 07 Jul 2021 21:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210707075144.82717-1-mrezanin@redhat.com>
In-Reply-To: <20210707075144.82717-1-mrezanin@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 8 Jul 2021 06:48:25 +0200
Message-ID: <CAM9Jb+j-u=pFk4XLt6iQ=hE4kqeWWopuRLCecWZ-SZke++_j2Q@mail.gmail.com>
Subject: Re: [PATCH] Fix libpmem configuration option
To: Miroslav Rezanina <mrezanin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> For some reason, libpmem option setting was set to work in an opposite
> way (--enable-libpmem disabled it and vice versa). Fixing this so
> configuration works properly.
>
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>  configure | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 7994bdee92..ffa93cc5fd 100755
> --- a/configure
> +++ b/configure
> @@ -1501,9 +1501,9 @@ for opt do
>    ;;
>    --disable-debug-mutex) debug_mutex=no
>    ;;
> -  --enable-libpmem) libpmem=disabled
> +  --enable-libpmem) libpmem="enabled"
>    ;;
> -  --disable-libpmem) libpmem=enabled
> +  --disable-libpmem) libpmem="disabled"
>    ;;
>    --enable-xkbcommon) xkbcommon="enabled"
>    ;;

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

