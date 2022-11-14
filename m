Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF55628EE6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:06:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinP-0007dQ-U3; Mon, 14 Nov 2022 18:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouifd-0004bQ-5o
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:19 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouY7t-00021N-Bm
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 06:59:46 -0500
Received: by mail-pf1-x42e.google.com with SMTP id y203so10778118pfb.4
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 03:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AWqWs6FSDUDWzKp9FdboTRUd+23ZKvkmWeYD+TgCRXI=;
 b=Dr7b2qzcku95xyoF49bLwQw0JtpvoghiFsHJV1T6DUd02UH8hPBNy/DoQDwjtPMrCL
 CAHyrH53HYIEagTUrHXdS9H1IeOSy87gmmLQJazUMuaxhb/KyWUU8idbyLc6y9YtjKE7
 wXTFT096VDqjD67/A2KcdRUPWmoZOqas+P6v/RbrVPLosa2DrGQf47vfzK2zPSWUnEKV
 WqTReOoqttHcxORocftoperNzbQz1ocYVKlxakNMGVc0QFocWBbfF2/w8aibdTup8jF5
 HopdqXmNXCeeEEGYFxKoQliILP0swLgH3od+hjX1gBm6oG8ExZXSBCmBVDKJtqYbE12S
 2i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AWqWs6FSDUDWzKp9FdboTRUd+23ZKvkmWeYD+TgCRXI=;
 b=iEr9Aipu0fDk/2L2ka1MEY0rJnOBfpiXGuji68Wn/WE5YXhJ9VyMXYybCxExhjd+44
 ew8TiXMHFzIUSOb2HNLzAIzaIy59eh+hNxr3IaRpbtL8fRzblA8d4iuHv4Wh198502hW
 X32y2icliw1CGR1T1iUSmiNCear2jswwpLcuzJbVejYVUglyp/kW3vKVJHHs9kRIT+az
 Z0v87IUbezNMY/sH1YI8/I/xvr/2Wim3rrssjMtm50rWeJhA4F4Isyrq0dZI2p/tQPQV
 1x8UBLE75aF4HGV7QZDyeEKdQB1Y4YY7iaQQyjf7zuBkVbtxuZiWIhmrhbtqm5Qi+C5X
 l/RQ==
X-Gm-Message-State: ANoB5pn4geGUvw9rg90lrhXqenMQdKtxJG+NVSCEoGdc9BTQYVNzxY8U
 m7qcw2fh/sek7cbqmKlqxeHJxXfP3WZB5HLYv/Jz9Q==
X-Google-Smtp-Source: AA0mqf6mIEOUmYX5JWv9qM6BJAbiHjprDMBP/P+sC7k2NS8quSaY8jYkv56P4nwAprL0IaoB0KaOFXiYPdjiaiZ0q1U=
X-Received: by 2002:a63:1665:0:b0:426:9c23:9f94 with SMTP id
 37-20020a631665000000b004269c239f94mr11415084pgw.105.1668427183382; Mon, 14
 Nov 2022 03:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 11:59:31 +0000
Message-ID: <CAFEAcA_aGiukDWQBAjj=Ln_u02wEbMNxOsHRZcBOm+jOz6HU2Q@mail.gmail.com>
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sun, 13 Nov 2022 at 20:10, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The upcoming capstone 5.0 drops support for the old way
> of including its header, due to this change:
> https://github.com/capstone-engine/capstone/commit/6656bcb63ab4e87dc6079bd6b6b12cc8dd9b2ad8
> The official way is to use <capstone/capstone.h>
>
> This change has already been proposed before, see
> https://patchwork.kernel.org/project/qemu-devel/patch/20180215173539.11033-1-f4bug@amsat.org/
> but it didn't find its way into qemu at that time.
>
> On current systems, using <capstone/capstone.h> works
> now (despite the pkg-config-supplied -I/usr/include/capstone) -
> since on all systems capstone headers are put into capstone/
> subdirectory of a system include dir. So this change is
> compatible with both the obsolete way of including it
> and the only future way.

That's only true if capstone happened to be installed
into a system include directory subdirectory. That
is probably true for most distros, but it isn't
necessarily true when an end user has built and
installed capstone locally themselves.

In other words, this is a breaking non-back-compatible
change by capstone upstream, which we now need to work
around somehow :-(


> diff --git a/include/disas/capstone.h b/include/disas/capstone.h
> index e29068dd97..d8fdc5d537 100644
> --- a/include/disas/capstone.h
> +++ b/include/disas/capstone.h
> @@ -3,7 +3,7 @@
>
>  #ifdef CONFIG_CAPSTONE
>
> -#include <capstone.h>
> +#include <capstone/capstone.h>
>
>  #else
>
> diff --git a/meson.build b/meson.build
> index cf3e517e56..6f34c963f7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2680,12 +2680,7 @@ if not get_option('capstone').auto() or have_system or have_user
>    capstone = dependency('capstone', version: '>=3.0.5',
>                          kwargs: static_kwargs, method: 'pkg-config',
>                          required: get_option('capstone'))
> -
> -  # Some versions of capstone have broken pkg-config file
> -  # that reports a wrong -I path, causing the #include to
> -  # fail later. If the system has such a broken version
> -  # do not use it.
> -  if capstone.found() and not cc.compiles('#include <capstone.h>',
> +  if capstone.found() and not cc.compiles('#include <capstone/capstone.h>',
>                                            dependencies: [capstone])
>      capstone = not_found
>      if get_option('capstone').enabled()

We can do something like

config_host_data.set('HAVE_CAPSTONE_CAPSTONE_H',
cc.has_header('capstone/capstone.h', depedencies: [capstone])

to check that this capstone really does have capstone/capstone.h,
for instance.

Dan: is there a reason why in commit 8f4aea712ffc4 you wrote
the "check that capstone.h really exists" check with cc.compiles
rather than cc.has_header ?

thanks
-- PMM

