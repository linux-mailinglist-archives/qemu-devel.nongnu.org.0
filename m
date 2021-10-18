Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F080430E96
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:15:53 +0200 (CEST)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcK3z-0003eX-Dd
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJSc-0007RV-6b
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:37:14 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:42739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJSX-0005c6-Ho
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:37:13 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 074649EA11
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:37:09 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjH86GBLz3HVj
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:37:08 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id B875BD896
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:37:08 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f174.google.com with SMTP id c28so14174997qtv.11
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:37:08 -0700 (PDT)
X-Gm-Message-State: AOAM53286zHBqSvNkGXB+U3kTZTQMfdX3CGl6+u/FeGvGKE6nKakfsO9
 XxjrWPv7YYu8D75rTJAVCFaBGUpU0e5N9qN0ttU=
X-Google-Smtp-Source: ABdhPJwo2Aoudax8A/d9QIyugK2xwBFABs/1Xf9fiRmmCg4VlDHN+L9ci4NVv2Qfb/DyKPymyJ/kl7GYlydAYICd8v4=
X-Received: by 2002:ac8:514f:: with SMTP id h15mr26889542qtn.340.1634528228472; 
 Sun, 17 Oct 2021 20:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-15-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-15-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:36:57 -0500
X-Gmail-Original-Message-ID: <CACNAnaEgxEBKCUDtyMm2uAYDZdRcdBaMYnj758wzo3UZiQ1Ypg@mail.gmail.com>
Message-ID: <CACNAnaEgxEBKCUDtyMm2uAYDZdRcdBaMYnj758wzo3UZiQ1Ypg@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] bsd-user: Rename sigqueue to qemu_sigqueue
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
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
> To avoid a name clash with FreeBSD's sigqueue data structure in
> signalvar.h, rename sigqueue to qemu_sigqueue. This sturcture

s/sturcture/structure/

> is currently defined, but unused.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/qemu.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index e65e41d53d..5b815c3a23 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -73,15 +73,15 @@ struct image_info {
>
>  #define MAX_SIGQUEUE_SIZE 1024
>
> -struct sigqueue {
> -    struct sigqueue *next;
> +struct qemu_sigqueue {
> +    struct qemu_sigqueue *next;
> +    target_siginfo_t info;
>  };
>
>  struct emulated_sigtable {
>      int pending; /* true if signal is pending */
> -    struct sigqueue *first;
> -    /* in order to always have memory for the first signal, we put it he=
re */
> -    struct sigqueue info;
> +    struct qemu_sigqueue *first;
> +    struct qemu_sigqueue info; /* Put first signal info here */
>  };
>
>  /*
> @@ -95,8 +95,8 @@ typedef struct TaskState {
>      struct image_info *info;
>
>      struct emulated_sigtable sigtab[TARGET_NSIG];
> -    struct sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue =
*/
> -    struct sigqueue *first_free; /* first free siginfo queue entry */
> +    struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo q=
ueue */
> +    struct qemu_sigqueue *first_free; /* first free siginfo queue entry =
*/
>      int signal_pending; /* non zero if a signal may be pending */
>
>      uint8_t stack[];
> --
> 2.32.0
>

Typo noted above in the commit message; otherwise:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

