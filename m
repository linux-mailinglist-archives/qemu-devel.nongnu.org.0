Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747CF2C533E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:50:07 +0100 (CET)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFmh-0004dO-5I
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFl2-0003KU-9P
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:48:16 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFl0-0003rZ-Es
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:48:16 -0500
Received: by mail-ed1-x544.google.com with SMTP id a15so1990301edy.1
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 03:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gP9zC36nODhB3RZnn07ocsLvpebWnS7K2Dn1SMe5wvo=;
 b=UeQLDn8N87Rqrwl/9UIOp5S84IgzdwVuQGMnG+7pMNM/UzSAtryj+T4B90+77iH6hg
 s+ExcWHi05YlIH2++0+7glMjaTutp1mTR0O2dRG4MB2khNKgfg6vHgHj7E54Lc/mRSMD
 hlS/2Qt4gzGj9k3paPwfQAUI9fFS2CUL8gvg+v7wfhbAlKWU+x+Qd69KvKligsPUgK/W
 eT8Y0TjJnRVAKUEGnUicMjVt/msK9CzDUqI3G+oGUdHlRx+Tm2jTZBciQQYNCGI1QfEN
 3ry0/BMgWSQ3TDZIKBGWrj8Jxj0DHx7Xr/teAyp6/Oj+QVTBW8cP2NJaHDc33jqpS6iu
 g1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gP9zC36nODhB3RZnn07ocsLvpebWnS7K2Dn1SMe5wvo=;
 b=FAW8x5zJy4lpFaV1bkoLPM/+NWs6HkEfRPP12vTaQ31viZma7ar80Js7Z8sHdlPk7f
 hV7FbSV4o8VfvVyk3l28oyb+wXLTV91jCSel9gKfmu7pYiyuetcGtrmbNLp5Y1FTnv02
 kC+xQJcAEI7Zqs3Nvgnd+JlcKE4RhBgHmNwE4TzsgZk1PCFmu+TXXvxsOu0q7+BwOf3l
 vDupqJ2zViwiCj43yaLTV1D88zIMHkb8eb9gLMMSIsPDnCgJXYPBAL+G9ZAw22GiPwZD
 p+JapXYDYcr5XbNCaoPv4gA/acrFXDcZFg3xFXVAeA7aEKTZBg/kl7ltfGl76P0MM2Ns
 h+BQ==
X-Gm-Message-State: AOAM532G+FUbMkH3G0oE2MR0VxSh1hTX3Ez0Y+57MBvPv8KVryjfRm7u
 rXSjznYEciKWCzzUwvgYGke01LD0ZINspsgeXIEF0Q==
X-Google-Smtp-Source: ABdhPJwwJ+ccwE7Ge8L1NbC5//j9s1Rrth9pI6EsAXXTg9vjlIOP4veijViHxYW+Z/PRm/wWqtL0mFZaZS1nRlo9lyE=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr2186986edt.204.1606391292493; 
 Thu, 26 Nov 2020 03:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-2-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-2-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 11:48:01 +0000
Message-ID: <CAFEAcA-qDgEG_N8ONha=wTtKGM4v-+3umLiZhA7DzP-1HiRXwQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] compiler.h: replace QEMU_GNUC_PREREQ macro
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Replace it with glib G_GNUC_CHECK_VERSION.
>
> Available since 2.42, the macro received a small correction in
> 2.55.1 (glib d44afbadda8a "macros: make G_GNUC_CHECK_VERSION()
> portable" which was apparently harmless).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/atomic.h      |  2 +-
>  include/qemu/compiler.h    | 15 +++------------
>  scripts/cocci-macro-file.h |  1 -
>  accel/tcg/cpu-exec.c       |  2 +-
>  4 files changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
> index c1d211a351..c409257c11 100644
> --- a/include/qemu/atomic.h
> +++ b/include/qemu/atomic.h
> @@ -248,7 +248,7 @@
>   * 4.3 (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D36793).
>   */
>  #if defined(__i386__) || defined(__x86_64__)
> -#if !QEMU_GNUC_PREREQ(4, 4)
> +#if !G_GNUC_CHECK_VERSION(4, 4)
>  #if defined __x86_64__
>  #define smp_mb()    ({ asm volatile("mfence" ::: "memory"); (void)0; })
>  #else
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index c76281f354..cf044bab4a 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -7,21 +7,12 @@
>  #ifndef COMPILER_H
>  #define COMPILER_H
>
> +#include "glib-compat.h"

osdep.h already includes glib-compat.h, so if it's safe to
include it this early we should just move that #include line
in osdep.h up above compiler.h. But I don't think it's going
to be quite that simple, because some parts of osdep.h
need to happen before we include any system headers, and
glib-compat.h includes some system headers. As it stands
this fragment will pull in glib-compat.h too early.

You probably need to rearrange osdep.h so it is
 * config-host.h
 * poison.h
 * bits that must go before any standard headers
 * pure system includes
 * glib-compat.h
 * compiler.h
(and hopefully none of the above needed stuff set up by compiler.h !)

Or if this tangle of bits depending on each other seems too
messy, we could just leave QEMU_GNUC_PREREQ the way it is :-)

thanks
-- PMM

