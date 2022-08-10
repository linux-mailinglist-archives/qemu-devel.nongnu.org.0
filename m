Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9858EE23
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:20:53 +0200 (CEST)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmZo-0002Mn-QR
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLm4M-0002J1-3s
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:48:28 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLm4K-0000wH-J5
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:48:21 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r69so7860989pgr.2
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=9zzQmgqJKCoRpi3u0LUB+0O6DXV4XhuHKNkf0lxlBPI=;
 b=mSmiKdh3dO+96l3mFNFyE8Wh8C6wUDeybU4gQm1Iq3SRXxT564DZv/WxNcZcs8qdRZ
 54v/t1QIrXZbgVsOzAejNnPcBcAhpcYc49CYK7jKD69ad2CHgrfZpaBHKtvtgZQP+J8M
 Vldk1Wq/rN25UWBylDgLPOChwo9xM9H7kAzbNs8U9iFUEAFNLPGy3IwUU9uoS9eoYzZP
 PUGhmt9VzTJ37RdDu5cI/mN2o0faP4Z25MTVAm8y6s0cKj0Ho9vyzR+GPYstaIUgPob5
 BG5Jc3CkKZVBq4WwgyGDvwmQ0684kkOEfAM2k+waVgfM79CGc8p3jqLRyl1AfWD8aq5I
 OXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=9zzQmgqJKCoRpi3u0LUB+0O6DXV4XhuHKNkf0lxlBPI=;
 b=kLr0WdH856FZmIgrHQ/kZF81bI7iDQh0ciw+TUIFjB1MFPmKRQUZyPxkEymAoKRgBT
 dWaF+pkbrbk2iKCoWfHulaZnOjZ85x831DAzhwfeCixy3MYAtWBOJwS9+/CD2N0R4/Wq
 hljD/839CuSR1GHPbpFQpqhE4Oq/6p02gYHoUV9QGd4uLw056YZ89UodVOGnKWoMIii/
 34XLj+kczgEqXzk6gSaosC1li1K5GE7Le9AX5AodwHK3zPVP0M+eGERzdHcYKTU1+uOE
 pYW2MdEjOw1SOvQEph8MbChu0GLXpOIEiznbGf3rBRQvPbGnL6hx0laM3ktYYq9bddUx
 5T8A==
X-Gm-Message-State: ACgBeo2e97x3N3uJYzgxQMVEY0ChzbIHA/B6hTV7O5z9gbwGNgQq2DZw
 28RxaXFu1r82jjLLnVAeLmFF5mWJVXE=
X-Google-Smtp-Source: AA6agR6qCfasHbRYf3ABgj/A4COeoyM1ELk/kyu1psUgkTSrMUBdIFw7t1U183cym3rHw9NpK7a+pw==
X-Received: by 2002:a05:6a00:b82:b0:52f:518f:fe6c with SMTP id
 g2-20020a056a000b8200b0052f518ffe6cmr13727772pfj.80.1660139298811; 
 Wed, 10 Aug 2022 06:48:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a17090a4f0700b001f7613a9d0dsm1663303pjh.52.2022.08.10.06.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 06:48:18 -0700 (PDT)
Message-ID: <36d6c445-f98a-edbc-8317-7f2a4d36f0cf@amsat.org>
Date: Wed, 10 Aug 2022 15:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] cutils: Add missing dyld(3) include on macOS
Content-Language: en-US
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220809222046.30812-1-f4bug@amsat.org>
In-Reply-To: <20220809222046.30812-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

+Thomas

On 10/8/22 00:20, Philippe Mathieu-Daudé wrote:
> Commit 06680b15b4 moved qemu_*_exec_dir() to cutils but forgot
> to move the macOS dyld(3) include, resulting in the following
> error (when building with Homebrew GCC on macOS Monterey 12.4):
> 
>    [313/1197] Compiling C object libqemuutil.a.p/util_cutils.c.o
>    FAILED: libqemuutil.a.p/util_cutils.c.o
>    ../../util/cutils.c:1039:13: error: implicit declaration of function '_NSGetExecutablePath' [-Werror=implicit-function-declaration]
>     1039 |         if (_NSGetExecutablePath(fpath, &len) == 0) {
>          |             ^~~~~~~~~~~~~~~~~~~~
>    ../../util/cutils.c:1039:13: error: nested extern declaration of '_NSGetExecutablePath' [-Werror=nested-externs]
> 
> Fix by moving the include line to cutils.
> 
> Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>   util/cutils.c      | 4 ++++
>   util/oslib-posix.c | 4 ----
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index cb43dda213..def9c746ce 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -39,6 +39,10 @@
>   #include <kernel/image.h>
>   #endif
>   
> +#ifdef __APPLE__
> +#include <mach-o/dyld.h>
> +#endif
> +
>   #ifdef G_OS_WIN32
>   #include <pathcch.h>
>   #include <wchar.h>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index bffec18869..d55af69c11 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -58,10 +58,6 @@
>   #include <lwp.h>
>   #endif
>   
> -#ifdef __APPLE__
> -#include <mach-o/dyld.h>
> -#endif
> -
>   #include "qemu/mmap-alloc.h"
>   
>   #ifdef CONFIG_DEBUG_STACK_USAGE


