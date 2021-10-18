Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A7E430E6E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 05:47:39 +0200 (CEST)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJcf-0001FM-7G
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 23:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJQZ-0006VG-5f
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:35:07 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:25666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJQV-00019i-1z
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:35:05 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 673669D81E
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:02 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjDk0b4Mz3GYB
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:02 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id E9BEACAF3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:35:01 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f177.google.com with SMTP id b15so5006448qkl.10
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:35:01 -0700 (PDT)
X-Gm-Message-State: AOAM530A+DXYkag1YvchBY5V0uWLkyhHyETOGT/hgjyUFUlOM9wKXQJm
 9ECd8z12vXjOtIeTJlzGhN6+7p/cAxSD1LDpHbc=
X-Google-Smtp-Source: ABdhPJxHQBzLbXWpWZ4IGdarEC801rP4vPjrhJDW+MTk7rKpfZ9MYqzpsIf8oyepScovYk/1GUMuW3lvPUa8vJA976U=
X-Received: by 2002:a05:620a:424f:: with SMTP id
 w15mr20903071qko.258.1634528101585; 
 Sun, 17 Oct 2021 20:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-8-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-8-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:34:50 -0500
X-Gmail-Original-Message-ID: <CACNAnaEr1sBPf2Zc6QTckgMbL30uZLqo9QzvrruovgzP7Dxcsw@mail.gmail.com>
Message-ID: <CACNAnaEr1sBPf2Zc6QTckgMbL30uZLqo9QzvrruovgzP7Dxcsw@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] bsd-user: move TARGET_MC_GET_CLEAR_RET to
 target_os_signal.h
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> Move TARGET_MC_GET_CLEAR_RET to freebsd/target_os_signal.h since it's
> architecture agnostic on FreeBSD.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/freebsd/target_os_signal.h  | 3 +++
>  bsd-user/i386/target_arch_signal.h   | 2 --
>  bsd-user/x86_64/target_arch_signal.h | 2 --
>  3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/targe=
t_os_signal.h
> index 3ed454e086..1a4c5faf19 100644
> --- a/bsd-user/freebsd/target_os_signal.h
> +++ b/bsd-user/freebsd/target_os_signal.h
> @@ -1,6 +1,9 @@
>  #ifndef _TARGET_OS_SIGNAL_H_
>  #define _TARGET_OS_SIGNAL_H_
>
> +/* FreeBSD's sys/ucontext.h defines this */
> +#define TARGET_MC_GET_CLEAR_RET 0x0001
> +
>  #include "target_os_siginfo.h"
>  #include "target_arch_signal.h"
>
> diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_ar=
ch_signal.h
> index 9812c6b034..a90750d602 100644
> --- a/bsd-user/i386/target_arch_signal.h
> +++ b/bsd-user/i386/target_arch_signal.h
> @@ -27,8 +27,6 @@
>  #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack siz=
e */
>  #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size =
*/
>
> -#define TARGET_MC_GET_CLEAR_RET 0x0001
> -
>  struct target_sigcontext {
>      /* to be added */
>  };
> diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/targe=
t_arch_signal.h
> index 4c1ff0e5ba..4bb753b08b 100644
> --- a/bsd-user/x86_64/target_arch_signal.h
> +++ b/bsd-user/x86_64/target_arch_signal.h
> @@ -27,8 +27,6 @@
>  #define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack siz=
e */
>  #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size =
*/
>
> -#define TARGET_MC_GET_CLEAR_RET 0x0001
> -
>  struct target_sigcontext {
>      /* to be added */
>  };
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

