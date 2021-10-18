Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0691430FA9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 07:06:47 +0200 (CEST)
Received: from localhost ([::1]:51150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKrG-0006IQ-Jm
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 01:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJZg-00024e-M6
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:44:32 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:63093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJZa-0005D9-OY
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:44:31 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id E205C9FA60
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:44:25 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjRY5dMtz3Jhm
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:44:25 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id A1F82CAFF
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:44:25 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f175.google.com with SMTP id t2so9733236qtn.12
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:44:25 -0700 (PDT)
X-Gm-Message-State: AOAM533pzaS/r3+fIb59dx6M9mPgC1A6Spml0k7Y3+MP1xGCM0po8d27
 4dScNr/aGEjR49mQOd48YaAh5uJ8WsKtjQ1kcMw=
X-Google-Smtp-Source: ABdhPJyNzzbqCLyuBlkwawxWwNHRLpnp8KgarVd8V8jDTC1OeYdRZJeIyD6gU6rfWrrrCcD7jrlp9hZ3l/pFdrPKE0A=
X-Received: by 2002:ac8:57c3:: with SMTP id w3mr27137135qta.132.1634528665344; 
 Sun, 17 Oct 2021 20:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-16-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-16-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:44:14 -0500
X-Gmail-Original-Message-ID: <CACNAnaE_a6vuBBe9nyQ5RkuXEo6hViOzQhiE_=v7fDzkizYiCg@mail.gmail.com>
Message-ID: <CACNAnaE_a6vuBBe9nyQ5RkuXEo6hViOzQhiE_=v7fDzkizYiCg@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] bsd-user/signal: Create a dummy signal queueing
 function
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> Create dummy signal queueing function so we can start to integrate other
> architectures (at the cost of signals remaining broken) to tame the
> dependency graph a bit and to bring in signals in a more controlled
> fashion. Log unimplemented events to it in the mean time.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h   |  2 +-
>  bsd-user/signal.c | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 5b815c3a23..62095eb975 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -17,7 +17,6 @@
>  #ifndef QEMU_H
>  #define QEMU_H
>
> -
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "qemu/units.h"
> @@ -209,6 +208,7 @@ void process_pending_signals(CPUArchState *cpu_env);
>  void signal_init(void);
>  long do_sigreturn(CPUArchState *env);
>  long do_rt_sigreturn(CPUArchState *env);
> +void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>  abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
>
>  /* mmap.c */
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index ad6d935569..0c1093deb1 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -16,10 +16,19 @@
>   *  You should have received a copy of the GNU General Public License
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> -#include "qemu/osdep.h"
>
> +#include "qemu/osdep.h"
>  #include "qemu.h"
>
> +/*
> + * Queue a signal so that it will be send to the virtual CPU as soon as
> + * possible.
> + */
> +void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
> +{
> +    qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
> +}
> +
>  void signal_init(void)
>  {
>  }
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

